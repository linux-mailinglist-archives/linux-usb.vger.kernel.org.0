Return-Path: <linux-usb+bounces-31696-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08417CD8A1D
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 10:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 099F7305E7BF
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 09:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC5332AAD5;
	Tue, 23 Dec 2025 09:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boo5cDTi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD7732A3D7
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483142; cv=none; b=QhO/S+NcUkp7ja/Mq/KG83+YyIX3UvHDXq4YQ7UMeHPPpVdHQxjySQDzv4NSl6NCfHO9ZiMDFa07g7M61kxL/gEOk+zOGpiVL+DCGnPvShQo+jHnhuDvAzY6sbBXE9EwwtBt3WKI9VzDZYlffW2zZ0zPSQFwO+BuEKqQ69rl5YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483142; c=relaxed/simple;
	bh=n8iF6LCWaznF/QJRdWglEOUUfpSZ/9BPHJWWYBW+rpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c98EMDd2RpnDbH8gFBbDM99iuhcspf7eTknJ+5lhejhDnMsNIuoyreXLZPKzMN5pv7h5eFt8eLnHwa9Y1XsmK4YyAjn8QHUBs/VKAPhT+W6cDAB9POA9Kuojqh8qzJsmN7fMKV82YqLPq0HDJtceYpcN6pDgrMvFCOjUysPD8ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boo5cDTi; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso40092635e9.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 01:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766483139; x=1767087939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yf7DR4twh1KIB6g4P1BYW5Y1pRuGiPRcjhJO0s70M+A=;
        b=boo5cDTiQVFakEPQFPz9SJFAT6LoNIVHP13dC67gkw/gY3ZLH1cq103UjV+y4UT3ZY
         T9qr5RkGs72rHXNNFOxbHIzICLBl98HozBy57jxi6rQNgT/4GFmJ9basZPVJmmuR2quZ
         Z8WOEcVaiV3IgPrt1tuj53Gx+C6v6kijxj3umNTrfqHF+TVAxXg1jhl3gMHTdUlKuD1r
         5KPPEVnTtp7g/FGBoZbF/qRfogI+35fvgWHpIH1JUUAcYMn3R+n41uRtXrk1PEb0qWIb
         cBG4J8v9iR06e+J4K+VlUem5ePgAHUkeuKk4z2fUvN279RTLNePdKw+X0QDHXivB9BWs
         YCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483139; x=1767087939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yf7DR4twh1KIB6g4P1BYW5Y1pRuGiPRcjhJO0s70M+A=;
        b=f6aLVClHFYQgol8SEUoJB1MOQb6tnmSDutzk3SlOC/5hXrhL2JNvmNZ4SgCq5lSVUb
         HQah1qHB/BwX3B/J3PDjK9joRMWF23wbVX161u6c7gZeZKGSYOUOm4x5z9t5biOZwZLL
         AVIgBXDalhlRcpEUMmB296271Twn6ct1hq4xgUXC+Wr4OYN2qytyEVSqTErhUfvvMAaQ
         xybCGZezjiA0qQhkfgdz7WXqfL73ugmDWE7tv1BlKLHlh9OSE55JJQja2abkly4NlcUf
         Faa3ELcUSrnAgmPDDRsmQhpABHFz+JnehN7f1XCdV7j5W1+HdBbDiGUFxFgDiRKiW2QC
         Of0g==
X-Gm-Message-State: AOJu0YwgDm+s5ImOEu6CDHVifwIBNmfG91NVIPgO/qZD0y5M2Z75S8YV
	pRIypl2D8VIR0bvHk2PPv8vwbKyMvZdbp2WVAdPtmYdjcf26m270TL31
X-Gm-Gg: AY/fxX4A5OOKuQmrbGJrR36N7xbsjve5SxtTKOVrk13UU99DxcILK9+zxReHkBS+WEe
	hd2tM6Lg/202FtSJxHaM9h/49HQBab8aOYwdZxXAllu/gAyfp/8FEXRqIqvqTAWQ13ULidSxo1L
	/uF1uvAHbEsGMxuZQULg6qC2ysx/FlqfAb90mwDGNoYgqyPTHwMVetQH78irx70IzJOKWWnqhse
	JTyNBsqD06MkF8gUhqui70P1ofEjSZ4T2QUHngJJPIuDPAJuttwcCGD7NAcVa8SA1WhgU9fKS4N
	WruSxn80tbGUqI5PxHj4uWeywF+fQcZQRWzBW2aIXbC6Q3YQ3WuPkeJgvXShW+KdVZ1v1he9ObE
	Lr/yAZmUrDhY9f1qFDtdWGMliy5SLnv4uTwZvc1kfdAR/hD4kmQe3ibO42OpeEP/ITcwbrPxSMW
	AV
X-Google-Smtp-Source: AGHT+IFV++vN7dsdftN1ei3bMzYC7um5UeqpqsXHA4exMdHm8/svGPlsCPKkkSe79zY99UyP9ZCiBg==
X-Received: by 2002:a05:600c:3111:b0:477:b642:9dc6 with SMTP id 5b1f17b1804b1-47d195aa79cmr136008445e9.34.1766483139187;
        Tue, 23 Dec 2025 01:45:39 -0800 (PST)
Received: from xeon ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1ae12sm25759024f8f.6.2025.12.23.01.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:45:38 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2]  usb: phy: tegra: add support for HSIC mode
Date: Tue, 23 Dec 2025 11:45:27 +0200
Message-ID: <20251223094529.7202-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for HSIC mode into phy driver. HSIC mode is supported by
second USB controller in Tegra SoC and is used for connecting modem.
Linux kernel has support for HSIC mode in the controller driver itself
(Chipidea driver) but USB PHY part was missing until now.

Tested on LG Optimus Vu smartphone with Infineon/Comneon modem on usb2
line.

---
Changes in v2:
- initialized err in tegra_usb_phy_power functions
- rebased on top of 6.18
---

Svyatoslav Ryhel (2):
  usb: phy: tegra: use phy type directly
  usb: phy: tegra: add HSIC support

 drivers/usb/phy/phy-tegra-usb.c   | 298 +++++++++++++++++++++++++++---
 include/linux/usb/tegra_usb_phy.h |   7 +-
 2 files changed, 275 insertions(+), 30 deletions(-)

-- 
2.51.0


