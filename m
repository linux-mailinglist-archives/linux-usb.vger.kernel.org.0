Return-Path: <linux-usb+bounces-31877-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB74ECEFCB7
	for <lists+linux-usb@lfdr.de>; Sat, 03 Jan 2026 09:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A60923030FF7
	for <lists+linux-usb@lfdr.de>; Sat,  3 Jan 2026 08:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005B52F49E3;
	Sat,  3 Jan 2026 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMZQyttO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228B020B7ED
	for <linux-usb@vger.kernel.org>; Sat,  3 Jan 2026 08:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767429164; cv=none; b=juXYrGhvDygrkTBUC8AgIUE/j+8KoVwCLHvvwEN+z7BPXzNV91fhTCX+sYBdPgoGoLjL4L7JgYUl7tWSf3fzKAkl48blA9qcA5ILuFo6l99Nn2EUT+qvgERT3CVwc1mKaPWEex5a4vzMim05SDxJYaqZ3tAA96yZrOmQfrcL3Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767429164; c=relaxed/simple;
	bh=APEICU9rUkhpDIjej28NsSuSNcUg3PQt0p6LlFlD33Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W5NXsb3TvOzUlzg3vq1+Bfqgm1hxDDkk7GBQptd1m1G7w9pnXxMS71Q+p+X+nDq2MHPfPzCF5Tr4wZVvzIadfO+pPaTaHk//VruYci2mif9B90LiXNdKMp3PPhPzTUZXygWCm1Ic+pp2Hp/gZBGe171y8dJFyO8IUQkNaEIiUBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMZQyttO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a099233e8dso106346695ad.3
        for <linux-usb@vger.kernel.org>; Sat, 03 Jan 2026 00:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767429161; x=1768033961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/VnPzfp1fQvhkaRYisdGLmhxps8C201lJVc83Pn+yP8=;
        b=SMZQyttOMQgSZSnlTT+qciCxiSEDvRphl4LJ/0fb6P/8lx4OxbJt4UB/Ws4TOeIp5g
         S2BI6zlaNPLhClK9BvJnOfXVa+KooZi74jYMwDp3LtSSUDRrml8TKZaAf0xB6aO36NyF
         F27OILSj6eMqF7bwe1ufntnchmtXI3ekXDXZYbOyrUiDFNOYN9mpQ7Yurl1OfJppW2zW
         7t6yWjiuHw6q3JRNl2lBTUiAobHjuhcDb9K/eGfaiKpoX4Zub4p9uve6i32xPw1HXC89
         zfZduIz+/d3RhWR4OYmRj9A57nssjj+rtfs+3dt8W5DKOBXNbaUIFEBu41rg0+ExOTM6
         0B4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767429161; x=1768033961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VnPzfp1fQvhkaRYisdGLmhxps8C201lJVc83Pn+yP8=;
        b=KmcW7MamhUF6mYiurbeEMU4rEZwJFxYq1INYHDmR356Vyf2A0C088q9AmoNDy5yTuT
         HuHtB59R84hO0ePvVNSsk1VK3ljFLhIR1WkpdNzFlswkUKjTAnWDj8HoTfoCX+sKB9LX
         SabgM1Y3WmGZYiNBsIJe+nVzgS0eeUeVgxxUGwk+CjpwWpq4Et9g/hv1Fzf6mxHZezcd
         0F6fES0uU7eqSS1/Yr+wnVemLF37r/3FGa4ccM8dK2UqPs/nqkh4PR0nri1joG+3Xlo/
         8UZ7O3wWc6XCAaINs2Rbrx3dy7heK2cvF7CpkxBGRLMu1o8C1nkwezBNqvnDzpWx5FMQ
         DKeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXDRU4917FhWKNHa1WTTUiFfQQFR1WtZ939CQz2pnNwwEYY7+1dRwLDU2IV9++Ug0G0POmoEfxKg8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3oHlxnoQdBJJN9hjG2ZZmcbENzatgPKOZFs09ASk5/Z8sxATU
	5QL88ovscsBnxxX96ldDC2GzJ1Sk9SiWfRxcjnkitJlrh8b2TAXz6iyC
X-Gm-Gg: AY/fxX5Whb9PMLoX2+COyUERvzBydX391pLIMAcAz0A6f3R68YEN3ZmFRWslf1YCqmg
	uuvpqyReB5fFDh8dOpolaMiczrIuUIHDRGOQdYOu2yXjOJtnBpgoiOU5aZyk6jrMnFY169f26eN
	sjHjyxkufSmuZCbBU6m7OIQdj/dN2XDYqIXv4Z3Bve3A6RmHParV7+FwMRzmqxp87ArDsNTxSZD
	ATBqtbSlFZhzpzLtcQfzAClODbPIr8hFVdkmYfvQNJaaG5aR3S+I4/YRKf5EU6IKCaruV0NFSnO
	BAiSN/ZC5jXNRhrTX4K57Yv+xmGPSC8czI28C7uC0dpL86bmNOYGtVJmHgjyhYpL36PpPs2+pBU
	SLPqRvDEXrUKv5S1lHnzOycZoaYD43K5ENoCKlbeTYXPf+GjS1mtwR+aK2KJDVBtp5POKCAB6Gt
	f1/OIw1A==
X-Google-Smtp-Source: AGHT+IFoulmgJlcINPNA8cZbhnmS4JTmUEE8b7brlKlIn5OURft66LBge+OGHsQgzKapPNMd4n6VcQ==
X-Received: by 2002:a17:902:c103:b0:2a0:97d2:a264 with SMTP id d9443c01a7336-2a2f2735214mr289212675ad.37.1767429161344;
        Sat, 03 Jan 2026 00:32:41 -0800 (PST)
Received: from rockpi-5b ([45.112.0.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm391700365ad.21.2026.01.03.00.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:32:40 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Yongbo Zhang <giraffesnn123@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB TYPEC CLASS)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 0/3] Typc fusb302 powerloss issue on Radxa Rock 5b
Date: Sat,  3 Jan 2026 14:01:16 +0530
Message-ID: <20260103083232.9510-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All

On the Radxa Rock 5B, the system occasionally experiences intermittent
hard resets during the boot process. Initially, I suspected a power supply
issue, but further investigation points to the Type-C fusb302 module as
the cause.

Specifically, probing or reloading the fusb302 module triggers a hard reset,
which can result in immediate power loss and a reboot.

[root@rockpi-5b ~]# rmmod fusb302
[root@rockpi-5b ~]# lsmod | grep  fusb302
[root@rockpi-5b ~]# modprobe fusb302
[root@rockpi-5b ~]# [ 3389.031608][ T7143] typec_fusb302 4-0022: Initiating hard-reset, which might result in machine power-loss.
[ 3390.030444][ T7143] typec_fusb302 4-0022: Initiating hard-reset, which might result in machine power-loss.

I attempted to trace the issue using ftrace but was unable to pinpoint the
root cause. The problem appears to originate either from the I2C controller
or the PMIC reset.

I have identified a potential workaround involving the I2C SCL debounce settings
for the RK3588 and submitted a patch here:

[1] https://lore.kernel.org/all/20260103052506.6743-1-linux.amoon@gmail.com/

Please note that the submitted changes address a minor aspect but do not fully
resolve the underlying issue.

Thanks
-Anand

Anand Moon (3):
  arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Correct Type-C pin bias
    settings
  arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Fix USB host phy-supply
    on Rock 5b-5bp-5t SbC
  usb: typec: fusb302: Switch to threaded interrupt handler

 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 7 +++----
 drivers/usb/typec/tcpm/fusb302.c                        | 7 ++++---
 2 files changed, 7 insertions(+), 7 deletions(-)


base-commit: 805f9a061372164d43ddef771d7cd63e3ba6d845
-- 
2.50.1


