Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB411F7D7
	for <lists+linux-usb@lfdr.de>; Wed, 15 May 2019 17:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbfEOPlN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 May 2019 11:41:13 -0400
Received: from pbmsgap02.intersil.com ([192.157.179.202]:51706 "EHLO
        pbmsgap02.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbfEOPlN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 May 2019 11:41:13 -0400
Received: from pps.filterd (pbmsgap02.intersil.com [127.0.0.1])
        by pbmsgap02.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x4FFCHu0019293;
        Wed, 15 May 2019 11:21:58 -0400
Received: from pbmxdp02.intersil.corp (pbmxdp02.pb.intersil.com [132.158.200.223])
        by pbmsgap02.intersil.com with ESMTP id 2sdrjcb6h7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 15 May 2019 11:21:58 -0400
Received: from pbmxdp01.intersil.corp (132.158.200.222) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Wed, 15 May 2019 11:21:56 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp01.intersil.corp (132.158.200.222) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Wed, 15 May 2019 11:21:56 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        "Chris Brandt" <chris.brandt@renesas.com>
Subject: [PATCH v4 07/13] usb: renesas_usbhs: add support for CNEN bit
Date:   Wed, 15 May 2019 10:20:42 -0500
Message-ID: <20190515152048.42363-8-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190515152048.42363-1-chris.brandt@renesas.com>
References: <20190515152048.42363-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-15_10:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=997
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905150094
X-Proofpoint-Spam-Reason: mlx
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For some SoC, CNEN must be set for USB Device mode operation.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v3:
 * added reviewed-by
v2:
 * options are now held in param
---
 drivers/usb/renesas_usbhs/common.c | 6 ++++++
 drivers/usb/renesas_usbhs/common.h | 1 +
 include/linux/usb/renesas_usbhs.h  | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 1de7a44f3415..734fb4e542c5 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -114,6 +114,12 @@ void usbhs_sys_function_ctrl(struct usbhs_priv *priv, int enable)
 	u16 mask = DCFM | DRPD | DPRPU | HSE | USBE;
 	u16 val  = HSE | USBE;
 
+	/* CNEN bit is required for function operation */
+	if (usbhs_get_dparam(priv, has_cnen)) {
+		mask |= CNEN;
+		val  |= CNEN;
+	}
+
 	/*
 	 * if enable
 	 *
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index 1fbffb7bbc8f..de74ebd1a347 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -104,6 +104,7 @@ struct usbhs_priv;
 
 /* SYSCFG */
 #define SCKE	(1 << 10)	/* USB Module Clock Enable */
+#define CNEN	(1 << 8)	/* Single-ended receiver operation Enable */
 #define HSE	(1 << 7)	/* High-Speed Operation Enable */
 #define DCFM	(1 << 6)	/* Controller Function Select */
 #define DRPD	(1 << 5)	/* D+ Line/D- Line Resistance Control */
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index 17fae6e504cc..9097a38fcda8 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -190,6 +190,7 @@ struct renesas_usbhs_driver_param {
 	u32 has_sudmac:1; /* for SUDMAC */
 	u32 has_usb_dmac:1; /* for USB-DMAC */
 	u32 runtime_pwctrl:1;
+	u32 has_cnen:1;
 #define USBHS_USB_DMAC_XFER_SIZE	32	/* hardcode the xfer size */
 };
 
-- 
2.16.1

