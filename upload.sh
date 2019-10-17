# Make sure I'm in the master branch (or the branch I want to render)
git checkout master

# Render book
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"

# Assume that all site files are in a folder called "_book"
# You can change the name of this folder and other stuff by 
# changing the "_bookdown.yml" file (changed to "docs/" here)

# Copy no jekyll file
cp .nojekyll docs/ 

# If you're uploading any small data files you have to copy them across, example:
# cp -r data.zip docs/

# Add the rendered book (i.e the website files)
git add -f docs
git commit -m "Added new section on new section"

# Split the original repo and put "docs" in a 
# branch called "gh-pages"
git subtree split --prefix docs -b gh-pages

# Push changes (i.e rendered files only) to gh-pages 
git push origin gh-pages --force

# Go back to master, reset everything and delete the gh-pages branch
git checkout master
git reset --hard HEAD~1
git branch -D gh-pages
