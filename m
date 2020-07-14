Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F236821FBAA
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 21:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731191AbgGNTDX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 15:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729779AbgGNTDU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 15:03:20 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456F1C061755
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 12:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8jYOAxBElB2/VtC11UlU4NG+pCqdfn6MRvdxsT+SXLg=; b=k06IJ9MrtUQG9uhCssW2lWio6s
        bMdQeeMGD58IY3i2kuSOpdO0hhB7C3injmzNN4Xv122eRi0u26iM80ISj+IadXqzZgoMd99gZ8/zC
        7axRAXKow5BeMrmfdkKuGFX8OgTWG0OSrd/5BNPzF8cpYm7cesrASTPnJeFnmwASn2+mqGsvUAs+b
        KRgvDuXADEb6xg1U3F41wGY5+fNTW6Ps+HM0Fk99N6/8e7b1ZJ8dR9hAUiksGAxTFKAoJQA8xvW38
        11yw2r7NH6byRp+CpOvbedZq4AWr6EBT/sK4exY0Ggavu+klY5esLTkO+Pg/RzBj3OtwCh1zf/toK
        wcCJ/ZCg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:59395 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jvQCz-00025u-LN; Tue, 14 Jul 2020 21:03:17 +0200
Subject: Re: [PATCH v3 0/6] Generic USB Display driver
To:     Peter Stuge <peter@stuge.se>
Cc:     Lubomir Rintel <lkundrak@v3.sk>, balbi@kernel.org,
        linux-usb@vger.kernel.org, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200709163235.360054-1-lkundrak@v3.sk>
 <1280ec51-7528-b993-3110-f6c28e98832c@tronnes.org>
 <20200714174008.16272.qmail@stuge.se>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <befd06f1-d0cc-ab26-3ec1-5da3f3ab3f37@tronnes.org>
Date:   Tue, 14 Jul 2020 21:03:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714174008.16272.qmail@stuge.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 14.07.2020 19.40, skrev Peter Stuge:
> Hi Noralf,
> 
> Noralf Trønnes wrote:
>> I would like to keep the SET_BUFFER request since it will serve as a
>> syncing point between the host and the device. I'm no USB expert but I
>> assume that a bulk transfer can fail halfway through and result in the
>> next update starting where the previous one failed and thus writing
>> beyond the end of the display buffer.
> 
> Transfers either succeed completely (possibly after many retries),
> time out (after zero or more transfered bytes) or fail catastrophically
> (e.g. from device disconnect).
> 
> In all cases, the driver on the host knows/has available how many bytes
> were successfully transfered.
> 

I was thinking about the device, that it could get out of sync. Let's
say the host sends a 1k framebuffer and half of it gets transferred and
the rest fails for some reason. Lubomir's MCU implementation has an
endpoint max size of 64 bytes and a callback is called for each packet.
If the 1k transfer fails at some point, will the device be able to
detect this and know that the next time the rx callback is called that
this is the start of a new framebuffer update?

Noralf.
