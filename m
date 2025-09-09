Return-Path: <linux-usb+bounces-27800-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49348B4FAE6
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 14:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3D081C602C4
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 12:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A5333EAFF;
	Tue,  9 Sep 2025 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O2bJOfDx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C9133CEB5
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421057; cv=none; b=bxkJThHCover6HVPp/K1U3rHxnK8yo8ibrL+yEvNsmTcnUnCXow9XGi1ntYLrp2SRr1c08CqIlFCmnR2KgwQmtx3mtCO26armzyngx9KhvSs+jlyqiTbbgB1sp6kuOb+I+2/e76fPb/5Nfep3jyZWa8L478o1wCOpS+09p9HeXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421057; c=relaxed/simple;
	bh=gg5T3nQ5VEwTdUPyYWVvxapRzmVgBSdtJ8K+4Q49glA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/A9rJSWeFKtsKzpWrUE+xuC0Nv7r0hOZxyTu+6fWX9iy7nuvNEOPARbNP9XV3Ita1cd3wApDvwVzZE5OLXpszhLo61S1sNN60MlCJ0gifa0KAKl3EjFkoNz5yk5tanAelCKULx7TRlEgjFpd+QyyqXsS5gcnv4zwT2w9RZLSFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O2bJOfDx; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b047f28a83dso934023166b.2
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 05:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757421054; x=1758025854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNT/Kw+T/4QMdMG2OTf9bXi1NzKMHFpMs7iCOhh/C34=;
        b=O2bJOfDx7p2FU0M224/tMkwabpPtl7eI92bdAVAwgGeup2SFh5ciDsMvdN5TXhBarv
         QWCDtWPsB8KtauymC7CUjbPKFg9AXaGbloXaL+R+lC94DiEwDcS5XOxZ7+B96HDHi3IG
         pDEqZ0+GkamvSooB31wWM6V54KmySo5mTnqlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421054; x=1758025854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNT/Kw+T/4QMdMG2OTf9bXi1NzKMHFpMs7iCOhh/C34=;
        b=XQJXZqr9xbsoRqk1SCMnRss9HmkGvw/h68pfBd6v8GNbhiA3JY8CA8p5vrsq3UcijJ
         n48GQoorfVKPJdDwo3wqIxxHFXsm9K/o8IS1ZhFipXlH58cwKSS/BRlXyyeAD2Xt6a30
         ZmzQEZ4Sf3YUJ4YrW/y5ED3eCh3VpMFIiZZceSzdKTQW3mSVX/msK7V1a3KUqm/P8O6Z
         fsuC4Br+xffouCA+yZYOXm9SV2kEDFRob7S7h8ncgEGvLOp+9G3yXNCS/P7H9aBDviFj
         Wk7M1MBaOGXFIZrS/Iniu36rdU3FIe0uDevoEfpuYyQKWCiUEd5bpi0V9z1MIc5rl1gG
         XhhA==
X-Forwarded-Encrypted: i=1; AJvYcCVH/G3m2W3cPpuN8UZYhIv9d+2t6F7OcIQ0IyXscDuRRUxk3p+wjut09yRR8KNFlK0x1DvCBCi3ZTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcX0CZ3EYAC+L6igazqgBDTNBhrYAXGU5V1xfYnHNaw//fsH9l
	J5C0wYSe8iouiClzbHARU6HJ8bTtmESGOP1X9b0/vDLcnsQEibqk4l2OaRQEc0xGZg==
X-Gm-Gg: ASbGnctetd4QfM5zHoZtFuxFEG9JouHa0UOGFWbKXHtTX9VA/PCDHGzx0qUhyYVNUuX
	5nPSD/N+uHfEY6oyHJjaQlQ1N1SxB6H/iK425YuJ7AJi+q9umd3YJwr4rr0GvPuGvCJN+SKZyOB
	dfQtKuKzO0WjExvul/r7m1r4DRryjWwTupNd7Ojiu0FjzLn8y5qDH3aCGdMS3wMm9Muw0X6n1kO
	ule3WprWUpjVEsQX8GmHHu70Ea8709f7H3YDTbnL+uJBsazmDU0tIl8WRQP9umfeaiteUzpD/0j
	wcfGhuic0vcb7rkEhneaUcy2kqXp2QfEkukIl3On6v4RB8vFBQsSZMWUteMgtK2r1wBeqG9Vazs
	a932towE3XgsNPqx81zFiEGVVB+NG3u4dqVgPk9bzO0xLMJLXcltGW9M5SOftDTXpwiPCD9/PTU
	fCnN/Fp/FWdvua0SP9yWhYmoTifw==
X-Google-Smtp-Source: AGHT+IFl1zU3QtNbYbaVd7tuOLAD+b+6Y5jT0xWKmoM/3PaJcYRD7JjPcvpNTsrUunsVw5t/BWWYbA==
X-Received: by 2002:a17:907:6d0d:b0:ae3:8c9b:bd61 with SMTP id a640c23a62f3a-b04b13fb3d7mr1122786466b.12.1757421053733;
        Tue, 09 Sep 2025 05:30:53 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm2409702166b.12.2025.09.09.05.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:30:53 -0700 (PDT)
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
Subject: [PATCH RFC 5/5] platform/chrome: cros_ec_typec: Propagate altmode entry result
Date: Tue,  9 Sep 2025 12:30:28 +0000
Message-ID: <20250909123028.2127449-6-akuchynski@chromium.org>
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

In the `cros_typec_configure_mux` function, which concludes the DP/TBT
alternate mode entry, the error code should be reported back to the Type-C
mode selection logic. This ensures a detailed result is conveyed to user
space. To inform partner drivers about the result, the VDM mechanism is
used: DP_CMD_STATUS_UPDATE for DP altmode and TBT_CMD_STATUS_UPDATE for
TBT altmode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c      |  9 ++++++
 drivers/platform/chrome/cros_typec_altmode.c | 32 ++++++++++++++++++--
 drivers/platform/chrome/cros_typec_altmode.h |  6 ++++
 3 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c0806c562bb9..18e627c9fc22 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -693,6 +693,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 	if (!ret)
 		ret = typec_mux_set(port->mux, &port->state);
 
+	dp_data.error = 0;
 	if (!ret)
 		ret = cros_typec_displayport_status_update(port->state.alt,
 							   port->state.data);
@@ -782,8 +783,16 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
+		cros_typec_tbt_status_update(
+			port->port_altmode[CROS_EC_ALTMODE_TBT], ret);
 	} else if (port->mux_flags & USB_PD_MUX_DP_ENABLED) {
 		ret = cros_typec_enable_dp(typec, port_num, pd_ctrl);
+		if (ret) {
+			struct typec_displayport_data dp_data = {.error = ret};
+
+			cros_typec_displayport_status_update(
+				port->port_altmode[CROS_EC_ALTMODE_DP], &dp_data);
+		}
 	} else if (port->mux_flags & USB_PD_MUX_SAFE_MODE) {
 		ret = cros_typec_usb_safe_state(port);
 	} else if (port->mux_flags & USB_PD_MUX_USB_ENABLED) {
diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 557340b53af0..75c7e6af1320 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -28,6 +28,7 @@ struct cros_typec_altmode_data {
 
 	u16 sid;
 	u8 mode;
+	int error;
 };
 
 struct cros_typec_dp_data {
@@ -295,9 +296,16 @@ int cros_typec_displayport_status_update(struct typec_altmode *altmode,
 
 	dp_data->data = *data;
 	dp_data->pending_status_update = false;
-	adata->header |= VDO_CMDT(CMDT_RSP_ACK);
-	adata->vdo_data = &dp_data->data.status;
-	adata->vdo_size = 2;
+	if (data->error) {
+		adata->header |= VDO_CMDT(CMDT_RSP_NAK);
+		adata->error = dp_data->data.error;
+		adata->vdo_data = &adata->error;
+		adata->vdo_size = 2;
+	} else {
+		adata->header |= VDO_CMDT(CMDT_RSP_ACK);
+		adata->vdo_data = &dp_data->data.status;
+		adata->vdo_size = 2;
+	}
 	schedule_work(&adata->work);
 
 	mutex_unlock(&adata->lock);
@@ -370,4 +378,22 @@ cros_typec_register_thunderbolt(struct cros_typec_port *port,
 
 	return alt;
 }
+
+int cros_typec_tbt_status_update(struct typec_altmode *alt, int error)
+{
+	struct cros_typec_altmode_data *adata = typec_altmode_get_drvdata(alt);
+
+	mutex_lock(&adata->lock);
+
+	adata->header = VDO(adata->sid, 1, SVDM_VER_2_0, TBT_CMD_STATUS_UPDATE);
+	adata->header |= VDO_CMDT(error ? CMDT_RSP_NAK : CMDT_RSP_ACK);
+	adata->error = error;
+	adata->vdo_data = &adata->error;
+	adata->vdo_size = 2;
+	schedule_work(&adata->work);
+
+	mutex_unlock(&adata->lock);
+
+	return 0;
+}
 #endif
diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platform/chrome/cros_typec_altmode.h
index 3f2aa95d065a..848a2b194b34 100644
--- a/drivers/platform/chrome/cros_typec_altmode.h
+++ b/drivers/platform/chrome/cros_typec_altmode.h
@@ -39,6 +39,7 @@ static inline int cros_typec_displayport_status_update(struct typec_altmode *alt
 struct typec_altmode *
 cros_typec_register_thunderbolt(struct cros_typec_port *port,
 				struct typec_altmode_desc *desc);
+int cros_typec_tbt_status_update(struct typec_altmode *alt, int error);
 #else
 static inline struct typec_altmode *
 cros_typec_register_thunderbolt(struct cros_typec_port *port,
@@ -46,6 +47,11 @@ cros_typec_register_thunderbolt(struct cros_typec_port *port,
 {
 	return typec_port_register_altmode(port->port, desc);
 }
+static inline int cros_typec_tbt_status_update(struct typec_altmode *alt,
+					int error)
+{
+	return 0;
+}
 #endif
 
 #endif /* __CROS_TYPEC_ALTMODE_H__ */
-- 
2.51.0.384.g4c02a37b29-goog


