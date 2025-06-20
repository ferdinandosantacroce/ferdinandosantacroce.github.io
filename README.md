## Hugo Theme Stack Starter Template

This is a quick start template for [Hugo theme Stack](https://github.com/CaiJimmy/hugo-theme-stack). It uses [Hugo modules](https://gohugo.io/hugo-modules/) feature to load the theme.

It comes with a basic theme structure and configuration. GitHub action has been set up to deploy the theme to a public GitHub page automatically. Also, there's a cron job to update the theme automatically everyday.

To get started:

1. Click *Use this template*, and create your repository on GitHub.
![Step 1](https://user-images.githubusercontent.com/5889006/156916624-20b2a784-f3a9-4718-aa5f-ce2a436b241f.png)

2. Once the repository is created, create a GitHub codespace associated with it.
![Create codespace](https://user-images.githubusercontent.com/5889006/156916672-43b7b6e9-4ffb-4704-b4ba-d5ca40ffcae7.png)

3. And voila! You're ready to go. The codespace has been configured with the latest version of Hugo extended, just run `hugo server` in the terminal and see your new site in action.

4. Check `config` folder for the configuration files. You can edit them to suit your needs. Make sure to update the `baseurl` property in `config/_default/config.toml` to your site's URL.

5. Once you're done editing the site, just commit it and push it. GitHub action will deploy the site automatically to GitHub page asociated with the repository.
![GitHub action](https://user-images.githubusercontent.com/5889006/156916881-90b8bb9b-1925-4e60-9d7a-8026cda729bf.png)
---

In case you don't want to use GitHub codespace, you can also run this template in your local machine. **You need to install Git, Go and Hugo extended locally.**

### Update theme manually

Run:

```bash
hugo mod get -u github.com/CaiJimmy/hugo-theme-stack/v3
hugo mod tidy
```

> This starter template has been configured with `v3` version of theme. Due to the limitation of Go module, once the `v4` or up version of theme is released, you need to update the theme manually. (Modifying `config/module.toml` file)

### Deploy to another static page hostings

If you want to build this site using another static page hosting, you need to make sure they have Go installed in the machine. 

<details>
  <summary>Vercel</summary>
  
You need to overwrite build command to install manually Go:

```
amazon-linux-extras install golang1.11 && hugo --gc --minify
```

![](https://user-images.githubusercontent.com/5889006/156917172-01e4d418-3469-4ffb-97e4-a905d28b8424.png)

Make sure also to specify Hugo version in the environment variable `HUGO_VERSION` (Use the latest version of Hugo extended):

![Environment variable](https://user-images.githubusercontent.com/5889006/156917212-afb7c70d-ab85-480f-8288-b15781a462c0.png)
</details>

---

## My personal notes
I used the template: [Hugo Theme Stack Starter Template](https://github.com/CaiJimmy/hugo-theme-stack-starter).  
It works like a charm in Codespace!  

I usually run it on my machine (no Docker):
```bash
hugo server
```

### Icons
I realized the template misses the icons; I downloaded them from the template repo [hugo-theme-stack](https://github.com/CaiJimmy/hugo-theme-stack)

If you need a new icon, go to https://tablericons.com/.  
Look for the icon desired, the copy the `*.svg` file to `assets/icons`.  
After copying the `*.svg` content, change this properties to these values:
```svg
... 
width="24" height="24" 
stroke-width="2" 
stroke="currentColor" 
...
```

To change icons in sidebar menu, edit the related page; for example, to change `Works` icon, open `content\page\works\index.md` file and edit `icon` property:
```markdown
---
title: "Works"
date: 2022-03-06
slug: "works"
menu:
    main:
        weight: 2
        params: 
          **icon: brain**
---

Under construction.  
```

### Images
Use high quality images.  
They will be resized before publishing.  


### Content
Everything you put in `content` folder will be published.  
I moved example posts out of `content` folder, into `example` folder.  

### Multilingual mode
See: [Multilingual mode](https://gohugo.io/content-management/multilingual/).    
I use the [translate by name file](https://gohugo.io/content-management/multilingual/#translation-by-file-name) strategy.  
If a `.md` file has no language suffix, it is considered the default language (english).  



### Things to learn
How to customize content: [https://gohugo.io/categories/templates/](https://gohugo.io/templates/lists/).
