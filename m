Return-Path: <linux-usb+bounces-5430-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7F0839C42
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 23:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 968A0B2909D
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 22:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905085473F;
	Tue, 23 Jan 2024 22:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PF29t11Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A527E53E04
	for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 22:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706049047; cv=none; b=MeDWS91FwodPSQqvH3+4BvzYcQHf5hEavSOxQRz9ofW+eR3ttXFpWHg1c/RQDmwF5dZZ858d635EeeUhMdH960NZtoK+fPaA/74/891bgpr3r4D3jaheqDDNhtb9HPJVsaZN580387HsiEugPHxOKPqoM0wjEHm0CKnEChMKHaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706049047; c=relaxed/simple;
	bh=nFPGi5xF7bCjge58x5dvSr31/w9RSEp6a3QqQMX9YTM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u5CIrTWcoU9DiqYGkffz9GfH5AzWyxCsy5ip3/AZajtdik560gXxnPo/3xyEqNoA17PtASbxaZr3+TaapZuzAs9uOJGzOlen3DgN8rOP9CkrY0bbRDlmX87MWvM1tIIeD9um1syv/cXeX2E0Yw6iwLxAlLG3UqqxBj3IHhm+Ajs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekpandit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PF29t11Z; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekpandit.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6dd7359e8adso1309659b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 14:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706049044; x=1706653844; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zJA66Po5lANNBlrllEE6mRzYHuJjBVUPPi7meiLS2z8=;
        b=PF29t11ZvpdaDOU6JpHiK5NjuIzDEtoAHCOvsX3eF1GtF+4d16Tr+qyOzoypToxBAW
         7esPFouEonmt4iOqDld4OOvH2spOrKZVWOi5CnQBCubgsKL1cPtuUtGNqKoFgJRuxHku
         TmbYt1BPpYIVI1jzctDgoDxLQG9rGhEjqD0jWHJRLDfGKQKZSdL5hh+Gbi3psQytAG+s
         miEmOf9ieCFVZjfgvQppoafVVzj6dUB6llfEzV+M0od6eTolb21B7S+BU6zr/2mDX32Z
         yZRnc1F+cBvkG+AEeX7tylIcwC2oy7R8FeqkyA1UAJYYit5rhJeku18EYquEm7yYlrac
         qjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706049044; x=1706653844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJA66Po5lANNBlrllEE6mRzYHuJjBVUPPi7meiLS2z8=;
        b=D3H7kJtemyOZifXG6X3Jt50mV9lqcpUtqH+GxJg353LD8a+hrrcx404T6cXSuQpR0V
         c92qw2R8tYwx5rYRPBtYqZwXWH7aqu0MS7Kn157OiHt2bZj9L8RV/a6HeATuxqRfCpuO
         HaJb7u9oRk33drI+JhD/NOYgdJLqEJReIDtKhdJfbHMonrmORhTysRQEb7iUQ1qS/siD
         A50kmAheNxfY64RhnXwmynGHNJ4GF2p+oKtSN5miRMoimY5QNmxBYOUGh0H6jPSNvP/S
         p0vu2m8oPW3++ig4KYO+XJMnO8U2TCO8UTj9MJjVjnR63pLO1Q/4vz0UBXBgqX7uho/Z
         lzKQ==
X-Gm-Message-State: AOJu0YxkZ8TtPP4mDh9kLMw19nkuXnXEl43lb48gpFemEVxHoWCEjYgZ
	cffOqWE9S0G38aiuO1R/48yARUzTP6IsbUSoMZ41MnBkDCJm2cUyECiyIunwlj0GuHDVMvpTJMS
	gkQnZdyVEPbNsVxcrc83DOqdGuWt4Bfw3xA==
X-Google-Smtp-Source: AGHT+IGO/pnHmieSUEyGfPKEd1eFTxoStKRA06ggz/E09iPERH89CJecxMFIF4JhR5LwT5OtMED52HAPwMZVPh05zR8ERw==
X-Received: from abps.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:9b4])
 (user=abhishekpandit job=sendgmr) by 2002:a05:6a00:3993:b0:6db:c63d:dc77 with
 SMTP id fi19-20020a056a00399300b006dbc63ddc77mr806983pfb.5.1706049044004;
 Tue, 23 Jan 2024 14:30:44 -0800 (PST)
Date: Tue, 23 Jan 2024 14:30:34 -0800
In-Reply-To: <20240123223039.1471557-1-abhishekpandit@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240123223039.1471557-1-abhishekpandit@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240123143026.v1.1.Iacf5570a66b82b73ef03daa6557e2fc0db10266a@changeid>
Subject: [PATCH v1 1/3] usb: typec: ucsi: Limit read size on v1.2
From: Abhishek Pandit-Subedi <abhishekpandit@google.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: pmalani@chromium.org, jthies@google.com, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Saranya Gopal <saranya.gopal@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Between UCSI 1.2 and UCSI 2.0, the size of the MESSAGE_IN region was
increased from 16 to 256. In order to avoid overflowing reads for older
systems, add a mechanism to use the read UCSI version to truncate read
sizes on UCSI v1.2.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
Tested on 6.6 kernel. Dmesg output from this change:
[  105.058162] ucsi_um_test ucsi_um_test_device.0: Registered UCSI
interface with version 3.0.0


 drivers/usb/typec/ucsi/ucsi.c | 26 ++++++++++++++++++++++++--
 drivers/usb/typec/ucsi/ucsi.h | 11 +++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5392ec698959..4edf785d203b 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -36,6 +36,19 @@
  */
 #define UCSI_SWAP_TIMEOUT_MS	5000
 
+static int ucsi_read_message_in(struct ucsi *ucsi, void *buf,
+					  size_t buf_size)
+{
+	/*
+	 * Below UCSI 2.0, MESSAGE_IN was limited to 16 bytes. Truncate the
+	 * reads here.
+	 */
+	if (ucsi->version <= UCSI_VERSION_1_2)
+		buf_size = min_t(size_t, 16, buf_size);
+
+	return ucsi->ops->read(ucsi, UCSI_MESSAGE_IN, buf, buf_size);
+}
+
 static int ucsi_acknowledge_command(struct ucsi *ucsi)
 {
 	u64 ctrl;
@@ -72,7 +85,7 @@ static int ucsi_read_error(struct ucsi *ucsi)
 	if (ret < 0)
 		return ret;
 
-	ret = ucsi->ops->read(ucsi, UCSI_MESSAGE_IN, &error, sizeof(error));
+	ret = ucsi_read_message_in(ucsi, &error, sizeof(error));
 	if (ret)
 		return ret;
 
@@ -170,7 +183,7 @@ int ucsi_send_command(struct ucsi *ucsi, u64 command,
 	length = ret;
 
 	if (data) {
-		ret = ucsi->ops->read(ucsi, UCSI_MESSAGE_IN, data, size);
+		ret = ucsi_read_message_in(ucsi, data, size);
 		if (ret)
 			goto out;
 	}
@@ -1556,6 +1569,15 @@ int ucsi_register(struct ucsi *ucsi)
 	if (!ucsi->version)
 		return -ENODEV;
 
+	/*
+	 * Version format is JJ.M.N (JJ = Major version, M = Minor version,
+	 * N = sub-minor version).
+	 */
+	dev_info(ucsi->dev, "Registered UCSI interface with version %x.%x.%x",
+		 UCSI_BCD_GET_MAJOR(ucsi->version),
+		 UCSI_BCD_GET_MINOR(ucsi->version),
+		 UCSI_BCD_GET_SUBMINOR(ucsi->version));
+
 	queue_delayed_work(system_long_wq, &ucsi->work, 0);
 
 	ucsi_debugfs_register(ucsi);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 6478016d5cb8..bec920fa6b8a 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -23,6 +23,17 @@ struct dentry;
 #define UCSI_CONTROL			8
 #define UCSI_MESSAGE_IN			16
 #define UCSI_MESSAGE_OUT		32
+#define UCSIv2_MESSAGE_OUT		272
+
+/* UCSI versions */
+#define UCSI_VERSION_1_2	0x0120
+#define UCSI_VERSION_2_0	0x0200
+#define UCSI_VERSION_2_1	0x0210
+#define UCSI_VERSION_3_0	0x0300
+
+#define UCSI_BCD_GET_MAJOR(_v_)		(((_v_) >> 8) & 0xFF)
+#define UCSI_BCD_GET_MINOR(_v_)		(((_v_) >> 4) & 0x0F)
+#define UCSI_BCD_GET_SUBMINOR(_v_)	((_v_) & 0x0F)
 
 /* Command Status and Connector Change Indication (CCI) bits */
 #define UCSI_CCI_CONNECTOR(_c_)		(((_c_) & GENMASK(7, 1)) >> 1)
-- 
2.43.0.429.g432eaa2c6b-goog


