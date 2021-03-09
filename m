Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC68C332E0D
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 19:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhCISRA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 13:17:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbhCISQv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Mar 2021 13:16:51 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 232C1C06174A
        for <linux-usb@vger.kernel.org>; Tue,  9 Mar 2021 10:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZST+NdFiFpFoYCK9cuPqdH4p9SeIGnAZwDaOtTHvsqk=; b=SnOOM9BlXOxiDAGkPWrkTp+C85
        Gz8oVb96eC71DKaYbbsRhUEtxmu91bLndWW/8/mU2nJVAb2GI4MoPShb0vbh3MK20DX9EqaBnHndg
        TF/PoyY4YWxjmZkUxvL6ihRqSKyXFRAYx1jUKlTKA1ivUJkXF9XyFfgIP6AcrgNRK1UiLI4DLLfkl
        IyAKUKIxZkv4fkkpomfT03ojnR4L+hcJcPT1pgMmirgWRI1hL52UeE+2mlVN84yak6vRN5qTmaFxr
        inb8p7B329BZkx86Emzr1bp//fhWfLN3pwanTnzRqyp3BizFCBZ9GwhBYkhN5Djvrm68jWRbt39wR
        vKD2dHiA==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=49681)
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1lJguX-0000m9-E3; Tue, 09 Mar 2021 19:16:49 +0100
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
To:     Peter Stuge <peter@stuge.se>
Cc:     hudson@trmm.net, markus@raatikainen.cc,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        sam@ravnborg.org
References: <20210305163104.30756-1-noralf@tronnes.org>
 <20210305163104.30756-4-noralf@tronnes.org>
 <20210309140200.13094.qmail@stuge.se>
 <59bf10c7-91aa-ba09-7128-91e87272e29e@tronnes.org>
Message-ID: <330c580d-de8f-7362-211b-eaf80b166421@tronnes.org>
Date:   Tue, 9 Mar 2021 19:16:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <59bf10c7-91aa-ba09-7128-91e87272e29e@tronnes.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 09.03.2021 19.07, skrev Noralf Trønnes:
> 
> 
> Den 09.03.2021 15.02, skrev Peter Stuge:
>> Hello Noralf,
>>
>> I've made some progress with my test device. I'm implementing R1
>> first and once that works I'll test RGB111 as well. Along the way
>> I've found a couple of things in the code:
>>

> Depending on how long it takes for the DMA mask dependency patch to show
> up in drm-misc-next, I will either publish a new version or apply the
> current and provide patches with the necessary fixes. 

In case I apply this version, are you happy enough with it that you want
to give an ack or r-b?

Noralf.
