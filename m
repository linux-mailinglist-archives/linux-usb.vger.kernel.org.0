Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96DFA62FA57
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 17:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235287AbiKRQeU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 11:34:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241578AbiKRQeQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 11:34:16 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52FB93CC1
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 08:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=eOwCWuzDmVHYBcMl1xoDBfPI5DnFpOhIDiik5Ypvrz4=; b=MwzB1
        Oesh88N2M5bYs/NjfA+Je0Agn0Sf2nEEf2YNBeZoT58lil+IBy1WANlNc4x1mbXBR3clGcvVAHJuw
        Po1+dEb7blwGlyVKfJKnckMh/Y3ipsQyrrSZaTUGa6rfngRyS2fgYf25qrmJ2Brym3es1nrelSyql
        HLhqV5x2THufXuQuFffGKTWOAAGfAK8aj+jm5/+DgCPZh7OIzUckbNJ6nYpiWs+l35zAoBJyywUt3
        jMnpEfTh0zIvtZMt6+TNsdRdZuJb+2+7RHw+ILqNKRrRACU/ibvzjb+6L+kXeIOst2DrN1jlABU9P
        Pojq/2IlCBEPjAvRMv6B6Mfpskllw==;
Received: from 188-39-28-98.static.enta.net ([188.39.28.98] helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <john@metanate.com>)
        id 1ow4Jd-00047H-4p;
        Fri, 18 Nov 2022 16:34:09 +0000
Date:   Fri, 18 Nov 2022 16:34:08 +0000
From:   John Keeping <john@metanate.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Jack Pham <quic_jackp@quicinc.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH] usb: gadget: configfs: Prevent double delete from
 purge_configs_funcs
Message-ID: <Y3e0ANWtax4SVONK@donbot>
References: <20221117053548.28158-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117053548.28158-1-quic_ugoswami@quicinc.com>
X-Authenticated: YES
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 17, 2022 at 11:05:48AM +0530, Udipto Goswami wrote:
> Currently the function purge_configs_funcs isn't protected by any lock
> So there is a potential race possible there id udc called composite_unbind
> and say at the same time the configfs_composite_bind also got executed.
> If bind fails and follows the error path, driver will end up calling the
> purge_configfs_funcs again, resulting in double free from func_list.
> 
> Fix this by introducing mutex gi->lock to make sure serial execution
> can be maintained. Also, usage of list_for_each_entry_safe is risky
> here since the tmp variable is still valid for the next iteration, in
> order to ensure list traversal is clean, use list_last_entry.

I don't understand how this can happen.

purge_configs_funcs() is called from the .bind and .unbind
usb_gadget_driver hooks, and those should not be able to run at the same
time - if bind has not succeeded, how does unbinding make sense?

> Fixes: 6cd0fe913879 ("usb: gadget: configfs: Preserve function ordering after bind failure")
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
>  drivers/usb/gadget/configfs.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 3a6b4926193e..f1ac87906897 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -1246,14 +1246,14 @@ static void purge_configs_funcs(struct gadget_info *gi)
>  {
>  	struct usb_configuration	*c;
>  
> +	mutex_lock(&gi->lock);
>  	list_for_each_entry(c, &gi->cdev.configs, list) {
> -		struct usb_function *f, *tmp;
> +		struct usb_function *f;
>  		struct config_usb_cfg *cfg;
>  
>  		cfg = container_of(c, struct config_usb_cfg, c);
> -
> -		list_for_each_entry_safe_reverse(f, tmp, &c->functions, list) {
> -
> +		while (!list_empty(&c->functions)) {
> +			f = list_last_entry(&c->functions, struct usb_function, list);
>  			list_move(&f->list, &cfg->func_list);
>  			if (f->unbind) {
>  				dev_dbg(&gi->cdev.gadget->dev,
> @@ -1269,6 +1269,7 @@ static void purge_configs_funcs(struct gadget_info *gi)
>  		c->highspeed = 0;
>  		c->fullspeed = 0;
>  	}
> +	mutex_unlock(&gi->lock);
>  }
>  
>  static int configfs_composite_bind(struct usb_gadget *gadget,
> -- 
> 2.17.1
> 
