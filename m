Return-Path: <linux-usb+bounces-6182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB37850022
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 23:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E099B1C2337E
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 22:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C139D374C6;
	Fri,  9 Feb 2024 22:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nz/3JUvt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9715828DDE
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 22:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707518309; cv=none; b=CqcJEy5tSfxqOnPVJS2cHClNXcoYbplm0yfUEMmghUGi1nS6xWXGrDYxsueGf21NKvLOTdQ1qEugzhAsWuAZpjR8Po3gGSUOaHZL80UUCJaigu/FS+2BTVx2tfI9D23KZ1UdEdF0nJsri3F2YqUbwXmM+tNO9S05aMyaWQq70sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707518309; c=relaxed/simple;
	bh=D0wMQBAP5bomV1qNyDC9+FF9TaUQoAw2/pwkBCGCI5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hzpeKIIzS68JN0Hd+p08U1FQNLt2UJj4477bHjXridUknKMlId56y2A6888dQTK8mIoCNgTE/Wweg3+QgSSRtKPIO28fYzagdiWmlmvQ8/bzwM1s9mpD3OLWq7QzDFMULKX/84XrvjJNKYm0M6aeksieyQeGSV9bnmxlEsWvcwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nz/3JUvt; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e08dd0fa0bso768398b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 09 Feb 2024 14:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707518307; x=1708123107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3v1P72CYS7nnHVJlklt4iy31XMKI0yvALu5tUoK9M4=;
        b=Nz/3JUvtiCPfQ8ItkKpt/iSN6qvkeSlw/JK5WeRY2MZ8PfIY4lXy99WVZcUM6QSRuZ
         ZZKf+D9vwdnEzjKVKOlTZEor/4viFAbRlpO4K0rGiCYOtnQirakM2hOnGIakdASQwpkw
         uuQbfAGpFdX/mjqKagCDqTzNiGQoTHL9memHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707518307; x=1708123107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3v1P72CYS7nnHVJlklt4iy31XMKI0yvALu5tUoK9M4=;
        b=j268JqXnPeAT61/iXNWMHhY6HkgewEwkvpii2Bl51Brt80yEd11KRQg7Sb51Kn2+mh
         bx/hkcJsRoJtUU6PoaBPSNy584rYQxDfwhKi7W8EszBO4mh8z9nBIhnssR5ebkjXt3m5
         Y6AwLtwB425WXpeZj64ZITpZXFZgLqmMGVYh01fAsvu3sx8RKpb7TrqKWfF2zp2p6ddf
         ZrDjQt0t4NIGyKLT+2VtzKLxNrlz4d8hGuENunlJaSarCrOEyIjfTP0Q70tVLi25a9KB
         VsgoNRKroQcuFrEn+jNExrpVEie5QvF5sV1V1aTP04nMjZQm66/08j9k9rYf0e7fBC0u
         zqxQ==
X-Gm-Message-State: AOJu0YxTZMzRwOosjBKaWZjfBbPKSpns8G3g96N72cFrTjYu+6XIvgdF
	lU61I/JgAmLJG9hUsg1ZNH0KWSHzy0JicLOzCxxt1ZMq0fTjYK+IDpr4rQF/3A==
X-Google-Smtp-Source: AGHT+IFnblxJf5MT3PgPtrtFdeM3jgZWdOPZ8Y/sWn4gZ5Nw0+wYgVYafd+x2/RNKCMRoKa/2Ava+Q==
X-Received: by 2002:a62:c183:0:b0:6e0:53dc:5a86 with SMTP id i125-20020a62c183000000b006e053dc5a86mr673591pfg.4.1707518306813;
        Fri, 09 Feb 2024 14:38:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqQ0d0lW0rhZY8bknQp4cJi9bKRhqRDz5Opza4sRwyH2vkoInyMSbkBFBsHs48chy8gIgewB8tCutSbEFiageui8r9AzSwMqgoIT/cvlnq08h4ZcQ3rGfaujzQ85CqDIywRKLmxGWGtFekRGbVv8a6FQ91PhTpFiLMW1CdT8SbHNj86eKNg3aeiOleVveeqUs1mmjEMFnDY0Xq+lx0r0hgngfxEdaFsZMg/xg0gPSSThO8G0n3vVc83dzVpZEGhIIXg+pNzBhf2tpCp5Rns24LeSaWqqDc/zt+01MBAGEji12Jg/2UckSX/q654MCh625c60UfgzC2Z3Tg+4Y+cq5BiKehz8t4Ar941fQXCFjYmA3ZpY2MTfpuG/uZfNFCSj5vRumf0SA5tVjeFdT4IJQwM1Z54GoS
Received: from localhost (209.148.168.34.bc.googleusercontent.com. [34.168.148.209])
        by smtp.gmail.com with UTF8SMTPSA id hq26-20020a056a00681a00b006e040d4d251sm1058929pfb.155.2024.02.09.14.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 14:38:26 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org
Cc: pmalani@chromium.org,
	jthies@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Saranya Gopal <saranya.gopal@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] usb: typec: ucsi: Limit read size on v1.2
Date: Fri,  9 Feb 2024 14:37:30 -0800
Message-ID: <20240209143723.v5.1.Iacf5570a66b82b73ef03daa6557e2fc0db10266a@changeid>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240209223824.622869-1-abhishekpandit@chromium.org>
References: <20240209223824.622869-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Between UCSI 1.2 and UCSI 2.0, the size of the MESSAGE_IN region was
increased from 16 to 256. In order to avoid overflowing reads for older
systems, add a mechanism to use the read UCSI version to truncate read
sizes on UCSI v1.2.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
Tested on 6.6 kernel. Dmesg output from this change:
[  105.058162] ucsi_um_test ucsi_um_test_device.0: Registered UCSI
interface with version 3.0.0


Changes in v5:
  - Change min_t to clamp

Changes in v4:
  - Added missing Tested-By tags from v1 and reviewed-by tags.

Changes in v2:
  - Changed log message to DEBUG

 drivers/usb/typec/ucsi/ucsi.c | 26 ++++++++++++++++++++++++--
 drivers/usb/typec/ucsi/ucsi.h | 11 +++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 14f5a7bfae2e..7c5cecdd93d6 100644
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
+		buf_size = clamp(buf_size, 0, 16);
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
@@ -1558,6 +1571,15 @@ int ucsi_register(struct ucsi *ucsi)
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
2.43.0.687.g38aa6559b0-goog


