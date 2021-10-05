Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E43524224B4
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 13:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233886AbhJELMx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 07:12:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:46558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233514AbhJELMx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Oct 2021 07:12:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B877461181;
        Tue,  5 Oct 2021 11:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633432263;
        bh=t9Hi3Bt2HsfxfTCScm20Dadmmfq/ocN/k5wAEgJ8AD8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dXiaCsGJcbN14LdLMk2MUv3ZqTgFHQcvIjb84vOarse3FttNgzMGYaYD6CkLKp5nt
         zLBMip74WoCQSCMhDRoEVKI+Qa7DOSPB05+sIRSc2mhFYY71V38ooqoQKDUiv6693c
         KjxFbLoc3CD3r+uXWUx5paTPjc8pjX6u09qwvBlg=
Date:   Tue, 5 Oct 2021 13:10:56 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 1/3] usb: gadget: configfs: avoid list move operation
 of usb_function
Message-ID: <YVwywFfe/x8OEHh8@kroah.com>
References: <1630976977-13938-1-git-send-email-quic_linyyuan@quicinc.com>
 <1630976977-13938-2-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630976977-13938-2-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 07, 2021 at 09:09:35AM +0800, Linyu Yuan wrote:
> add a new list which link all usb_function at configfs layers,
> it means that after link a function a configuration,
> from configfs layer, we can still found all functions,
> it will allow trace all functions from configfs.

I am sorry, but I do not understand this paragraph.  Can you try
rewording it?

> 
> Reported-by: kernel test robot <lkp@intel.com>

How did the kernel test robot report this?  You are adding a new
function here, it is not a bug you are fixing, right?


> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: fix unused cfg variable warning
> v3: add struct inside configfs.c
> v4: no change
> v5: lost v2 fix, add it again
> 
>  drivers/usb/gadget/configfs.c | 55 ++++++++++++++++++++++++-------------------
>  1 file changed, 31 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 477e72a..5b2e6f9 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -58,6 +58,11 @@ static inline struct gadget_info *to_gadget_info(struct config_item *item)
>  	return container_of(to_config_group(item), struct gadget_info, group);
>  }
>  
> +struct config_usb_function {
> +	struct list_head list;
> +	struct usb_function *f;
> +};

What lock protects this list?

> +
>  struct config_usb_cfg {
>  	struct config_group group;
>  	struct config_group strings_group;
> @@ -420,7 +425,7 @@ static int config_usb_cfg_link(
>  	struct usb_function_instance *fi = container_of(group,
>  			struct usb_function_instance, group);
>  	struct usb_function_instance *a_fi;
> -	struct usb_function *f;
> +	struct config_usb_function *cf;
>  	int ret;
>  
>  	mutex_lock(&gi->lock);
> @@ -438,21 +443,29 @@ static int config_usb_cfg_link(
>  		goto out;
>  	}
>  
> -	list_for_each_entry(f, &cfg->func_list, list) {
> -		if (f->fi == fi) {
> +	list_for_each_entry(cf, &cfg->func_list, list) {
> +		if (cf->f->fi == fi) {
>  			ret = -EEXIST;
>  			goto out;
>  		}
>  	}
>  
> -	f = usb_get_function(fi);
> -	if (IS_ERR(f)) {
> -		ret = PTR_ERR(f);
> +	cf = kzalloc(sizeof(*cf), GFP_KERNEL);

Why "kzalloc" and not "kmalloc"?

I don't understand why you are moving everything to a single list in the
system, what is wrong with the existing per-device one?

thanks,

greg k-h
