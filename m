Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA0631CE52
	for <lists+linux-usb@lfdr.de>; Tue, 16 Feb 2021 17:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhBPQoj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Feb 2021 11:44:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbhBPQoi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Feb 2021 11:44:38 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B41C061574
        for <linux-usb@vger.kernel.org>; Tue, 16 Feb 2021 08:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=sC3sO/bS72AtEqP90G5x7VExQuWQRyOINPX4+6P8VmY=; b=EYHxHxCTeHbl7b3fL2i2hxMZaZ
        O3mB4XYP84ABXfBGIFE52Istlt/BdDekT14IumA2bJPsBLeKzwDV5LyJfgSX1QQDfPqv9WnRNrz06
        rT7ri+AIN6zCPlNgEudgi6gPl/IZzQoUqa/kejnB2uGCmRU7gWPeSF6QCaT8xjguyjC+sgzRduvU3
        twKgdkdN60cTtIGtm7meCXhiZNhv6Dg4BVRsW+Sn07AsjFSmwvku6lYxAdWeZvMTvSozr75H0E5ww
        SSaM4SZd7J64KXYgrWGG1nafw66yX2UHnDZrncn/thIwdYEUNMXk8GlUKh1H2zoS9W/sKKKxVUITe
        GiDLksQQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:49315 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1lC3Ro-0005BE-9F; Tue, 16 Feb 2021 17:43:36 +0100
Subject: Re: [PATCH v5 3/3] drm: Add Generic USB Display driver
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
To:     Oliver Neukum <oneukum@suse.de>, dri-devel@lists.freedesktop.org
Cc:     hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
        linux-usb@vger.kernel.org, th020394@gmail.com, lkundrak@v3.sk,
        pontus.fuchs@gmail.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
        peter@stuge.se
References: <20210212174609.58977-1-noralf@tronnes.org>
 <20210212174609.58977-4-noralf@tronnes.org>
 <5164bb01b7f3cf71926109a37b9e3957cfb630ba.camel@suse.de>
 <316502da-218e-3837-d356-79a7b5dce7ae@tronnes.org>
Message-ID: <d89c375e-3dea-89a3-2315-65ee91fd17f0@tronnes.org>
Date:   Tue, 16 Feb 2021 17:43:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <316502da-218e-3837-d356-79a7b5dce7ae@tronnes.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 16.02.2021 17.40, skrev Noralf Trønnes:
> 
> 
> Den 16.02.2021 14.36, skrev Oliver Neukum:
>> Am Freitag, den 12.02.2021, 18:46 +0100 schrieb Noralf Trønnes:
>>> +static void gud_connector_early_unregister(struct drm_connector *connector)
>>> +{
>>> +       struct gud_connector *gconn = to_gud_connector(connector);
>>> +
>>> +       backlight_device_unregister(gconn->backlight);
>>> +       cancel_work_sync(&gconn->backlight_work);
>>> +}
>>
>> Hi,
>>
>> this looks like you are creating a race condition where the queued work
>> may operate on an already unregistered backlight.
>>
> 
> backlight_device_unregister() sets bd->ops = NULL. This means that
> userspace can't update brightness anymore, and thus won't call into this
> driver. After that it should be safe to flush/cancel the workqueue.
> 
> Unless I'm missing something here.
> 

And it's ok for the worker to operate on an unregistered backlight, the
memory is still available. It's freed when the connector goes away.

Noralf.
