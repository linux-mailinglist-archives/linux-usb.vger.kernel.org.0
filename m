Return-Path: <linux-usb+bounces-19808-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DFCA2079D
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 10:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CD6F1673B0
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 09:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCA61991B8;
	Tue, 28 Jan 2025 09:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3nvala+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93B9748D;
	Tue, 28 Jan 2025 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738057540; cv=none; b=qIvHUzxyMP60uSDAnJQN4T76ECUcoL7T5SyBWkvhyMmDL73NtH4eXG6CXHRmhXazGravezr7slA02XZr40DGkxQFJbDWEzRy7OD19VH9oZiqIp3GhxRZY73o5s4iRxYtts/1AEdMWup+IQ/s8tGHPSt917d+qLbP1Yvg6mzJZsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738057540; c=relaxed/simple;
	bh=LzTNlFBUoZyErs9VRbY7Hq0Vv+qJOCYMPgnRLrDnHUc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p5ap1uXfWlBZYTSpe+ZE8W/RhOBhZ4hUUKot+feYunEF+zuZhBTz2r5nlByzPtCfK5NSOyAXqoPHZRE71kYarwamC6dhlFMqzHtyNqw9GxIQgpRde74VrUwZ5BKU1tTjvySFwr7D6HytRPXTsZMUue/w0JD6ljDz93iCO8HrHrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3nvala+; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30616d71bb0so55776071fa.3;
        Tue, 28 Jan 2025 01:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738057537; x=1738662337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWZjaX6OmuRpph866S74kZjLXuQTRPDZaelIBN7N2tQ=;
        b=G3nvala+iOdX9fnG3hoEzuy6lA1TQ7ZYKJ7ryky69QolBz9oEVqS381+9beODkBLLh
         sBUr0u9J0cCVOg8idr6lHq0QxR9DB07cbIj6B1FpdmUmZCJDBbyKU7v91uwLFLGwMfvp
         drE1j74BcXDZo9uVup/INPZmVmBuKJzVVI0kspIvGjElAmpsqcXKpzB3gn2BUg/OVivT
         /NjV1j0d1lmPLaQAxNN/47e9/7R3nj+63U3yDeSKAtcrfUR18zY70dKhcll6Nla6LV+N
         2cX1CcqQ0pqfl11yz2rVQkBrjzgWYUdDuXTEnL2mdr2chR0BANJgvzhV/8k8gucdj9q8
         j4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738057537; x=1738662337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWZjaX6OmuRpph866S74kZjLXuQTRPDZaelIBN7N2tQ=;
        b=kvaG7zEos+6diAAUEjkMS16BlT9YgyN5jgaME8vrxTPetIP0C3Pv4Vidjw6eppYbEB
         d6H6RQ1AYH5qwhcASok+sn1+NifCh6K7J7e9UO1RLiNqP60/bSuTROc3zZJIolFXyWwh
         5eEfSVwSGa4qpJ4kLgJZNCuU4nZRZroMfXRJhYA9Ly79/Jh72CNNJG3SZzoTMi4/Wvnl
         lSY9RlLlVRvXm694dFNr9zOr7HgNN98JlyyFfIaI0uEfFrw31EaeQwCVMtISiusU+CNh
         kSq9cwPNfbeH2S1qXfPfEHHJKye2fkpaDk/s4E3njmOoSv+JkD0HBWoouFaywZyjyuVr
         JSLg==
X-Forwarded-Encrypted: i=1; AJvYcCWoP+7oW/O7WQWq7wlF3mOFtSMlF+Tqr3iA52CFPw7CEX5za3ZpKcnsNtBZ+bNtoeOR00ce7iNaK3sryWU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+dq/pkXhdCSIxeZpyJAEtc3bQTCmrqw9kyq9m2IXKYDm0Ojn6
	SijkYdJ6OVZxR0yarVsv5uEIpFLxVEj7jcNaJzO0FDz9LC1b1D+sPejO1w==
X-Gm-Gg: ASbGncvOSks6NQjhytUkEswpu/LPDsEdWTePSiBzMzaMo8bpXl+mdYdVV5MtPo9x1wk
	ZXLBsfLdD0QY/TWoaGG0hrpWuvDKSW5arYHenDG6L3v1mWq2W+0QqgcJPAX8Qcyr+98x/upbPxF
	mtF7ZKITp9/YKPcEkD6oYuShZkD2uifndegG3H6F5Ui+PkAF7erAUO3GC6wV5JYJ6+ovdmr8VUX
	FGOMx4IoJ6nwGHJ6ZCptQpTZWWPwoMWhrCRzFsNJIUUJ9Dkc03Y/kxQeEKRdzrKRM1l31GiCCjh
	k27MCJmfdEyqpZumB3VgESSdVq4MIZ4f
X-Google-Smtp-Source: AGHT+IEKuFF/q7sy3cGduVrnlS3tzdjR849kj4RjhvQuvNHPWG1v9ToPm/rP+C2VpSl83iDfTDe4vA==
X-Received: by 2002:a05:651c:897:b0:2ff:9b6f:23d9 with SMTP id 38308e7fff4ca-3072ca5cb5dmr166937501fa.7.1738057536700;
        Tue, 28 Jan 2025 01:45:36 -0800 (PST)
Received: from foxbook (adtk111.neoplus.adsl.tpnet.pl. [79.185.222.111])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc4a4f1sm17992371fa.99.2025.01.28.01.45.33
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jan 2025 01:45:35 -0800 (PST)
Date: Tue, 28 Jan 2025 10:45:29 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: xhci: Restore xhci_pci support for Renesas HCs
Message-ID: <20250128104529.58a79bfc@foxbook>
In-Reply-To: <20250127151051.1a91bbe6@foxbook>
References: <20250127151051.1a91bbe6@foxbook>
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
a SPI flash and are ready to work with xhci_pci alone.

A refactor merged in v6.12 broke the latter configuration so that users
are finding their hardware ignored by the normal driver and are forced to
enable the firmware loader which isn't really necessary on their systems.

Let xhci_pci work with those chips as before when the firmware loader is
disabled by kernel configuration.

Fixes: 25f51b76f90f ("xhci-pci: Make xhci-pci-renesas a proper modular driver")
CC: stable@vger.kernel.org
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219616
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219726
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

new in v2:
- changed #ifdef CONFIG_XXX to if (IS_ENABLED(CONFIG_XXX))
- renamed the PCI IDs table to clarify code intent
- small commit message improvements

 drivers/usb/host/xhci-pci.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 5a5f0b2dba4d..54460d11f7ee 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -657,8 +657,8 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 }
 EXPORT_SYMBOL_NS_GPL(xhci_pci_common_probe, "xhci");
 
-static const struct pci_device_id pci_ids_reject[] = {
-	/* handled by xhci-pci-renesas */
+/* handled by xhci-pci-renesas if enabled */
+static const struct pci_device_id pci_ids_renesas[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0014) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0015) },
 	{ /* end: all zeroes */ }
@@ -666,7 +666,8 @@ static const struct pci_device_id pci_ids_reject[] = {
 
 static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
-	if (pci_match_id(pci_ids_reject, dev))
+	if (IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS) &&
+			pci_match_id(pci_ids_renesas, dev))
 		return -ENODEV;
 
 	return xhci_pci_common_probe(dev, id);
-- 
2.48.1

