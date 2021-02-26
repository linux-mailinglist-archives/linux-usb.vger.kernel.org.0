Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6A6326254
	for <lists+linux-usb@lfdr.de>; Fri, 26 Feb 2021 13:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhBZMKR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Feb 2021 07:10:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhBZMKR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Feb 2021 07:10:17 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3D6C061574
        for <linux-usb@vger.kernel.org>; Fri, 26 Feb 2021 04:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=069mkm7tqItUG64Ib7wUtneTZFgWoa3IFZJXAvEdDLw=; b=dLfKwVJh7zQUEaYCNBkkubHqqr
        ktYyAfOJhtunI4nYnifVe4V5LgzTWkZeQujkEhMpOcxOyUh5aL2E9H4UNKk5yz3bzJKG/KAgB0djH
        3T4oB1NeEpJDYReVt0iDNm4AY8cqyt4TF1ePmSlTA/kJ+aovs8QSAOIGx1o2/57qoWw0+zlZZse2R
        vsg4BPJbhQc5PojOwsbvPt0/FdWRe4TuAC1HzrULRL1qzWYkNNDW6mkAjFHUJ7DUZk6SgXn4ZiwDp
        M41saTuaKFIz575OJcR6ILGnZxsWyH0uG/6vV2+dRrWxObfNjPfHScffIPcTsmFrcM8/+OQpu+kZl
        0PkEbyig==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:65161 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1lFbvr-0007hf-M6; Fri, 26 Feb 2021 13:09:19 +0100
Subject: Re: [PATCH v6 3/3] drm: Add GUD USB Display driver
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
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
Message-ID: <3ee3fad6-61be-b848-a68f-df7c2e0001f9@tronnes.org>
Date:   Fri, 26 Feb 2021 13:09:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5c00a868-3a2f-438b-3670-ee86caef4d2a@tronnes.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 20.02.2021 18.27, skrev Noralf Trønnes:
> 
> 
> Den 19.02.2021 22.42, skrev Peter Stuge:

>>
>> More generally it's not very typical in USB to report the data size
>> separately from the data itself, if reporting size explicitly at all.
>>
>> Sizes can be part of the data structure itself (like in descriptors) but
>> on the application layer (like here) it's convenient to just decide a
>> sensible fixed maximum size and let the host try to always transfer
>> that size while accepting short transfers. Unlike read() a short
>> transfer only ever happens if and when a device intends for it,
>> so that's like an in-band handshake but "for free".
>>
>> Oh, and does/should the GUD EDID change if the panel "behind" the device
>> CPU on a hotpluggable connector changes? It wouldn't be great to require
>> GUD driver reprobe in that case. But maybe DRM requires that anyway?
>>
> 
> If gud_connector_status_req.status has changed since last poll or
> GUD_CONNECTOR_STATUS_CHANGED is set, DRM will notify userspace which
> will reprobe the connector. connector->epoch_counter++ in
> gud_connector_status_request() triggers that.
> 
>>
>> I'm sorry I didn't spot this pattern earlier, I understand that it's late
>> in the game and that changing it needs the gadget to change as well, but I
>> do really think this is a worthwhile change throughout the protocol.
>>
> 
> I see what you mean, I'll give it a try.
> 

Peter, please have a look at this diff and see if I'm on the right track
here: https://gist.github.com/notro/a43a93a3aa0cc75d930890b7b254fc0a

I want to avoid waisting a patch version cycle by being way off.

Noralf.
