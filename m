Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8157C327486
	for <lists+linux-usb@lfdr.de>; Sun, 28 Feb 2021 22:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhB1VFo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 Feb 2021 16:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhB1VFo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 28 Feb 2021 16:05:44 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC62DC06174A
        for <linux-usb@vger.kernel.org>; Sun, 28 Feb 2021 13:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=X0MXwH6FHHu6zd6OcezB6lg1gPu4rqv9Y1Ez4KIqcvM=; b=lWtyJwv06uXOWNBKwdnnrr35lT
        CtGGQA4Z/WoCalxGRwoouw9lHBH5U3xa5lzeX5M2vBCgWJPsWV5WLL29a1rByMTZlEKBtBPdAKxKn
        0nhowNW3jQWYiLHxSqVTUwbZ2XawtDQxZAeVnJ0dIgUMWY7bNI+p//ZYtUbVSF01nl0iKnXHhOZoe
        1R928Mgyea+YsrYxnjyBF2Nkq4qP9Wk66Wp13LyG/7cu7gbpUw9qLMqm6t7CTClEtoIAoQLdzIM7T
        g8Hyzvd8DWLjybPfbMbpg+WHGN7q683uP+ud1e/0OjMB70FbI/hUpYd7FLHALn94L2VvvoEYkDACL
        LeYkEaDw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56877 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1lGTF6-000554-Hl; Sun, 28 Feb 2021 22:04:44 +0100
Subject: Re: [PATCH v6 3/3] drm: Add GUD USB Display driver
To:     Peter Stuge <peter@stuge.se>
Cc:     hudson@trmm.net, markus@raatikainen.cc,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        sam@ravnborg.org
References: <20210219121702.50964-1-noralf@tronnes.org>
 <20210219121702.50964-4-noralf@tronnes.org>
 <20210219214243.11330.qmail@stuge.se>
 <5c00a868-3a2f-438b-3670-ee86caef4d2a@tronnes.org>
 <3ee3fad6-61be-b848-a68f-df7c2e0001f9@tronnes.org>
 <20210228015209.3252.qmail@stuge.se>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <230829ee-4bf1-7211-d0a3-2ec07fdcd1c1@tronnes.org>
Date:   Sun, 28 Feb 2021 22:04:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210228015209.3252.qmail@stuge.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 28.02.2021 02.52, skrev Peter Stuge:
> Noralf Trønnes wrote:
>> Peter, please have a look at this diff and see if I'm on the right track
>> here: https://gist.github.com/notro/a43a93a3aa0cc75d930890b7b254fc0a
> 
> Yes that's exactly what I meant; this way the possibility for contradicting
> sizes is eliminated by protocol and not just by implementation - very nice!
> 
> Some more comments, sorry if this is just because of ongoing work:
> 
> Perhaps the functions taking usb_device + ifnum could take usb_interface
> instead - but I don't know if that would simplify or complicate things.
> Alan mentioned this idea in similar circumstances in another thread.
> I don't feel strongly, but perhaps it's cleaner.
> 

I agree it's cleaner, this way I don't have to store the interface
number in gdrm.

> gud_usb_control_msg() now seems almost redundant, maybe it could be removed.
> 

There are 4 callers so I think it makes sense still.

> In gud_usb_set() if NULL == buf then that's passed to usb_control_msg()
> along with len, which likely crashes if len > 0, so it may be good to
> check or enforce that, maybe with else len=0; before the gud_usb_transfer()
> call.
> 

Ok.

> Finally a small style note that I'd personally change a few if (ret > 0) {
> blocks to have one indent level less and do each check right away, e.g. in
> gud_connector_get_modes():
> 
> ret = gud_usb_get()
> if (ret % EDID_LENGTH) {
> 	drm_err();
> } else if (ret > 0) {
> 	edid_ctx.len = ret;
> 	edid = drm_do_get_edid();
> }
> 
> and later on in the function by the display modes one indent level
> could be saved with a goto:
> 
> if (ret <= 0)
> 	goto out;
> 
> but obviously no huge deal.
> 

It makes for a better read so I'll do that.

> 
> In general it's really helpful for device development to see error messages
> when the device behaves incorrectly, the "Invalid .. size" errors are great
> examples of this, but e.g. gud_get_display_descriptor() returns -EIO without
> a message. Maybe there are opportunities for further helpful error messages?
> 

The message is printed by the caller:

	ret = gud_get_display_descriptor(intf, &desc);
	if (ret) {
		DRM_DEV_DEBUG_DRIVER(dev, "Not a display interface: ret=%d\n", ret);
		return -ENODEV;
	}

It's a debug message enabled by writing to /sys/module/drm/parameters/debug.
The reason for not making it an error message, is that I want the driver
to just ignore non-display vendor class interfaces so they can co-exist
on the device. Someone might make an open protocol gpio (vendor class)
interface driver some day, or adc, i2c, spi, rtc, or...

Thanks,
Noralf.
