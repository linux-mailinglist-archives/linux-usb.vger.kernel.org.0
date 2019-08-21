Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6CA977CC
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 13:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbfHULR4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 07:17:56 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:6525 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726330AbfHULR4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Aug 2019 07:17:56 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id A20B2201EB;
        Wed, 21 Aug 2019 13:17:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1566386269; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=mHNZwwUmUVZ6ozjEQnWjk83PbyOTW6YV1i3PzN9PvJg=;
        b=psecbGapDJpLj89rVd9qMyJy3AhDJJ+SaMfzQ+a6W1cl5vNR4kW98u3JWJSNK8PW8x34eh
        ZiYojBQmKzmoTHd3Vg5nerB8paTUNDdHkgB+Czls22xN5ZVDT5jH+kuSDQggd3Bk4Xmnou
        qwFB0Cl1b7ZwdAihJ++FG6d389X5qpiQPoSAKpVV+wtZzH78q43Ew39JX1OJgBllKNfNv5
        Ux8UlqBeQ758EC2k09wNqMNk7x6bukmtRqcLTwxGFzVCGTqhDdFlErCIQdIoJzaipLm+Xx
        iHuaSmS90IxEbO7szsV9ayAuiBRC6QQ9VPiIGJPo7bAEapV7No/IOLIBWegqPw==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id 8276ABEEBD;
        Wed, 21 Aug 2019 13:17:49 +0200 (CEST)
Message-ID: <5D5D285D.3080908@bfs.de>
Date:   Wed, 21 Aug 2019 13:17:49 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     linux-usb@vger.kernel.org
CC:     greg@kroah.com
Subject: problems with Edgeport/416
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
         ARC_NA(0.00)[];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         BAYES_HAM(-3.00)[100.00%];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         TO_DN_NONE(0.00)[];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         DKIM_SIGNED(0.00)[];
         RCPT_COUNT_TWO(0.00)[2];
         NEURAL_HAM(-0.00)[-0.999,0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_TLS_ALL(0.00)[]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello List,
does some use linux with an Edgeport/416 ?

I have a strange problem. the device is resetting soon
after i started using it (but not immediately).
I do not see a kernel OOPS but a common pattern is:

2019-08-20T15:19:39.825812+00:00 omnfrmo10 kernel: [683270.658623] usb 7-1.1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
2019-08-20T15:19:39.825818+00:00 omnfrmo10 kernel: [683270.658626] usb 7-1.1.2: Product: Edgeport/416
2019-08-20T15:19:39.825821+00:00 omnfrmo10 kernel: [683270.658628] usb 7-1.1.2: Manufacturer: Digi International
2019-08-20T15:19:39.825823+00:00 omnfrmo10 kernel: [683270.658630] usb 7-1.1.2: SerialNumber: E63966100-1
2019-08-20T15:19:39.985571+00:00 omnfrmo10 kernel: [683270.817909] usb 7-1.1.2: Edgeport TI 2 port adapter converter now attached to ttyUSB4
2019-08-20T15:19:39.985594+00:00 omnfrmo10 kernel: [683270.818132] usb 7-1.1.2: Edgeport TI 2 port adapter converter now attached to ttyUSB5
2019-08-20T15:19:40.007943+00:00 omnfrmo10 mtp-probe: checking bus 7, device 88: "/sys/devices/pci0000:00/0000:00:1d.1/usb7/7-1/7-1.1/7-1.1.2"
2019-08-20T15:19:40.053750+00:00 omnfrmo10 kernel: [683270.885626] usb 7-1.2.2: New USB device found, idVendor=1608, idProduct=0247
2019-08-20T15:19:40.053791+00:00 omnfrmo10 kernel: [683270.885630] usb 7-1.2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
2019-08-20T15:19:40.053797+00:00 omnfrmo10 kernel: [683270.885633] usb 7-1.2.2: Product: Edgeport/416
2019-08-20T15:19:40.053800+00:00 omnfrmo10 kernel: [683270.885635] usb 7-1.2.2: Manufacturer: Digi International
2019-08-20T15:19:40.053803+00:00 omnfrmo10 kernel: [683270.885637] usb 7-1.2.2: SerialNumber: E63966100-5
2019-08-20T15:19:40.065569+00:00 omnfrmo10 kernel: [683270.897406] usb 7-1.1.3: new full-speed USB device number 90 using uhci_hcd
2019-08-20T15:19:40.213569+00:00 omnfrmo10 kernel: [683271.046316] usb 7-1.2.2: Edgeport TI 2 port adapter converter now attached to ttyUSB6
2019-08-20T15:19:40.213594+00:00 omnfrmo10 kernel: [683271.046782] usb 7-1.2.2: Edgeport TI 2 port adapter converter now attached to ttyUSB7
2019-08-20T15:19:40.242034+00:00 omnfrmo10 mtp-probe: checking bus 7, device 89: "/sys/devices/pci0000:00/0000:00:1d.1/usb7/7-1/7-1.2/7-1.2.2"
2019-08-20T15:19:40.301578+00:00 omnfrmo10 kernel: [683271.133380] usb 7-1.2.3: new full-speed USB device number 91 using uhci_hcd
2019-08-20T15:19:40.357559+00:00 omnfrmo10 kernel: [683271.192815] usb 7-1.1.3: New USB device found, idVendor=1608, idProduct=0247
2019-08-20T15:19:40.357584+00:00 omnfrmo10 kernel: [683271.192820] usb 7-1.1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
2019-08-20T15:19:40.357588+00:00 omnfrmo10 kernel: [683271.192822] usb 7-1.1.3: Product: Edgeport/416
2019-08-20T15:19:40.357591+00:00 omnfrmo10 kernel: [683271.192825] usb 7-1.1.3: Manufacturer: Digi International
2019-08-20T15:19:40.357593+00:00 omnfrmo10 kernel: [683271.192827] usb 7-1.1.3: SerialNumber: E63966100-2
2019-08-20T15:19:40.513702+00:00 omnfrmo10 kernel: [683271.349103] usb 7-1.1.3: Edgeport TI 2 port adapter converter now attached to ttyUSB8
2019-08-20T15:19:40.513725+00:00 omnfrmo10 kernel: [683271.349311] usb 7-1.1.3: Edgeport TI 2 port adapter converter now attached to ttyUSB9
2019-08-20T15:19:40.537138+00:00 omnfrmo10 mtp-probe: checking bus 7, device 90: "/sys/devices/pci0000:00/0000:00:1d.1/usb7/7-1/7-1.1/7-1.1.3"
2019-08-20T15:19:40.601754+00:00 omnfrmo10 kernel: [683271.433389] usb 7-1.1.4: new full-speed USB device number 92 using uhci_hcd
2019-08-20T15:19:40.601794+00:00 omnfrmo10 kernel: [683271.433631] usb 7-1.2.3: New USB device found, idVendor=1608, idProduct=0247
2019-08-20T15:19:40.601798+00:00 omnfrmo10 kernel: [683271.433634] usb 7-1.2.3: New USB device strings: Mfr=1, Produc


I did some experiments (changing cables etc) but always the same. But when tested with a windows system it worked all fine.
later i used a single port USB->Serial and all worked as expected.

I tested with: Opensuse 15.1 on a DELL latitude E5400

uname -a
Linux omnfrmo10 4.12.14-lp151.28.10-vanilla #1 SMP Sat Jul 13 17:59:31 UTC 2019 (0ab03b7) x86_64 x86_64 x86_64 GNU/Linux

I would like to improve the situation, does anyone has that device ? any hints what to look at ?

please reply direct, i am not member of this list.

re,
 wh








