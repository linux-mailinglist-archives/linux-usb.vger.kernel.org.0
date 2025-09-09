Return-Path: <linux-usb+bounces-27798-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C4EB4FAE3
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 14:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFA0F1C6002B
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 12:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66F533A035;
	Tue,  9 Sep 2025 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O4ZSzGJG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9AD3376BF
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421050; cv=none; b=EDD1tjUibnu87fT6GPTweR6EWix+g6WH4CBVeFDKXfXzwXT8aRsYx6sEskK6f5KZ3FPWgoLIXl9xtk0pKxvMNkqBnEkuL/AT/8u9Yvt4395l5subIC3HcGqhzCtsV0YVwJHYVytsH7M6Hm8AmE8nogKBcPAi+2OosipWmHSIWY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421050; c=relaxed/simple;
	bh=nvs2gDcjL6C8NXVm+Q+MwxkLZX3yRe9EVozIv1TgODA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sMTcQPSvnjqjjXzUMcrwkDsZutqeuQmlHFGrPOH/aPbO9akDiCqqjBomMxz2hL/2THm1JYarl35nyOLYHzEWn3P1qoSqcyOCWJwDBsu/wdCDq8N2IGs0bW2x2lFvsi4YtXPWhrPDX+9mY6a/YWkigPrAsi9zzdAcMhEstydYaGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O4ZSzGJG; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b046f6fb230so166658566b.1
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 05:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757421047; x=1758025847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WMeag17a1l945PqdAkCvwljw0rC07igvRdu/jbhGyo=;
        b=O4ZSzGJGE+qIUVIKHbi9EKJMkHR4OcfJyj1dStQ6Cish+IHffHfxdLh7GSfs2QJf3Y
         f51jcXko35kbky9zXTCXkly7VGpWNTK4DPsuVUWZQ+klOesbEEOr3jmyyRtaF7KA9HYW
         RJIVrwkvlRWzqABNiw90W6e+Onhuc2kYNlEDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421047; x=1758025847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WMeag17a1l945PqdAkCvwljw0rC07igvRdu/jbhGyo=;
        b=jDRft/64GtfqwwWCDtrXqOb6/xIOL6huBa0IQ6IKPjSYKbTMHcSpvUZvVp4CVK7iZ7
         RHN8SJi0VYOBM0vmsiG/+svLItqlkbuW+i8VzovdBTlRvTwkkwMLtHeFrXkRW83ZHr2z
         QSd5pm7XvvJNaZA5/JYe7hAXx847an1p48kA8kS0uuTXFNUAOxobWos8S87JgZ8C0C3k
         viRPToWoucobkKSKWJOqTEV9A0x5ujWRbUAl/wSOrJZmrC6xubAl0bEC9+/kH5fXS729
         5lvXMynRO7NO2vuCky1AV1fnzS7S6+6zRj1ZF5x88gbWe6adFJm9Zdi/F/0hsIKHsueh
         beEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhAGLNsOHoVe21zIxFm4g973CZlt7KCAHgU6I/4LFOAZQoQvrRqmjRWhqH9tobfFWW2A2ofn4PBLM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd5+wHXvorZEaocmNgQC8ye++BtkyV236hrDnjWdiIXusTwvcE
	StVNg035lzgYPIMPrdGIekOcgZO/z99GpVYqm1cXYnJdSPquGnBQgXgfdfNBuV3c5Q==
X-Gm-Gg: ASbGncsLIyLOA5fEe7DKEdsjVY0FoXgQNLIXfMlPzqiHYvfpsC4OydYRqCZW7PIl2dt
	8r+E6SsP6ILHQx9+S+KaBtL5lOXiz7+NEjO+0qfACfOff3jud75ci5/oRrjciAKT/nd1kCoa3+0
	XXmSBO3wSadizDSUS5kWMmYnyC7sFRlzviTP0yMgAFwC1AzVhjQWSFTQHx9uHBBPGpGMnoSe6ZI
	rZxa4k/mIKRtY202/y3EcsYkzQsDr4LVqq1OgZM2+yayULIBuw1vzcTcH+dhu/lw4acuTUhQ9l4
	GJs33wTuViW0RsexQRWkcFKNrkYDik9xo9HjhIX0EPl6lv2Ur/451XETbwUdXeBLfC1wVDo8cUa
	ZMWlOTlcF/TmmPvkk7iUbL7foc8nrccHMNvhT1o8K16QUcBWHay/pLcsZlka2cPCJmvyzvDFiHq
	zSHhUGUtg+dz6iOjcYpbIZz+2r9Q==
X-Google-Smtp-Source: AGHT+IFhBrHiIKFQDuEGLUi8nmmT8pVqq//MniH5jqrxhg+sNjRz6k9qHyzIb5oAJzhfDrVeqxv60A==
X-Received: by 2002:a17:907:c2a:b0:b04:2c2e:50a5 with SMTP id a640c23a62f3a-b04b1f0d207mr1522958966b.16.1757421046612;
        Tue, 09 Sep 2025 05:30:46 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm2409702166b.12.2025.09.09.05.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:30:46 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 3/5] usb: typec: Report altmode entry status via callback
Date: Tue,  9 Sep 2025 12:30:26 +0000
Message-ID: <20250909123028.2127449-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250909123028.2127449-1-akuchynski@chromium.org>
References: <20250909123028.2127449-1-akuchynski@chromium.org>
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
 drivers/usb/typec/altmodes/displayport.c | 19 +++++++++++++++++--
 drivers/usb/typec/altmodes/thunderbolt.c | 10 ++++++++++
 include/linux/usb/typec_dp.h             |  2 ++
 include/linux/usb/typec_tbt.h            |  3 +++
 4 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 1dcb77faf85d..052d18b54f0a 100644
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
+			typec_altmode_entry_complete(dp->alt, ret);
+		}
 		break;
 	case DP_STATE_CONFIGURE:
 		ret = dp_altmode_configure_vdm(dp, dp->data.conf);
-		if (ret)
+		if (ret) {
 			dev_err(&dp->alt->dev,
 				"unable to send Configure command (%d)\n", ret);
+			typec_altmode_entry_complete(dp->alt, ret);
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
 
@@ -414,10 +419,14 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 		switch (cmd) {
 		case DP_CMD_STATUS_UPDATE:
 			dp->state = DP_STATE_EXIT;
+			if (vdo)
+				entry_result = *(int *)vdo;
 			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = 0;
 			ret = dp_altmode_configured(dp);
+			if (vdo)
+				entry_result = *(int *)vdo;
 			break;
 		default:
 			break;
@@ -432,6 +441,12 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 
 err_unlock:
 	mutex_unlock(&dp->lock);
+
+	if (!entry_result)
+		entry_result = ret;
+	if (entry_result || cmd == DP_CMD_CONFIGURE)
+		typec_altmode_entry_complete(dp->alt, entry_result);
+
 	return ret;
 }
 
diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 6eadf7835f8f..765ba7348ac4 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -214,6 +214,7 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 	struct typec_thunderbolt_data data;
 	int cmd_type = PD_VDO_CMDT(hdr);
 	int cmd = PD_VDO_CMD(hdr);
+	int entry_result = 0;
 
 	mutex_lock(&tbt->lock);
 
@@ -248,6 +249,12 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 		switch (cmd) {
 		case CMD_ENTER_MODE:
 			dev_warn(&alt->dev, "Enter Mode refused\n");
+			if (vdo)
+				entry_result = *(int *)vdo;
+			break;
+		case TBT_CMD_STATUS_UPDATE:
+			if (vdo)
+				entry_result = *(int *)vdo;
 			break;
 		default:
 			break;
@@ -262,6 +269,9 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 
 	mutex_unlock(&tbt->lock);
 
+	if (entry_result || cmd == TBT_CMD_STATUS_UPDATE)
+		typec_altmode_entry_complete(alt, entry_result);
+
 	return 0;
 }
 
diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
index acb0ad03bdac..c9fa68cd1265 100644
--- a/include/linux/usb/typec_dp.h
+++ b/include/linux/usb/typec_dp.h
@@ -44,10 +44,12 @@ enum {
  * commands: Status Update and Configure.
  *
  * @status will show for example the status of the HPD signal.
+ * @error will contain the error code, if applicable.
  */
 struct typec_displayport_data {
 	u32 status;
 	u32 conf;
+	int error;
 };
 
 enum {
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
2.51.0.384.g4c02a37b29-goog


