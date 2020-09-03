Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B7C25C77F
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 18:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbgICQyJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 12:54:09 -0400
Received: from mr06.mx01.tldhost.de ([62.108.41.213]:37450 "EHLO
        mr06.mx01.tldhost.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgICQyH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 12:54:07 -0400
Received: from mx01.tldhost.de (localhost [127.0.0.1])
        by mx01.tldhost.de (Postfix) with ESMTP id 8CF29121763
        for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2020 18:54:03 +0200 (CEST)
Received: by mx01.tldhost.de (Postfix, from userid 1001)
        id 8189A121764; Thu,  3 Sep 2020 18:54:03 +0200 (CEST)
X-Spam-Status: No, score=-1.9 required=7.0 tests=BAYES_00,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.2
Received: from server12.tldhost.de (server12.tldhost.de [84.19.26.112])
        by mx01.tldhost.de (Postfix) with ESMTPS id 15923121763;
        Thu,  3 Sep 2020 18:54:02 +0200 (CEST)
Received: from fw-emea.rohde-schwarz.com (fw-emea.rohde-schwarz.com
 [80.246.32.33]) by webmail.kiener-muenchen.de (Horde Framework) with HTTP;
 Thu, 03 Sep 2020 16:54:01 +0000
Date:   Thu, 03 Sep 2020 16:54:01 +0000
Message-ID: <20200903165401.Horde.0plv-8-wrkSbaoSekydKWEy@webmail.kiener-muenchen.de>
From:   guido@kiener-muenchen.de
To:     George McCollister <george.mccollister@gmail.com>
Cc:     linux-usb@vger.kernel.org, guido.kiener@rohde-schwarz.com
Subject: Re: usbtmc: stb race condition introduced by
 4f3c8d6eddc272b386464524235440a418ed2029
References: <CAFSKS=Pv1Ji4XqHjVMCAnszq_HjFYYk7GuzeeCCScHd1NMumDA@mail.gmail.com>
 <20200901185903.Horde.NHT9rmY1GQT34m6C6YMUCNF@webmail.kiener-muenchen.de>
 <CAFSKS=M8xh3UVFEt+QxcCr_Ghie8tBkudrbLO15hpvEzQEbGfQ@mail.gmail.com>
 <20200902152514.Horde.-6-I20fjCayIQgkkuxwk-o2@webmail.kiener-muenchen.de>
 <CAFSKS=P-kY=CJhbf_QCAPRJKrZQ1OR9FyrrMSzm-7Wm6BxSgYA@mail.gmail.com>
In-Reply-To: <CAFSKS=P-kY=CJhbf_QCAPRJKrZQ1OR9FyrrMSzm-7Wm6BxSgYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <20200903165401.25201.11736@server12.tldhost.de>
X-PPP-Vhost: kiener-muenchen.de
X-POWERED-BY: TLDHost.de - AV:CLEAN SPAM:OK
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


>> >> More info see:
>> >> https://github.com/GuidoKiener/linux-usbtmc/blob/master/README.md
>> >>
>> >> > My USBTMC device has an interrupt endpoint with a 1ms interval.
>> >> >
>> >> > 1) A query is sent to the USBTMC device.
>> >> >
>> >> > 2) An SRQ is reported via the interrupt endpoint with MAV set.
>> >> >
>> >> > 3) Userspace performs a read to get the reply since MAV is set after
>> >> > being notified by poll().
>> >>
>> >> Did you start reading (read()) without checking the Status Byte after
>> >> poll() event?
>> >
>> > I check the status byte after poll(). The problem seems to be that I
>> > also check the status byte in a loop (until there is nothing to
>> > service) before calling poll again.
>>
>> This is not a problem. You can check the status byte several times
>> as long as you like. When RQS Bit (0x40) is set, then you know it was
>> an intermediate SRQ, sent according to chapter 3.4.1
>> (USBTMC_usb488_subclass_1_00.pdf). Otherwise it is a requested status
>> byte according to chapter 3.4.2.
>
> I wouldn't call myself a USBTMC or 488 expert. I read the USBTMC spec,
> 488.1 and 488.2 but it's been three years since I implemented most of
> my device firmware and wrote the userspace code. It runs in a
> contained environment so I haven't done any interoperability testing.
> However, my understanding is that MSS shares the same bit with RQS and
> if something is still needing service the MSS bit will be set in the
> status byte given in reply to a READ_STATUS_BYTE request. If that is
> the case how would you tell a status byte sent as an SRQ vs one with
> MSS sent in reply to READ_STATUS_BYTE? See IEEE Std 488.2-1992 Figure
> 11-3—Service Request Enabling.
>
Yes RQS and MSS share the same bit. When you look at Figure 11-2 then you
can see the difference in handling this bit:
1. RQS is returned by a Serial Poll (=viReadSTB()). The RQS bit is reset
after the Serial Poll. See chapter 11.2.2.1 Reading with a Serial Poll.
Therefore the RQS bit is only sent with the SRQ message and deleted after
sending the message. As a consequence the device need not to set the RQS bit
when the status request is initiated by the READ_STATUS_BYTE.

2. The MSS bit does not toggle after reading, but it is only sent in the
SCPI layer as a reponse to the SCPI query "*STB?".

This is true for 488.2 devices and when you support the Interrupt pipe.
It should be true for 488.1 devices, too, however it is very difficult to
get the whole picture from this spec.
Most people, who have written that spec, are now retired.

>>
>> > As long as you only check the
>> > status byte when there is a cached value available it should be no
>> > problem. However if you call USBTMC488_IOCTL_READ_STB when there is
>> > not a cached SRQ value an SRQ can occur after the lock is released in
>> > usbtmc488_ioctl_read_stb() and cache an older value (which will be
>> > read by the next USBTMC488_IOCTL_READ_STB) than the one returned.
>>
>> Yes, interrupts (here SRQ) can happen at any time. Therefore the user
>> can enable/disable interrupts (e.g. with SCPI command SRE) and
>> postpone interrupt handling.
>
> This wasn't necessary before but perhaps it could be used to work
> around the issue.
>
>>
>> The SRQ sends a status byte with RQS bit set (chapter 3.4.1) and the
>> request initiated by the client returns a status byte without RQS bit
>> (chapter 3.4.2).
>
> Again maybe I'm confused by how MSS is supposed to work.
>

Regards,

Guido


