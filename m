Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCEB5163706
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 00:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgBRXP0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 18:15:26 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:40639 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727635AbgBRXP0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 18:15:26 -0500
Received: by mail-pj1-f66.google.com with SMTP id 12so1675338pjb.5
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 15:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=O/9klpGHLMADnUIY4uFTdH1oZj+pJ2PeAtZwg9XEeiM=;
        b=AoSIzus/0ZIkUFaIcL3KjKfca95RtDoFlhGqri1FF8mIHc0brn+dOLzpZ6BOwUkFrR
         WKBWH9WEs7RweKkpgzg/cDqrVd+88u7C3LS+k7jMuUrKTkFSvhz5S/d73oxNBEWOsuL/
         ru1bTIO0GXHTyv7ol7hIteInxeJIOfoxAZeOCWAQ1ZsaIagKhoYcSig3WGxtJIXgG+Lb
         QccF/bRmBArqSH4Xsd2mYJuSRVZccsH0tL3q5UGGUKoghSVPcNPzXMbS9aEykIHJIugC
         xdq9QeUSeTAJ55Zhx6F5M3u+JHevc2kUpMd6IaciPeXoJTO/sseCQioDk7hCaFT6LZhe
         dAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=O/9klpGHLMADnUIY4uFTdH1oZj+pJ2PeAtZwg9XEeiM=;
        b=HtZXOBk3LQDNuU9LT6HRe5PHSFTHkxTxxPeRXNvWLOdEYYB6nZZPa+oC0WL1SQorGB
         w4AiXf9V5T5sQJHbgtd3W5EryPOVkViahqgRpLnW5z+x8GKAgHTnOuRXJMNn3rCFqd0x
         CUtiSoITCAlXVl6TTGa3cV0ALeLSMMmgUAsYML5E37x/a2fM1uB7NcA7HJi+aQTwXYAa
         hGcLALV0N3gbmBX7h55zShZ11wZk5/6U+C8pH+2TUYj3zw29eN6zAYZyFyHZljCtthVJ
         H0tq+6IAkZ0PF2uo6OQqdpM+oG4c2QLNc8kGYPPtQXqnd1JwdTzpSAUPqvL9zlXvKmMh
         PSXw==
X-Gm-Message-State: APjAAAUW51gTr8S6++BV6A/7IjKCndV/seIoJN0VK6IhIMU8LwG+ZyAH
        2bX4zCWuiLCcNKLTmcjV/ww=
X-Google-Smtp-Source: APXvYqwB/sNf4W2XEk0dDOoponuTPMp1ErIc3typaOtG5Yuwk92HULZ8F7DUUmDL1VCBVmRePVYxYg==
X-Received: by 2002:a17:902:8542:: with SMTP id d2mr23679068plo.200.1582067725831;
        Tue, 18 Feb 2020 15:15:25 -0800 (PST)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id l73sm39505pge.44.2020.02.18.15.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 15:15:25 -0800 (PST)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH] usb: typec: ucsi_ccg: workaround for NVIDIA test device
Date:   Tue, 18 Feb 2020 15:15:20 -0800
Message-Id: <20200218231520.12208-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

NVIDIA VirtualLink (svid 0x955) has two altmode, vdo=0x1 for
VirtualLink DP mode and vdo=0x3 for NVIDIA test mode. NVIDIA
test device FTB (Function Test Board) reports altmode list with
vdo=0x3 first and then vdo=0x1. The list is:
 SVID   VDO
0xff01  0xc05
0x28de  0x8085
0x955   0x3
0x955   0x1

Current logic to assign mode value is based on order
in altmode list. This causes a mismatch of CON and SOP altmodes
since NVIDIA GPU connector has order of vdo=0x1 first and then
vdo=0x3. Fixing this by changing the order of vdo values
reported by NVIDIA test device. the new list will be:

 SVID   VDO
0xff01  0xc05
0x28de  0x8085
0x955   0x1085
0x955   0x3

Also NVIDIA VirtualLink (svid 0x955) uses pin E for display mode.
NVIDIA test device reports vdo of 0x1 so make sure vdo values
always have pin E assignement.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
 drivers/usb/typec/ucsi/ucsi.h     |  2 ++
 drivers/usb/typec/ucsi/ucsi_ccg.c | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index a89112b69cd5..8e831108f481 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -119,12 +119,14 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_SET_PDR_ACCEPT_ROLE_SWAPS		BIT(25)
 
 /* GET_ALTERNATE_MODES command bits */
+#define UCSI_ALTMODE_RECIPIENT(_r_)		(((_r_) >> 16) & 0x7)
 #define UCSI_GET_ALTMODE_RECIPIENT(_r_)		((u64)(_r_) << 16)
 #define   UCSI_RECIPIENT_CON			0
 #define   UCSI_RECIPIENT_SOP			1
 #define   UCSI_RECIPIENT_SOP_P			2
 #define   UCSI_RECIPIENT_SOP_PP			3
 #define UCSI_GET_ALTMODE_CONNECTOR_NUMBER(_r_)	((u64)(_r_) << 24)
+#define UCSI_ALTMODE_OFFSET(_r_)		(((_r_) >> 32) & 0xff)
 #define UCSI_GET_ALTMODE_OFFSET(_r_)		((u64)(_r_) << 32)
 #define UCSI_GET_ALTMODE_NUM_ALTMODES(_r_)	((u64)(_r_) << 40)
 
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 2658cda5da11..b421b0045448 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -125,6 +125,10 @@ struct version_format {
 #define CCG_FW_BUILD_NVIDIA	(('n' << 8) | 'v')
 #define CCG_OLD_FW_VERSION	(CCG_VERSION(0x31) | CCG_VERSION_PATCH(10))
 
+/* Altmode offset for NVIDIA Function Test Board (FTB) */
+#define USB_TYPEC_NVIDIA_FTB_DP_OFFSET	(2)
+#define USB_TYPEC_NVIDIA_FTB_DBG_OFFSET	(3)
+
 struct version_info {
 	struct version_format base;
 	struct version_format app;
@@ -489,6 +493,29 @@ static int ucsi_ccg_read(struct ucsi *ucsi, unsigned int offset,
 		return ret;
 
 	if (offset == UCSI_MESSAGE_IN) {
+		if (UCSI_COMMAND(uc->last_cmd_sent) ==
+		    UCSI_GET_ALTERNATE_MODES &&
+		    UCSI_ALTMODE_RECIPIENT(uc->last_cmd_sent) ==
+		    UCSI_RECIPIENT_SOP) {
+			struct ucsi_altmode *alt = (struct ucsi_altmode *)val;
+
+			if (alt[0].svid == USB_TYPEC_NVIDIA_VLINK_SID &&
+			    UCSI_ALTMODE_OFFSET(uc->last_cmd_sent) ==
+			    USB_TYPEC_NVIDIA_FTB_DP_OFFSET &&
+			    alt[0].mid == USB_TYPEC_NVIDIA_VLINK_DBG_VDO) {
+				alt[0].mid = USB_TYPEC_NVIDIA_VLINK_DP_VDO |
+						DP_CAP_DP_SIGNALING |
+						DP_CAP_USB |
+						DP_CONF_SET_PIN_ASSIGN(BIT
+							(DP_PIN_ASSIGN_E));
+			}
+			if (alt[0].svid == USB_TYPEC_NVIDIA_VLINK_SID &&
+			    UCSI_ALTMODE_OFFSET(uc->last_cmd_sent) ==
+			    USB_TYPEC_NVIDIA_FTB_DBG_OFFSET &&
+			    alt[0].mid == USB_TYPEC_NVIDIA_VLINK_DP_VDO) {
+				alt[0].mid = USB_TYPEC_NVIDIA_VLINK_DBG_VDO;
+			}
+		}
 		if (UCSI_COMMAND(uc->last_cmd_sent) == UCSI_GET_CURRENT_CAM &&
 		    uc->has_multiple_dp) {
 			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)val);
-- 
2.17.1

