Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA9932629B
	for <lists+linux-usb@lfdr.de>; Fri, 26 Feb 2021 13:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhBZMTr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Feb 2021 07:19:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbhBZMTR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Feb 2021 07:19:17 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EDC1C0617AA
        for <linux-usb@vger.kernel.org>; Fri, 26 Feb 2021 04:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=r/6vfWhqipvLyzahEZKp3//4g9Jmkmn637+uZha2WN0=; b=M1zkB8Bgx1H4dApWcJ0SNeimlL
        ED73W38VsozuDNEB238xzl7w0bMhIxmScyrY5u5AWjFLJF7jhNVyFUbeTPz5wqwZOIO34MEl+ljeE
        SKnFVjMaB9X7DDU3ZUXY9rWzITUPImr323kcCDaIPsB9ulOvoegfRNH2L2P5tDp5CW+RFsWlGJAyZ
        1L95FLFcK5mtqGTbVAj1kPsUPoUfQ523pwlFrRGJbzxgaPcQ7CYMu69UYrFE9BgpplAis3grwZLaO
        0r2KBTrj3bybgTpmMacUfaO50y9gaEjjsQxksgDBmNGJ1jgFVPDJxqqoXOHfYSTF0fl54qoE2m8GV
        qAjmRn6Q==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:65187 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1lFc4m-0004Ad-Gx; Fri, 26 Feb 2021 13:18:32 +0100
Subject: Re: [PATCH v6 3/3] drm: Add GUD USB Display driver
To:     Peter Stuge <peter@stuge.se>
Cc:     hudson@trmm.net, markus@raatikainen.cc,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        sam@ravnborg.org
References: <20210219121702.50964-1-noralf@tronnes.org>
 <20210219121702.50964-4-noralf@tronnes.org>
 <20210225095825.6196.qmail@stuge.se>
 <ecd868f9-5877-63ea-7d3b-504147489b61@tronnes.org>
 <20210225213729.16532.qmail@stuge.se>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <2774f35e-9436-87a0-c596-6ddb4ec6c637@tronnes.org>
Date:   Fri, 26 Feb 2021 13:18:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210225213729.16532.qmail@stuge.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 25.02.2021 22.37, skrev Peter Stuge:
> Noralf Trønnes wrote:
>>> I forgot, but I have a two-tone (black/red) e-ink display here, and I
>>> also have a 3-bpp RGB TFT display.
>>
>> I've been anticipating the need for more formats, but I didn't want to
>> add them without having a user. Otherwise I could end up adding stuff
>> that would never be used. If you can test, there's no problem adding
>> support for more formats now.
> 
> That's great! I can't promise to to test the three-color (b/w/r) e-ink
> but I'll prepare a test setup for the RGB-TFT on the weekend.
> 

Ok, I'll add GUD_DRM_FORMAT_RGB111 in the next patch version.

Noralf.
