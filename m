Return-Path: <linux-usb+bounces-6929-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 306E88607F6
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 02:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 934331F239D2
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 01:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BC7B65D;
	Fri, 23 Feb 2024 01:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WA36HLS+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78975B651
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 01:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708650293; cv=none; b=RVes+Hwe0Y3UtVrKCcBSQK+pM7umNiSj19CHIZKISqyiIyYwZsufmDJdi5z6Xw1WPSfpzZMpKyjdbX23Y6L5B6RPJCjw+nKa7fOP6nWmkcvzuPfs/oZSaU4uw+LfgeYpSVer8HR1k+GULwNmK5tQ5mQTNseH96F43FyJgACtRH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708650293; c=relaxed/simple;
	bh=z+h1yXxJcUa7Q+rt4Z5SzcMtHfpQaYLneY32ZhvvCDU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PKpjmi7o9jzhCpla80XS4Y8Us2wbWZ3+IvK+5o1NjTVXOkpFJ6ExeKCoT/qfHD0pYTElVQHjol8F7Ki1Bw8PCJ3EtCMWwEIhRE69gwBhMG0kW+oNMPJrdm2rKz6vJedPZLwWVMYf8X65A0adtaMtE09EXydVgsHdomJwhg8wIBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WA36HLS+; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-60853aafd93so7512667b3.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 17:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708650291; x=1709255091; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eXcGLp3XklPDGcQgU4Tvmf4Q43ky22vQ6sErhij3a6c=;
        b=WA36HLS+J5v+rQdbMhr2IpkjNfrT9BewdgAGiw3HJjBH/Yiyvza2XQVVutXYo72ZBe
         5zhZzC5e2YMEyf5z0oCyX+irfTq3s6eavAsqI5N0NamkxlJgikK21wvwla40E6W2Sunv
         J9NRokaAi8oLPeJpc/sT+HlN6xMY/1JUXrSj94DzcZ7wl05IN7NYhlW6d8rJulCr6vzH
         2epKbRkJQJWMpj8xEtJ/JfAVg5xGVJHr/Cv6bsKT2Uz3M0i1DGxcsSTrPBgAsp4sqSJu
         8oCxa8iElsg/CN/aiY4M0+SXl93Epc47A7GrkORbrIwY4SC3g9yalOyxGjBxALmlTluw
         NFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708650291; x=1709255091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eXcGLp3XklPDGcQgU4Tvmf4Q43ky22vQ6sErhij3a6c=;
        b=UuxA65GkhltorpZOgl/N5HYlL2vOk08OoiA35yf0+1Cgsb5sEGlNyR4wgeX2wgIykX
         X4ANxhhp9tGHE1hBMppBtRcFsxZpWS7jVnRODy6IkhnRDftNNQeqkGQs/+bMmS8ppHRO
         xzjTxWcqlu5lnhxPYqr2pB5kt2+ELPLWPiixDKZeTSNPMQBibxHUDUmCavGA056oBf1V
         rh/dN8NyIuNRBs6RLfUA7CP14nle+lRhcHPH3xDguwzwU9Wd49sjqtEwpQqdAxJKRUnq
         wvZ/KHe5r/ZcMDfnvIGq56w9aFDEpFJWbZ7Om8UA6IEaKiUlD4r7pDGYMQctSHfR+F3F
         QOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI2q3mIxCmLF9i0hoi2RX87kvdWdLKqI4An6gw4TXJLVTROhFd34+u05x4s1bfxG0/kaUepiuaU7mEcNSZpL1WPvAYoysxJla6
X-Gm-Message-State: AOJu0YwxGua5TpF4FnAXjUYkimHg82ocm1K3RnMhu+wxOyEG8OXAQNs4
	akJ/P0xMtfVSmtrukuFfICxGXrd0a2HUu2ov6tWMyBERCmybNUzycI8NfYVWeoICdJ3OsULOoUc
	HHQ==
X-Google-Smtp-Source: AGHT+IG03PrEw0HtTG4m+Bmf4i5fWw4eM9SL3vavSQOaa0Hr4Q3QsF3Zw3M2mOiSLiC8G1EsDy9aVF5f8J8=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:6902:18ce:b0:dc6:fec4:1c26 with SMTP id
 ck14-20020a05690218ce00b00dc6fec41c26mr202150ybb.1.1708650291721; Thu, 22 Feb
 2024 17:04:51 -0800 (PST)
Date: Fri, 23 Feb 2024 01:03:25 +0000
In-Reply-To: <20240223010328.2826774-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240223010328.2826774-1-jthies@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240223010328.2826774-2-jthies@google.com>
Subject: [PATCH 1/4] usb: typec: ucsi: Clean up UCSI_CABLE_PROP macros
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Clean up UCSI_CABLE_PROP macros by fixing a bitmask shifting error for
plug type and updating the modal support macro for consistent naming.

Fixes: 3cf657f07918 ("usb: typec: ucsi: Remove all bit-fields")
Signed-off-by: Jameson Thies <jthies@google.com>
---
Tested by building v6.6 kernel.

 drivers/usb/typec/ucsi/ucsi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 7e35ffbe0a6f..469a2baf472e 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -259,12 +259,12 @@ struct ucsi_cable_property {
 #define UCSI_CABLE_PROP_FLAG_VBUS_IN_CABLE	BIT(0)
 #define UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE	BIT(1)
 #define UCSI_CABLE_PROP_FLAG_DIRECTIONALITY	BIT(2)
-#define UCSI_CABLE_PROP_FLAG_PLUG_TYPE(_f_)	((_f_) & GENMASK(3, 0))
+#define UCSI_CABLE_PROP_FLAG_PLUG_TYPE(_f_)	(((_f_) & GENMASK(4, 3)) >> 3)
 #define   UCSI_CABLE_PROPERTY_PLUG_TYPE_A	0
 #define   UCSI_CABLE_PROPERTY_PLUG_TYPE_B	1
 #define   UCSI_CABLE_PROPERTY_PLUG_TYPE_C	2
 #define   UCSI_CABLE_PROPERTY_PLUG_OTHER	3
-#define UCSI_CABLE_PROP_MODE_SUPPORT		BIT(5)
+#define UCSI_CABLE_PROP_FLAG_MODE_SUPPORT	BIT(5)
 	u8 latency;
 } __packed;
 
-- 
2.44.0.rc0.258.g7320e95886-goog


