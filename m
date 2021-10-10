Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88BF42816E
	for <lists+linux-usb@lfdr.de>; Sun, 10 Oct 2021 15:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbhJJNGm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Oct 2021 09:06:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:57348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232516AbhJJNGl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 10 Oct 2021 09:06:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C121860F92;
        Sun, 10 Oct 2021 13:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633871083;
        bh=LLZzJAseIQ02oNyDeIe8C01FJD+RjQIbcd2sa2HoFLI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pCrhjtsQEa65rEZd5IGVKyZB556zbEskV3x7aW9NnoKNKeqt4BdN4F/k9tbbhGouK
         PIbdFrDvhN4lap0q/CVCM4atBxSHHUb7JdE2+KpGcOfhHtOerNFvkdAdpzjMxTErMe
         8bC8NCYEqXqA1vRWymytWG0gBEuJuIoZQ/+S1C4M=
Date:   Sun, 10 Oct 2021 15:04:40 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 1/3] usb: gadget: configfs: avoid list move operation
 of usb_function
Message-ID: <YWLk6IvBsgpT+s75@kroah.com>
References: <1630976977-13938-1-git-send-email-quic_linyyuan@quicinc.com>
 <1630976977-13938-2-git-send-email-quic_linyyuan@quicinc.com>
 <YVwywFfe/x8OEHh8@kroah.com>
 <DM8PR02MB8198787E8C17F646B7DED9F4E3B39@DM8PR02MB8198.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR02MB8198787E8C17F646B7DED9F4E3B39@DM8PR02MB8198.namprd02.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Oct 09, 2021 at 02:26:07AM +0000, Linyu Yuan (QUIC) wrote:
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Sent: Tuesday, October 5, 2021 7:11 PM
> > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> > Subject: Re: [PATCH v5 1/3] usb: gadget: configfs: avoid list move operation
> > of usb_function
> > 
> > On Tue, Sep 07, 2021 at 09:09:35AM +0800, Linyu Yuan wrote:
> > > add a new list which link all usb_function at configfs layers,
> > > it means that after link a function a configuration,
> > > from configfs layer, we can still found all functions,
> > > it will allow trace all functions from configfs.
> > 
> > I am sorry, but I do not understand this paragraph.  Can you try
> > rewording it?
> > 
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > How did the kernel test robot report this?  You are adding a new
> > function here, it is not a bug you are fixing, right?
> > 
> > 
> > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > ---
> > > v2: fix unused cfg variable warning
> > > v3: add struct inside configfs.c
> > > v4: no change
> > > v5: lost v2 fix, add it again
> > >
> > >  drivers/usb/gadget/configfs.c | 55 ++++++++++++++++++++++++----------
> > ---------
> > >  1 file changed, 31 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> > > index 477e72a..5b2e6f9 100644
> > > --- a/drivers/usb/gadget/configfs.c
> > > +++ b/drivers/usb/gadget/configfs.c
> > > @@ -58,6 +58,11 @@ static inline struct gadget_info
> > *to_gadget_info(struct config_item *item)
> > >  	return container_of(to_config_group(item), struct gadget_info,
> > group);
> > >  }
> > >
> > > +struct config_usb_function {
> > > +	struct list_head list;
> > > +	struct usb_function *f;
> > > +};
> > 
> > What lock protects this list?
> > 
> > > +
> > >  struct config_usb_cfg {
> > >  	struct config_group group;
> > >  	struct config_group strings_group;
> > > @@ -420,7 +425,7 @@ static int config_usb_cfg_link(
> > >  	struct usb_function_instance *fi = container_of(group,
> > >  			struct usb_function_instance, group);
> > >  	struct usb_function_instance *a_fi;
> > > -	struct usb_function *f;
> > > +	struct config_usb_function *cf;
> > >  	int ret;
> > >
> > >  	mutex_lock(&gi->lock);
> > > @@ -438,21 +443,29 @@ static int config_usb_cfg_link(
> > >  		goto out;
> > >  	}
> > >
> > > -	list_for_each_entry(f, &cfg->func_list, list) {
> > > -		if (f->fi == fi) {
> > > +	list_for_each_entry(cf, &cfg->func_list, list) {
> > > +		if (cf->f->fi == fi) {
> > >  			ret = -EEXIST;
> > >  			goto out;
> > >  		}
> > >  	}
> > >
> > > -	f = usb_get_function(fi);
> > > -	if (IS_ERR(f)) {
> > > -		ret = PTR_ERR(f);
> > > +	cf = kzalloc(sizeof(*cf), GFP_KERNEL);
> > 
> > Why "kzalloc" and not "kmalloc"?
> > 
> > I don't understand why you are moving everything to a single list in the
> > system, what is wrong with the existing per-device one?
> Thanks Greg,
> 
> Let me explain what I want to do in this  change,
> 
> For original code,  when add a function to configuration, it will add function 
> struct usb_function {
> ...
> struct list_head		list; [1]
> };
> to following list,
> struct config_usb_cfg {
> ...
> 	struct list_head func_list; [2]
> };
> Then when bind happen, it will move [1] to following list,
> struct usb_configuration {
> ...
> struct list_head	functions; [3]
> };
> 
> When unbind, it will move [1] back to [2].
> 
> We can see list [1] move between two list head, it is not easy to trace.
> 
> And when I add trace, I only want to get trace info from structure defined in configfs.c,
> 
> So I add a new list which ONLY add/remove to head [2] and it represent a function in configfs layer.
> And original list [1] will ONLY add/remove to head [3].

I am sorry, but I still do not understand.  These are different types of
things that you are now putting all on the same list?

What prevents your trace functions from working today with the existing
code?  What can you not get access to?

All you say here is "it is not easy to trace", but that does not explain
_what_ you are missing and why you need to change that.

thanks,

greg k-h
