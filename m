Return-Path: <linux-usb+bounces-19782-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E1A1D7D7
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 15:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A979A166413
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 14:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10511FF1D4;
	Mon, 27 Jan 2025 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRP6cXgX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0583FC7;
	Mon, 27 Jan 2025 14:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737987060; cv=none; b=siYlaA5p9B0G1mhXtxWXXtFD0sED928vZZrKVhH0VnL6EusM6v7lOLeXvrqi77YEP8QOdBrL/K7zCrhRTgPg2qLWtg1NmpCNKRm7W53Gi2EK9Fa59MwZgxevXFpDoU1RdkBrl61VROI7mJAt6DXN3Wmm74pLgBQBNokRrPRp5ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737987060; c=relaxed/simple;
	bh=iMW9Aa8fxgjENZyzXvp1yeoQVZnpx3V00QGC+RvF8Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pler7KkC7aclS68zrW5qmACtChYUfkXYdlgeCWr14f+E6Ee3tFy8Z52OdOKmU5ae25MNMltkvehLcajKk2xCLOmY+XPc4e3dSkeCi9zSOHR1pQwzU0AtYNYjSjxWGmwAueSuH0eZWDiytAVZev8nBDkHSzJCG1upGMfhnnOrdd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRP6cXgX; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so6364738e87.1;
        Mon, 27 Jan 2025 06:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737987057; x=1738591857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TGx6oloRgJbGdlcEo4C+R87dnmqGRB/eKfp5IrNMWJw=;
        b=XRP6cXgX/SrjvJFUGxlLmwZeW9g/I3BgJDnEs6ZheaXFE9N+gPZhbeTzZHmzcy0f0X
         rxGM32LoiSHciaqmI9tIpXZw7M2aVfOcjbGylib5l8PiUKZ3ffAm2G843nxcV75j+Jxk
         9uW9Xvolheh8BwRlw58OzdYvOYcVNFnCYuD9MuVoB4gqhS3Hi6Ei4IpnJz5f3n4Rd+9z
         gcyx7yCdzKKegOv/WjoXxqoYNi3BgxeP78imHsFr6wunmWgNzDL3aAT8Ytw4f98+2sa/
         EL8+evIN9EE+WmUlaROyPNzX7OF+iRauZGH9gi18KVS8Vnl2dkjL6YRkreQz3xKbXB8A
         jSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737987057; x=1738591857;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGx6oloRgJbGdlcEo4C+R87dnmqGRB/eKfp5IrNMWJw=;
        b=qe750iwyPNdhqT0H2ifBaLgaLtEIxeedTCgX0pxqyMMUQ9rUQqbtU8Sg+Hv1DUhKY2
         Co6h6xguKxijjArVtLlYi4E1tffIVizsLGAJZVvEvVvm/liPNCAKQCH1JEBDYbCp3akH
         PL7zp8wUJPDhF1h3FoU4PguTHrKehztkgrGFIB4MY4bwZYRuxVkW3DtCECOL3pF28Y3r
         NtxEjjXQBSlx+uu19S2BarH+VcUYJhI2U9TjDfEZ7SzCiyImrM0kSMGsjbnJGfdmbflu
         kOBBU/AtQebGAaZtYdWkugq4YsVPXENl/688KTNWtcKDPpd8aV1bPDwIZIS/nGuYWbuP
         bRsA==
X-Forwarded-Encrypted: i=1; AJvYcCWwRf9ofuquxqbDrzieAiDpZLZIBQVtuvmVGu6hWXlcPpzOO8qtHl4AiXlz2VwGf2nYOZA5Lqm9tizU75w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCRtrgzjHcEmDoKaDe0QSfcYH3+ct/Ve5fo9vKhFmaofJVAPgY
	muMFvYnqIThUmF87AR6CmPeI4BltfV2ll6M6SgEA1eGEenFE38MiYDvdjw==
X-Gm-Gg: ASbGncu4VDV9GxAbR5tcEZmOd/7I0KovLQnb0VKIFvPFc68Sn2CmctpyHDSU0xH2Dqn
	Ro+RjKaMyxD6TCbIuXUjEQ+cYX/xmrvCtjofW4bi8pDxgTa6SgMOWJTSX6J2XZZNH3eDCM5RJl7
	T7qfKotA5Ut0XmiLeNh4QDSyajR0xfViZIDgTKq4eUEnr8Dqe3+kdxwb8a5zRJlZ69ZTqYyHu1R
	iuCGxk0nOzVpY5YFrUfGajkucEIEeiyQwWpLYtRO4VszjSYMgk0ylISXGpGo0mh4QTq0SXHVBiD
	zt4NaJHbEFqPgj37pCcffw==
X-Google-Smtp-Source: AGHT+IFBauQIs4y1Eo1ht95ecsGNe+uF1RgVEe2vShitNyIOhCEFvIyzvyFVrI0rzPRhKxhzFVGRqA==
X-Received: by 2002:a05:6512:3d2:b0:542:297f:663d with SMTP id 2adb3069b0e04-543c224df09mr5216975e87.23.1737987056510;
        Mon, 27 Jan 2025 06:10:56 -0800 (PST)
Received: from foxbook (adtk111.neoplus.adsl.tpnet.pl. [79.185.222.111])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c836828bsm1289543e87.153.2025.01.27.06.10.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jan 2025 06:10:56 -0800 (PST)
Date: Mon, 27 Jan 2025 15:10:51 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Restore xhci_pci support for Renesas HCs
Message-ID: <20250127151051.1a91bbe6@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Some Renesas HCs require firmware upload to work, this is handled by the
xhci_pci_renesas driver. Other variants of those chips load firmware from
onboard flash and can work with xhci_pci alone.

A refactor merged in v6.12 broke the latter configuration and users are
finding their hardware not working after upgrading and need to enable the
firmware loader which isn't really necessary on their systems.

Let xhci_pci work with those chips as before when the firmware loader is
disabled by kernel configuration.

Fixes: 25f51b76f90f ("xhci-pci: Make xhci-pci-renesas a proper modular driver")
CC: stable@vger.kernel.org
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219616
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219726
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 5a5f0b2dba4d..3d08d6527b1d 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -657,17 +657,21 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 }
 EXPORT_SYMBOL_NS_GPL(xhci_pci_common_probe, "xhci");
 
+#if IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS)
 static const struct pci_device_id pci_ids_reject[] = {
 	/* handled by xhci-pci-renesas */
 	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0014) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0015) },
 	{ /* end: all zeroes */ }
 };
+#endif
 
 static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
+#if IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS)
 	if (pci_match_id(pci_ids_reject, dev))
 		return -ENODEV;
+#endif
 
 	return xhci_pci_common_probe(dev, id);
 }
-- 
2.48.1


