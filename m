Return-Path: <linux-usb+bounces-381-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C76E7A6546
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 15:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55C87281EF9
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 13:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8314E36AFA;
	Tue, 19 Sep 2023 13:34:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B156136AE9
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 13:34:32 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444D0F3
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 06:34:30 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-321530de76eso1862824f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 06:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695130468; x=1695735268; darn=vger.kernel.org;
        h=user-agent:mime-version:date:content-transfer-encoding:face:to
         :reply-to:subject:message-id:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDGZ7ESmQjFG89VckL4t9KqfVucqeQtd/wo0UBdtEQg=;
        b=fYYGeAWdG7pzDcnkrW4nyYBYokgwx2FDCBfVFtIS+LWwOcJemFMCS0UJSYnTxzqmZR
         xlSxU7bJMAJ3dYfbRkI8x/+AtrkxwXu/NOy/OvR+S4/c/qaRT0/clJTyWkwnaDmz2X0e
         1h9drDb1e/3OwzJRcYk+34y/vsDtgLF/vJw9cl99nV+g+/LQYCzW8Qa4GHEFn6HcXGb6
         d4LxQsTKo0qgHgm8Yc03ssBRdie3KQ6HBJV4kDqkQ5UvGeM2aRhLm2vTSNA7I6HnHd7a
         YVaIM8odfyXEJQ8JxpYJajUh3dNY1xVK6/F/2lkWWVbzkOi4x9whD5CiEr7s4+DI/7o4
         /zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695130468; x=1695735268;
        h=user-agent:mime-version:date:content-transfer-encoding:face:to
         :reply-to:subject:message-id:from:sender:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qDGZ7ESmQjFG89VckL4t9KqfVucqeQtd/wo0UBdtEQg=;
        b=gKyy/iiNDZMioT+gLCLzX1jQXUJ6tIJGEc1AF2LnTI+TGBRq+lJW+91uyL8oqeh0e/
         CpsdZQPSx410rQpgMjKaiRl9WY38ZGvwwL2em5LeRaKwH9ubg9E5UDOv5Qlo3CPHl0KA
         IdxKguZTBWXGtAg8kMahCcd7A0sAXfmUedwMVvFJ2/CG5XInVYrIH30ZeXDFivxN0wiG
         qZF3YKa+pPsAI4V3Rx1Y1B9wZrxg6qNihcaoaly4m6rtJKu0BduipxBkbEIrQXkxerPq
         T9n91rXC9D0omSaTWEUyaXHURhyM/yjVmcH4Eew3NbHaf2ZOr+uT5cCalNY0KnRluylU
         Lmcw==
X-Gm-Message-State: AOJu0YwNyQNDOZ++fWWL/BahzFXYk5AB2KvfQ1aCX7I+gwMPP8WFQRNf
	/HEGMXUYAliGXxr6VoI2UCGh7M96JOo=
X-Google-Smtp-Source: AGHT+IFx/SLcu+DZd+BMc0NWtPSPF9LpGXlpyJDVzFLibxVFV3FPdEN7jQUF1wIhQEJny/M61VaJEw==
X-Received: by 2002:a5d:6e06:0:b0:319:867e:97d7 with SMTP id h6-20020a5d6e06000000b00319867e97d7mr8790687wrz.52.1695130467775;
        Tue, 19 Sep 2023 06:34:27 -0700 (PDT)
Received: from mobalindesk.lan.lan (dynamic-077-006-049-035.77.6.pool.telefonica.de. [77.6.49.35])
        by smtp.googlemail.com with ESMTPSA id q5-20020a5d6585000000b0031accc7228asm15823890wru.34.2023.09.19.06.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 06:34:27 -0700 (PDT)
Sender: Massimo B <burcheri.massimo@gmail.com>
From: Massimo Burcheri <massimo@burcheri.de>
X-Google-Original-From: Massimo Burcheri <burcheri.massimo+linux-usb@gmail.com>
Message-ID: <8d8df33f29e9abc0c20909c028863e3b9674921d.camel@gmail.com>
Subject: SanDisk  Extreme Pro 55AF and UAS
Reply-To: burcheri.massimo+linux-usb@gmail.com
To: linux-usb <linux-usb@vger.kernel.org>
Face:
 iVBORw0KGgoAAAANSUhEUgAAADAAAAAwAQMAAABtzGvEAAAAA3NCSVQICAjb4U/gAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABGUlEQVQYlUWQsUoDQRCGv71LjB7KSSBwwZCTgFhY2EYIHmJnZRMLo5AXUMRCBMHcE6iPoGBlINpoZXGVeQTFKqSxMgYtTBFcZw7EKfZn2Z2Z7//hr2ysZ+5tqFLmWKVaKKs0vWd9TJx2AibmoQcupj6CCZirqTgzA5hmsdtQWe5/xAREX7uJ3MLP9x4lyieNO5mcOxyM8HH79y/4Cdn9R3JDsts/uGO82yOMJf/ah1Y8tfQEIQt7Z7rCawtNiUpHFgYUdgTxgI1NAW6SvxoqWabbw0Bd5jpQibTNBC1F4nIMk2TWhTqIs+fSVpzfCsVR9eaiJf5W6mtWXK7O+vKR4nWkSYSuFbP4No3Ht6dpSN9pSMYmaXI1/usXT0FM3SoTKAAAAAAASUVORK5CYII=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Sep 2023 15:34:15 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.48.4 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello,

I have a SanDisk USB3.2 Gen2x2 NVMe enclosure.

Bus 004 Device 004: ID 0781:55af SanDisk Corp. Extreme Pro 55AF

That was working with UAS fine on all machines.

Now on one machine it started failing with UAS. The same drive and same cab=
le on
a different machine with almost same setup and kernel is still working fine=
 with
uas.

Here is the failing machine:

Sep 19 07:00:15 [kernel] usb-storage 2-1.6:1.0: USB Mass Storage device det=
ected
Sep 19 07:00:15 [kernel] scsi host0: usb-storage 2-1.6:1.0
Sep 19 07:00:15 [kernel] usbcore: registered new interface driver usb-stora=
ge
Sep 19 07:00:15 [kernel] scsi host7: uas
Sep 19 07:00:15 [kernel] usbcore: registered new interface driver uas
Sep 19 07:00:15 [kernel] scsi 7:0:0:0: Direct-Access     SanDisk  Extreme P=
ro 55AF 1087 PQ: 0 ANSI: 6
Sep 19 07:00:15 [kernel] sd 7:0:0:0: [sdc] 7813971617 512-byte logical bloc=
ks: (4.00 TB/3.64 TiB)
Sep 19 07:00:15 [kernel] sd 7:0:0:0: [sdc] Write Protect is off
Sep 19 07:00:15 [kernel] scsi 7:0:0:1: Enclosure         SanDisk  SES Devic=
e       1087 PQ: 0 ANSI: 6
Sep 19 07:00:15 [kernel] sd 7:0:0:0: [sdc] Write cache: enabled, read cache=
: enabled, supports DPO and FUA
Sep 19 07:00:15 [kernel] sd 7:0:0:0: [sdc] Preferred minimum I/O size 512 b=
ytes
Sep 19 07:00:15 [kernel] sd 7:0:0:0: [sdc] Optimal transfer size 2097152 by=
tes
Sep 19 07:00:16 [kernel] scsi 0:0:0:0: Direct-Access     Generic- Compact F=
lash    1.00 PQ: 0 ANSI: 0 CCS
Sep 19 07:00:16 [kernel] sd 0:0:0:0: [sdd] Media removed, stopped polling
Sep 19 07:00:16 [kernel] sd 0:0:0:0: [sdd] Attached SCSI removable disk
Sep 19 07:00:16 [kernel] scsi 0:0:0:1: Direct-Access     Generic- SM/xD-Pic=
ture    1.00 PQ: 0 ANSI: 0 CCS
Sep 19 07:00:16 [kernel] sd 0:0:0:1: [sde] Media removed, stopped polling
Sep 19 07:00:16 [kernel] sd 0:0:0:1: [sde] Attached SCSI removable disk
Sep 19 07:00:16 [kernel] scsi 0:0:0:2: Direct-Access     Generic- SD/MMC   =
        1.00 PQ: 0 ANSI: 0 CCS
Sep 19 07:00:16 [kernel] scsi 0:0:0:3: Direct-Access     Generic- MS/MS-Pro=
/HG     1.00 PQ: 0 ANSI: 0 CCS
Sep 19 07:00:16 [kernel] sd 0:0:0:2: [sdf] Media removed, stopped polling
Sep 19 07:00:16 [kernel] sd 0:0:0:2: [sdf] Attached SCSI removable disk
Sep 19 07:00:16 [kernel] sd 0:0:0:3: [sdg] Media removed, stopped polling
Sep 19 07:00:16 [kernel] sd 0:0:0:3: [sdg] Attached SCSI removable disk
Sep 19 07:00:16 [kernel] scsi 0:0:0:4: Direct-Access     Generic- SD/MMC/MS=
/MSPRO  1.00 PQ: 0 ANSI: 0 CCS
Sep 19 07:00:16 [kernel] sd 0:0:0:4: [sdh] Media removed, stopped polling
Sep 19 07:00:16 [kernel] sd 0:0:0:4: [sdh] Attached SCSI removable disk
Sep 19 07:00:29 [kernel] usb 4-4: USB disconnect, device number 3
Sep 19 07:00:29 [kernel] sd 7:0:0:0: [sdc] tag#24 uas_zap_pending 0 uas-tag=
 1 inflight: CMD=20
Sep 19 07:00:29 [kernel] sd 7:0:0:0: [sdc] tag#24 CDB: Test Unit Ready 00 0=
0 00 00 00 00
Sep 19 07:00:29 [kernel] scsi 7:0:0:1: tag#26 uas_zap_pending 0 uas-tag 2 i=
nflight: CMD=20
Sep 19 07:00:29 [kernel] scsi 7:0:0:1: tag#26 CDB: Inquiry 12 01 00 00 0d 0=
0
Sep 19 07:00:29 [kernel] sd 7:0:0:0: [sdc] Read Capacity(16) failed: Result=
: hostbyte=3DDID_ERROR driverbyte=3DDRIVER_OK
Sep 19 07:00:29 [kernel] sd 7:0:0:0: [sdc] Sense not available.
Sep 19 07:00:29 [kernel] sd 7:0:0:0: [sdc] Read Capacity(10) failed: Result=
: hostbyte=3DDID_ERROR driverbyte=3DDRIVER_OK
Sep 19 07:00:29 [kernel] sd 7:0:0:0: [sdc] Sense not available.
Sep 19 07:00:29 [kernel] sd 7:0:0:0: [sdc] 0 512-byte logical blocks: (0 B/=
0 B)
Sep 19 07:00:29 [kernel] sdc: detected capacity change from 7813971617 to 0
Sep 19 07:00:29 [kernel] sd 7:0:0:0: [sdc] Attached SCSI disk
Sep 19 07:00:33 [kernel] usb 4-4: new SuperSpeed USB device number 4 using =
xhci_hcd
Sep 19 07:00:33 [kernel] usb 4-4: New USB device found, idVendor=3D0781, id=
Product=3D55af, bcdDevice=3D10.87
Sep 19 07:00:33 [kernel] usb 4-4: New USB device strings: Mfr=3D2, Product=
=3D3, SerialNumber=3D1
Sep 19 07:00:33 [kernel] usb 4-4: Product: Extreme Pro 55AF
Sep 19 07:00:33 [kernel] usb 4-4: Manufacturer: SanDisk
Sep 19 07:00:33 [kernel] usb 4-4: SerialNumber: 323134385331643031333831
Sep 19 07:00:33 [kernel] scsi host7: uas
Sep 19 07:00:33 [mtp-probe] checking bus 4, device 4: "/sys/devices/pci0000=
:00/0000:00:14.0/usb4/4-4"
Sep 19 07:00:33 [mtp-probe] bus: 4, device: 4 was not an MTP device
Sep 19 07:00:33 [mtp-probe] checking bus 4, device 4: "/sys/devices/pci0000=
:00/0000:00:14.0/usb4/4-4"
Sep 19 07:00:33 [mtp-probe] bus: 4, device: 4 was not an MTP device
Sep 19 07:00:34 [kernel] scsi 7:0:0:0: Direct-Access     SanDisk  Extreme P=
ro 55AF 1087 PQ: 0 ANSI: 6
Sep 19 07:00:34 [kernel] sd 7:0:0:0: [sdc] 7813971617 512-byte logical bloc=
ks: (4.00 TB/3.64 TiB)
Sep 19 07:00:34 [kernel] sd 7:0:0:0: [sdc] Write Protect is off
Sep 19 07:00:34 [kernel] scsi 7:0:0:1: Enclosure         SanDisk  SES Devic=
e       1087 PQ: 0 ANSI: 6
Sep 19 07:00:34 [kernel] sd 7:0:0:0: [sdc] Write cache: enabled, read cache=
: enabled, supports DPO and FUA
Sep 19 07:00:34 [kernel] sd 7:0:0:0: [sdc] Preferred minimum I/O size 512 b=
ytes
Sep 19 07:00:34 [kernel] sd 7:0:0:0: [sdc] Optimal transfer size 2097152 by=
tes
Sep 19 07:00:42 [metalog] Got SIGUSR1 - enabling synchronous mode.
Sep 19 07:01:04 [kernel] scsi 7:0:0:1: tag#21 uas_eh_abort_handler 0 uas-ta=
g 2 inflight: CMD IN=20
Sep 19 07:01:04 [kernel] scsi 7:0:0:1: tag#21 CDB: Inquiry 12 01 00 00 04 0=
0
Sep 19 07:01:04 [kernel] sd 7:0:0:0: [sdc] tag#26 uas_eh_abort_handler 0 ua=
s-tag 1 inflight: CMD=20
Sep 19 07:01:04 [kernel] sd 7:0:0:0: [sdc] tag#26 CDB: Test Unit Ready 00 0=
0 00 00 00 00
Sep 19 07:01:04 [kernel] scsi host7: uas_eh_device_reset_handler start
Sep 19 07:01:04 [kernel] usb 4-4: reset SuperSpeed USB device number 4 usin=
g xhci_hcd
Sep 19 07:01:04 [kernel] scsi host7: uas_eh_device_reset_handler success
Sep 19 07:01:04 [kernel] scsi host7: uas_eh_device_reset_handler start
Sep 19 07:01:05 [kernel] usb 4-4: reset SuperSpeed USB device number 4 usin=
g xhci_hcd
Sep 19 07:01:05 [kernel] scsi host7: uas_eh_device_reset_handler success
Sep 19 07:01:05 [kernel] sd 7:0:0:0: [sdc] tag#25 data cmplt err -75 uas-ta=
g 2 inflight: CMD=20
Sep 19 07:01:05 [kernel] sd 7:0:0:0: [sdc] tag#25 CDB: Mode Sense(6) 1a 00 =
3f 00 04 00
Sep 19 07:01:35 [kernel] sd 7:0:0:0: [sdc] tag#25 uas_eh_abort_handler 0 ua=
s-tag 2 inflight: CMD=20
Sep 19 07:01:35 [kernel] sd 7:0:0:0: [sdc] tag#25 CDB: Mode Sense(6) 1a 00 =
3f 00 04 00
Sep 19 07:01:35 [kernel] scsi 7:0:0:1: tag#20 uas_eh_abort_handler 0 uas-ta=
g 1 inflight: IN=20
Sep 19 07:01:35 [kernel] scsi 7:0:0:1: tag#20 CDB: Inquiry 12 01 80 00 14 0=
0
Sep 19 07:01:35 [kernel] scsi host7: uas_eh_device_reset_handler start
Sep 19 07:01:35 [kernel] usb 4-4: reset SuperSpeed USB device number 4 usin=
g xhci_hcd
Sep 19 07:01:35 [kernel] scsi host7: uas_eh_device_reset_handler success
Sep 19 07:01:35 [kernel] scsi host7: uas_eh_device_reset_handler start
Sep 19 07:01:35 [kernel] usb 4-4: reset SuperSpeed USB device number 4 usin=
g xhci_hcd
Sep 19 07:01:35 [kernel] scsi host7: uas_eh_device_reset_handler success
Sep 19 07:01:35 [kernel]  sdc: sdc1 sdc2 sdc3

When plugging the device it seems to interact somehow with the internal car=
d
reader module on that machine, so I left these lines here in the log for
analysis.

Searching the web for these error messages I found I needed to disable UAS =
and continue with usb-storage:
options usb-storage quirks=3D0781:55af:u
That works, but reduces the performance a lot. What is broken?

I remember the issue started when I tried a new longer cable on that machin=
e.
Because it didn't work properly I switched back to the original cable again
which didn't solve the issues. Testing the drive with original cable again =
on
other machines is still working with uas, so I don't think the drive is bro=
ken.
Could the local physical USB interface be broken by that cable test in a wa=
y
that only affects UAS? I doubt.

Best regards,
Massimo

