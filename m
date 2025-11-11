Return-Path: <linux-usb+bounces-30307-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A04D0C4A406
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 02:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 987801883BA6
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 01:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D45308F14;
	Tue, 11 Nov 2025 01:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pkmi93pI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DD83043C7
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 01:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762823152; cv=none; b=UZwCNxiINgHHBoA64SNYO6l/SY1E/UpGDA/Ver4RaybjtxsGCV3LbZ1zsRJ20vZYJAWs0s1e2v/SVALyqBo5AUXTwQXMr8/z0ZMGGgSdcQKHBjSAbLzJiBfrQTu7jangKCUnxkvEucN86LdQQpWhmPvnIoYdOQ3iaOUFANl/5g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762823152; c=relaxed/simple;
	bh=32FzMDU9FuSXH89N9W6BQDxaQIuvFnXEJ7ejrXc17Oo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfvsEgCvmpZYJLMVIpthMQVOliQGwOQCZfbCTCm8Q0tJizW6n+6JkygnpxwETb/UEP4irYXdQ/drVfjXib65vBzU7Q9CQVjdJAa4PDgYfnaTDk+VLYspvu6/x+OJUBDrguFXwNit1hNvT1WqrOKZFWVDZf7bIu0kqCZ2dpvBVtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pkmi93pI; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so2833308b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 17:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762823147; x=1763427947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AU1cvyK/RZiYSXnkWHxOQByTi0bqhv5ilLpZYMg7YE=;
        b=Pkmi93pIOU01fZ2npdBEgjfvWfRmIgGbNiAcjNd2rjzvU47HHOiK48ZQjVreA25+Tu
         Tpqp3dP9SUetxKFKqEQDPIdrxehgfg+BmDWAideQZf6sMShwTscIlQnICd+2f5koacfa
         ra+zE5AQn3I6puu9hS7wu33IudacS+NICaK7FBzyJ3aaW7esWOnjAXm8+W9xMcDyjqkl
         XyJg8n5XaA5QOAQ0RFJKDX/aPsjZphdnp40g+V1dO5EbKH/COFSo4h2mq2r7ISMMlM6n
         pHapKcGQ5FMaikHPSwrplDYn5sWjfunb7hccMdGMDXcbs8xPh6zD8h6lJi3U2Ubc7GPO
         l0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762823147; x=1763427947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/AU1cvyK/RZiYSXnkWHxOQByTi0bqhv5ilLpZYMg7YE=;
        b=qECrZBa6dQa4xJlKx00nRuKlmdYt2T1AmEYosZ8VPvMPz/f7ubBjlwxnOA9QNyxd7t
         wVQZtlpPL6ZeKvldjn5yv+fD8GDtBy6OCd3jKmrzIo7GcTaHTuBsbGefuOJqsBvYWt1X
         b412GK9YoYb5wLp5fsXE7FODHMi6kabdAIWj5elkk+4raKN9zTm665+1brJqSufIXHL+
         M8nklm9Ar9arKjpNK/ljpnZIsSKc0CiKTtV+KaO+xjtB1RcRCZMnBKD9Oiky74q5ieTi
         RtPTUy15jWy2TpzRxNqg/UIuUrqOxuZcSjAVBjwWelIe21weluFC2yHI10ALj9l90fx1
         GEQw==
X-Forwarded-Encrypted: i=1; AJvYcCWyuYBh5sKmUJYqwMng7QQWhO03lmQFNhLohsS/T1rceqxoLNloDXjB3t0p4nLxUlRVjEfMmoVrElk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzes9NcBNX61QypugBXWBu8rYw+SlC2RpwRQKPmbmlAoVSL/XJ3
	7qFPjgUviIajyzOi/D3MCMHnJUbRJ5q01btKKXKjCwsWi2DyjRs4NHj1NJmqi6HPMSA=
X-Gm-Gg: ASbGncsjBpBPW79jT3QKME9yHnuLt2bnu57Ua7lXXeD9PoQn84GGM/c2lDgK3e3RVvb
	qdBTiaDpx42w/pR7mzav0GjDEtY5sN7S3kn8i2oSSw0rd0CdHyBnI+a4iptnwT/WEGFJ/6gSPl7
	D7G/SafF+P3xkKN/YNa+h+rlt05QXo21yz+xlhNLubotlLwTEZO4gZLA3VNFAdWQXyu/Hmjk7lT
	ItJp6pxxYm75DT2UB66bg8eDV8/URV8uhgKkz1aOCgNQs1PX7GlQNAk1OokF4lXzVIMK+uiyrE3
	O563o4zb9Vrrb7XT9x3qUbkW9rMPD2WCDQLGZi0bXJSJK+AqUIrzA1/umDieMf0CVTycDkIYmGr
	zBVQHgrjkbE437hEXOXdkgZ6TrNdQEIt9k2Kdwi6SCUEyzffsRUjlX9+FUeWIhR+sJeWyI5K29U
	MTOXf1m3d/pZ/Nrg+ZawvqNGm6v+2cDwMW3S60Lz/8iUB3+vBxYxI=
X-Google-Smtp-Source: AGHT+IEx5azjX+o3hqS8V17+4/MrJOMVmOKv87GOYuNRk4AU89k6A3F+8tvCJUT2IefZkkfOXSjRHw==
X-Received: by 2002:a05:6300:8095:b0:355:1add:c28a with SMTP id adf61e73a8af0-3551addcbd1mr7931367637.2.1762823147197;
        Mon, 10 Nov 2025 17:05:47 -0800 (PST)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b214155c8esm9744314b3a.38.2025.11.10.17.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 17:05:46 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Fedor Pchelkin <boddah8794@gmail.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] usb: typec: ucsi: Add duplicate detection to nvidia registration path
Date: Tue, 11 Nov 2025 09:05:40 +0800
Message-ID: <20251111010541.145421-2-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111010541.145421-1-acelan.kao@canonical.com>
References: <20251111010541.145421-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the duplicate altmode detection to ucsi_register_altmodes_nvidia()
which is used when a driver provides the update_altmodes() callback.

This ensures all drivers benefit from duplicate detection, whether they
use the standard registration path or the nvidia path with update_altmodes
callback.

Without this fix, drivers using the nvidia path (like yoga_c630) would
still encounter duplicate altmode registration errors from buggy firmware.

Fixes: a79f16efcd00 ("usb: typec: ucsi: Add support for the partner USB Modes")
Cc: stable@vger.kernel.org
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 7b79e7491094..923a7bd30936 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -535,19 +535,25 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 
 	/* now register altmodes */
 	for (i = 0; i < max_altmodes; i++) {
-		memset(&desc, 0, sizeof(desc));
-		if (multi_dp) {
-			desc.svid = updated[i].svid;
-			desc.vdo = updated[i].mid;
-		} else {
-			desc.svid = orig[i].svid;
-			desc.vdo = orig[i].mid;
-		}
-		desc.roles = TYPEC_PORT_DRD;
+		struct ucsi_altmode *altmode_array = multi_dp ? updated : orig;
 
-		if (!desc.svid)
+		if (!altmode_array[i].svid)
 			return 0;
 
+		/*
+		 * Check for duplicates in current array and already
+		 * registered altmodes. Skip if duplicate found.
+		 */
+		if (ucsi_altmode_is_duplicate(con, recipient, altmode_array, i,
+					      altmode_array[i].svid,
+					      altmode_array[i].mid, i))
+			continue;
+
+		memset(&desc, 0, sizeof(desc));
+		desc.svid = altmode_array[i].svid;
+		desc.vdo = altmode_array[i].mid;
+		desc.roles = TYPEC_PORT_DRD;
+
 		ret = ucsi_register_altmode(con, &desc, recipient);
 		if (ret)
 			return ret;
-- 
2.43.0


