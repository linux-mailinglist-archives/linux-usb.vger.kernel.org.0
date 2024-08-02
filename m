Return-Path: <linux-usb+bounces-12892-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4B4945F19
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 16:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB63D1F23F47
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 14:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B221E4EF0;
	Fri,  2 Aug 2024 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zh7M8pgn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE53C1E2871
	for <linux-usb@vger.kernel.org>; Fri,  2 Aug 2024 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722607476; cv=none; b=HW3TrGqhwliwr6RdlplYQo2H3i0o5gHFzkuIZ/4Fiz8DivJg+SZUX+16olEMCFoGBVC66tJmy/bwz2xFKpWMxa9rsBbpS7+1BC/+W9eueqQiUOlU5YoO8EEqLeyWVe9KEVnrRubfAUzT8DS2qvoCQpZ/nV7H6Qfqfq9k9vFMaMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722607476; c=relaxed/simple;
	bh=U5dcxUNr2odgIs7xUMMoIe9RlwP0Ah79BKNX5w4H41k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KdhpzstygimxozxMUjfenPwm68F2cYYSHTh6wuQndgCQZ98dLU5d+CAEwypew9ljHii+kpythyMn/JnzGU73lbFYFCR+hEzQIjJZNJwGBvKgsFZhNu21eyEaiisqiKDo+fpIhfh7XqKH1Qbcirbuyx84WpfXs+YD+kRaf2GGxU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zh7M8pgn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428163f7635so53993125e9.2
        for <linux-usb@vger.kernel.org>; Fri, 02 Aug 2024 07:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722607473; x=1723212273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gTNrD7q7lCqs+SeK/esd32UOqUw2p0Lz4FfB73dcWE=;
        b=Zh7M8pgnG7kbhOPh9OYLQMyRnytnm18EYpZM+2NEvr+6/VRFyTA61/Qf73ZoFGfwcs
         zSx27xg9SLDMwXym7QFbQ4RHyFc2oyTbPvLibTyC0EKHF8L4RxzCa6yKkKpOSyQ+W9yL
         7G7ZSdGiO5YgamB5grqrjIj1GCtFnyLIFS66EOoWHUvSblug71peGSkM+gssk1MDNaqb
         0xQn3Gx587Fh9XKBC9J83SZcG49wB2bvoi24p82NRf+cb4MkFtWzQH8bcPl81UPTuUMD
         47ap1+MNBotXRs6vI8mDhiQjQMRKMj4EmF8aj/qC6LlP4YhcqYWC1/qWpOJOsrye5NcC
         ZMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722607473; x=1723212273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gTNrD7q7lCqs+SeK/esd32UOqUw2p0Lz4FfB73dcWE=;
        b=EKqfKMHJ42PrEZu9etroM99CYK+xmPkwsR9XLrmD+CgqZNC99tX3Mb9MPKR/7bQk0i
         0SzqdyTrQRdZ0Zz1FEiDxjjzjfNr3ldPcYyYdkDJYfbVjb9vbyB6M6CRYDPTP0/OY2NC
         XjuweYypvvNQxPVwb6TvpO5zPctcnt1bBuz7QnJP5BzCl8ATflk9zYoGvP7ddhh+r271
         0zsvW252TYEVhrMDEESeI9/eObuODdfouZjQ2mPJIzdYt5TnhrM7z9fZ8t0IpCcsyOUC
         l0JiKRcQykBWVzMuHQPuwAaBUZv/Pee5QIyuRBDX0Xrc4hnGD9rwBKjuJXfrpNiJPcxn
         l+Ng==
X-Forwarded-Encrypted: i=1; AJvYcCULnNkXjOsKNcvKUXxnx1YEdmPH38MUPdLwTeeSaIQkqZ5ZnZFgOLmesjm6bAb41j7wwNrsS0awjbeycBAgGtjSE+5nETGTxCcn
X-Gm-Message-State: AOJu0Yw/68DP1slFbFHNAiAiP7Ggq1yy4A/OKfuf/OKa0Jufd1+xROsH
	nxSbn9dWFRxvi1Eons5LaYMUrTYe2BMuOo846x7HcQdF58jLXYPMG24GU4CSr9Q=
X-Google-Smtp-Source: AGHT+IFr84SxcyNfkXjTT3ybZwAT53ZW4xC0O3ambdifRm7c9yPj8RBwEztP1+OFFxLbll+J3KtfDg==
X-Received: by 2002:a05:600c:3acc:b0:426:5f7d:addc with SMTP id 5b1f17b1804b1-428e6b8380dmr20915355e9.37.1722607473217;
        Fri, 02 Aug 2024 07:04:33 -0700 (PDT)
Received: from ta2.c.googlers.com.com (185.83.140.34.bc.googleusercontent.com. [34.140.83.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e8d6555fsm29041605e9.26.2024.08.02.07.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 07:04:32 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: gregkh@linuxfoundation.org,
	hgajjar@de.adit-jv.com,
	willmcvicker@google.com
Cc: paul@crapouillou.net,
	brauner@kernel.org,
	christian.koenig@amd.com,
	jlayton@kernel.org,
	kees@kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 2/2] usb: gadget: f_fs: pull out f->disable() from ffs_func_set_alt()
Date: Fri,  2 Aug 2024 14:04:28 +0000
Message-ID: <20240802140428.2000312-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
In-Reply-To: <20240802140428.2000312-1-tudor.ambarus@linaro.org>
References: <20240802140428.2000312-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ``alt`` parameter was used as a way to differentiate between
f->disable() and f->set_alt(). As the code paths diverge quite a bit,
pull out the f->disable() code from ffs_func_set_alt(), everything will
become clearer and less error prone. No change in functionality
intended.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/usb/gadget/function/f_fs.c | 36 ++++++++++++++++++------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 0bfed1741b3e..e0ceaa721949 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -3731,14 +3731,12 @@ static int ffs_func_set_alt(struct usb_function *f,
 	struct ffs_data *ffs = func->ffs;
 	int ret = 0, intf;
 
-	if (alt != (unsigned)-1) {
-		if (alt > MAX_ALT_SETTINGS)
-			return -EINVAL;
+	if (alt > MAX_ALT_SETTINGS)
+		return -EINVAL;
 
-		intf = ffs_func_revmap_intf(func, interface);
-		if (intf < 0)
-			return intf;
-	}
+	intf = ffs_func_revmap_intf(func, interface);
+	if (intf < 0)
+		return intf;
 
 	if (ffs->func)
 		ffs_func_eps_disable(ffs->func);
@@ -3753,12 +3751,6 @@ static int ffs_func_set_alt(struct usb_function *f,
 	if (ffs->state != FFS_ACTIVE)
 		return -ENODEV;
 
-	if (alt == (unsigned)-1) {
-		ffs->func = NULL;
-		ffs_event_add(ffs, FUNCTIONFS_DISABLE);
-		return 0;
-	}
-
 	ffs->func = func;
 	ret = ffs_func_eps_enable(func);
 	if (ret >= 0) {
@@ -3770,7 +3762,23 @@ static int ffs_func_set_alt(struct usb_function *f,
 
 static void ffs_func_disable(struct usb_function *f)
 {
-	ffs_func_set_alt(f, 0, (unsigned)-1);
+	struct ffs_function *func = ffs_func_from_usb(f);
+	struct ffs_data *ffs = func->ffs;
+
+	if (ffs->func)
+		ffs_func_eps_disable(ffs->func);
+
+	if (ffs->state == FFS_DEACTIVATED) {
+		ffs->state = FFS_CLOSING;
+		INIT_WORK(&ffs->reset_work, ffs_reset_work);
+		schedule_work(&ffs->reset_work);
+		return;
+	}
+
+	if (ffs->state == FFS_ACTIVE) {
+		ffs->func = NULL;
+		ffs_event_add(ffs, FUNCTIONFS_DISABLE);
+	}
 }
 
 static int ffs_func_setup(struct usb_function *f,
-- 
2.46.0.rc2.264.g509ed76dc8-goog


