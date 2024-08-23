Return-Path: <linux-usb+bounces-13991-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8685295D559
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 20:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B956C1C2161D
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 18:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3615190670;
	Fri, 23 Aug 2024 18:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnFJPjEN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D9118DF81
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 18:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724438195; cv=none; b=Ksab3olDnpkcrkVTcem81z7k/7bwxl31jbJ9eOarq6aBy8y1XHlUYTaY0x5zRb/HT/9wV3nikcIH9ZkC0ZXgbHvonxl0k5qyLJ28KZHyiHMrsCGFb9C9gxuY2YODcK716R3qobrqWsCFnNPIxiID+80ODMn8j/0TnUGFuF9b1hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724438195; c=relaxed/simple;
	bh=nfL+BKMQ0rMSka4mYJVwQoHNXn6ov9Sw/MngzPUC+ns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4OuoVjVTx52mYIT92M70h4ios0BcwncGUkDgwJ/zxzxy6WXX6LF+cxFP12EDmqSv5CAq3wAfBtO5jxT90ueVJUm4xqbu28EvZAS40bciMUccZ91a5i26BxNgvuw3QUxKLw7IHhZc4eniZ4RyzjVfOxehu2mT5QS977cQg7wj7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnFJPjEN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42809d6e719so17999745e9.3
        for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 11:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724438191; x=1725042991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OKHjz9U6/D2CycmXMWQcD+3LBxVkpBUsW2P6Yednkb0=;
        b=SnFJPjEN0bn/QjRcI8IGwYireNGBDBjCErUtjzVsmL2e2e1qulTkxUy7yimZUO0/rU
         ZGMbhroGhymRWd8TYsTpUlva6d5B6u5PpX8FedsjA6IrvbdFH/oPdvvFH529Ky9W1yb+
         so7DveyruDteQ7MuabiXVEN5yClI8yPN+j3hgFji03CCg3afjNwJG4ooC2Fh1pF7qqU4
         dBESbfNl5jAcCUao2uoyvREY6x0cwnrly2QVTvvpGWfpitLmChf7Br2TtJ73cnV1serT
         tc0Mil0uxghdEyhPrfspDuWbGU8R4mNSqOQql4HdbZVLPOtGNz+nKjejJfkXtfF43LBA
         b7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724438191; x=1725042991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKHjz9U6/D2CycmXMWQcD+3LBxVkpBUsW2P6Yednkb0=;
        b=rW/TH5ucSE1o0rLkaPVJlr1i8HViEYMMYuVz0uUufbnBJ/hckGykp8fn6nP3JgMeM2
         di5qC3LYuLjjmHkC2bIyPf2V+QFfsrRogHozFVgJo35pnE80mo+zArOIohsOQ+osga6s
         v+j/KhUYw/DWVs0An9jprdoJfoEEiFExzp78m3AyKe9qQISRRpG/8lkKAfCvCbfDbRvJ
         /AS1Tw3e3odgfr7j7XOmElLBaz1m1wVrg8mSk4B2/cCFulYjR7wu+/NtyQiU8Ojlfy+u
         IBSIwg+f9MuI+NwJUiMQ+fwGxtUGsyb/7dNSl3K6NAjewgJA2HX1xuefmmtRsvVKweoQ
         6F7Q==
X-Gm-Message-State: AOJu0YwW8cYJ5N1bN2z05qh0D32PXipnYIDC8ikwR9p6CLws2nu2qlUy
	GmO1N+IBv69MhhvwWuoAjEBY0y6N97Lf6f9fUURr+GJSfj42sPd4fq62MVExhJY=
X-Google-Smtp-Source: AGHT+IGF42DJ9yt5eok+NaCkH0P7+bdED2hhy31OG5GNEe4sczEFZwht4JmSSHuIoBNfrWKkeqTXnQ==
X-Received: by 2002:a05:600c:4f93:b0:426:62df:bdf0 with SMTP id 5b1f17b1804b1-42acc8d49dfmr25488995e9.10.1724438191189;
        Fri, 23 Aug 2024 11:36:31 -0700 (PDT)
Received: from localhost.localdomain (89-139-152-165.bb.netvision.net.il. [89.139.152.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5158f14sm68638595e9.16.2024.08.23.11.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 11:36:30 -0700 (PDT)
From: alon.barlev@gmail.com
To: linux-usb@vger.kernel.org
Cc: johan@kernel.org,
	Alon Bar-Lev <alon.barlev@gmail.com>
Subject: [PATCH] USB: serial: qcserial: add support for Sierra Wireless EM7511
Date: Fri, 23 Aug 2024 21:35:53 +0300
Message-ID: <20240823183553.2288-1-alon.barlev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alon Bar-Lev <alon.barlev@gmail.com>

Add support for Sierra Wireless EM7511 0x90b0/0x90b1 compositions.

Signed-off-by: Alon Bar-Lev <alon.barlev@gmail.com>
---
 drivers/usb/serial/qcserial.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
index 703a9c563557..4e19536a603c 100644
--- a/drivers/usb/serial/qcserial.c
+++ b/drivers/usb/serial/qcserial.c
@@ -165,6 +165,8 @@ static const struct usb_device_id id_table[] = {
 	{DEVICE_SWI(0x1199, 0x907b)},	/* Sierra Wireless EM74xx */
 	{DEVICE_SWI(0x1199, 0x9090)},	/* Sierra Wireless EM7565 QDL */
 	{DEVICE_SWI(0x1199, 0x9091)},	/* Sierra Wireless EM7565 */
+	{DEVICE_SWI(0x1199, 0x90b0)},	/* Sierra Wireless EM7511 QDL */
+	{DEVICE_SWI(0x1199, 0x90b1)},	/* Sierra Wireless EM7511 */
 	{DEVICE_SWI(0x1199, 0x90d2)},	/* Sierra Wireless EM9191 QDL */
 	{DEVICE_SWI(0x1199, 0xc080)},	/* Sierra Wireless EM7590 QDL */
 	{DEVICE_SWI(0x1199, 0xc081)},	/* Sierra Wireless EM7590 */
-- 
2.43.0


