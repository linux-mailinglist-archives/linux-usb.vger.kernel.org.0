Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246532F58B4
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 04:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbhANCxu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 21:53:50 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:54706 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725949AbhANCxu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 21:53:50 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 651FDC00EB;
        Thu, 14 Jan 2021 02:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610592769; bh=6wgzOhzl5+BO8jhGk4Dw4TfuXInE5l1og7lus5vjvWo=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=iJ79a+tgLpMZVZknwFmmXEW4Te4s8txCkKobcbeZ+iEOjzPfveACQno0JtwejUgwF
         uyeGuFLf8fygqyruvUS6A0Ly25FtT/zoJTdRMDNGNJEtq+aNb7rWauUQMrMMpIg+yT
         eRVWun3y83aP7TzTEpn/ZvqYPHG7wWjiLrkj8/X4PDAqMW53FVeHBjc62rSzwTlBfN
         plE56iTmAHOw6gzP7EIrl8s6bFanzLVIA4EfqBJLqQckX+azmBAqQHOOhXVvAHAldi
         h5fcTCtCNHBXcZirTjOGeD6ALqbytdGEdX1Q+2yVMnevnQbC1fqlnKyPzQD2Ae43h8
         atGKpF6Rzbt9g==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 73743A005E;
        Thu, 14 Jan 2021 02:52:46 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 13 Jan 2021 18:52:46 -0800
Date:   Wed, 13 Jan 2021 18:52:46 -0800
Message-Id: <ae9293ebd63a29f2a2035054753534d9eb123d74.1610592135.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v6 01/11] usb: ch9: Add USB 3.2 SSP attributes
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rob Gill <rrobgill@protonmail.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>, Bin Liu <b-liu@ti.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In preparation for USB 3.2 dual-lane support, add sublink speed
attribute macros and enum usb_ssp_rate. A USB device that operates in
SuperSpeed Plus may operate at different speed and lane count. These
additional macros and enum values help specifying that.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v6:
- Rebase on Greg's usb-testing branch
- Convert the sublink speed attribute enum to macros and move it to uapi
- Remove usb_sublink_speed struct
- To simplify things, use usb_ssp_rate enum to specify the signaling rate
  generation and lane count
- Update commit message
Changes in v5:
- Rebase on Felipe's testing/next branch
- Changed Signed-off-by email to match From: email header
Changes in v4:
- None
Changes in v3:
- None
Changes in v2:
- Move to include/linux/usb/ch9.h instead of under uapi

 include/linux/usb/ch9.h      |  9 +++++++++
 include/uapi/linux/usb/ch9.h | 13 +++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
index 604c6c514a50..86c50907634e 100644
--- a/include/linux/usb/ch9.h
+++ b/include/linux/usb/ch9.h
@@ -36,6 +36,15 @@
 #include <linux/device.h>
 #include <uapi/linux/usb/ch9.h>
 
+/* USB 3.2 SuperSpeed Plus phy signaling rate generation and lane count */
+
+enum usb_ssp_rate {
+	USB_SSP_GEN_UNKNOWN = 0,
+	USB_SSP_GEN_2x1,
+	USB_SSP_GEN_1x2,
+	USB_SSP_GEN_2x2,
+};
+
 /**
  * usb_ep_type_string() - Returns human readable-name of the endpoint type.
  * @ep_type: The endpoint type to return human-readable name for.  If it's not
diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
index 0f865ae4ba89..17ce56198c9a 100644
--- a/include/uapi/linux/usb/ch9.h
+++ b/include/uapi/linux/usb/ch9.h
@@ -968,9 +968,22 @@ struct usb_ssp_cap_descriptor {
 	__le32 bmSublinkSpeedAttr[1]; /* list of sublink speed attrib entries */
 #define USB_SSP_SUBLINK_SPEED_SSID	(0xf)		/* sublink speed ID */
 #define USB_SSP_SUBLINK_SPEED_LSE	(0x3 << 4)	/* Lanespeed exponent */
+#define USB_SSP_SUBLINK_SPEED_LSE_BPS		0
+#define USB_SSP_SUBLINK_SPEED_LSE_KBPS		1
+#define USB_SSP_SUBLINK_SPEED_LSE_MBPS		2
+#define USB_SSP_SUBLINK_SPEED_LSE_GBPS		3
+
 #define USB_SSP_SUBLINK_SPEED_ST	(0x3 << 6)	/* Sublink type */
+#define USB_SSP_SUBLINK_SPEED_ST_SYM_RX		0
+#define USB_SSP_SUBLINK_SPEED_ST_ASYM_RX	1
+#define USB_SSP_SUBLINK_SPEED_ST_SYM_TX		2
+#define USB_SSP_SUBLINK_SPEED_ST_ASYM_TX	3
+
 #define USB_SSP_SUBLINK_SPEED_RSVD	(0x3f << 8)	/* Reserved */
 #define USB_SSP_SUBLINK_SPEED_LP	(0x3 << 14)	/* Link protocol */
+#define USB_SSP_SUBLINK_SPEED_LP_SS		0
+#define USB_SSP_SUBLINK_SPEED_LP_SSP		1
+
 #define USB_SSP_SUBLINK_SPEED_LSM	(0xff << 16)	/* Lanespeed mantissa */
 } __attribute__((packed));
 
-- 
2.28.0

