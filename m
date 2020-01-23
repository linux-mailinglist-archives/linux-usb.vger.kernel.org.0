Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 603B21470AB
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2020 19:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgAWSXC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jan 2020 13:23:02 -0500
Received: from mail-pf1-f173.google.com ([209.85.210.173]:33177 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729031AbgAWSXC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jan 2020 13:23:02 -0500
Received: by mail-pf1-f173.google.com with SMTP id z16so1924502pfk.0
        for <linux-usb@vger.kernel.org>; Thu, 23 Jan 2020 10:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=bo/OsYyrQ5f4c1n/3+jslyR1BtB3QudbiUsZXeQtoB0=;
        b=C2575JY+42hNxHRyXWgEJ++HZhVDt0hiFtcJ//ZB5CizFSpKD7Kx3WrsdKZjUnZiyR
         NZJD1CYc2WH4A0HAuSsQldwEvqZEmDv2RoWh3U4iEZ4TJ7SPbOFBjdigY9VQRzPECb+X
         h7WSY7fDqBB47+fD5up6q+oob0erG/sR1bbkUrxfK4R6P5oEanm0uS+Av5mYVUfwWFNV
         WDkrgEtZfTG6BHnC1fYMF8HOzC9n2cPRDc+DAoMnTvhCWzLIJ8aN4aB5VDEm0hdqcIXi
         FgKDIFlXeFJSEedhUdi15exZYBRdMmuvJ+LcQ5WPAVPKS8uZIHwZGGR9eWWV6mZxQ42J
         g61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bo/OsYyrQ5f4c1n/3+jslyR1BtB3QudbiUsZXeQtoB0=;
        b=caBHsfo8jWlM7cX4eoj/HYonXKOO2wCMot+zoN/HulpI8Fnd0pEMEGtyGCrBAXGp19
         EkW+myt7jwPt7LC7w8yQABV9NjRDYP/FzEgtNKRVbN/p0GmiwBABwIb2L6mzclvUWe8g
         Z7hesYyxtUODoZg4A96Fr8tmHYkyy7YdsY6/X4DUNeDK4gAVUTBsGiZou5On5OpHM6ii
         jcbndNPbE6UMoKAsmxqa2JfATROllwiUSaT/s6pAUb0BHqr7f719qZQZfcp+NH2B92e5
         Vqlmx5DvSKcVRKCQcwM1gKN5gHp6vJqL7oBofs/LlkUors5ea4DWZhoxOsO1L9joF4fm
         nMZg==
X-Gm-Message-State: APjAAAXPkHQBmoZojoc79niZDbPj5llafAGTYs1l/FKah0x8dW7KXB3c
        n2MfQKwnq5asBY1W2hyh80I=
X-Google-Smtp-Source: APXvYqxwKE747kyZoAPf2q6DIqaIMbkCWkGf50xc0tuqY86f7vAKBU8L30JvLCHfYGksx7EiIvhsYA==
X-Received: by 2002:aa7:8708:: with SMTP id b8mr8703071pfo.184.1579803781634;
        Thu, 23 Jan 2020 10:23:01 -0800 (PST)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id p21sm3427894pfn.103.2020.01.23.10.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 10:23:00 -0800 (PST)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v2 1/2] usb: typec: ucsi: register DP only for NVIDIA DP VDO
Date:   Wed, 22 Jan 2020 16:58:58 -0800
Message-Id: <20200123005859.13194-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

NVIDIA VirtualLink (svid 0x955) has two altmode, vdo=0x1 for
VirtualLink DP mode and vdo=0x3 for NVIDIA test mode.
Register display altmode driver only for vdo=0x1

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
Changes from v1->v2:
 Moved defines from typec_dp.h to ucsi.h based on comments
 from Heikki.

 drivers/usb/typec/ucsi/ucsi.c | 12 ++++++++++--
 drivers/usb/typec/ucsi/ucsi.h |  7 +++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index d5a6aac86327..eca9d598a42f 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -270,9 +270,16 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 
 		switch (desc->svid) {
 		case USB_TYPEC_DP_SID:
-		case USB_TYPEC_NVIDIA_VLINK_SID:
 			alt = ucsi_register_displayport(con, override, i, desc);
 			break;
+		case USB_TYPEC_NVIDIA_VLINK_SID:
+			if (desc->vdo == USB_TYPEC_NVIDIA_VLINK_DBG_VDO)
+				alt = typec_port_register_altmode(con->port,
+								  desc);
+			else
+				alt = ucsi_register_displayport(con, override,
+								i, desc);
+			break;
 		default:
 			alt = typec_port_register_altmode(con->port, desc);
 			break;
@@ -475,7 +482,8 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 	while (adev[i]) {
 		if (recipient == UCSI_RECIPIENT_SOP &&
 		    (adev[i]->svid == USB_TYPEC_DP_SID ||
-			adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID)) {
+			(adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID &&
+			adev[i]->vdo != USB_TYPEC_NVIDIA_VLINK_DBG_VDO))) {
 			pdev = typec_altmode_get_partner(adev[i]);
 			ucsi_displayport_remove_partner((void *)pdev);
 		}
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index e434b9c9a9eb..a89112b69cd5 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -340,4 +340,11 @@ static inline void
 ucsi_displayport_remove_partner(struct typec_altmode *adev) { }
 #endif /* CONFIG_TYPEC_DP_ALTMODE */
 
+/*
+ * NVIDIA VirtualLink (svid 0x955) has two altmode. VirtualLink
+ * DP mode with vdo=0x1 and NVIDIA test mode with vdo=0x3
+ */
+#define USB_TYPEC_NVIDIA_VLINK_DP_VDO	0x1
+#define USB_TYPEC_NVIDIA_VLINK_DBG_VDO	0x3
+
 #endif /* __DRIVER_USB_TYPEC_UCSI_H */
-- 
2.17.1

