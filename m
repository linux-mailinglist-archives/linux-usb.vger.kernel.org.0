Return-Path: <linux-usb+bounces-26461-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6627EB19E3D
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 11:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68E831892F1F
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 09:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E71E24BD1A;
	Mon,  4 Aug 2025 09:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aU+J1y3S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E256124886C
	for <linux-usb@vger.kernel.org>; Mon,  4 Aug 2025 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298277; cv=none; b=DWwmfsepCkgS1ZDzN+HflDu4kwGPNyGJBc1fY2TaHzaIwOVpeGI4MzO6e28iQhIAw7mzYo/y7jhVvhvKU56MyDxmRpVRl4OnSWqp6hoHmV+DXhD65611qEUDnW1n2CQsUQU9yhkNzuEvUsV1qTuRlCZ4by2Fjbl7wUYO5UqPlPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298277; c=relaxed/simple;
	bh=Wim6/hhsGkzpmyBteC6lxKug+x1Hl++2A1SnnryflnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bf8WgmlU+IVMcZ2wwjY73s01ymEFNvV/BnmrsNI9lBVl1lc7E9w4BrsOIN215H4tZugNuOsiXt7I8qdD8ufe19pD90Jdo/Zz6CbrHHa1rFJ8D00BxDMX9sI9mXhGwiuUz//Yl0GSuFCgdFm/nkc5jiL8wNX4Ybnuu2Ku5JxX1jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aU+J1y3S; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-af968aa2de4so117512366b.1
        for <linux-usb@vger.kernel.org>; Mon, 04 Aug 2025 02:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298274; x=1754903074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JirWTL5DD5i/aaLwZXtRPh+upuNujZxtHnxy4nebniE=;
        b=aU+J1y3SCsZX9AbJajnkwaIZFEJVttms3UzXGs/o/Pw6x5h2Fyzw0g+4P5BCZR/nS/
         LH57nrj5H1It43YIvDK95iA8+6X5zrz1854i9BrdK33xvl51mlVpiZxT4zAc8yHKU0WF
         Lq7XWCJijwdxe6e3aLBsHVOlqG/pqmIvKDqgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298274; x=1754903074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JirWTL5DD5i/aaLwZXtRPh+upuNujZxtHnxy4nebniE=;
        b=gHkPGSpf3kZRf+tgolAcp/zVt7akHJ8IKz0HeJPXkzZbNt52Z1MT9LVM1p4krt5zve
         YbOUW1W0+xSqqutY/0kQkmRLee12Ebaj97PGEg9SJjeScLpzgGM4F0crPD1KFtVqUsjA
         F2LcNQD9Yi39TYbEcX/VtYq8dpTWZ4jvR0DGlMo+2171QJa63Q26Vt4qywNBS19uBTaF
         gb6PEO4m2i3/qixbSwugGrvnfMrnBeuzhy2LsQrAYjCb4doE4msT9XOJWen/gkGFxk0F
         K0AzXO2ZbeUe43/VVFOFi0vrzuRF5VkTNqOeqvTE/yP4dsWEUa9EUKb69E1TduGf3v0f
         fc5A==
X-Forwarded-Encrypted: i=1; AJvYcCUsj+9/nYU5D6ZwdnbwzrgnCvDXVQ4VGPTFjXq8sTuvLtpj9HZTIqoIezmZNaYHC5giDaeFM1lc9fI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj5l0WVLcFDpGh38NoQ6tYfEhDseiMdLmBm9ziki/9uILZKyHl
	lZ/CcS9xO9AjzJo9m4ams2HDaEf8o3IZ5kJUkkOHjSP9TZm3+KX+pN7Ivdoy0j20CA==
X-Gm-Gg: ASbGncvoyYkDLtWfbttB5yx+qPGhVcK9/Q3uwTp4jKa9qTWLsOvsiU4ppMFLiSrC4Hj
	Ul5U2IK/d8GmdyznMMdXDC4WHxdwTy/OytBWPQ0DnT0IMlnWAs0O0pAZJKzn4onbaurOhNmk7Qe
	go0cX0gELSRdAjIq3N/1AmtXsxaWvPa45TrEIilbuWno/qsjuBt062EWXhqIJ1SvGtBjj0Mcx8H
	vHyKBq4l5e1uLrP39AQWVLk594FUxYNgNwb6M1g4ssGvC/bzD5bb9VxMQ54zQyO09SwpAKNl6AB
	IoT/RH6bD4YmDvPtHLfviCwRp9LRuMnxaSG7Jhyk8HeQqrF+66Egtb7uLQkEyM6/dVTAS/3gydI
	VzA9hFalJy2sp2xEUcXjt9rQlL6VNac3KZsC38+yarFALFC9DpFHtpqIf3wReVoEwopjDPiptt6
	5of9OKYTYdYGn8jmY=
X-Google-Smtp-Source: AGHT+IEXwVnGXEwJmvwIKQ+9TglwzCM+Cwf+cZbxJgv6w4qbaGweSEZddpXpmziYmO2DBNvTXArTGA==
X-Received: by 2002:a17:907:948c:b0:ae6:abe9:4daa with SMTP id a640c23a62f3a-af940079146mr950414766b.27.1754298274157;
        Mon, 04 Aug 2025 02:04:34 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:04:33 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 06/10] usb: typec: Report altmode entry status via callback
Date: Mon,  4 Aug 2025 09:03:35 +0000
Message-ID: <20250804090340.3062182-7-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250804090340.3062182-1-akuchynski@chromium.org>
References: <20250804090340.3062182-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Type-C mode selection logic requires feedback on the result of an
alternate mode entry attempt.
Call the `typec_mode_selection_altmode_complete()` callback to provide
this final success or failure status.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/altmodes/displayport.c | 17 +++++++++++++++--
 drivers/usb/typec/altmodes/thunderbolt.c |  8 ++++++++
 include/linux/usb/typec_tbt.h            |  3 +++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 1dcb77faf85d..cac78d995047 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -293,16 +293,20 @@ static void dp_altmode_work(struct work_struct *work)
 		header = DP_HEADER(dp, svdm_version, DP_CMD_STATUS_UPDATE);
 		vdo = 1;
 		ret = typec_altmode_vdm(dp->alt, header, &vdo, 2);
-		if (ret)
+		if (ret) {
 			dev_err(&dp->alt->dev,
 				"unable to send Status Update command (%d)\n",
 				ret);
+			typec_mode_selection_altmode_complete(dp->alt, ret);
+		}
 		break;
 	case DP_STATE_CONFIGURE:
 		ret = dp_altmode_configure_vdm(dp, dp->data.conf);
-		if (ret)
+		if (ret) {
 			dev_err(&dp->alt->dev,
 				"unable to send Configure command (%d)\n", ret);
+			typec_mode_selection_altmode_complete(dp->alt, ret);
+		}
 		break;
 	case DP_STATE_CONFIGURE_PRIME:
 		ret = dp_altmode_configure_vdm_cable(dp, dp->data_prime.conf);
@@ -371,6 +375,7 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 	int cmd_type = PD_VDO_CMDT(hdr);
 	int cmd = PD_VDO_CMD(hdr);
 	int ret = 0;
+	int entry_result = 0;
 
 	mutex_lock(&dp->lock);
 
@@ -414,10 +419,12 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 		switch (cmd) {
 		case DP_CMD_STATUS_UPDATE:
 			dp->state = DP_STATE_EXIT;
+			entry_result = *(int *)vdo;
 			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = 0;
 			ret = dp_altmode_configured(dp);
+			entry_result = *(int *)vdo;
 			break;
 		default:
 			break;
@@ -432,6 +439,12 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 
 err_unlock:
 	mutex_unlock(&dp->lock);
+
+	if (!entry_result)
+		entry_result = ret;
+	if (entry_result || cmd == DP_CMD_CONFIGURE)
+		typec_mode_selection_altmode_complete(dp->alt, entry_result);
+
 	return ret;
 }
 
diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 6eadf7835f8f..bbba3c6bc8b8 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -214,6 +214,7 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 	struct typec_thunderbolt_data data;
 	int cmd_type = PD_VDO_CMDT(hdr);
 	int cmd = PD_VDO_CMD(hdr);
+	int entry_result = 0;
 
 	mutex_lock(&tbt->lock);
 
@@ -248,6 +249,10 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 		switch (cmd) {
 		case CMD_ENTER_MODE:
 			dev_warn(&alt->dev, "Enter Mode refused\n");
+			entry_result = *(int *)vdo;
+			break;
+		case TBT_CMD_STATUS_UPDATE:
+			entry_result = *(int *)vdo;
 			break;
 		default:
 			break;
@@ -262,6 +267,9 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 
 	mutex_unlock(&tbt->lock);
 
+	if (entry_result || cmd == TBT_CMD_STATUS_UPDATE)
+		typec_mode_selection_altmode_complete(alt, entry_result);
+
 	return 0;
 }
 
diff --git a/include/linux/usb/typec_tbt.h b/include/linux/usb/typec_tbt.h
index 55dcea12082c..57cbda5292bb 100644
--- a/include/linux/usb/typec_tbt.h
+++ b/include/linux/usb/typec_tbt.h
@@ -24,6 +24,9 @@ struct typec_thunderbolt_data {
 	u32 enter_vdo;
 };
 
+/* TBT3 alt mode specific commands */
+#define TBT_CMD_STATUS_UPDATE		VDO_CMD_VENDOR(0)
+
 /* TBT3 Device Discover Mode VDO bits */
 #define TBT_MODE			BIT(0)
 #define TBT_ADAPTER(_vdo_)		FIELD_GET(BIT(16), _vdo_)
-- 
2.50.1.565.gc32cd1483b-goog


