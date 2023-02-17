Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCA2A69ADEE
	for <lists+linux-usb@lfdr.de>; Fri, 17 Feb 2023 15:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjBQOV5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Feb 2023 09:21:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjBQOVz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Feb 2023 09:21:55 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92AB6D268
        for <linux-usb@vger.kernel.org>; Fri, 17 Feb 2023 06:21:36 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id u14-20020a17090a4bce00b002341fadc370so1425526pjl.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Feb 2023 06:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JzT1elv7HtbbbfB3I+WuCpQETzax4iEEAJ3a87Rz+mM=;
        b=EDNclRZPnzZRmX8mrwUBkDiehUWpmO8ph3+X/tmu/eTulcGsGNOKDqXPO89Ta5AZ1q
         eUQ20Tv9IRvQAiH3b4jdRF2B+VSJlrkjrbFQ8nP+5ht460srTJc299ZypnK8NARWiFLv
         Vew82zDsPU5Vn+6ZuLTAkl7Q6JGg/X0Tet4d1gOUzN3xdEvEB65d3MbhJ9FD/vpNiY4X
         9OngEiBrltyxnRRLFlxO1Q2VksPeVtuVquhI0d+DrG91a7diEGSyNLttKlT3/GToQuDY
         eNZGNW0QGEBXN7RuWmNaacOKvpQ32vCgFq0IEwpw5qOP+uyDa6dg/FYDN6ssQC1A6/jb
         2p2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JzT1elv7HtbbbfB3I+WuCpQETzax4iEEAJ3a87Rz+mM=;
        b=W+8sHPJpIvSRDJoS/FOS51oCGh+Ppq6shwTvtk7fDzlFFGd9fTsjeUB976GKx9pbCm
         Hhqurw9S/yf7Rb9EdAxEW3R9P5Hi79ozP/ZIM0bxSucwY7gjblIW3azAo/4OVsyEpDLq
         01SbYUNGMIwdcv3i0ggPDuXybySh5LHSiMTeimgIvwsRmIsAzDXV5LqTQMp45YPkuHo/
         NYGzLx93XMesy3UEbXLP7eYafi+1vkYG0H2X1bCY1wN/TVyZ/XaKE71IFzwF1EBpKIz3
         lYXsKVbALvAQqjegNQ57Gmd9hsQyh/7AeKvdTe6K2fjGYti8Lfmgpgma34B3Sap7FQYp
         8Lvg==
X-Gm-Message-State: AO0yUKUDrssffuG4tS8dgg45gLSZUkZPHZ83lHAYBNj/MYNgygusCo19
        nrgLnnmVKC72777UZX1kgq40Tr/5earLBasogik+GCGlMBM=
X-Google-Smtp-Source: AK7set9bjPAjjOh+3H0K77C/TFzhiCGrJj/MDCdHMFHUx7aYpT4JbnMH6KgQqQLaVAU08h62eTUKB/rvdi2lgeBpw40=
X-Received: by 2002:a17:903:1c3:b0:199:1a40:dccc with SMTP id
 e3-20020a17090301c300b001991a40dcccmr216884plh.9.1676643695694; Fri, 17 Feb
 2023 06:21:35 -0800 (PST)
MIME-Version: 1.0
From:   Seth Bollinger <seth.boll@gmail.com>
Date:   Fri, 17 Feb 2023 08:21:24 -0600
Message-ID: <CA+JN8xMXu=sVQ2nyR9SgF25fquCZhH43wdsnuvfjDu+yGRv2yA@mail.gmail.com>
Subject: HC died
To:     linux-usb@vger.kernel.org
Cc:     sethb@digi.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello All,

We're experiencing a problem with our devices in the field where our
customers attach problematic USB devices that are causing the xhci
host controller to shut down with the "HC died; cleaning up" message.

I've narrowed this down to a timeout of the address device TRB on the
command ring (currently 5 seconds).  It sometimes takes our hardware
9.6 to complete this TRB.  When the driver is trying to stop the cmd
ring, the controller is busy for an additional 4.6 seconds.  This
results in the "HC died" message and shutdown of the host controller.

If I bump the command ring timeout beyond the max TRB completion time,
the host controller continues to be responsive and doesn't need to be
shut down.

My knowledge of how the usb protocol should handle this problem isn't
strong enough to know if there is a better solution than simply
increasing the command ring default timeout.

Is there a better way to handle this problem?

I've reproduced this on kernel 6.0, and 6.1.

Here is a log of the issue, along with some extra tracing I added to
track the duration of the command ring TRB completions.  FYI, I
recreate this problem by connecting/disconnecting the 5V pin quickly.
The theory is that the device is no longer present on the bus when the
hardware is trying to address the device.  I understand this is
somewhat degenerate, but it's happening frequently to our customers in
the field and it would be nice if the HC didn't die requiring them to
reboot to recover.

[F00:P06]  Feb 16 16:40:14  kernel: usb 3-2.1: new high-speed USB
device number 13 using xhci_hcd
[F00:P07]  Feb 16 16:40:14  kernel: xhci_hcd 0002:01:00.0: Set root
hub portnum to 4
[F00:P07]  Feb 16 16:40:14  kernel: xhci_hcd 0002:01:00.0: Set fake
root hub portnum to 2
[F00:P07]  Feb 16 16:40:14  kernel: xhci_hcd 0002:01:00.0: udev->tt =
0000000000000000
[F00:P07]  Feb 16 16:40:14  kernel: xhci_hcd 0002:01:00.0: udev->ttport = 0x0
[F00:P06]  Feb 16 16:40:14  kernel: xhci_hcd 0002:01:00.0:
xhci_setup_device: xhci_queue_address_device
[F00:P07]  Feb 16 16:40:14  kernel: xhci_hcd 0002:01:00.0: // Ding dong!
[F00:P06]  Feb 16 16:40:23  kernel: xhci_hcd 0002:01:00.0: completion
cmd 11, time: 163776215, duration: 9596181 us
[F00:P04]  Feb 16 16:40:23  kernel: usb 3-2.1: Device not responding
to setup address.
[F00:P07]  Feb 16 16:40:23  kernel: xhci_hcd 0002:01:00.0: // Ding dong!
[F00:P06]  Feb 16 16:40:23  kernel: xhci_hcd 0002:01:00.0: completion
cmd 10, time: 163778807, duration: 2530 us
[F00:P06]  Feb 16 16:40:23  kernel: xhci_hcd 0002:01:00.0: completion
cmd 9, time: 163778906, duration: 90 us
[F00:P07]  Feb 16 16:40:23  kernel: xhci_hcd 0002:01:00.0: Slot 15
output ctx = 0x8422f000 (dma)
[F00:P07]  Feb 16 16:40:23  kernel: xhci_hcd 0002:01:00.0: Slot 15
input ctx = 0x87ea9000 (dma)
[F00:P07]  Feb 16 16:40:23  kernel: xhci_hcd 0002:01:00.0: Set slot id
15 dcbaa entry 000000001958e382 to 0x8422f000
[F00:P07]  Feb 16 16:40:24  kernel: xhci_hcd 0002:01:00.0: Set root
hub portnum to 4
[F00:P07]  Feb 16 16:40:24  kernel: xhci_hcd 0002:01:00.0: Set fake
root hub portnum to 2
[F00:P07]  Feb 16 16:40:24  kernel: xhci_hcd 0002:01:00.0: udev->tt =
0000000000000000
[F00:P07]  Feb 16 16:40:24  kernel: xhci_hcd 0002:01:00.0: udev->ttport = 0x0
[F00:P06]  Feb 16 16:40:24  kernel: xhci_hcd 0002:01:00.0:
xhci_setup_device: xhci_queue_address_device
[F00:P07]  Feb 16 16:40:24  kernel: xhci_hcd 0002:01:00.0: // Ding dong!
[F00:P06]  Feb 16 16:40:33  kernel: xhci_hcd 0002:01:00.0: completion
cmd 11, time: 173580444, duration: 9596416 us
[F00:P04]  Feb 16 16:40:33  kernel: usb 3-2.1: Device not responding
to setup address.
[F00:P07]  Feb 16 16:40:33  kernel: xhci_hcd 0002:01:00.0: // Ding dong!
[F00:P06]  Feb 16 16:40:33  kernel: xhci_hcd 0002:01:00.0: completion
cmd 10, time: 173583035, duration: 2529 us
[F00:P06]  Feb 16 16:40:33  kernel: xhci_hcd 0002:01:00.0: completion
cmd 9, time: 173583129, duration: 83 us
[F00:P07]  Feb 16 16:40:33  kernel: xhci_hcd 0002:01:00.0: Slot 16
output ctx = 0x8422f000 (dma)
[F00:P07]  Feb 16 16:40:33  kernel: xhci_hcd 0002:01:00.0: Slot 16
input ctx = 0x87ea9000 (dma)
[F00:P07]  Feb 16 16:40:33  kernel: xhci_hcd 0002:01:00.0: Set slot id
16 dcbaa entry 00000000ae4b7693 to 0x8422f000
[F00:P03]  Feb 16 16:40:33  kernel: usb 3-2.1: device not accepting
address 13, error -71
[F00:P07]  Feb 16 16:40:33  kernel: xhci_hcd 0002:01:00.0: // Ding dong!
[F00:P06]  Feb 16 16:40:33  kernel: xhci_hcd 0002:01:00.0: completion
cmd 10, time: 173790654, duration: 2529 us
[F00:P07]  Feb 16 16:40:33  kernel: xhci_hcd 0002:01:00.0: Bad real port.
[F00:P06]  Feb 16 16:40:33  kernel: xhci_hcd 0002:01:00.0: completion
cmd 9, time: 173790749, duration: 86 us
[F00:P07]  Feb 16 16:40:33  kernel: xhci_hcd 0002:01:00.0: Slot 17
output ctx = 0x8422f000 (dma)
[F00:P07]  Feb 16 16:40:33  kernel: xhci_hcd 0002:01:00.0: Slot 17
input ctx = 0x87ea9000 (dma)
[F00:P07]  Feb 16 16:40:33  kernel: xhci_hcd 0002:01:00.0: Set slot id
17 dcbaa entry 00000000e45e3c7b to 0x8422f000
[F00:P07]  Feb 16 16:40:34  kernel: xhci_hcd 0002:01:00.0: // Ding dong!
[F00:P06]  Feb 16 16:40:34  kernel: xhci_hcd 0002:01:00.0: completion
cmd 10, time: 174478971, duration: 2528 us
[F00:P07]  Feb 16 16:40:34  kernel: xhci_hcd 0002:01:00.0: Bad real port.

Thanks for your assistance,

Seth
