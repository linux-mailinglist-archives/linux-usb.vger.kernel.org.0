Return-Path: <linux-usb+bounces-30747-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D2FC7125D
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 22:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E956E4E1A08
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 21:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BB72FC899;
	Wed, 19 Nov 2025 21:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JbFnhdDA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C04372AAA
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 21:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763587765; cv=none; b=QoiIc4PnowIhI0JgVBi/VPXe+POaYk+FlPmRBVEfNlxZtJMbhoYbf6yHcn+BPsdKznJEMdWPmiQ3/T08FkZmaEV46AUj3odNMXncO6njoPaygncYzOMvOJYJGS3Qm8Jzf5H6gxTg+CZ/675Qz4aR9x1zgqoVTIvYl3M6ySXwTJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763587765; c=relaxed/simple;
	bh=qZlWcf6iSVdCWX0jqzcFQAhJv1kY7V5LUAOq/ARDBHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SiLRKEQyfHsO62oqA1mAtdJVMaKgA5rHyr0l2EIYBGkzqQVH53zo5Hmzu2cH2IVYNiEmWe44PP4BfrFnDTb6KpTbaj/DLRs5p7PX2QT03VgmVGST0wt9LleuSNgURuP3uqU8p8/xJ9H7ZNoyhlNRfRuia8zRYKNtUlMQhmYz9O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JbFnhdDA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso229372a12.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 13:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763587762; x=1764192562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wsPUaZW+lWt4EDGBIFcaMFiCWPFFRuP/pCkDPZ3cF10=;
        b=JbFnhdDArRpGmF3ijJRjqh8jv66s4pg88Jk1oFRyZHXk3gxQSosUP/mtYH57Xqksd0
         PLi+LsfY5nttt4kA2EMHNZtKhXoILjqzZjEfK4/n9z4tUgfJ7D8cUWvPloVEMcxQPN1L
         3TCUOC6JIuVetJ75wN657kg99+ixStE9NidJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763587762; x=1764192562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsPUaZW+lWt4EDGBIFcaMFiCWPFFRuP/pCkDPZ3cF10=;
        b=WZCI/h8pfZlFAqybdroR5T4zNHy3xXr+XX70A2aSaLH6EtTn5eIb5fRx6uTWQmuLtL
         0tDKpSwa6B6hwDEYCNZgG+q+CZB61xiwUeM88E3oDAdCCB+RIItuY0pv/lfG4gpHG6LY
         Qkj+9EruuRy+mi1tyTUQP4lJ5z8k3lqbSgvXSAUeJuNmGe8DIRbYiORhnOXZl4HysZr0
         QjUCuoP86b3tSYoAwJoBj1kkIPovRHjzMGKA0NwI5BQlLRtty9p4Zngu/V1gxQkaWy3d
         REOGfi2ArmsaCCV1Nwtjg1cvNeHb4BStjz0Sy7H1F3ftvfhPLp5TOrtCaz4yru83Pbsy
         Ra4w==
X-Gm-Message-State: AOJu0YzxNMQg7mjlAsU3u7AjfWe1XPuP4ghcEq3ZzjHeiv8R9jPzrAV0
	rpeF1OEnO1qrT8uu0hhCMc0WD93hUiR+GBzorPE2YpjIZkz5MNmi1dLfhmfsyYAN
X-Gm-Gg: ASbGncukxEksMFgho9UDMaVFcP9RcgOhHijAylLvN0ujEf3H6PduN8SZSF9jKA+RSNb
	OKnsYbSDcKYedDraIi4QDAl4plpqKHAunqK5ia4uN5I0GnlWm6QfkLHhPwqHn6Lkxa3j2pX48rm
	oU2CoVs5nGabmFx1cc9p62Y0CyKvrNVa5ZqXlnIyfZN729J+iWrw+JK9pehHY5YwwBcch6Ivzro
	Y55ftSwdRdv9k5OmBbxDggPEs0VW6hpq3ItqSIGxpSjsnG0I040fr7+M3usfRD8oTRqgSLfPGWd
	2X6e423myV86LYrdGT2XT7aQlXNMk/Kv2bB0Ji4fGy7tE/DmF3iwQVIVv8msEr7CpCFZ7FrOFRI
	UcNnE4ewE+CFkxDDHK5SuEPNIbS+hyqkJSPxxJlBsP5V18i8G5lXbz5QzveMOO3AOqCVHF0ASdT
	yoimZ/YxHFg4UjFGOq+gnIxDQ6tePKEcuSZUluyFbWNuM3Z8zEsNxeC1sZy5iJVwk=
X-Google-Smtp-Source: AGHT+IHbYGDmo+BdHdOCRgxP7WIVUSQS17wnJF3168P0UlZ9kD5pE+va199gFRzl/hENjd56EOiCug==
X-Received: by 2002:a17:906:7949:b0:b73:99f7:8134 with SMTP id a640c23a62f3a-b7654fbe7ccmr51298766b.45.1763587762277;
        Wed, 19 Nov 2025 13:29:22 -0800 (PST)
Received: from januszek.c.googlers.com.com (5.214.32.34.bc.googleusercontent.com. [34.32.214.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d7cb3bsm38816966b.27.2025.11.19.13.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 13:29:21 -0800 (PST)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] xhci: dbgtty: fix device unregister
Date: Wed, 19 Nov 2025 21:29:09 +0000
Message-ID: <20251119212910.1245694-1-ukaszb@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Łukasz Bartosik <ukaszb@chromium.org>

When DbC is disconnected then xhci_dbc_tty_unregister_device()
is called. However if there is any user space process blocked
on write to DbC terminal device then it will never be signalled
and thus stay blocked indifinitely.

This fix adds a tty_vhangup() call in xhci_dbc_tty_unregister_device().
The tty_vhangup() wakes up any blocked writers and causes subsequent
write attempts to DbC terminal device to fail.

Cc: stable@vger.kernel.org
Fixes: dfba2174dc42 ("usb: xhci: Add DbC support in xHCI driver")
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
Changes in v2:
- Replaced tty_hangup() with tty_vhangup()

---
 drivers/usb/host/xhci-dbgtty.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index d894081d8d15..ad86f315c26d 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -535,6 +535,12 @@ static void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc)
 
 	if (!port->registered)
 		return;
+	/*
+	 * Hang up the TTY. This wakes up any blocked
+	 * writers and causes subsequent writes to fail.
+	 */
+	tty_vhangup(port->port.tty);
+
 	tty_unregister_device(dbc_tty_driver, port->minor);
 	xhci_dbc_tty_exit_port(port);
 	port->registered = false;
-- 
2.52.0.rc1.455.g30608eb744-goog


