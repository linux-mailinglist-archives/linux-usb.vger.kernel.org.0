Return-Path: <linux-usb+bounces-2798-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49C7E8BC8
	for <lists+linux-usb@lfdr.de>; Sat, 11 Nov 2023 17:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0EAB1F20F87
	for <lists+linux-usb@lfdr.de>; Sat, 11 Nov 2023 16:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5CD1B287;
	Sat, 11 Nov 2023 16:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZH5m/6Q+"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D98F134CB
	for <linux-usb@vger.kernel.org>; Sat, 11 Nov 2023 16:58:16 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C51258D
	for <linux-usb@vger.kernel.org>; Sat, 11 Nov 2023 08:58:12 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-53dfc28a2afso4760605a12.1
        for <linux-usb@vger.kernel.org>; Sat, 11 Nov 2023 08:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699721891; x=1700326691; darn=vger.kernel.org;
        h=content-disposition:mime-version:mail-followup-to:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zf7mjj6RvjP6iCeWq9MR1oxa8J02Kljgim40J+HYr00=;
        b=ZH5m/6Q+Z7P6RKPaL0SD5qP+jCjhLcFskDu4OImi6UkMV2L4aiqYro9C+7g3K4ypVs
         7BV2OpTNqu7Rq9eKNvWjf2M6NAHBomLCDzTrDQC6S7FAE/lQ28WfDuHFKJpyYKXXE9SM
         b3XrSkzipenYTcygBHZaiQfNxppJRgQjGNBSU5u+PLvW4rYpIQzb91iJmdYVY/dyA+fT
         fpXDRd8jquYC7TiG+TS7gx7fBjMwRvdbYUPxJSdNyrkVaX2m0buFttPcxTiVtKkpTSu1
         mLbKaFbJUh1ZHdre6HL1qAcWffgPhNyeMvlEpYTd6m61Endm1GB1iw5A+FaZEKlcMVyX
         2BTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699721891; x=1700326691;
        h=content-disposition:mime-version:mail-followup-to:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zf7mjj6RvjP6iCeWq9MR1oxa8J02Kljgim40J+HYr00=;
        b=a7PGHo1KvYrc2kNB2LAKNh0euSTSpPMs045tpV6dFgiCuP36eJVUrQaYrycHy11Tuy
         HFzjEs8A0w5NsEGl8V/HcoLPG6BEeD+vXa3J9NYHi8v1u9VsIUrWLeDwpBL6TseL8CIv
         QVNnwcO+soBKc8HiwZETun2Jy2P1aB11j8tS9GmPykBNMhhz9wTnb02hOSL7cIlEvATl
         L38dRJke43QnvcC1dM4TaGZ0Q5ji/jdhLL9mzzC+H1xe/5nbCaM28JOLerFVQmEKs71T
         6tcQts3RQdc8kGn01jULRMqw0jIvY5DfMCc5kHzcIRxBpBPx6VAVgBQEUfia4uyNY8vI
         qJDA==
X-Gm-Message-State: AOJu0Yz968NgV57AInv04+JKPaQtJ4sfe104KryzU7JZX+xWhwsuO62s
	X2ABqSI4WFKOEa95PonNXeCJOnBIb70=
X-Google-Smtp-Source: AGHT+IHShKc0e+b7ppSNA04sN6MHRi9IWHZJsPujXYozoGsMI7Yq//YZ64UhrL5uMBD6g684ZgWwUg==
X-Received: by 2002:a05:6402:1116:b0:543:858b:9d94 with SMTP id u22-20020a056402111600b00543858b9d94mr1468933edv.41.1699721890623;
        Sat, 11 Nov 2023 08:58:10 -0800 (PST)
Received: from ryzen7700x.fritz.box (p200300ee973f6100aaa159fffee94020.dip0.t-ipconnect.de. [2003:ee:973f:6100:aaa1:59ff:fee9:4020])
        by smtp.gmail.com with ESMTPSA id n16-20020a5099d0000000b005454b6d4e22sm1196553edb.64.2023.11.11.08.58.10
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 08:58:10 -0800 (PST)
Date: Sat, 11 Nov 2023 17:58:08 +0100
From: Andreas Kempf <aakempf@gmail.com>
To: linux-usb@vger.kernel.org
Subject: Slow enumeration of Creative Sound Blaster G3
Message-ID: <ZU-xz52-1QMregso@ryzen7700x.fritz.box>
Mail-Followup-To: linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I apologize if this is the wrong mailing list but my investigation
led me to the USB subsystem and I do not know how to proceed.

My system:
Arch Linux
Linux kernel 6.6.1 (-arch1-1)
Motherboard: ASRock X670E PG Lightning
Device: Creative Sound Blaster G3

I have a Creative Technology Sound Blaster G3 USB sound device that
seems to work perfectly on Windows. It used to work just fine on Linux,
as well. However, at some point a few weeks ago, it started behaving
oddly. Unfortunately, I cannot pinpoint exactly when the problems
started happening because the symptoms did not immediately point me
toward the device and I did not immediately figure out what was going
on as I only noticed hangs when shutting down the system.

After some testing I figured out that it takes several minutes for the
device to be recognized. Having plugged in the device, a command like

$ cat /sys/devices/pci0000:00/0000:00:02.1/0000:04:00.0/ \
  0000:05:0c.0/0000:17:00.0/usb5/5-4/manufacturer

blocks for several minutes, until, at some point, it correctly prints
Creative Technology Ltd

The kernel seems to slowly figure out what to do with the device:

Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: new high-speed USB device number 2 using xhci_hcd
Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: config 1 interface 2 altsetting 0 bulk endpoint 0x82 has invalid maxpacket 256
Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: New USB device found, idVendor=041e, idProduct=3267, bcdDevice=10.40
Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: New USB device strings: Mfr=1, Product=2, SerialNumber=9
Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: Product: Sound Blaster G3
Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: Manufacturer: Creative Technology Ltd
Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: SerialNumber: 15C1E5E3165B9B3D
Nov 11 16:25:29 ryzen7700x kernel: input: Creative Technology Ltd Sound Blaster G3 as /devices/pci0000:00/0000:00:02.1/0000:04:00.0/0000:05:0c.0/0000:17:00.0/usb5/5-4/5-4:1.0/0003:041E:3267.0007/input/input28
Nov 11 16:25:29 ryzen7700x kernel: hid-generic 0003:041E:3267.0007: input,hidraw6: USB HID v1.10 Device [Creative Technology Ltd Sound Blaster G3] on usb-0000:17:00.0-4/input0
Nov 11 16:25:34 ryzen7700x kernel: usb 5-4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -110)
Nov 11 16:25:44 ryzen7700x kernel: usb 5-4: uac_clock_source_is_valid(): cannot get clock validity for id 33
Nov 11 16:25:44 ryzen7700x kernel: usb 5-4: clock source 33 is not valid, cannot use
Nov 11 16:26:00 ryzen7700x kernel: usb 5-4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -110)
Nov 11 16:26:10 ryzen7700x kernel: usb 5-4: uac_clock_source_is_valid(): cannot get clock validity for id 33
Nov 11 16:26:10 ryzen7700x kernel: usb 5-4: clock source 33 is not valid, cannot use
Nov 11 16:26:30 ryzen7700x kernel: usb 5-4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -110)
Nov 11 16:26:41 ryzen7700x kernel: usb 5-4: uac_clock_source_is_valid(): cannot get clock validity for id 37
Nov 11 16:26:41 ryzen7700x kernel: usb 5-4: clock source 37 is not valid, cannot use
Nov 11 16:26:56 ryzen7700x kernel: usb 5-4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -110)
Nov 11 16:27:06 ryzen7700x kernel: usb 5-4: uac_clock_source_is_valid(): cannot get clock validity for id 37
Nov 11 16:27:06 ryzen7700x kernel: usb 5-4: clock source 37 is not valid, cannot use
Nov 11 16:27:27 ryzen7700x kernel: usb 5-4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -110)
Nov 11 16:27:37 ryzen7700x kernel: usb 5-4: uac_clock_source_is_valid(): cannot get clock validity for id 35
Nov 11 16:27:37 ryzen7700x kernel: usb 5-4: clock source 35 is not valid, cannot use
Nov 11 16:27:52 ryzen7700x kernel: usb 5-4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -110)
Nov 11 16:28:03 ryzen7700x kernel: usb 5-4: uac_clock_source_is_valid(): cannot get clock validity for id 35
Nov 11 16:28:03 ryzen7700x kernel: usb 5-4: clock source 35 is not valid, cannot use
Nov 11 16:28:44 ryzen7700x kernel: usb 5-4: 12:3: failed to get current value for ch 0 (-110)
Nov 11 16:29:14 ryzen7700x kernel: usb 5-4: 12:3: cannot get min/max values for control 2 (id 12)
Nov 11 16:29:40 ryzen7700x kernel: usb 5-4: 13:3: failed to get current value for ch 0 (-110)
Nov 11 16:30:11 ryzen7700x kernel: usb 5-4: 13:3: cannot get min/max values for control 2 (id 13)
Nov 11 16:30:36 ryzen7700x kernel: usb 5-4: 11:3: failed to get current value for ch 0 (-110)
Nov 11 16:31:07 ryzen7700x kernel: usb 5-4: 11:3: cannot get min/max values for control 2 (id 11)
Nov 11 16:31:22 ryzen7700x kernel: usb 5-4: 1:3: failed to get current value for ch 0 (-110)
Nov 11 16:31:43 ryzen7700x kernel: usb 5-4: 1:3: cannot get min/max values for control 2 (id 1)
Nov 11 16:31:58 ryzen7700x kernel: usb 5-4: 14:3: failed to get current value for ch 0 (-110)
Nov 11 16:32:19 ryzen7700x kernel: usb 5-4: 14:3: cannot get min/max values for control 2 (id 14)
Nov 11 16:32:34 ryzen7700x kernel: usb 5-4: 2:3: failed to get current value for ch 0 (-110)
Nov 11 16:32:54 ryzen7700x kernel: usb 5-4: 2:3: cannot get min/max values for control 2 (id 2)
Nov 11 16:33:10 ryzen7700x kernel: usb 5-4: 23:3: failed to get current value for ch 0 (-110)
Nov 11 16:33:30 ryzen7700x kernel: usb 5-4: 23:3: cannot get min/max values for control 2 (id 23)
Nov 11 16:33:46 ryzen7700x kernel: usb 5-4: 25:3: failed to get current value for ch 0 (-110)
Nov 11 16:34:06 ryzen7700x kernel: usb 5-4: 25:3: cannot get min/max values for control 2 (id 25)
Nov 11 16:34:21 ryzen7700x kernel: usb 5-4: 8:3: failed to get current value for ch 0 (-110)
Nov 11 16:34:42 ryzen7700x kernel: usb 5-4: 8:3: cannot get min/max values for control 2 (id 8)

After these 9 minutes, the device seems to be able to play audio
normally. Most of these messages I recognize, I think they have always
been there but did not cause any issues. If I unplug the device (not
sure if it has to happen during these 9 minutes), I encounter a hung
task:

Nov 11 16:48:49 ryzen7700x kernel: INFO: task (udev-worker):9428 blocked for more than 122 seconds.
Nov 11 16:48:49 ryzen7700x kernel:       Not tainted 6.6.1-arch1-1 #1
Nov 11 16:48:49 ryzen7700x kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
Nov 11 16:48:49 ryzen7700x kernel: task:(udev-worker)   state:D stack:0     pid:9428  ppid:9361   flags:0x00004002
Nov 11 16:48:49 ryzen7700x kernel: Call Trace:
Nov 11 16:48:49 ryzen7700x kernel:  <TASK>
Nov 11 16:48:49 ryzen7700x kernel:  __schedule+0x3e8/0x1410
Nov 11 16:48:49 ryzen7700x kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 11 16:48:49 ryzen7700x kernel:  ? kernfs_link_sibling+0xef/0x120
Nov 11 16:48:49 ryzen7700x kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 11 16:48:49 ryzen7700x kernel:  schedule+0x5e/0xd0
Nov 11 16:48:49 ryzen7700x kernel:  schedule_preempt_disabled+0x15/0x30
Nov 11 16:48:49 ryzen7700x kernel:  __mutex_lock.constprop.0+0x39a/0x6a0
Nov 11 16:48:49 ryzen7700x kernel:  ? usb_match_id+0x7f/0xb0
Nov 11 16:48:49 ryzen7700x kernel:  ? __pfx___driver_attach+0x10/0x10
Nov 11 16:48:49 ryzen7700x kernel:  __driver_attach+0x1b6/0x1c0
Nov 11 16:48:49 ryzen7700x kernel:  bus_for_each_dev+0x85/0xd0
Nov 11 16:48:49 ryzen7700x kernel:  bus_add_driver+0x116/0x220
Nov 11 16:48:49 ryzen7700x kernel:  driver_register+0x59/0x100
Nov 11 16:48:49 ryzen7700x kernel:  usb_register_driver+0x8c/0x150
Nov 11 16:48:49 ryzen7700x kernel:  acm_init+0xce/0xff0 [cdc_acm 669a2f93233934a4904557f961d0940f49d001ee]
Nov 11 16:48:49 ryzen7700x kernel:  ? __pfx_acm_init+0x10/0x10 [cdc_acm 669a2f93233934a4904557f961d0940f49d001ee]
Nov 11 16:48:49 ryzen7700x kernel:  do_one_initcall+0x5a/0x320
Nov 11 16:48:49 ryzen7700x kernel:  do_init_module+0x60/0x240
Nov 11 16:48:49 ryzen7700x kernel:  init_module_from_file+0x89/0xe0
Nov 11 16:48:49 ryzen7700x kernel:  idempotent_init_module+0x120/0x2b0
Nov 11 16:48:49 ryzen7700x kernel:  __x64_sys_finit_module+0x5e/0xb0
Nov 11 16:48:49 ryzen7700x kernel:  do_syscall_64+0x5d/0x90
Nov 11 16:48:49 ryzen7700x kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 11 16:48:49 ryzen7700x kernel:  ? syscall_exit_to_user_mode+0x2b/0x40
Nov 11 16:48:49 ryzen7700x kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 11 16:48:49 ryzen7700x kernel:  ? do_syscall_64+0x6c/0x90
Nov 11 16:48:49 ryzen7700x kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 11 16:48:49 ryzen7700x kernel:  ? exc_page_fault+0x7f/0x180
Nov 11 16:48:49 ryzen7700x kernel:  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
Nov 11 16:48:49 ryzen7700x kernel: RIP: 0033:0x7f3f474ed73d
Nov 11 16:48:49 ryzen7700x kernel: RSP: 002b:00007ffd2bc03ad8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
Nov 11 16:48:49 ryzen7700x kernel: RAX: ffffffffffffffda RBX: 0000557ac78e6ac0 RCX: 00007f3f474ed73d
Nov 11 16:48:49 ryzen7700x kernel: RDX: 0000000000000004 RSI: 00007f3f475fa376 RDI: 0000000000000006
Nov 11 16:48:49 ryzen7700x kernel: RBP: 00007f3f475fa376 R08: 0000000000000001 R09: 0000000000000000
Nov 11 16:48:49 ryzen7700x kernel: R10: 0000000000000050 R11: 0000000000000246 R12: 0000000000020000
Nov 11 16:48:49 ryzen7700x kernel: R13: 0000557ac788a5a0 R14: 0000000000000000 R15: 0000557ac788a720
Nov 11 16:48:49 ryzen7700x kernel:  </TASK>

I am not sure how to proceed. From what I gather, the "invalid maxpacket
256" message suggests that the device's firmware is iffy and the other
messages do not inspire confidence either. It used to work without
noticeable issues though. In any case, these issues seem to block
shutdown sometimes and, all in all, these delays seem problematic.

I captured a few seconds of the devices usbmon interface and, during the
long initialization in case they are useful:

ffff888106921980 1731857265 S Co:5:007:0 s 21 01 0100 2203 0001 1 = 01
ffff888106a91d40 1731859450 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1731859451 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1731908612 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1731908612 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1732168615 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1732168621 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1732431951 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1732431953 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1732671946 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1732671951 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1732912197 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1732912206 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1733178866 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1733178874 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1733418870 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1733418892 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1733661954 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1733661957 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1733928620 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1733928623 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1734165536 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1734165545 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1734432190 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1734432198 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1734671990 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1734671999 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1734912202 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1734912211 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1735179002 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1735179011 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1735418865 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1735418886 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1735658935 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1735658944 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1735925530 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1735925538 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1736165532 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1736165540 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1736432206 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1736432222 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1736671986 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1736671990 S Ii:5:001:1 -115:2048 4 <
ffff888106921980 1736859748 C Co:5:007:0 -2 0
ffff88815c840900 1736859796 S Co:5:007:0 s 01 0b 0000 0004 0000 0
ffff888106a91d40 1736912209 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1736912215 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1737178955 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1737178959 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1737418879 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1737418895 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1737658907 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1737658926 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1737925536 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1737925557 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1738165533 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1738165552 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1738432205 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1738432224 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1738672008 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1738672013 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1738912202 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1738912207 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1739178895 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1739178900 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1739418866 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1739418871 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1739658873 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1739658878 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1739925710 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1739925715 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1740165540 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1740165546 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1740431959 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1740431963 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1740672048 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1740672053 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1740912294 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1740912303 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1741178871 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1741178880 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1741418868 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1741418877 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1741658859 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1741658868 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1741925533 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1741925542 S Ii:5:001:1 -115:2048 4 <
ffff88815c840900 1741979290 C Co:5:007:0 -2 0
ffff88815c840900 1741979308 S Ci:5:007:0 s a1 01 0200 2103 0001 1 <
ffff888106a91d40 1742165284 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1742165288 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1742432299 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1742432308 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1742672094 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1742672103 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1742912260 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1742912269 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1743178864 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1743178887 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1743418875 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1743418884 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1743658867 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1743658876 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1743925532 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1743925541 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1744165286 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1744165290 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1744432282 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1744432288 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1744672141 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1744672147 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1744912214 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1744912232 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1745178859 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1745178864 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1745418867 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1745418873 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1745658866 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1745658871 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1745925528 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1745925534 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1746165296 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1746165300 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1746432209 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1746432214 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1746672178 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1746672182 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1746912194 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1746912199 S Ii:5:001:1 -115:2048 4 <
ffff88815c840900 1747099069 C Ci:5:007:0 -2 0
ffff88815c840900 1747099088 S Co:5:007:0 s 21 01 0100 2203 0001 1 = 01
ffff888106a91d40 1747178618 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1747178621 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1747418881 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1747418886 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1747658872 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1747658877 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1747925532 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1747925537 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1748165617 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1748165622 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1748432201 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1748432206 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1748672197 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1748672203 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1748912199 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1748912204 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1749178858 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1749178864 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1749418629 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1749418634 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1749658857 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1749658862 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1749925537 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1749925542 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1750165296 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1750165300 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1750432191 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1750432197 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1750672192 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1750672211 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1750912198 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1750912204 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1751178863 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1751178869 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1751418630 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1751418634 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1751658868 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1751658874 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1751925528 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1751925534 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1752165557 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1752165562 S Ii:5:001:1 -115:2048 4 <
ffff88815c840900 1752219028 C Co:5:007:0 -2 0
ffff88815c840900 1752221432 S Co:5:007:0 s 01 0b 0001 0004 0000 0
ffff888106a91d40 1752432183 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1752432201 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1752672191 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1752672197 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1752912197 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1752912202 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1753178867 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1753178873 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1753418626 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1753418632 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1753658868 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1753658874 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1753925525 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1753925530 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1754165528 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1754165532 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1754432192 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1754432198 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1754672196 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1754672201 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1754912197 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1754912202 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1755178861 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1755178866 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1755418957 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1755418962 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1755658863 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1755658868 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1755925537 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1755925543 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1756165291 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1756165296 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1756432197 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1756432202 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1756672190 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1756672195 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1756911956 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1756911959 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1757178624 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1757178626 S Ii:5:001:1 -115:2048 4 <
ffff88815c840900 1757339014 C Co:5:007:0 -2 0
ffff88815c840900 1757341225 S Co:5:007:0 s 21 01 0100 2203 0001 1 = 01
ffff888106a91d40 1757418631 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1757418635 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1757658855 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1757658861 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1757925536 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1757925542 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1758165520 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1758165526 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1758431958 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1758431964 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1758671952 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1758671956 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1758912197 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1758912202 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1759178855 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1759178874 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1759418618 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1759418621 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1759658874 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1759658880 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1759925540 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1759925546 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1760165303 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1760165321 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1760432199 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1760432205 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1760672297 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1760672315 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1760912206 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1760912224 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1761178856 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1761178860 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1761418634 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1761418637 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1761658871 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1761658876 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1761925293 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1761925297 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1762165524 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1762165530 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1762431969 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1762431975 S Ii:5:001:1 -115:2048 4 <
ffff88815c840900 1762459743 C Co:5:007:0 -2 0
ffff88815c840900 1762459776 S Co:5:007:0 s 01 0b 0000 0004 0000 0
ffff888106a91d40 1762672262 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1762672267 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1762912207 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1762912212 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1763178863 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1763178869 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1763418627 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1763418631 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1763658863 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1763658882 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1763925524 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1763925529 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1764165527 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1764165532 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1764432210 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1764432215 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1764672216 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1764672219 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1764912196 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1764912202 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1765178884 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1765178900 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1765418629 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1765418632 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1765658898 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1765658914 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1765925296 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1765925300 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1766165531 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1766165548 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1766432209 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1766432224 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1766671962 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1766671965 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1766912197 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1766912203 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1767178886 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1767178905 S Ii:5:001:1 -115:2048 4 <
ffff888106a91d40 1767418628 C Ii:5:001:1 0:2048 2 = 1000
ffff888106a91d40 1767418631 S Ii:5:001:1 -115:2048 4 <
ffff88815c840900 1767579797 C Co:5:007:0 -2 0

Best regards

Andreas

