Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A682E7F30
	for <lists+linux-usb@lfdr.de>; Thu, 31 Dec 2020 11:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgLaKEx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Dec 2020 05:04:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgLaKEx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Dec 2020 05:04:53 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8184C061575
        for <linux-usb@vger.kernel.org>; Thu, 31 Dec 2020 02:04:12 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id z21so12863811pgj.4
        for <linux-usb@vger.kernel.org>; Thu, 31 Dec 2020 02:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dFNB2JawdfToGNnV0DutDAmrcjgvVKQozyuOgj/8R+c=;
        b=sju60xBo9LD/xfwrzP8L1EjOFpCRnEOphxWSh8ayEPVdeOwucJi4fpi6vFaFci028B
         rLqLqATqks61CCYdwYDWHTaa05na8TyDmQlhFLrHcOZzp0CSl1QaY1iV7NmdWot9A0zP
         zBUfI62GFB33PiRP6n/MdLP1+xS+EKuyORVGrUHPdojYbtAKW+uCAvDfwwF04Fto4bqd
         pD9mQr6PCSimvuRHzm1HxTqn3q/gI3oNiin4byoFE67qnwYQheJRtPmCUuWRe2Xdb5zt
         cvUTHUiw+7gaYK1EBSV8EnAXFy8ORQKTFBnt/NpvAcTfKG+hJp75R0as02kNVHmgvPIw
         wEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dFNB2JawdfToGNnV0DutDAmrcjgvVKQozyuOgj/8R+c=;
        b=p2kH9BQO1Iszpq1dcAZYvvG45mjtePPm+68osurRX8ijFx5vwa+nqXwh75eknm7xWL
         m2Uw5aSIGFki5eku8O6LSU6zC2sa+j3oDdUlVwrSHm9TsT1zk86lPC/ezsO3k+jlQOIx
         1rWju6GVbp33jG6CkJ9Pmpf/tgVobi3y8MAg6lLT3boMApKmt91hQDSf94LncPfodoCZ
         KDHqB8fHF0oL3tqEGxYlAJg02ekeRaxTfZwU1X4h5gjoaCplaeOOjwq5VCv2PvfGfxK7
         NnjQ7Ao7ehlT+rCFCJ8WzhTaVei0/i1OIguePoKWDB4Vufn31NwPfZK+o+go3gcFGGRF
         U2Qg==
X-Gm-Message-State: AOAM533upQ0W5xQhHNe7ZC1GYLKDDs80EoNRQKguGWGTH4Zbq7lGo/9F
        Qh6bzjXCVv+APmyioXP+B1o=
X-Google-Smtp-Source: ABdhPJxuth1OWyobSXhnA2VG5DFcH53M12uqsg9IvMOYYyizQCgnYJHpvXiJ3UCtlIMrkDsk9wN81g==
X-Received: by 2002:a63:f010:: with SMTP id k16mr13645981pgh.28.1609409052412;
        Thu, 31 Dec 2020 02:04:12 -0800 (PST)
Received: from b29397-desktop ([84.17.34.137])
        by smtp.gmail.com with ESMTPSA id b10sm48421404pgh.15.2020.12.31.02.04.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Dec 2020 02:04:11 -0800 (PST)
Date:   Thu, 31 Dec 2020 18:04:00 +0800
From:   Peter Chen <hzpeterchen@gmail.com>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v2] usb: gadget: configfs: Preserve function ordering
 after bind failure
Message-ID: <20201231100122.GA12514@b29397-desktop>
References: <20201229224443.31623-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201229224443.31623-1-jackp@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-12-29 14:44:43, Jack Pham wrote:
> From: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> 
> When binding the ConfigFS gadget to a UDC, the functions in each
> configuration are added in list order. However, if usb_add_function()
> fails, the failed function is put back on its configuration's
> func_list and purge_configs_funcs() is called to further clean up.
> 
> purge_configs_funcs() iterates over the configurations and functions
> in forward order, calling unbind() on each of the previously added
> functions. But after doing so, each function gets moved to the
> tail of the configuration's func_list. This results in reshuffling
> the original order of the functions within a configuration such
> that the failed function now appears first even though it may have
> originally appeared in the middle or even end of the list. At this
> point if the ConfigFS gadget is attempted to re-bind to the UDC,
> the functions will be added in a different order than intended,
> with the only recourse being to remove and relink the functions all
> over again.
> 
> An example of this as follows:
> 
> ln -s functions/mass_storage.0 configs/c.1
> ln -s functions/ncm.0 configs/c.1
> ln -s functions/ffs.adb configs/c.1	# oops, forgot to start adbd
> echo "<udc device>" > UDC		# fails
> start adbd
> echo "<udc device>" > UDC		# now succeeds, but...
> 					# bind order is
> 					# "ADB", mass_storage, ncm
> 
> [30133.118289] configfs-gadget gadget: adding 'Mass Storage Function'/ffffff810af87200 to config 'c'/ffffff817d6a2520
> [30133.119875] configfs-gadget gadget: adding 'cdc_network'/ffffff80f48d1a00 to config 'c'/ffffff817d6a2520
> [30133.119974] using random self ethernet address
> [30133.120002] using random host ethernet address
> [30133.139604] usb0: HOST MAC 3e:27:46:ba:3e:26
> [30133.140015] usb0: MAC 6e:28:7e:42:66:6a
> [30133.140062] configfs-gadget gadget: adding 'Function FS Gadget'/ffffff80f3868438 to config 'c'/ffffff817d6a2520
> [30133.140081] configfs-gadget gadget: adding 'Function FS Gadget'/ffffff80f3868438 --> -19
> [30133.140098] configfs-gadget gadget: unbind function 'Mass Storage Function'/ffffff810af87200
> [30133.140119] configfs-gadget gadget: unbind function 'cdc_network'/ffffff80f48d1a00
> [30133.173201] configfs-gadget a600000.dwc3: failed to start g1: -19
> [30136.661933] init: starting service 'adbd'...
> [30136.700126] read descriptors
> [30136.700413] read strings
> [30138.574484] configfs-gadget gadget: adding 'Function FS Gadget'/ffffff80f3868438 to config 'c'/ffffff817d6a2520
> [30138.575497] configfs-gadget gadget: adding 'Mass Storage Function'/ffffff810af87200 to config 'c'/ffffff817d6a2520
> [30138.575554] configfs-gadget gadget: adding 'cdc_network'/ffffff80f48d1a00 to config 'c'/ffffff817d6a2520
> [30138.575631] using random self ethernet address
> [30138.575660] using random host ethernet address
> [30138.595338] usb0: HOST MAC 2e:cf:43:cd:ca:c8
> [30138.597160] usb0: MAC 6a:f0:9f:ee:82:a0
> [30138.791490] configfs-gadget gadget: super-speed config #1: c
> 
> Fix this by reversing the iteration order of the functions in
> purge_config_funcs() when unbinding them, and adding them back to
> the config's func_list at the head instead of the tail. This
> ensures that we unbind and unwind back to the original list order.
> 
> Fixes: 88af8bbe4ef7 ("usb: gadget: the start of the configfs interface")
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
> v2: rebase on gregkh's usb-testing
> 
>  drivers/usb/gadget/configfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 56051bb97349..3dda1d63f231 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -1248,9 +1248,9 @@ static void purge_configs_funcs(struct gadget_info *gi)
>  
>  		cfg = container_of(c, struct config_usb_cfg, c);
>  
> -		list_for_each_entry_safe(f, tmp, &c->functions, list) {
> +		list_for_each_entry_safe_reverse(f, tmp, &c->functions, list) {
>  
> -			list_move_tail(&f->list, &cfg->func_list);
> +			list_move(&f->list, &cfg->func_list);
>  			if (f->unbind) {
>  				dev_dbg(&gi->cdev.gadget->dev,
>  					"unbind function '%s'/%p\n",
> -- 

Hi Jack,

I am curious what features are broken if the functions are added with
not planned order?

-- 

Thanks,
Peter Chen

