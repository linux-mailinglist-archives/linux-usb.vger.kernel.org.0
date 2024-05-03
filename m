Return-Path: <linux-usb+bounces-9993-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E31968BA4A1
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2024 02:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12C371C225AC
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2024 00:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F52C8D7;
	Fri,  3 May 2024 00:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yA3B7DrP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41F315EA2
	for <linux-usb@vger.kernel.org>; Fri,  3 May 2024 00:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714696789; cv=none; b=nQaHCx5U/Fkrsczz+2IzSekjPhJlNG3y9sErjHfWKPbqhi2AWQE0s6ujrSZrJidWsPeg64hH52ZxUdezhTvH7C95NgglbK7R/zd8tibCDBKgP0R/uS2DUqheMes+7gCTmupYzHmexU/NVptM+Y8YsS9asdFGWHzeVTV8GTFB2c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714696789; c=relaxed/simple;
	bh=1W6WfWN99WG/pjCYyMD+X7XuHDDI4azbE7UAfj/7jS8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LIidFfxTzLmqOhuabPSMukvyUp6tFdwdIAX3qmZmsbqId7nWJuYsa+vLFK3UsoPkY8asQ9bWWz7mmysJC9/nd2HtcpfGDvCsf9hjsy1QiGfyy/0VXO1BoWrZPwMIs92JYxrsaTEw1lS32GiaQI403N/xDYiFoul16dw1L8Uqmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yA3B7DrP; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dbe9e13775aso16239252276.1
        for <linux-usb@vger.kernel.org>; Thu, 02 May 2024 17:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714696786; x=1715301586; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ev3cYq8jpdJihaDvVJt0iSYbqkUt898jtR/GbVOU2w0=;
        b=yA3B7DrPU/ieKZ2wOxG9sEQWe0ugOTXMleihyGLewgSyLPBbJXDnUMm4VHzN/6FLvW
         cC6Pz2vn4oBiK9EsngRZS8q+NeupvXf0ckcOV7ILLCVD4bXVNzO+QwiRqPpw2+WfXmyc
         px5bNxjpw892MuAFC0Rsrqo2DSEBEhHUHrvDshhMqFutGREbG6CRQVv+wrzotDS0Zevv
         a2BJMfFTXtsXORwkq1WUYGPKK88QJfvVZHwSLH+B2g8SazPbUMeuDZG3Cl2Se8rrjiSL
         hk9oQ5mtZ8rcwx5nUz+/NN9kbQ/Fhe+L569wbMp2dnRDCJwMQkZiiowBQpEaDmc7gRoN
         A48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714696786; x=1715301586;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ev3cYq8jpdJihaDvVJt0iSYbqkUt898jtR/GbVOU2w0=;
        b=enoGtxF4B8M2eC7BeGvUSj8CX0mbNB0enygyfvDgx37WwB/VPZzXBdY7a8vgeb9A9d
         +q8aXjUDo96oUYHZAVykrqHCYSFWprLcqa43gyjkncaYNna59Gsxpqc7mX5YVKAaba1J
         IWKwWGPRRmT6q4dD+7ji1KvB4UbpmmCb2BaDo7k/T3CX2k9LDtQ0n7cVcsbSf62dpNaa
         qXeurrPGh4xYUrc727Dirprt4Wo1scWR7Z0bvQdbVCg0fNA7nDdwUYYu/7WKsbfNNxHm
         gEVD2ejobTuonfVZfS4YO0Bm4zIrV0NbsThj/i5W19IAGod9i5BevNplYFRXPxPL1Fnk
         IN5g==
X-Forwarded-Encrypted: i=1; AJvYcCXRaJC/Pnral/Nm4sP53k7bCRjIxeG5/+3Rp00UfQFJmU2ea+XmNrCv7MLUj8qIY/PiWrNIUyaDKbJXUmc/EUFLWotqoAwnvMj1
X-Gm-Message-State: AOJu0YxvSxUx6a6UjbBpVaGSwvQ4P14B2AOj/F8ibcZ8NhP2w8lF7hoJ
	0m8IKdu2KKKgRKV1TlfC0zzlkqJrpoIttRFPszNAD7iCyn51p9rMilLC7U65IszU5QkUsd7WpXR
	fZQ==
X-Google-Smtp-Source: AGHT+IFsDXHVBXexV+q+HUPPZ1A61NbpNAX/YNO61X1Tzqc3GZbiwPa7NnrSWuFsoBHqRKuYYgTm+BG32hw=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a25:26cc:0:b0:de4:e042:eee9 with SMTP id
 m195-20020a2526cc000000b00de4e042eee9mr383303ybm.6.1714696786732; Thu, 02 May
 2024 17:39:46 -0700 (PDT)
Date: Fri,  3 May 2024 00:39:18 +0000
In-Reply-To: <20240503003920.1482447-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240503003920.1482447-1-jthies@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240503003920.1482447-3-jthies@google.com>
Subject: [PATCH v3 2/4] usb: typec: Update sysfs when setting ops
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

When adding altmode ops, update the sysfs group so that visibility is
also recalculated.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Jameson Thies <jthies@google.com>
Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
Changes in V3:
- None.

Changes in V2:
- None.

 drivers/usb/typec/altmodes/displayport.c |  2 +-
 drivers/usb/typec/class.c                | 18 +++++++++++++++++-
 drivers/usb/typec/ucsi/displayport.c     |  2 +-
 include/linux/usb/typec.h                |  3 +++
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 596cd4806018b..92cc1b1361208 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -746,7 +746,7 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	dp->alt = alt;
 
 	alt->desc = "DisplayPort";
-	alt->ops = &dp_altmode_ops;
+	typec_altmode_set_ops(alt, &dp_altmode_ops);
 
 	if (plug) {
 		plug->desc = "Displayport";
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9610e647a8d48..9262fcd4144f8 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -467,6 +467,22 @@ static const struct attribute_group *typec_altmode_groups[] = {
 	NULL
 };
 
+/**
+ * typec_altmode_set_ops - Set ops for altmode
+ * @adev: Handle to the alternate mode
+ * @ops: Ops for the alternate mode
+ *
+ * After setting ops, attribute visiblity needs to be refreshed if the alternate
+ * mode can be activated.
+ */
+void typec_altmode_set_ops(struct typec_altmode *adev,
+			   const struct typec_altmode_ops *ops)
+{
+	adev->ops = ops;
+	sysfs_update_group(&adev->dev.kobj, &typec_altmode_group);
+}
+EXPORT_SYMBOL_GPL(typec_altmode_set_ops);
+
 static int altmode_id_get(struct device *dev)
 {
 	struct ida *ids;
@@ -2317,7 +2333,7 @@ void typec_port_register_altmodes(struct typec_port *port,
 			continue;
 		}
 
-		alt->ops = ops;
+		typec_altmode_set_ops(alt, ops);
 		typec_altmode_set_drvdata(alt, drvdata);
 		altmodes[index] = alt;
 		index++;
diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index d9d3c91125ca8..eb7b8d6e47d00 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -337,7 +337,7 @@ struct typec_altmode *ucsi_register_displayport(struct ucsi_connector *con,
 	dp->con = con;
 	dp->alt = alt;
 
-	alt->ops = &ucsi_displayport_ops;
+	typec_altmode_set_ops(alt, &ucsi_displayport_ops);
 	typec_altmode_set_drvdata(alt, dp);
 
 	return alt;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index b35b427561ab5..549275f8ac1b3 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -167,6 +167,9 @@ struct typec_port *typec_altmode2port(struct typec_altmode *alt);
 
 void typec_altmode_update_active(struct typec_altmode *alt, bool active);
 
+void typec_altmode_set_ops(struct typec_altmode *alt,
+			   const struct typec_altmode_ops *ops);
+
 enum typec_plug_index {
 	TYPEC_PLUG_SOP_P,
 	TYPEC_PLUG_SOP_PP,
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


