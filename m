Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4CD25AEC6
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 17:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgIBP0U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 11:26:20 -0400
Received: from mr05.mx01.tldhost.de ([62.108.36.228]:38805 "EHLO
        mr05.mx01.tldhost.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727944AbgIBPZs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 11:25:48 -0400
X-Greylist: delayed 73218 seconds by postgrey-1.27 at vger.kernel.org; Wed, 02 Sep 2020 11:25:46 EDT
Received: from mx01.tldhost.de (localhost [127.0.0.1])
        by mx01.tldhost.de (Postfix) with ESMTP id 100B6120803
        for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2020 17:25:15 +0200 (CEST)
Received: by mx01.tldhost.de (Postfix, from userid 1001)
        id 059B6120868; Wed,  2 Sep 2020 17:25:15 +0200 (CEST)
X-Spam-Status: No, score=-1.9 required=7.0 tests=BAYES_00,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.2
Received: from server12.tldhost.de (server12.tldhost.de [84.19.26.112])
        by mx01.tldhost.de (Postfix) with ESMTPS id 49E491205BF;
        Wed,  2 Sep 2020 17:25:14 +0200 (CEST)
Received: from fw-emea.rohde-schwarz.com (fw-emea.rohde-schwarz.com
 [80.246.32.33]) by webmail.kiener-muenchen.de (Horde Framework) with HTTPS;
 Wed, 02 Sep 2020 15:25:14 +0000
Date:   Wed, 02 Sep 2020 15:25:14 +0000
Message-ID: <20200902152514.Horde.-6-I20fjCayIQgkkuxwk-o2@webmail.kiener-muenchen.de>
From:   guido@kiener-muenchen.de
To:     George McCollister <george.mccollister@gmail.com>
Cc:     linux-usb@vger.kernel.org, guido.kiener@rohde-schwarz.com
Subject: Re: usbtmc: stb race condition introduced by
 4f3c8d6eddc272b386464524235440a418ed2029
References: <CAFSKS=Pv1Ji4XqHjVMCAnszq_HjFYYk7GuzeeCCScHd1NMumDA@mail.gmail.com>
 <20200901185903.Horde.NHT9rmY1GQT34m6C6YMUCNF@webmail.kiener-muenchen.de>
 <CAFSKS=M8xh3UVFEt+QxcCr_Ghie8tBkudrbLO15hpvEzQEbGfQ@mail.gmail.com>
In-Reply-To: <CAFSKS=M8xh3UVFEt+QxcCr_Ghie8tBkudrbLO15hpvEzQEbGfQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
X-PPP-Message-ID: <20200902152515.1001.63715@server12.tldhost.de>
X-PPP-Vhost: kiener-muenchen.de
X-POWERED-BY: TLDHost.de - AV:CLEAN SPAM:OK
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>> More info see:
>> https://github.com/GuidoKiener/linux-usbtmc/blob/master/README.md
>>
>> > My USBTMC device has an interrupt endpoint with a 1ms interval.
>> >
>> > 1) A query is sent to the USBTMC device.
>> >
>> > 2) An SRQ is reported via the interrupt endpoint with MAV set.
>> >
>> > 3) Userspace performs a read to get the reply since MAV is set after
>> > being notified by poll().
>>
>> Did you start reading (read()) without checking the Status Byte after
>> poll() event?
>
> I check the status byte after poll(). The problem seems to be that I
> also check the status byte in a loop (until there is nothing to
> service) before calling poll again.

This is not a problem. You can check the status byte several times
as long as you like. When RQS Bit (0x40) is set, then you know it was
an intermediate SRQ, sent according to chapter 3.4.1
(USBTMC_usb488_subclass_1_00.pdf). Otherwise it is a requested status
byte according to chapter 3.4.2.

> As long as you only check the
> status byte when there is a cached value available it should be no
> problem. However if you call USBTMC488_IOCTL_READ_STB when there is
> not a cached SRQ value an SRQ can occur after the lock is released in
> usbtmc488_ioctl_read_stb() and cache an older value (which will be
> read by the next USBTMC488_IOCTL_READ_STB) than the one returned.

Yes, interrupts (here SRQ) can happen at any time. Therefore the user
can enable/disable interrupts (e.g. with SCPI command SRE) and
postpone interrupt handling.

The SRQ sends a status byte with RQS bit set (chapter 3.4.1) and the
request initiated by the client returns a status byte without RQS bit
(chapter 3.4.2).

> This
> is a race condition and sounds broken to me but if this is the
> intended behavior I can adjust my userspace code to only do
> USBTMC488_IOCTL_READ_STB once after poll indicates an SRQ and live
> with it.
> It doesn't seem right for USBTMC488_IOCTL_READ_STB to ever report an
> older value than what was reported on the previous call.

I agree that this can result in an odd behavior (E.g. the MAV bit
is unset with reading the subsequent cached status byte).
I was not aware about this problem and I need to check whether this is
a common problem in VISA implementations or whether we just need to fix
the kernel (e.g. drop requested status byte and return older cached value).

A workaround to avoid this odd behavior is to read the status byte
again with USBTMC488_IOCTL_READ_STB when your user application detects
the RQS bit.

BTW when you look at the old implementation
https://elixir.bootlin.com/linux/v4.7.10/source/drivers/usb/class/usbtmc.c#L1332
then you can see that you will never get a status byte with RQS bit set.
The status byte was never stored in data->bNotify2

Regards,

Guido



