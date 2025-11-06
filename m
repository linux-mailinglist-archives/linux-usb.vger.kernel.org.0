Return-Path: <linux-usb+bounces-30151-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32006C3BD03
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 15:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E92A1886409
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 14:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40DA343D9B;
	Thu,  6 Nov 2025 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OeRC5w/9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C56302CDF
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439792; cv=none; b=Zuz93XNrnbpeIsRAFe1shBw2xdl5zyxQ1YlpPswW+7xMghMKAYcDgsK259Vlym9WiPhv6mJTblhlEiFlRJgZQA3w6GcBfWtlEmvIet6hXqfTwG2Hjl6REOhWSNlQRAGmgtVGERbodJimPtZ1KwRJc4dD4vvX+O7rQIS67exnqCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439792; c=relaxed/simple;
	bh=cgh3Vak6zP+Xb4sZcHY+bd8yHXC0q2hAbj8FIzk6Pjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E6s3jRsZrhPlh+Rx2uTpDPon4S/45w8uEVshKU0kRWiPU1LMRDFMWzEvpQ5/J/d7LRa7L8LBsGlCyl34V842qaq8sl6mOEBYptVJHxZ2f+YxQM6qprxJFI65GvPJQLEKL7QpeDlnv3oMIhtQ+you8GmbIuzLg3ymllhxcYB3/Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OeRC5w/9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477563bcbbcso5295245e9.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 06:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762439789; x=1763044589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2hlP/g32u7s3LyR5M2MyElNtRyiD5b8iMgapRQ0QHFA=;
        b=OeRC5w/9lfQiCXJrya4rOHkKGsGvk/D+X8yLEphrLRzQdHkfEAvYxT3+d9IsqUFDYF
         Rtj269jeyix9RWmIzVExzsK3GdjUhlLcZDDkwSPeKbP/lF1wj69CGUSHm2xmxUFpL1r8
         G2jrK2xyqHdNw+9r5HM/aXD3ljmvRllIPcz4gxBeosd1hvbi4i5FPkLRFI3pDr39nHvC
         0FGraEP4C3/jr8W5VBIt6zvTFh8yNISDswYENK2DUqTloN/7OitMMyGCbSmWT0NQm+1v
         2NESm6vk4peLIf3pgi/NK90HEOVyekkfDIgeQWgIbgXO/9CEpnMvhx0Z9/rqfyBEcqUm
         E6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762439789; x=1763044589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hlP/g32u7s3LyR5M2MyElNtRyiD5b8iMgapRQ0QHFA=;
        b=AvhPTVzOjXK+755mBRglpze6ri/HkC8gYo9R3h8qv8sSZXZYZ3oOxqqG1jf5WeC9CY
         eKyFZfEmqlIOdMOvJOyCKacCtPmnEN+a82KofM/HSLxt/6dSeZPBF2jSq8rarGH3rmja
         DwdQkEj5OPT53SzgA6jY7uuz7bDM0mo2jQT1ggJxvYtIMs9JTJ7Rp669Fg3fsG6Nz4jJ
         OwW4oje+FwBQjeswkLetWw5tB2a6uzX0BYvJNISaWJld6n9pqasj6Z2hfRlfTWa9ZKsI
         X5iCPcvimORMyA/gqikW/8iewJucbuFcDwB22bx8wRcEhnSWcbd0orgQ7LZttev7R/yL
         1UJg==
X-Forwarded-Encrypted: i=1; AJvYcCXxbj0SA+xP9ksGudgmnbf1CeIy6toUa53hEgtgCcvFWeQiI10GU2BT5dDtnsw9pWAXAWCzP1t2wIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYfcnrBt19PQTzqFMRAdynDS4mXwuHd/1xW8/yXxJKdWgbv/jN
	9NOBGwLG1/Pz3u8GzIXj7NEmjk61737K4xqFRwso482LOJE53iA1R55Kw2VlR5Eiy7o=
X-Gm-Gg: ASbGncvB/gK4xSBJU697ZZXvJSIgvf77wjcVU6NzvlEFrVuUggUg4X5blikSpjQzEan
	sZTxX5AidDSGS7E+hCHaXcF3V+fZtQq3AlhEcyDhSzjAX/JYq9Fyv+3zvpjyjJunCAGPfRGMHYn
	nRgYz1LH+ZGG/cKCvfFTtJFSIVhjgLwIb3tPUFWyDK7egwibwiUWUz/SWPwDzXOKe/BTkAH26Yq
	vQzYH7n5weBL2LGEMpxXtVr/MVy1oZFdTu7vW+/Ql6nwX5Jlrf1vAWfhjkWwoAdbWNX8sQisTjm
	6kC5lJRUeQnKgsoxYZQe9IFtw+dcd2o+sgOjChwSV3CUhKoMxrAKYfRuMkXXZgMff4J0lHShF3T
	cn/YtOT5DUXs/Wyh4EEz4KBP1eHBe0tq9nnCumPCobiA1A2zWE3hAzCb3aTf0V5CntAPKMo+QGe
	watjWU1hxkK3HiRWzPXhPc8y0Z3UQ/tEUIWu2JY19F
X-Google-Smtp-Source: AGHT+IH0S/6NocUvBBvhVFlXalk6vfmsVEte/Abd8sUlhELu8RQVK9rbCvig9oqcdCFDI4RBgNCyBg==
X-Received: by 2002:a05:600c:37c6:b0:46e:37fc:def0 with SMTP id 5b1f17b1804b1-4775cdbf0eamr51383005e9.9.1762439788723;
        Thu, 06 Nov 2025 06:36:28 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce2cde0sm112185495e9.15.2025.11.06.06.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:36:28 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	kuninori.morimoto.gx@renesas.com,
	geert+renesas@glider.be
Cc: claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/4] usb: host: renesas: Handle reset signals on suspend/resume
Date: Thu,  6 Nov 2025 16:36:21 +0200
Message-ID: <20251106143625.3050119-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adds handling of reset signals during suspend and resume.
This is necessary for the Renesas RZ/G3S SoC, which has a power-saving
mode that turns off power to most SoC components (including USB).
The reset signals need to be configured accordingly during
suspend and resume.

In addition, a cleanup patch (1/4) has been included.

Thank you,
Claudiu

Claudiu Beznea (4):
  usb: host: Do not check priv->clks[clk]
  usb: host: ehci-platform: Call reset assert/deassert on suspend/resume
  usb: host: ohci-platform: Call reset assert/deassert on suspend/resume
  usb: renesas_usbhs: Assert/de-assert reset signal on suspend/resume

 drivers/usb/host/ehci-platform.c   | 25 +++++++++++++++++----
 drivers/usb/host/ohci-platform.c   | 24 ++++++++++++++++----
 drivers/usb/renesas_usbhs/common.c | 35 ++++++++++++++++++++++--------
 3 files changed, 67 insertions(+), 17 deletions(-)

-- 
2.43.0


