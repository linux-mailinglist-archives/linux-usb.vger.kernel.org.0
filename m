Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B793171F652
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 01:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbjFAXBS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jun 2023 19:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232229AbjFAXBQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jun 2023 19:01:16 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84798195
        for <linux-usb@vger.kernel.org>; Thu,  1 Jun 2023 16:01:10 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-4573697b2cdso435896e0c.3
        for <linux-usb@vger.kernel.org>; Thu, 01 Jun 2023 16:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685660469; x=1688252469;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZqCYMQww7tuqq8r8oRum71TPGwN7C5A9Cx07kitczds=;
        b=eGdQrJ+EWk8JLiydV5AHdy7Apc+9xaJyV0rKXgjaDVPaALgNZ/qxEW9nT89lDKgQk0
         fn8JojovsI3rMfr8SPUUMvB3EQefOokHQUErfEn77+4XiSqV6EhzSSn+uK3rDilFM67i
         YNpUR0SSYPRc/G/zUcindq39wLOau7uVMHtZK4PNhF0DMRqw5igMzUJ0uHjGbfNjJFDF
         AHqr2qbOsPQT5KDg0QAh4UyOcaAWdzjdKMgwFUXnEFgeigzEkqnDF3zNgG83I6uiDhG5
         Rg+WE6UJMkS1kZdUUj6howpEBUXTcvhvdYlVs4aMaDEunV9LmBiizcsFehmc3ViGcnzC
         syPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685660469; x=1688252469;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZqCYMQww7tuqq8r8oRum71TPGwN7C5A9Cx07kitczds=;
        b=ArNBAN5jSNiLoT+E5MPV6pqkCEJ5hEA8BDoA5h9i+MqZ3qYtsOAVb2tQJYvuEvv5mu
         PQMpgXViPgsu+YBhlxzfjbxJnNl1Ydtr7i5ejZfrUfC/KhaqQs+U/CqfApRi3H/ggsiv
         bjNO6vZuU41hGVaOy71iQCko3i3j4zr2PdEta53CfxpAbxzWY5hG45vnUZF26M+k1lJP
         m9Ki7BFA332TyBKa78ENqrTUuGJpk1NepENbOKRH9p6gCFjKaNawcYUW+vjZFucX8ROj
         XwygDQNYclvN3IIiqtthZpLqOlZ/o73zfKkJod6lwwQ0WFZWlVXuohkSFNELscqKyR97
         mGUg==
X-Gm-Message-State: AC+VfDxQ4ZXpvyqkZRyZU+Kj3uLqVDJPfN5X7mZ/x1VoCp+8JJ5OZUwM
        hg1SrCHhDBwcT8JddmWlFHRKaIZ4wTC8nbZ19TFxyAhPuZo=
X-Google-Smtp-Source: ACHHUZ7OuGIlU4fJ0JIAcyHQoK4q76o0f5ZRCxGUmw7nBIsJHwhxCW1uRP162f2WhYUbFxQg16bRVIVk6P5y1myRAx4=
X-Received: by 2002:a1f:d1c5:0:b0:457:5379:daed with SMTP id
 i188-20020a1fd1c5000000b004575379daedmr1940668vkg.1.1685660467735; Thu, 01
 Jun 2023 16:01:07 -0700 (PDT)
MIME-Version: 1.0
From:   Colin Williams <colin.williams.seattle@gmail.com>
Date:   Thu, 1 Jun 2023 16:00:56 -0700
Message-ID: <CAPXXXSCjjJ5=+zigZyfX65uNOQYYJun1pQspq4jgJpC+TFJRPg@mail.gmail.com>
Subject: Cannot access device / WD Portable Game Drive 5.0 TB USB Inbox
To:     Linux USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I've tried two cables and using two different computers to access my
WD Portable 5.0 TB portable game drive that has a USB interface. Dmesg
seems ok with line

`[ 4586.948425] sd 6:0:0:0: [sdb] Assuming drive cache: write through`

However when I try to access the device via smartctl / cfdisk / etc to
get more information, I get something like no such device and then
dmesg is populated with errors.

Does anyone have experience with these scenarios?

Are there any suggestions to recover my data or does it appear the
device has given up the ghost?

Finally due to the large volume of responses from kernel mailing
lists, I am not currently subscribed. I would appreciate it if you
would CC me regarding responses.


Kindly

Colin Williams



```
[ 4531.648581] .......................................................ready
[ 4586.945308] sd 6:0:0:0: [sdb] Very big device. Trying to use READ
CAPACITY(16).
[ 4586.946119] sd 6:0:0:0: [sdb] 9767475200 512-byte logical blocks:
(5.00 TB/4.55 TiB)
[ 4586.946123] sd 6:0:0:0: [sdb] 4096-byte physical blocks
[ 4586.947284] sd 6:0:0:0: [sdb] Write Protect is off
[ 4586.947288] sd 6:0:0:0: [sdb] Mode Sense: 47 00 10 08
[ 4586.948419] sd 6:0:0:0: [sdb] No Caching mode page found
[ 4586.948425] sd 6:0:0:0: [sdb] Assuming drive cache: write through
[ 4622.130073] iwlwifi 0000:03:00.0: Radio type=0x0-0x3-0x1
[ 4622.368355] usb 4-2: Disable of device-initiated U1 failed.
[ 4622.379174] iwlwifi 0000:03:00.0: Radio type=0x0-0x3-0x1
[ 4627.488329] usb 4-2: Disable of device-initiated U2 failed.
[ 4632.864288] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4638.244207] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4638.452112] usb 4-2: device not accepting address 12, error -62
[ 4643.872208] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4649.248179] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4649.456152] usb 4-2: device not accepting address 12, error -62
[ 4654.880182] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4660.260151] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4660.468115] usb 4-2: device not accepting address 12, error -62
[ 4665.888149] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4671.264076] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4671.472070] usb 4-2: device not accepting address 12, error -62
[ 4671.488227] usb 4-2: USB disconnect, device number 12
[ 4671.504071] print_req_error: 2 callbacks suppressed
[ 4671.504087] blk_update_request: I/O error, dev sdb, sector 0 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 4671.504095] buffer_io_error: 2 callbacks suppressed
[ 4671.504096] Buffer I/O error on dev sdb, logical block 0, async page read
[ 4671.504164] blk_update_request: I/O error, dev sdb, sector 0 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 4671.504169] Buffer I/O error on dev sdb, logical block 0, async page read
[ 4671.504190] blk_update_request: I/O error, dev sdb, sector 0 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 4671.504192] Buffer I/O error on dev sdb, logical block 0, async page read
[ 4671.504206] blk_update_request: I/O error, dev sdb, sector 0 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 4671.504208] Buffer I/O error on dev sdb, logical block 0, async page read
[ 4671.504213] ldm_validate_partition_table(): Disk read failed.
[ 4671.504221] blk_update_request: I/O error, dev sdb, sector 0 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 4671.504222] Buffer I/O error on dev sdb, logical block 0, async page read
[ 4671.504235] blk_update_request: I/O error, dev sdb, sector 0 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 4671.504236] Buffer I/O error on dev sdb, logical block 0, async page read
[ 4671.504247] blk_update_request: I/O error, dev sdb, sector 0 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 4671.504248] Buffer I/O error on dev sdb, logical block 0, async page read
[ 4671.504259] blk_update_request: I/O error, dev sdb, sector 0 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 4671.504261] Buffer I/O error on dev sdb, logical block 0, async page read
[ 4671.504266] Dev sdb: unable to read RDB block 0
[ 4671.504274] blk_update_request: I/O error, dev sdb, sector 0 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 4671.504275] Buffer I/O error on dev sdb, logical block 0, async page read
[ 4671.504286] blk_update_request: I/O error, dev sdb, sector 0 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 4671.504288] Buffer I/O error on dev sdb, logical block 0, async page read
[ 4671.504321]  sdb: unable to read partition table
[ 4671.532205] sd 6:0:0:0: [sdb] Read Capacity(16) failed: Result:
hostbyte=DID_ERROR driverbyte=DRIVER_OK
[ 4671.532212] sd 6:0:0:0: [sdb] Sense not available.
[ 4671.532219] sd 6:0:0:0: [sdb] Read Capacity(10) failed: Result:
hostbyte=DID_ERROR driverbyte=DRIVER_OK
[ 4671.532221] sd 6:0:0:0: [sdb] Sense not available.
[ 4671.532225] sd 6:0:0:0: [sdb] 0 512-byte logical blocks: (0 B/0 B)
[ 4671.532226] sd 6:0:0:0: [sdb] 4096-byte physical blocks
[ 4671.532236] sd 6:0:0:0: [sdb] Attached SCSI disk
[ 4676.896090] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4682.272070] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4682.480039] usb 4-2: device not accepting address 13, error -62
[ 4687.904053] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4693.280033] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4693.488002] usb 4-2: device not accepting address 14, error -62
[ 4693.496092] usb usb4-port2: attempt power cycle
[ 4699.680018] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4705.056003] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4705.263969] usb 4-2: device not accepting address 15, error -62
[ 4710.687982] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4716.063965] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[ 4716.271934] usb 4-2: device not accepting address 16, error -62
[ 4716.279918] usb usb4-port2: unable to enumerate USB device
```
