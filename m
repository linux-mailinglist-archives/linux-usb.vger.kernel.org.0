Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC76978C4
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 14:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfHUMEB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 08:04:01 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:10816 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbfHUMEB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Aug 2019 08:04:01 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id 82109202D0;
        Wed, 21 Aug 2019 14:03:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1566389034; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yAI9WyRyq741kntfMdBwNyhTQQK2NpeiQ77x2zhq+BQ=;
        b=aVeWyu6USPDyvXYfB5miF1XBugepg3cnr9U6IUyJXjCJMFIWhDCaTK5ijnqze6jdVRDtEt
        KwQBX5JwC8VVkII9lR+yvLVuQoNTJlI/T7Q4OMAoaP8oXLl0VUqXTeiftGy8spQ5aAtLeJ
        RU2CCfB/Erl7eMkeRUsDcoPJHU6Xfs4mWHa4PSbJCz1v5POh4C3cKCwcokvRDIYnW+79+6
        VzJnpdTOasUer2yYWkkCpVxkd8hOy4Q/RwaQozMTElRbth6h2t3Yz4hq2d0b1XeL1auz6s
        e8x0/bDIphQaLjwWEACZ+201iljooPzxT8XRCglLBVLPGkNC+BCjgA61+A1Lgg==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id 56F0FBEEBD;
        Wed, 21 Aug 2019 14:03:54 +0200 (CEST)
Message-ID: <5D5D332A.3010504@bfs.de>
Date:   Wed, 21 Aug 2019 14:03:54 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "greg@kroah.com" <greg@kroah.com>
Subject: Re: problems with Edgeport/416
References: <5D5D285D.3080908@bfs.de> <741cf63f72e443ba9158c9c123fcccc7@SVR-IES-MBX-03.mgc.mentorg.com>
In-Reply-To: <741cf63f72e443ba9158c9c123fcccc7@SVR-IES-MBX-03.mgc.mentorg.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
         ARC_NA(0.00)[];
         TO_DN_EQ_ADDR_SOME(0.00)[];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[3];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         BAYES_HAM(-3.00)[100.00%];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.998,0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_TLS_ALL(0.00)[]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Am 21.08.2019 13:43, schrieb Schmid, Carsten:
> Hi Walter,
> 
> i had a similar issue with a different device.
> Please check, if you have dynamic debug enabled in your kernel
> (/sys/kernel/debug/dynamic_debug/control exists)
> 


ll /sys/kernel/debug/dynamic_debug/control
-rw-r--r-- 1 root root 0 Aug 12 16:15 /sys/kernel/debug/dynamic_debug/control


> Then you can enable additional kernel messages using
> echo -n 'module xhci_hcd =p' > /sys/kernel/debug/dynamic_debug/control
> echo -n 'module usbcore =p' > /sys/kernel/debug/dynamic_debug/control
> 


> Check which usb related messages you can enable through the dynamic_debug.
> (doing a "cat /sys/kernel/debug/dynamic_debug/control | grep usb" helps much)
> 
I see a bunch of messages. what do you expect me to do ? I have 412 lines, should
i send them ?



> Finally, a fine resource is
> https://www.kernel.org/doc/html/v4.11/admin-guide/dynamic-debug-howto.html
> 
I did not know about dynamic-debug, fortunately linux drivers simply work these days :)

re,
 wh


> Best regards
> Carsten
> 
>> -----Ursprüngliche Nachricht-----
>> Von: linux-usb-owner@vger.kernel.org [mailto:linux-usb-
>> owner@vger.kernel.org] Im Auftrag von walter harms
>> Gesendet: Mittwoch, 21. August 2019 13:18
>> An: linux-usb@vger.kernel.org
>> Cc: greg@kroah.com
>> Betreff: problems with Edgeport/416
>>
>> Hello List,
>> does some use linux with an Edgeport/416 ?
>>
>> I have a strange problem. the device is resetting soon
>> after i started using it (but not immediately).
>> I do not see a kernel OOPS but a common pattern is:
>>
>> 2019-08-20T15:19:39.825812+00:00 omnfrmo10 kernel: [683270.658623] usb
>> 7-1.1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>> 2019-08-20T15:19:39.825818+00:00 omnfrmo10 kernel: [683270.658626] usb
>> 7-1.1.2: Product: Edgeport/416
>> 2019-08-20T15:19:39.825821+00:00 omnfrmo10 kernel: [683270.658628] usb
>> 7-1.1.2: Manufacturer: Digi International
>> 2019-08-20T15:19:39.825823+00:00 omnfrmo10 kernel: [683270.658630] usb
>> 7-1.1.2: SerialNumber: E63966100-1
>> 2019-08-20T15:19:39.985571+00:00 omnfrmo10 kernel: [683270.817909] usb
>> 7-1.1.2: Edgeport TI 2 port adapter converter now attached to ttyUSB4
>> 2019-08-20T15:19:39.985594+00:00 omnfrmo10 kernel: [683270.818132] usb
>> 7-1.1.2: Edgeport TI 2 port adapter converter now attached to ttyUSB5
>> 2019-08-20T15:19:40.007943+00:00 omnfrmo10 mtp-probe: checking bus 7,
>> device 88: "/sys/devices/pci0000:00/0000:00:1d.1/usb7/7-1/7-1.1/7-1.1.2"
>> 2019-08-20T15:19:40.053750+00:00 omnfrmo10 kernel: [683270.885626] usb
>> 7-1.2.2: New USB device found, idVendor=1608, idProduct=0247
>> 2019-08-20T15:19:40.053791+00:00 omnfrmo10 kernel: [683270.885630] usb
>> 7-1.2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>> 2019-08-20T15:19:40.053797+00:00 omnfrmo10 kernel: [683270.885633] usb
>> 7-1.2.2: Product: Edgeport/416
>> 2019-08-20T15:19:40.053800+00:00 omnfrmo10 kernel: [683270.885635] usb
>> 7-1.2.2: Manufacturer: Digi International
>> 2019-08-20T15:19:40.053803+00:00 omnfrmo10 kernel: [683270.885637] usb
>> 7-1.2.2: SerialNumber: E63966100-5
>> 2019-08-20T15:19:40.065569+00:00 omnfrmo10 kernel: [683270.897406] usb
>> 7-1.1.3: new full-speed USB device number 90 using uhci_hcd
>> 2019-08-20T15:19:40.213569+00:00 omnfrmo10 kernel: [683271.046316] usb
>> 7-1.2.2: Edgeport TI 2 port adapter converter now attached to ttyUSB6
>> 2019-08-20T15:19:40.213594+00:00 omnfrmo10 kernel: [683271.046782] usb
>> 7-1.2.2: Edgeport TI 2 port adapter converter now attached to ttyUSB7
>> 2019-08-20T15:19:40.242034+00:00 omnfrmo10 mtp-probe: checking bus 7,
>> device 89: "/sys/devices/pci0000:00/0000:00:1d.1/usb7/7-1/7-1.2/7-1.2.2"
>> 2019-08-20T15:19:40.301578+00:00 omnfrmo10 kernel: [683271.133380] usb
>> 7-1.2.3: new full-speed USB device number 91 using uhci_hcd
>> 2019-08-20T15:19:40.357559+00:00 omnfrmo10 kernel: [683271.192815] usb
>> 7-1.1.3: New USB device found, idVendor=1608, idProduct=0247
>> 2019-08-20T15:19:40.357584+00:00 omnfrmo10 kernel: [683271.192820] usb
>> 7-1.1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>> 2019-08-20T15:19:40.357588+00:00 omnfrmo10 kernel: [683271.192822] usb
>> 7-1.1.3: Product: Edgeport/416
>> 2019-08-20T15:19:40.357591+00:00 omnfrmo10 kernel: [683271.192825] usb
>> 7-1.1.3: Manufacturer: Digi International
>> 2019-08-20T15:19:40.357593+00:00 omnfrmo10 kernel: [683271.192827] usb
>> 7-1.1.3: SerialNumber: E63966100-2
>> 2019-08-20T15:19:40.513702+00:00 omnfrmo10 kernel: [683271.349103] usb
>> 7-1.1.3: Edgeport TI 2 port adapter converter now attached to ttyUSB8
>> 2019-08-20T15:19:40.513725+00:00 omnfrmo10 kernel: [683271.349311] usb
>> 7-1.1.3: Edgeport TI 2 port adapter converter now attached to ttyUSB9
>> 2019-08-20T15:19:40.537138+00:00 omnfrmo10 mtp-probe: checking bus 7,
>> device 90: "/sys/devices/pci0000:00/0000:00:1d.1/usb7/7-1/7-1.1/7-1.1.3"
>> 2019-08-20T15:19:40.601754+00:00 omnfrmo10 kernel: [683271.433389] usb
>> 7-1.1.4: new full-speed USB device number 92 using uhci_hcd
>> 2019-08-20T15:19:40.601794+00:00 omnfrmo10 kernel: [683271.433631] usb
>> 7-1.2.3: New USB device found, idVendor=1608, idProduct=0247
>> 2019-08-20T15:19:40.601798+00:00 omnfrmo10 kernel: [683271.433634] usb
>> 7-1.2.3: New USB device strings: Mfr=1, Produc
>>
>>
>> I did some experiments (changing cables etc) but always the same. But when
>> tested with a windows system it worked all fine.
>> later i used a single port USB->Serial and all worked as expected.
>>
>> I tested with: Opensuse 15.1 on a DELL latitude E5400
>>
>> uname -a
>> Linux omnfrmo10 4.12.14-lp151.28.10-vanilla #1 SMP Sat Jul 13 17:59:31 UTC
>> 2019 (0ab03b7) x86_64 x86_64 x86_64 GNU/Linux
>>
>> I would like to improve the situation, does anyone has that device ? any hints
>> what to look at ?
>>
>> please reply direct, i am not member of this list.
>>
>> re,
>>  wh
>>
>>
>>
>>
>>
>>
>>
> 
