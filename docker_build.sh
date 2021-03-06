#/!bin/bash
if [[ -f "prepare_automap_for_github.sh" ]] ; then
	. prepare_automap_for_github.sh
fi
work_dir=$PWD

if [[ -f "config_debug.ini" ]] ; then
	qgis_projects_dir=~/qgis_projects
	rm -f $work_dir/icons/*.*
	cp -f $qgis_projects_dir/icons/*.* $work_dir/icons/
# 	rm -f $work_dir/QGIS3/profiles/default/python/expressions/*.py
fi
# expressions_dir=$work_dir/expressions
# mkdir -p $work_dir/QGIS3/profiles/default/python/expressions/
# cp -f $expressions_dir/*.py $work_dir/QGIS3/profiles/default/python/expressions/
docker build -t $(basename $work_dir) . #--no-cache --pull
docker rmi $(docker images -q -f dangling=true)