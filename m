Return-Path: <linux-usb+bounces-11310-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C6C908098
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 03:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A58EC1F23011
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 01:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B26181D15;
	Fri, 14 Jun 2024 01:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8EYCuaJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131993211
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 01:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718328021; cv=none; b=HX5DWK59+zZwAXfUP+S5f3eY0EyrM6Z4LGYtbjxWFLFxci5J5xeKP9URwWh0/HhGGs2IHHW2BCTaaLBUBYsgDiahiWB3Xh274ItYCgIpG90py74ePWnLyW1PBPaN5XVXyGZtuTU/pfZqUrvf1cM5kjhmXeeYwsHGJezyr/aY//Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718328021; c=relaxed/simple;
	bh=1/UV5rNbFGlSRo38gGtfXmJyq4nb1HuKIY4Z/2vzIss=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QRsflWY4RmEorpqMZ4fXu0PoSWqXvrHY2+PgFDjMUJlKrBZLgLRKV28CjF/MuW9pbnZz9fyhMKxlGJo6g6mD/gUDDTVBl4D4es9NoxZx23RCoLjcXK+BUjxqUBKUZ98h9ES2nfIVmZvfjudFcSDpR2AgUV0inbF6OoRCfWUu1v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8EYCuaJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42138eadf64so14632185e9.3
        for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 18:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718328018; x=1718932818; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+ldpUs4lFMM9EZqalz4pB3v1P7aXbOuVOO4jLCGTps=;
        b=l8EYCuaJcbLUDswg5oL7X0+GXTSpjyP+03lnqX2DaVCcyUg4ftBRytx1UiH4sFo7/3
         pkX0LhXqwVa59sVNBg83sor6CZggD/VGjdsbNJcwzOMC2597jIJy3fjBnylBYcqMjCmN
         O2S36qBft9N+JVXEQ0vgCTtrv2kMk55+8xyhKd45+UX8w8No1GHoFRSHsxfsBcuU9D9e
         TvYC0L6frPZBDaslBEd1yFBfZ3HCTK46/xfoFR76u78md8DxpiXBA+DhLq7xRGUYu2BJ
         2LO09alEVLmrAa+5bCnSORqxvb0EpLSIE891LqDtDV96NSU1wHEiHhRSKmnXOGAHXqVm
         cV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718328018; x=1718932818;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T+ldpUs4lFMM9EZqalz4pB3v1P7aXbOuVOO4jLCGTps=;
        b=w/kjev37NQD1TLw5QW0UAhgSOymx5w6dqfhgMLkKf/mEnaPgyCT+3v0rvUvb4ZSl6F
         lkElj9ZWCYIJFGHfQxI1cDB1gKMbv47RTnCfa2A3gx4iSgPw/rmkzQfff/3uEyBp87wL
         q17Dz22ckV5EBtulmzkO8KHSCLH7tTkYoET/3io/SYzeVJ4y7zkoVIWepnraTThvCXER
         tQ9+IlQcsc+qY/mFRyudRWMRFgnpeffJKzkzDBbAY6YE0RE+CZgIj8GwAbGQ8+scv723
         90u4PGACmL+HZ2JlTOXoN2QmT+r8nm4IwOhKkQ9Nk95WBl8HA+LT8BjQTsltRRGFy9s8
         Sr/g==
X-Forwarded-Encrypted: i=1; AJvYcCXxlV+O3nvP5RV/YsuJYM5+wsm1RMtEOzpHZFwnrKX8vJuYDJ7YL9+WN+jISIdWHhW+7bQstk+RWE6BEwhNhE9Wl7hqyjdFauN5
X-Gm-Message-State: AOJu0YxkHesxiwL6OtEkHdG8phv2B5/jRkhEGWwMvglj1B9g0XFzqZSi
	xzgf/WZM/n2hbhWjEifxyE+jiD5QqRyPg73TVT5aG6QLqLjV3JXw7rovEQ==
X-Google-Smtp-Source: AGHT+IFor0LKnt+OgXKYmhwKpb7CB9qhNHEfZJlTS+RGOMEZKB1vdZFwbrz52fmULvEA1pzQGvyDqA==
X-Received: by 2002:a05:600c:1d29:b0:421:79dc:56e4 with SMTP id 5b1f17b1804b1-42304862690mr11483375e9.41.1718328018061;
        Thu, 13 Jun 2024 18:20:18 -0700 (PDT)
Received: from hermes.prahal.homelinux.net (91-175-163-178.subs.proxad.net. [91.175.163.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874e71dcsm78095565e9.44.2024.06.13.18.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 18:20:17 -0700 (PDT)
Message-ID: <4f4f814d22f491cc1fe051a33fea8352ee5dc5df.camel@gmail.com>
Subject: Remove NO_ATA_1X quirk for at least a few Seagate external drives
 to fix smartctl with uas ?
From: Alban Browaeys <alban.browaeys@gmail.com>
To: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Date: Fri, 14 Jun 2024 03:20:17 +0200
In-Reply-To: <db0adddf85d29d50c3930342bd4b09fc287091b8.camel@gmail.com>
References: <9791b3eee4fc52b45f1ea9b9724bf977bf5c38d4.camel@gmail.com>
	 <48c94250-64b3-4a19-9c87-0f48a2ceb425@suse.com>
	 <25ee57cfbe5c2ab6522ae4e0992f68c4c9a70766.camel@gmail.com>
	 <45b88a576be459f37ed8f329d53221640ce3617e.camel@gmail.com>
	 <db0adddf85d29d50c3930342bd4b09fc287091b8.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

I found where the quirk from usb-storage.quirks applies to uas:
uas_probe drivers/usb/storage/uas.c u64 dev_flags;
> uas_use_uas_driver(intf, id, &dev_flags) drivers/usb/storage/uas-detect.h=
 u64 flags =3D id->driver_info;
	> usb_stor_adjust_quirks(udev, &flags);=20

Thus I found why the patch does not work.
The fix to get smartctl working is not to set NO_REPORT_LUNS (though
this lead me to debug why and find why smarttl was broken).

I found that with the NO_REPORT_LUNS patch the flags set by
usb_stor_adjust_quirks were 12000000, ie:
	US_FLAG(NO_ATA_1X,      0x02000000
	US_FLAG(NO_REPORT_LUNS, 0x10000000)
and without the patch the value is likely: 0x02000000

But with the working "0x0bc2:0x2037:j" usb-storage.quirks the flags
value was 10000000, thus the NO_ATA_1X was removed.

So I though that maybe teh issue was with NO_ATA_1X being applied by
default and not with a missing NO_REPORT_LUNS.

So I tried:
=C2=A0echo -n "0x0bc2:0x2037:" | sudo tee  /sys/module/usb_storage/paramete=
rs/quirks
and I get a flags value of "0" and smartctl is working.

sudo smartctl -i /dev/sdd
smartctl 7.4 2023-08-01 r5530 [x86_64-linux-6.10.0-rc3+] (local build)
Copyright (C) 2002-23, Bruce Allen, Christian Franke, www.smartmontools.org

=3D=3D=3D START OF INFORMATION SECTION =3D=3D=3D
Model Family:     Seagate Barracuda 2.5 5400
Device Model:     ST4000LM024-2AN17V
Serial Number:    WCKAEWZZ
LU WWN Device Id: 5 000c50 0e732b6d8
Firmware Version: 0001
User Capacity:    4=E2=80=AF000=E2=80=AF787=E2=80=AF030=E2=80=AF016 bytes [=
4,00 TB]
Sector Sizes:     512 bytes logical, 4096 bytes physical
Rotation Rate:    5526 rpm
Form Factor:      2.5 inches
Device is:        In smartctl database 7.3/5528
ATA Version is:   ACS-3 T13/2161-D revision 5
SATA Version is:  SATA 3.1, 6.0 Gb/s (current: 6.0 Gb/s)
Local Time is:    Fri Jun 14 02:58:20 2024 CEST
SMART support is: Available - device has SMART capability.
SMART support is: Enabled



The issue is US_FL_NO_ATA_1X is harcoded in uas_use_uas_driver drivers/usb/=
storage/uas-detect.h.
/* All Seagate disk enclosures have broken ATA pass-through support */
if (le16_to_cpu(udev->descriptor.idVendor) =3D=3D 0x0bc2)
        flags |=3D US_FL_NO_ATA_1X;

How can I confirm that indeed at least my two Seagate drives are fine
with US_FL_NO_ATA_1X and how would you suggest disabling this flag if
these drives are stable? Add a new flag to force enable US_FL_NO_ATA_1X
via quirks only for specific Seagate drives?

Regards,
Alban

