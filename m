Return-Path: <linux-usb+bounces-5496-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DD883B62E
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 01:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A86A91F2557C
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 00:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578B41FB4;
	Thu, 25 Jan 2024 00:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DWQx2SE1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BEB80A
	for <linux-usb@vger.kernel.org>; Thu, 25 Jan 2024 00:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706143503; cv=none; b=g16FqJwxxGn5sn4K+u5WhyFOBLU2pXCPmvTzhxwtmlye23D6Mf/JX98Dvo2O2pVy6KNtKwWfLtBpHX1nwVATiMnlJn/DfLdTD9hiDN+zEuKdyfB3UkdSo5dMkhlCtanxCqFZ0B6V73nqJgzHuNciMHZ7qFj+65rw5662N/hE2MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706143503; c=relaxed/simple;
	bh=r6Ufy8qCjB3wudrJmJt1hWXKnwVM0p8XJJRB7q9J22Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s8NF5GLymOFtKAIJwwvW2zrviYor932j2JVlsLqkXdL6Qm2/19au8isxrzgxzhLr8Tj80wURMnI5mxGnwKck0nBUYD/NbXi6NK3J9X6bZCQQPpd08OKtU2is45yST2OlKKazkywsYmKEnHHzoEpdFRrF5ebHQzj7SBtbnfAz47E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekpandit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DWQx2SE1; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekpandit.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-5cf962e1fcbso5885327a12.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 16:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706143502; x=1706748302; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EY+HU/Fe9TNSb7NTRiVg3VzIL1w66/uXrMVPpg/61b4=;
        b=DWQx2SE1BSrj4RwXVuMA0avN+K9LETETDUfL/C+b5Px/CNQQUTNHLOvQiG4QnIdoBB
         7zkJiUow2ce01+K1UfRtMoV8TLPY/PdvBrVB3z0Qjsjh0dUD+YCy/xT3MxPpfsf1Voos
         rghh7Ip01EyxmQnlmeQ52hCMvqIEOthzUq0s58ppFjxGj3E61nDfwrN/gwIYWR0EvkxZ
         1ghGMl9uuHjivMTAhyX07/5Acwe0UjB5ioOePqkGQmCXH/C42wzkGd1GZ5xZ6EuPlwie
         UfWtRZ8ZKv7aJvaxke7rWwjQgrgVjiJEZeMO4T1lYFHqHJJz6JyuJ6iBj8e0jE9zP9AU
         NNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706143502; x=1706748302;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EY+HU/Fe9TNSb7NTRiVg3VzIL1w66/uXrMVPpg/61b4=;
        b=afa9BiNlQ/VKil1upTS4PDG8dCgRPzIaSJ1tHKYNeVzhwSnjbgYCHwXga3FJCh5XCQ
         wLT50qeXizvdJnx22hX0wP/FQEkivsJbnX1oRTvw6966NV3P07kevA/J3GyHLLVdnCaU
         FnT+Xy1Akiiicub5cKVfyRTZAAbulT0mbbZXcvMlYGX8ZNR5oaOpYVdw7Mk+4+J6v7CD
         SGtvr3906LOQB2IjlCjYaSZCSuHgOwAozbqkXl+ofd7U2Lqu+sWiWKPMU2Wyfu3cJLMF
         RayRfcUZr/pKp/kzwKYKg2MaT1tIFa5DKuFeZFN54W1Yz87iEjuzb9nLi+JQv7gOoJTt
         V7Ig==
X-Gm-Message-State: AOJu0YyVPB7O+PWnbpS4MinWZ9yAgf1zn6SVVQt78Z1R+mAWxCW10qlh
	ClDhGaOnO1qXcDZ7qKRDk4n2nsZbvFJx2T9xz7QbQjSw7O8xrm2DBpsLaW8qE3kdCCAPQ8nDJEi
	vBVTKX1PkM6CKLMHo+Gz5kFwy74POFh/nZg==
X-Google-Smtp-Source: AGHT+IFzW9IxDdcpAbx+P42Lj+RP2SYFzv3TI1T2+ggKXWfs/LWOrLNuaTj24559/1/0KA46MGpUVE0ctWuuih9gPDuaIg==
X-Received: from abps.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:9b4])
 (user=abhishekpandit job=sendgmr) by 2002:a65:6856:0:b0:5ca:3a8e:7505 with
 SMTP id q22-20020a656856000000b005ca3a8e7505mr223pgt.2.1706143501636; Wed, 24
 Jan 2024 16:45:01 -0800 (PST)
Date: Wed, 24 Jan 2024 16:44:52 -0800
In-Reply-To: <20240125004456.575891-1-abhishekpandit@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240125004456.575891-1-abhishekpandit@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240124164443.v2.1.Iacf5570a66b82b73ef03daa6557e2fc0db10266a@changeid>
Subject: [PATCH v2 1/3] usb: typec: ucsi: Limit read size on v1.2
From: Abhishek Pandit-Subedi <abhishekpandit@google.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, 
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


Changes in v2:
  - Changed log message to DEBUG

 drivers/usb/typec/ucsi/ucsi.c | 26 ++++++++++++++++++++++++--
 drivers/usb/typec/ucsi/ucsi.h | 11 +++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5392ec698959..a35056ee3e96 100644
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
+	dev_dbg(ucsi->dev, "Registered UCSI interface with version %x.%x.%x",
+		UCSI_BCD_GET_MAJOR(ucsi->version),
+		UCSI_BCD_GET_MINOR(ucsi->version),
+		UCSI_BCD_GET_SUBMINOR(ucsi->version));
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


