Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE61728FF6
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jun 2023 08:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237984AbjFIGbM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jun 2023 02:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237860AbjFIGbK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Jun 2023 02:31:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD16A1FE9
        for <linux-usb@vger.kernel.org>; Thu,  8 Jun 2023 23:30:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3F0C164F95
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 06:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E52CC433EF;
        Fri,  9 Jun 2023 06:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1686292256;
        bh=8KvbnK3WULiicFt+n6EuUMqyhD6lGjDs4AyURERfHOM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vzQALZ6Ggpmvcrqz0Kc9bzKklq/a8lVrpncVMPPxsdg+n41K7q8juynffi7MZoebF
         fQ9aiCliCSa6BzW/oZdgUN6cPHs8RjP5tX8P7LrSE6wLtHXFb9AZ3DAzAihb0Bavjl
         hLW1+AOpvmY26ONwne/tEoyzIsHQiu5w/HAnPcc0=
Date:   Fri, 9 Jun 2023 08:30:54 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dmitry Antipov <dmantipov@yandex.ru>
Cc:     Michael Jamet <michael.jamet@intel.com>, linux-usb@vger.kernel.org,
        lvc-project@linuxtesting.org
Subject: Re: [PATCH] thunderbolt: handle possible NULL pointer from
 get_device()
Message-ID: <2023060911-expose-unplanned-964a@gregkh>
References: <20230609061619.57756-1-dmantipov@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609061619.57756-1-dmantipov@yandex.ru>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 09, 2023 at 09:16:19AM +0300, Dmitry Antipov wrote:
> Handle possible NULL pointer returned by 'get_device()'
> in 'tb_xdomain_alloc()' and 'remove_unplugged_switch()'.

Sorry, but how can that happen?

> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  drivers/thunderbolt/icm.c     | 5 +++++
>  drivers/thunderbolt/xdomain.c | 4 ++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
> index 86521ebb2579..40ab6104a437 100644
> --- a/drivers/thunderbolt/icm.c
> +++ b/drivers/thunderbolt/icm.c
> @@ -2035,6 +2035,11 @@ static void remove_unplugged_switch(struct tb_switch *sw)
>  {
>  	struct device *parent = get_device(sw->dev.parent);
>  
> +	if (!parent) {

This will never fail, how did you test this?


> +		tb_warn(sw->tb, "no parent of switch %pUb\n", sw->uuid);
> +		return;
> +	}
> +
>  	pm_runtime_get_sync(parent);
>  
>  	/*
> diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
> index e2b54887d331..a0ee683d752e 100644
> --- a/drivers/thunderbolt/xdomain.c
> +++ b/drivers/thunderbolt/xdomain.c
> @@ -1883,6 +1883,8 @@ struct tb_xdomain *tb_xdomain_alloc(struct tb *tb, struct device *parent,
>  
>  	device_initialize(&xd->dev);
>  	xd->dev.parent = get_device(parent);
> +	if (!xd->dev.parent)

Again, how did you test this?  How can that ever happen?

thanks,

greg k-h
