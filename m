Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB7E12BFD1
	for <lists+linux-usb@lfdr.de>; Sun, 29 Dec 2019 02:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfL2BGq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Dec 2019 20:06:46 -0500
Received: from smtp.infotech.no ([82.134.31.41]:52366 "EHLO smtp.infotech.no"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726187AbfL2BGp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 28 Dec 2019 20:06:45 -0500
Received: from localhost (localhost [127.0.0.1])
        by smtp.infotech.no (Postfix) with ESMTP id A1C32204191;
        Sun, 29 Dec 2019 02:06:43 +0100 (CET)
X-Virus-Scanned: by amavisd-new-2.6.6 (20110518) (Debian) at infotech.no
Received: from smtp.infotech.no ([127.0.0.1])
        by localhost (smtp.infotech.no [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wb2tAiL6Dp6L; Sun, 29 Dec 2019 02:06:41 +0100 (CET)
Received: from [192.168.48.23] (host-23-251-188-50.dyn.295.ca [23.251.188.50])
        by smtp.infotech.no (Postfix) with ESMTPA id 3EABC20416A;
        Sun, 29 Dec 2019 02:06:41 +0100 (CET)
Reply-To: dgilbert@interlog.com
Subject: Re: usb-c pd: PD_MAX_PAYLOAD too small
From:   Douglas Gilbert <dgilbert@interlog.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org
References: <f000d0e7-eb7f-5df6-ee2b-188e68f0baa9@interlog.com>
 <20191227223014.GA29215@roeck-us.net>
 <46a6024c-4081-45db-1768-3fb69ac8deb8@interlog.com>
Message-ID: <62cbce31-5cc0-ecad-aca1-40483900aeb1@interlog.com>
Date:   Sat, 28 Dec 2019 20:06:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <46a6024c-4081-45db-1768-3fb69ac8deb8@interlog.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2019-12-28 7:57 p.m., Douglas Gilbert wrote:
> On 2019-12-27 5:30 p.m., Guenter Roeck wrote:
>> On Fri, Dec 27, 2019 at 12:18:11PM -0500, Douglas Gilbert wrote:
>>> Samsung have an optional USB-C charger for their 10+
>>> tablet ***. This optional unit is one of the first PPS
>>> capable PD power adapters on the mass market at a
>>> reasonable price (around $50). Its part number is
>>> EP-TA485 and is described as a 45 Watt "Travel Adapter".
>>>
>>> I have a rig using an Acme Arietta and a NXP OM 13588 board
>>> which can do USB-C sink/source. And the EP-TA485 is plugged
>>> into the OM 13588 which pushes that latter into (power)
>>> sink mode.
>>>
>>>  From 'cat /sys/kernel/debug/usb/tcpm-1-0050' that adapter
>>> advertises these PDOs (and PDO[4] implies at 11 Volts it
>>> can supply 5 Amps which is worrying for a 45 Watt supply):
>>>
>>> [   19.207338]  PDO 0: type 0, 5000 mV, 3000 mA [E]
>>> [   19.207361]  PDO 1: type 0, 9000 mV, 3000 mA []
>>> [   19.207383]  PDO 2: type 0, 15000 mV, 3000 mA []
>>> [   19.207428]  PDO 3: type 0, 20000 mV, 2250 mA []
>>> [   19.207448]  PDO 4: type 3, 3300-11000 mV, 5000 mA
>>> [   19.207466]  PDO 5: type 3, 3300-16000 mV, 3000 mA
>>> [   19.207484]  PDO 6: type 3, 3300-21000 mV, 2250 mA
>>>
>>> And whenever drivers/usb/typec/tcpm/tcpci.c fetches those
>>> PDOs, it fires this warning at line 443 (lk 5.4.6):
>>>
>>>             if (WARN_ON(cnt > sizeof(msg.payload)))
>>
>> Thanks a lot for the report.
>>
>> The question here is if cnt includes the header bytes, which would
>> make it too large for the check if there are indeed 7 PDOs.
>> I'll have to check in the specification after I am back from vacation
>> (early January).
> 
> Placed a pr_info() before that WARN and got cnt=31 and
> sizeof(msg.payload)=28. The spec says there can be no more than 7
> (A)PDOs [Section 6.4.1 page 118 USB PD spec 'Revision 3.0,
> Version 2.0']. So it looks like 'cnt' includes both the header (2
> bytes) and the CRC.
> 
> So its probably been bad for a while, just needed a source with
> 7 (A)PDOs to trip that over zealous warning.
> 
> Doug Gilbert

Just another possibly unrelated datapoint. That Samsung 45 Watt
PPS power adapter (EP-TA485) works on just about everything I have
tested it on, apart from this laptop which is a Lenovo X270.
When plugged into the X270, the laptop continually does hard
resets on the PD protocol (i.e. on the CC lines). Could the X270
have the same bug?

A Dell XPS (9380) which is more recent than the X270 has no problem.
That is just as well because that XPS has 3 type-C receptacles, a
3.5mm audio jack and a microSD reader (i.e. no other way to power
(and thus charge) the laptop other than via USB PD).

> 
>>>
>>> And that implies in include/linux/usb/pd.h
>>>
>>> struct pd_message {
>>>          __le16 header;
>>>          union {
>>>                  __le32 payload[PD_MAX_PAYLOAD];
>>>                  struct pd_chunked_ext_message_data ext_msg;
>>>          };
>>> } __packed;
>>>
>>> ... that PD_MAX_PAYLOAD is too small (or off by one). It is 7
>>> in lk 5.4.6 and linux-stable.
>>>
>>> Doug Gilbert
>>>
>>>
>>> *** When 10+ tablet is purchased it comes with a less capable
>>>      (i.e. no PPS) 35 Watt adapter (I believe). Samsung say if
>>>      the owner wants "fast" charging to buy the EP-TA485.
>>>      If PPS catches one, it will effectively move power
>>>      electronics from the smartphone or tablet into the
>>>      power adapter. And that could be a win for laptops as well.
>>>
>>>
>>> ------------[ cut here ]------------
>>> WARNING: CPU: 0 PID: 1154 at drivers/usb/typec/tcpm/tcpci.c:443
>>> tcpci_irq+0x1b4/0x1e0 [tcpci]
>>> Modules linked in: tcpci tcpm roles typec asix usbnet mii
>>> CPU: 0 PID: 1154 Comm: irq/37-1-0050 Tainted: G        W         
>>> 5.4.6-armv5-r0 #1
>>> Hardware name: Atmel AT91SAM9
>>> [<c000f9b4>] (unwind_backtrace) from [<c000d7e0>] (show_stack+0x10/0x14)
>>> [<c000d7e0>] (show_stack) from [<c00188b8>] (__warn+0xac/0xd0)
>>> [<c00188b8>] (__warn) from [<c0018984>] (warn_slowpath_fmt+0xa8/0xb8)
>>> [<c0018984>] (warn_slowpath_fmt) from [<bf053398>] (tcpci_irq+0x1b4/0x1e0 
>>> [tcpci])
>>> [<bf053398>] (tcpci_irq [tcpci]) from [<c0050e78>] (irq_thread_fn+0x1c/0x78)
>>> [<c0050e78>] (irq_thread_fn) from [<c00510f0>] (irq_thread+0x104/0x1ec)
>>> [<c00510f0>] (irq_thread) from [<c0034460>] (kthread+0x11c/0x130)
>>> [<c0034460>] (kthread) from [<c00090e0>] (ret_from_fork+0x14/0x34)
>>> Exception stack(0xc55dffb0 to 0xc55dfff8)
>>> ffa0:                                     00000000 00000000 00000000 00000000
>>> ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>>> ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
>>> ---[ end trace 2ab4ab025e97eabd ]---
>>>
>>>
>>> Finally:
>>>  From other (non-Linux) equipment I can tell that the EP-TA485 adapter is
>>> only advertising 7 PDOs, so there is no 8th PDO being truncated in Linux.
> 

