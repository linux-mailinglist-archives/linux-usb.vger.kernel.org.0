Return-Path: <linux-usb+bounces-22804-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A7DA826F9
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 16:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F842175C82
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 14:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E606C266584;
	Wed,  9 Apr 2025 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c6/2GOgr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8312265CDE
	for <linux-usb@vger.kernel.org>; Wed,  9 Apr 2025 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207363; cv=none; b=E80z0s3DEe4Lp3NMpNeCJXsDq3nIypzI6d/Y/VIj3ocwhuXgvovobyPpcAL24hriKydEXodCdIgX1dOY7vWINKEYkHtj/d9cdGU6v0MtdElmgpA5BUCOHNiAjTS7YMK6716qAqk1fo/ebLlnz5kqY6V7ub1Wb4YtemN8Ke093zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207363; c=relaxed/simple;
	bh=mG96fuhZeMSiI4R/GosBkkESrvmzH8d+f53dlK48H50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xh4j3yyLGmec9RfLTriU3J/3J1AHpew/mUlRuQqdRmtSrVFDutjQhhlfTxCW1/y1Z3hcw5Cm/Dc2wP5QY3yb/MIygq7bLEhoQLocy4rVFultwAsFFq2SErkswYFxX/YapwRNT7YoPsE4S+FZpDHDSbXtKuvBlbnZIeQb49nAV5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c6/2GOgr; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac25520a289so1196623966b.3
        for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 07:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744207360; x=1744812160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqfKoc5OtBfHsLnQESTgykRUnwgehQk6QiKSOB65pWU=;
        b=c6/2GOgrVvbSHtrK+LOIIbr0+LrQoYbcN751ah95zeEs2SdrJmgGHXWszmRH7Gkc8E
         qzW3EcCRkcAs0Bq2D+QGLK9MIMpqDJPLX079X9EkB8/CIiwJHqaNO2m+usSsi3rGCJkg
         OD6V1PDrycsWyNzHrcBRHV/WFhSxU6A1nYqVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207360; x=1744812160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqfKoc5OtBfHsLnQESTgykRUnwgehQk6QiKSOB65pWU=;
        b=jRnPsJgkAlTy9wUKdYH05yYLJ7YAQnzVaTirAKdVS0xgXjXLJzQaZs/vRjm6sjEY7O
         uU3S+K34bAVSFy2kHZ91lgWu2yXbQArAvkxIfSgfi57WYDlHteRFesSiy7UKF2NT7x93
         ZCjqae6kkZep9+lp01zryDMBxsOAKyvzLUoQJhfTm9o6WECLXRZ1oVH51xknWyLHMl2M
         wYk8P/6oH95IVxSKp0nVFhu8aW5VJFAvQ1bhAEA94CaxoSk3WpFpu0u0V9Xd5md+MAGD
         FZYubzKkGPIxJJg0ynQQ0c3BYTh/FmXHonyBhd/olUunkAacUMYbtiKKJIeOXG7REI/h
         LmWg==
X-Gm-Message-State: AOJu0Yw4doNSySc9pL9sUmqvz3rx+pf/tjOQq8ykVxw/qwqBuiY0+uDB
	6ec5QKOCD+7g9XBNsBQaz4jd7x/SNhSy5ggQ35yn39cZGL4gM2jmy0DUrHU5+w==
X-Gm-Gg: ASbGncsh3NW6Tjl2gvLrMsIQ2Iwr2cYEyaCBVLPUUf5mjVE0xmN38g8Jeg43JGIHzl6
	a140rkVlrtUJ77n6yWwfCgLkn4iWuSgJRYzZW75/sun7pj/bJy/YI/y3CzDAd70t8mk3GyrEb/B
	zjDtx+168SFhwGnEaQZoL3YsWCdj/QuVud3fB3xBxS50adMR51yTUwnZ0npSx3/RD1nUpi1Q5pl
	EP7b7qBE+naI3oUeqHPNWlEUrDAVA8Awdrosey2iTWnmFLxvFVoCu7hzyfETjudcT5f0Xyo7j36
	pYYbMlypXOeaxuZSYwZJV5zeP7ryo9nQ8AC+NbuSEn0Ljw/rL0rW76aQhOPbquM6LN9aAv8b3QM
	S6JDULLGeNoyTKzHrGzMbfniblGwXbvR/Mg==
X-Google-Smtp-Source: AGHT+IEWLkJa6H04bRvIjATOXf67M7GaZevp9XaqI0gC2rlSAY+sEhjXK4b4hzkWvOJzYrzvKZi5EQ==
X-Received: by 2002:a17:907:9714:b0:ac2:84db:5916 with SMTP id a640c23a62f3a-aca9b6acee1mr356442466b.31.1744207358401;
        Wed, 09 Apr 2025 07:02:38 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (185.155.90.34.bc.googleusercontent.com. [34.90.155.185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be95d0sm102657966b.55.2025.04.09.07.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:02:38 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Madhu M <madhu.m@intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] usb: typec: ucsi: displayport: Fix NULL pointer access
Date: Wed,  9 Apr 2025 14:02:21 +0000
Message-ID: <20250409140221.654892-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
In-Reply-To: <20250409140221.654892-1-akuchynski@chromium.org>
References: <20250409140221.654892-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch ensures that the UCSI driver waits for all pending tasks in the
ucsi_displayport_work workqueue to finish executing before proceeding with
the partner removal.

Cc: stable@vger.kernel.org
Fixes: af8622f6a585 ("usb: typec: ucsi: Support for DisplayPort alt mode")
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/displayport.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index acd053d4e38c..8aae80b457d7 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -299,6 +299,8 @@ void ucsi_displayport_remove_partner(struct typec_altmode *alt)
 	if (!dp)
 		return;
 
+	cancel_work_sync(&dp->work);
+
 	dp->data.conf = 0;
 	dp->data.status = 0;
 	dp->initialized = false;
-- 
2.49.0.504.g3bcea36a83-goog


