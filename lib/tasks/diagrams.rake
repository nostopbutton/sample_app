namespace :doc do
  namespace :diagram do
    task :models do
#      sh "railroad -i -l -a -m -M | dot -Tsvg | sed 's/font-size=\"14.00\"/font-size=\"11.00\"/g' > doc/models.svg"
#      sh "railroad -i -l -a -m -M | dot -Tpng > doc/models.png"
      sh "railroady -i -l -a -m -M | dot -Tsvg | sed 's/font-size=\"14.00\"/font-size=\"11.00\"/g' > doc/models.svg"
      sh "railroady -b -i -l -a -m -M | dot -Tsvg | sed 's/font-size=\"14.00\"/font-size=\"11.00\"/g' > doc/models_brief.svg"

      sh "railroady -i -l -a -m -M | dot -Tpng > doc/png/models.png"
      sh "railroady -b -i -l -a -m -M | dot -Tpng > doc/png/models_brief.png"

    end

    task :controllers do
#      sh "railroad -i -l -C | neato -Tsvg | sed 's/font-size=\"14.00\"/font-size=\"11.00\"/g' > doc/controllers.svg"
#      sh "railroad -i -l -C | neato -Tpng  > doc/controllers.png"
      sh "railroady -i -l -C | neato -Tsvg | sed 's/font-size=\"14.00\"/font-size=\"11.00\"/g' > doc/controllers.svg"
      sh "railroady -b -i -l -C | neato -Tsvg | sed 's/font-size=\"14.00\"/font-size=\"11.00\"/g' > doc/controllers_brief.svg"

      sh "railroady -i -l -C | neato -Tpng  > doc/png/controllers.png"
      sh "railroady -b -i -l -C | neato -Tpng  > doc/png/controllers_brief.png"
    end
  end

  task :diagrams => %w(diagram:models diagram:controllers)
end