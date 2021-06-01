Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74FF2392C50
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 13:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233148AbhE0LH4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 May 2021 07:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233032AbhE0LH4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 May 2021 07:07:56 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82202C061574
        for <linux-usb@vger.kernel.org>; Thu, 27 May 2021 04:06:21 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id z130so2478138wmg.2
        for <linux-usb@vger.kernel.org>; Thu, 27 May 2021 04:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ummK6qfHHovxgsh1qAiAuit2Ah0G9hijqJN9zZVv1/0=;
        b=y32EG0ZeB5pHnaFFE4hd3qjmELxCKWPasGNhZVK2KNPfjsmZjnOVJxKGniO03vuQ7E
         58U2S8SiSp6qPG/R7EfiWnJnWPTySvr65KmGiOq4Te5SWv6I0/9QpSo5WDsxE8ShUdt5
         qlu/E9ZSnbWC86PJwYn0HIcwy2LD/6zqEG9Dvnde5mjgIJAPLI0yUrwKmG40fVGigpwl
         2csdVxTSZUqkfXvC5wlSZsyO7NYy0aBBb1pjd2pHy4eIdG2nnFpzM9ALSHNPy5UtXboo
         GAVObA2n3XAAPrlJrPOE30mSHymCpotbb0v8hwe/XE9ZjwK9vKyrNlmWPkmGPqoX8LdE
         lanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ummK6qfHHovxgsh1qAiAuit2Ah0G9hijqJN9zZVv1/0=;
        b=Wj5M/5x4Er5Bj+9MugId4HiA/3J8wKJG7951FIn9rPE9/C21T9Qh6FhjZqTKcfMjCJ
         C6q6xOEkfbZNQTeO09fRv/v0NOSS60iqcMSZ8hQ2lsZp96Q7rodHMUm51JmhdBoU9dI4
         OeM02G/zN2/7ZldWk6Af13dGfSCQNaMDZaEI+KOHlMEZLHE+vP4JFJLn0KxznCp5ZpSk
         Ph04z4mMHi+Z87C2TV6n8xfeFmC22TAbQKh97oTP0P9WWNNYl++ERyPW0tYzoBHD6Vir
         v/M7mNTsGTOzTqinzj4eAoEH/CmQg8HvaJMdd/mBae1dxQ0wfSpEOBUssxP/wzfKZPt+
         TlwQ==
X-Gm-Message-State: AOAM530eFj0y9vWKynyirvhRVr0xIudNvYfXwtTen2XGmhqAbo5pF9AT
        a2atEt+KA4mJ7gt2M9VeEy/FeURJcEDxHw==
X-Google-Smtp-Source: ABdhPJxUkvVSOzieXINUUjbfGicjBFU/rPCLLdCo5DfT0V4Cs7PwsidbIX5NjFxx4+fN8wKazUYGjA==
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr2771652wmh.183.1622113580028;
        Thu, 27 May 2021 04:06:20 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id x2sm2381237wmj.3.2021.05.27.04.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 04:06:19 -0700 (PDT)
Date:   Thu, 27 May 2021 12:06:11 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 17/24] usb: host: xhci: Remove unused variable 'len'
Message-ID: <20210527110611.GK543307@dell>
References: <20210526130037.856068-1-lee.jones@linaro.org>
 <20210526130037.856068-18-lee.jones@linaro.org>
 <YK9Ju9/kdaRv1jcT@kroah.com>
 <20210527081609.GF543307@dell>
 <5958f870-1834-3132-a729-2b26a84349ea@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5958f870-1834-3132-a729-2b26a84349ea@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 27 May 2021, Mathias Nyman wrote:

> On 27.5.2021 11.16, Lee Jones wrote:
> > On Thu, 27 May 2021, Greg Kroah-Hartman wrote:
> > 
> >> On Wed, May 26, 2021 at 02:00:30PM +0100, Lee Jones wrote:
> >>> Fixes the following W=1 kernel build warning(s):
> >>>
> >>>  drivers/usb/host/xhci.c: In function ‘xhci_unmap_temp_buf’:
> >>>  drivers/usb/host/xhci.c:1349:15: warning: variable ‘len’ set but not used [-Wunused-but-set-variable]
> >>>
> >>> Cc: Mathias Nyman <mathias.nyman@intel.com>
> >>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >>> Cc: linux-usb@vger.kernel.org
> >>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> >>> ---
> >>>  drivers/usb/host/xhci.c | 9 ++++-----
> >>>  1 file changed, 4 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> >>> index 27283654ca080..ac2a7d4288883 100644
> >>> --- a/drivers/usb/host/xhci.c
> >>> +++ b/drivers/usb/host/xhci.c
> >>> @@ -1346,7 +1346,6 @@ static bool xhci_urb_temp_buffer_required(struct usb_hcd *hcd,
> >>>  
> >>>  static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
> >>>  {
> >>> -	unsigned int len;
> >>>  	unsigned int buf_len;
> >>>  	enum dma_data_direction dir;
> >>>  
> >>> @@ -1362,10 +1361,10 @@ static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
> >>>  				 dir);
> >>>  
> >>>  	if (usb_urb_dir_in(urb))
> >>> -		len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
> >>> -					   urb->transfer_buffer,
> >>> -					   buf_len,
> >>> -					   0);
> >>> +		sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
> >>> +				     urb->transfer_buffer,
> >>> +				     buf_len,
> >>> +				     0);
> >>
> >> Sorry, but no, I keep rejecting this over and over, it needs to handle
> >> the error handling properly and not paper over it like this :(
> > 
> > Will fix.
> > 
> >> All the bots keep tripping up on it, you are not alone.
> > 
> 
> This is getting a lot of attention. Something like this should fix it:
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 27283654ca08..306ab81421fd 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1361,12 +1361,16 @@ static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
>  				 urb->transfer_buffer_length,
>  				 dir);
>  
> -	if (usb_urb_dir_in(urb))
> +	if (usb_urb_dir_in(urb)) {
>  		len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
>  					   urb->transfer_buffer,
>  					   buf_len,
>  					   0);
> -
> +		if (len != buf_len) {
> +			xhci_dbg(xhci, "Copy from tmp buf to urb sg list failed\n");
> +			urb->actual_length = len;
> +		}
> +	}
>  	urb->transfer_flags &= ~URB_DMA_MAP_SINGLE;
>  	kfree(urb->transfer_buffer);
>  	urb->transfer_buffer = NULL;
>  
> urb->actual_length is now properly set.
> The debug level message will help me find the cause if we ever need
> to debug oddly behaving devices.
> 
> Note this is a very rarly taken codepath for quirky xHC harware that
> can't handle a specific sequence of buffer lengths queued.
> 
> I can write a proper commit message and push this forward

Okay by me.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
