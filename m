Return-Path: <linux-usb+bounces-18216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6608D9E7CB6
	for <lists+linux-usb@lfdr.de>; Sat,  7 Dec 2024 00:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A4951887ABF
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2024 23:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A91215066;
	Fri,  6 Dec 2024 23:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QBfg9eJs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E5D215042
	for <linux-usb@vger.kernel.org>; Fri,  6 Dec 2024 23:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733528332; cv=none; b=ZeQ/kOcVBxsyJ35L5P0cM+mU0j4+P4B2TbWH+E0i2oudb1aWxU2XvI9CjA2duhX7p642qp1822/jgUSGKt51HzqvCFfO4Iap0KeAxwiX0KroO1gvMCj9b9yLbjoaVR3c5yaE24bjYmoE2VuYcSByQxrHizeI7HYPL2+U/j/SG8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733528332; c=relaxed/simple;
	bh=mSbImJ4dzWme04JaRICj6xcOiMD+Em1Pq6oCKRsC+SU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bkod9wOzBm/mRKVU+DK9msRJ9msMcbyX3bPmQT645tb04vLnQ7Rk15/rpzDwhCrR66ys3YLpTLlj7NGWNtHYSYmqrPR1BQGnsk++58IMuWanzdmyIB0moJTJ/JhX7jP/Wph31gZcm7hT8foGb9n8Fq9hmQC6jcs9h3SBo89MKtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QBfg9eJs; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-215c54e5f24so22906935ad.2
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2024 15:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733528330; x=1734133130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcArLAGlc9DQDoWi6KCdvmZsVO2iZiC3gTAsa+lsHVQ=;
        b=QBfg9eJsFfMm2MCqnNjPWey35dGy4Q4Gn10RNRp5un54nhonw2bgAlC/r/i8Mr8FtL
         hS4dmV+5RQ+z8Znt+jxKnh5IPbHeZUoRIEhHYM4RnZYsWPtq769WlUWaEgTA+n6T/Vm/
         C74em7f1Ec7GxhNz0AjLDLurIJ5ZuM5jxOt5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733528330; x=1734133130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcArLAGlc9DQDoWi6KCdvmZsVO2iZiC3gTAsa+lsHVQ=;
        b=a6JrmphRrZs1cB8hWfjB8OD7VImyasVG7Pkc7WA2HDxtqfM9PvNRtTeYyDTLHjsdzJ
         Z9t4DdostWk4YdDi4gx7qQIAnFe05LPvaDnZ0NyzhxhzKI3FMcChSsykMGBfHUy/DB5K
         AilPPO0tafcCxi8e9/l3Lm/qOAOwiY0PGkckDpYYIQUIcAj0Qa1Iakl7jvuHlyNQEZSP
         AcSE2w4mkosL8gJ57kY3Q93GnDef5rhPUFsA+WL9CEFOy+mtFK74ox0YMiypyd7L+er9
         MG2RNeU2SpTNADMmkQJWUm8Q8voHIsnyvAGW+HaJpgjgO2PgN16PhZz4c+lWbJpS82bs
         IdOw==
X-Forwarded-Encrypted: i=1; AJvYcCWNYOddw2yuYhk5UM3iiimRU5EYQIAQFz1wW5Bo3kdRsZtM+C57knnI1J2kpelrRNGLjSWVTQEwH2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztt2Yy+LRcXN9rdng7/a+95u1tYzRVBFKWsSV0eaKaMfp+2ubu
	HJV/266Jk5SojwvFBmswG1xN19IsWuD4xWbo+A1AYLKYw5yP5iQUxSnYB7xwSw==
X-Gm-Gg: ASbGncvs2A3Se3y4rlJpix9d70/9j1h1eRWCpzE7iAgCH8jyaxiqSWUnpaVxlMmwb3i
	DZE0ABXuUHismFiObZWUiTbiUtJIhqnvkpaeqtSBhP4bYHvwdsiWTuT/hzjP004YvQbg60KT8PY
	p/LB3IE5XOweP2wzsSijC0VkhbxSb28DxkgmoiMpsinnsSLw60pg6eGo8ZPL48UHqmPa55gLziI
	OohNuifvnqugwhlWblaCig1zDep+GXu88VDAvWEZaQJ8m8T2g55JgufNHoeA8k2zjaf5Hm/G6S9
	1ivByqYbaDStvN/Fusl1HSbA
X-Google-Smtp-Source: AGHT+IFfLFsxeaCP6JpA4wv/h1BK8Dgjnc9khGWbX2GJzIK3a3OtB6TO5+qcZX4naTvJeWS7CY8AWQ==
X-Received: by 2002:a17:902:d2cc:b0:215:94c0:f6ea with SMTP id d9443c01a7336-21614ddb7b8mr57867325ad.56.1733528330015;
        Fri, 06 Dec 2024 15:38:50 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-215f8e3e452sm33980235ad.43.2024.12.06.15.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 15:38:49 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	pmalani@chromium.org,
	jthies@google.com,
	dmitry.baryshkov@linaro.org,
	badhri@google.com,
	rdbabiera@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] platform/chrome: cros_ec_typec: Update partner altmode active
Date: Fri,  6 Dec 2024 15:38:15 -0800
Message-ID: <20241206153813.v4.4.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241206233830.2401638-1-abhishekpandit@chromium.org>
References: <20241206233830.2401638-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mux configuration is often the final piece of mode entry and can be used
to determine whether a partner altmode is active. When mux configuration
is done, use the active port altmode's SVID to set the partner active
field for all partner alt modes.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

(no changes since v1)

 drivers/platform/chrome/cros_ec_typec.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c7781aea0b88..e3eabe5e42ac 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -618,6 +618,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	};
 	struct ec_params_usb_pd_mux_ack mux_ack;
 	enum typec_orientation orientation;
+	struct cros_typec_altmode_node *node, *n;
 	int ret;
 
 	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
@@ -676,6 +677,16 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 			port->mux_flags);
 	}
 
+	/* Iterate all partner alt-modes and set the active alternate mode. */
+	list_for_each_entry_safe(node, n, &port->partner_mode_list, list) {
+		if (port->state.alt != NULL &&
+		    node->amode->svid == port->state.alt->svid) {
+			typec_altmode_update_active(node->amode, true);
+		} else {
+			typec_altmode_update_active(node->amode, false);
+		}
+	}
+
 mux_ack:
 	if (!typec->needs_mux_ack)
 		return ret;
-- 
2.47.0.338.g60cca15819-goog


