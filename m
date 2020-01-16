Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67F8413F58C
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2020 19:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388725AbgAPS4v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jan 2020 13:56:51 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38110 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbgAPS4u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jan 2020 13:56:50 -0500
Received: by mail-pl1-f194.google.com with SMTP id f20so8716380plj.5
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2020 10:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lH/YUdZChUbcTI6lHhgqRfUPh2Cq6M1uHVk41I24ALE=;
        b=m+FIX8LhkzZETrbhg+/AtsPj1VCJpKMxK4HqUeGW+usalDWH/SNTXjAHDX2dbU0rxq
         4PI5bJ6NPFE2JDd6pqbFDATKzdd2oH2PydupRMkUME8ifw6DuEfns0Tie8cSAiNa6W6h
         vP0pbaYebV5fk10nz9z6VVTE6xZzF3z9mcxBGyumPNXaxpZkS665cEVgslBB5uOXBJox
         szX0bIwW2yEBNKHr+INgNMR4MoU7+iWuKm/NlrT+OE7zyW9c2zfyrwGt6uoL5F10rvH5
         TVAkwcAAoSbKVyXRg402iwmirY+C2qhxEhsEYoLLOtarqgrMU/++3Jg6oActeTEFol+7
         fapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lH/YUdZChUbcTI6lHhgqRfUPh2Cq6M1uHVk41I24ALE=;
        b=sCIt0B8Dt6SAtlcj1F0DYSdjCdcUg3jtFl9YiJDGg4W4WfuYZvXWScFED9VcWGZOck
         wdE+OAOb2J7/NXrEjTmw1xgKj3IdXVpTCJnY+bB4cgdwxGAKEIH3L+NagjQPNvvdrVpj
         ZweQfucP2lC533tj0jScyLEuCE7pU+8F4E+P/5rfOrfKOwkedKhiqFJwcN93VwFSUfSg
         kb2p35KM9sAL4aUl20HbBMBeyzdx9WQ9Hw6MwQ4Q2aUPrW7dfHjZhmvQckwTiZqLwvg2
         6JQFqAJV41Vv318gm35tkdmXOECjbV2fRK2NmgnodFLFJIkPW80ffh0ICu48/feUPt26
         0o4Q==
X-Gm-Message-State: APjAAAXUdAgM6mCjyUn/zbLImTr6DTbX+a35UP+QjZlrOtbHB6B/Ipwb
        wTSf17DVVlq4/B0yfsP6tVX0REu/
X-Google-Smtp-Source: APXvYqxxCO+5yshYcrzTu9fJ43+E3qs9mFZf7N8ezTc7SIrhuj+L28IG/LeG3wrCfSYnlSbts6TRYw==
X-Received: by 2002:a17:902:6901:: with SMTP id j1mr15696984plk.214.1579201009003;
        Thu, 16 Jan 2020 10:56:49 -0800 (PST)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id z26sm24611709pgu.80.2020.01.16.10.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 10:56:48 -0800 (PST)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH 1/2] usb: typec: ucsi: register DP only for NVIDIA DP VDO
Date:   Wed, 15 Jan 2020 17:32:46 -0800
Message-Id: <20200116013247.16507-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

NVIDIA VirtualLink (svid 0x955) has two altmode with vdo values
of vdo=0x1 for VirtualLink DP mode and vdo=0x3 for NVIDIA test
mode. Register display altmode driver only for vdo=0x1

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 12 ++++++++++--
 include/linux/usb/typec_dp.h  |  2 ++
 2 files changed, 12 insertions(+), 2 deletions(-)

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
diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
index fc4c7edb2e8a..848321c4498e 100644
--- a/include/linux/usb/typec_dp.h
+++ b/include/linux/usb/typec_dp.h
@@ -10,6 +10,8 @@
  * IDs as the SVID.
  */
 #define USB_TYPEC_NVIDIA_VLINK_SID	0x955	/* NVIDIA VirtualLink */
+#define USB_TYPEC_NVIDIA_VLINK_DP_VDO	0x1
+#define USB_TYPEC_NVIDIA_VLINK_DBG_VDO	0x3
 #define USB_TYPEC_DP_MODE	1
 
 /*
-- 
2.17.1

