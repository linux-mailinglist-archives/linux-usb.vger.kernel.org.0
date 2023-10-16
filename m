Return-Path: <linux-usb+bounces-1645-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F107CA083
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 09:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77B251C2091F
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 07:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65891641A;
	Mon, 16 Oct 2023 07:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJdIYDBO"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B0E15ACA
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 07:26:15 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B751DC;
	Mon, 16 Oct 2023 00:26:14 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9b2cee40de8so852128866b.1;
        Mon, 16 Oct 2023 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697441173; x=1698045973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIF366p2fSWvwuEAKrDTEGDfvFAKQAfN3wG9+11Etbo=;
        b=jJdIYDBOBsklVVLcgajtJGNsyFA+nzFZK6Tq+f/F6HFdCZ5rx7HAnjPOqjpKOfJyPx
         9xk3zsgfi1UxA5LVaePQ9B4Lk2eg2DL7C/6Cec027KrEyVvqW2QFANDaaU/0TL5T/4co
         KBBuOgoO3C7JlXc9DxsPvgK94/EbReB/BCacSgpLdCPshfT2MLtu5ne59G2zhXRMcqNz
         6hSi5N3BvExd4OI6BmQpkBmsRBwKxtAaA1DtOUqhxtGj3cKBwIo6r6kVazeojSeXKuiA
         JPy8P8jWTMbmM2efdZOfWmHpoCE9kYgIRVou09GgkNSMZa7i41/1V8QQq7SrGowl+uAn
         KKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697441173; x=1698045973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIF366p2fSWvwuEAKrDTEGDfvFAKQAfN3wG9+11Etbo=;
        b=MUHheMQdyb4JY4u2OUEEzTYvHdMeYHRylzYLLAKBvNVxO1LnPR+TfkVFcP1BKYgi1h
         KdulSbTlwEDiM2gtWj1Z1Hta2ks2MzUHG5X/68DBxyL5y0X/Georu4luryZaVLOAjXzo
         0Mv5fJBbOEDEG10UOJQjvVw4/mLSkRbbU53ViZkDJ5GstCd4EBXoWIRbU81s4McaHG9k
         G7oy97iuNm/EM14UIkUAZhYcc8HXsPZPqPTcK91EHb/Jnfe36KMnTMD/dYZnDt4fX0eR
         tIqUES7dKabjty1/oDqknfJX+jUvE8vQWtUqCotItrzvxZXIBKTtFCv+KX6aWT87NcjV
         HpmA==
X-Gm-Message-State: AOJu0YwIHPXfew/SBki1jRcPqKKGmyH0vl13ysyfJF6aYQk+uDF44XZN
	1cSH/rpMyNOz6+FYaubT2tmgADqXH9MOkw==
X-Google-Smtp-Source: AGHT+IGve75sWFrhdh/ObqI+CeT6vriUkqD9+ABDF6ki+95UsIexy7TiBZGVskWLudzmRekYF+dFQQ==
X-Received: by 2002:a17:907:3f12:b0:9ad:e3fd:d46c with SMTP id hq18-20020a1709073f1200b009ade3fdd46cmr7060305ejc.10.1697441172388;
        Mon, 16 Oct 2023 00:26:12 -0700 (PDT)
Received: from sauvignon.fi.muni.cz ([2001:718:801:22c:bdcb:518:be8f:6a76])
        by smtp.gmail.com with ESMTPSA id n25-20020a17090673d900b0099297782aa9sm3399980ejl.49.2023.10.16.00.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 00:26:12 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: linux-usb@vger.kernel.org
Cc: usb-storage@lists.one-eyed-alien.net,
	linux-scsi@vger.kernel.org,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	oneukum@suse.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [PATCH 0/7] usb-storage,uas: Support OPAL commands on USB attached devices.
Date: Mon, 16 Oct 2023 09:25:57 +0200
Message-ID: <20231016072604.40179-1-gmazyland@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006125445.122380-1-gmazyland@gmail.com>
References: <20231006125445.122380-1-gmazyland@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This patchset adds support for OPAL commands (self-encrypted drives)
through USB-attached storage (usb-storage and UAS drivers).

The related SCSI change was sent in a separate patch
https://lore.kernel.org/linux-scsi/20231016070211.39502-1-gmazyland@gmail.com/

The first part (64-bit quirks) is generic and will be needed later anyway
once new flags appear.

1) Patches 1-5 only add support for 64-bit quirks for USB storage
(unfortunately, USB device info can be 32-bit on 32-bit platforms,
and we are out of space for flags now).

2) Patches 6-7 enable OPAL commands on USB devices and adds
IGNORE_OPAL quirk. The last patch uses the flag for Realtek 9210
devices that do not behave correctly.

More info

1) 64bit USB storage quirk flags

The quirks are transferred through the device info value, which
is unsigned long (and as a part of USB infrastructure, it cannot
be changed).
After discussion on the USB list, I used high bit as an indicator
that the values need to be translated/unpacked to 64bit
(while lower values are used directly).

This is implemented through a host-compiled program that
generates device tables and uses a translation function.
As both usb-storage and UAS drivers share a lot of headers and
definitions, we need to generate separate files for usb-storage
and UAS. Note that due to the linking of both UAS and mass-storage
together, it must use separate names for translation tables.

(I also tried to use a statically generated array for flags,
but this increased the size of drivers significantly and
the code was quite ugly...)

2) Support for OPAL on USB attached storage.

The main support for OPAL on USB-attached storage is
straightforward (it depends on ATA-12 pass-thru support
for security commands).
Patch 6 enables the SCSI security flag for USB mass storage
and UAS device by default.

During device detection, the USB driver (mass-storage, UAS) enables
the security driver flag to allow SED OPAL code to run OPAL discovery
command for the device. If it receives a correct reply, OPAL is enabled
for the device. If not (or if SCSI command is rejected), OPAL
remains disabled.

Enabling OPAL support may uncover many issues, as OPAL-locked devices
often tend to generate errors on the locked range.

Anyway, cryptsetup will soon support OPAL devices, and I think support
for USB devices is a nice feature that enables users to unlock drives
even if they are attached through USB adapters.

There are also bugs in firmware implementations, so I added a quirk
flag that can disable security commands for particular devices.

The last patch uses this quirk for Realtek 9210, which seems to support
OPAL commands, but after configuring OPAL locking range, it also sets
the write-protected flag for the whole device.
This is perhaps a bug in firmware (all versions I tried), and I will
report that later to Realtek.


Milan Broz (7):
  usb-storage: remove UNUSUAL_VENDOR_INTF macro
  usb-storage,uas: make internal quirks flags 64bit
  usb-storage: use fflags index only in usb-storage driver
  usb-storage,uas: use host helper to generate driver info
  usb-storage,uas: do not convert device_info for 64-bit platforms
  usb-storage,uas: enable security commands for USB-attached storage
  usb-storage,uas: disable security commands (OPAL) for RT9210 chip
    family

 .../admin-guide/kernel-parameters.txt         |   2 +
 drivers/usb/storage/Makefile                  |  28 +++
 drivers/usb/storage/alauda.c                  |   2 +-
 drivers/usb/storage/cypress_atacb.c           |   2 +-
 drivers/usb/storage/datafab.c                 |   2 +-
 drivers/usb/storage/ene_ub6250.c              |   2 +-
 drivers/usb/storage/freecom.c                 |   2 +-
 drivers/usb/storage/isd200.c                  |   2 +-
 drivers/usb/storage/jumpshot.c                |   2 +-
 drivers/usb/storage/karma.c                   |   2 +-
 drivers/usb/storage/mkflags.c                 | 235 ++++++++++++++++++
 drivers/usb/storage/onetouch.c                |   2 +-
 drivers/usb/storage/realtek_cr.c              |   2 +-
 drivers/usb/storage/scsiglue.c                |   4 +
 drivers/usb/storage/sddr09.c                  |   2 +-
 drivers/usb/storage/sddr55.c                  |   2 +-
 drivers/usb/storage/shuttle_usbat.c           |   2 +-
 drivers/usb/storage/uas-detect.h              |   6 +-
 drivers/usb/storage/uas.c                     |  29 +--
 drivers/usb/storage/unusual_devs.h            |  11 +
 drivers/usb/storage/unusual_uas.h             |  11 +
 drivers/usb/storage/usb-ids.h                 |  37 +++
 drivers/usb/storage/usb.c                     |  44 ++--
 drivers/usb/storage/usb.h                     |   7 +-
 drivers/usb/storage/usual-tables.c            |  38 +--
 include/linux/usb_usual.h                     |   2 +
 26 files changed, 385 insertions(+), 95 deletions(-)
 create mode 100644 drivers/usb/storage/mkflags.c
 create mode 100644 drivers/usb/storage/usb-ids.h

-- 
2.42.0


