Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 219ED79CEBA
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 12:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234276AbjILKsO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 06:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234614AbjILKri (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 06:47:38 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC9A2D66
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 03:46:18 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C5j2Jk021252;
        Tue, 12 Sep 2023 10:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=ql0MXUqnRp4qZTJ5FGKsA7pW/NJ/IDI6mp45YiyGHx8=;
 b=ihgRRitmgWPhLrh/WZyI25qMHMRZuNd0DM7VvxtpFcBMPPlzMKvqkUprpCjXA6wBfXlR
 yiygvutmXO0nJTtaIHH2R/bQQ0vspgWQ9DU+PpsKGbwNm+yseqjB7kbZ6UBVKoMWCfN3
 xUYxojgo17dletdGXCEU0ITc6wDlAl8jWwOeDKdEEDl0EReqyoLIj6zwwBO9fKGeAPGu
 pHIW39H4DPDoiORAkzxMOzG/y2iVkvphj0BsLle2S0tevTLXiMhcAYZOGY4JC+rMi9mL
 23st8iwnsJmSo1R5xtqYUzh3HvGSxRYWcD+qvCQGEzcZNhcSNAxyjxu3FgZIQN6ySUXU jg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t22hyjq3k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 10:45:34 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CAjXCh029993
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 10:45:33 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 12 Sep 2023 03:45:26 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Neal Liu <neal_liu@aspeedtech.com>,
        "Cristian Birsan" <cristian.birsan@microchip.com>,
        Bin Liu <b-liu@ti.com>, "Kevin Cernekee" <cernekee@gmail.com>,
        Justin Chen <justin.chen@broadcom.com>,
        "Al Cooper" <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        "Vladimir Zapolskiy" <vz@mleia.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        Herve Codina <herve.codina@bootlin.com>,
        hierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@amd.com>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        "Shuah Khan" <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 03/10] usb: gadget: add anonymous definition in struct usb_ep
Date:   Tue, 12 Sep 2023 18:44:48 +0800
Message-ID: <20230912104455.7737-4-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230912104455.7737-1-quic_linyyuan@quicinc.com>
References: <20230912104455.7737-1-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KkoYaF0lOxHE8l9WYB4Q5Y6cMX8DFGZv
X-Proofpoint-GUID: KkoYaF0lOxHE8l9WYB4Q5Y6cMX8DFGZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=992 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309120090
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some UDC trace event will save usb endpoint information, but it will use
one int size buffer to save one bit information of usb endpoint, so more
than one int buffer to save several bit fields which is not good.

Add some anonymous union have three u32 members which can be used by trace
event during fast assign stage to reduce trace buffer usage, and add
related macro to extract bit fields from u32 members for later trace event
output state usage.

Also move exist maxpacket and other bit field into anonymous struct which
inside anonymous union and Change them from unsigned to u32 type.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change
v3: change method to extract bit field

 include/linux/usb/gadget.h | 106 +++++++++++++++++++++++++++++++------
 1 file changed, 90 insertions(+), 16 deletions(-)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index a1717c633942..1b63843f5c31 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -194,13 +194,14 @@ struct usb_ep_ops {
  * @dir_out:Endpoint supports OUT direction.
  */
 struct usb_ep_caps {
-	unsigned type_control:1;
-	unsigned type_iso:1;
-	unsigned type_bulk:1;
-	unsigned type_int:1;
-	unsigned dir_in:1;
-	unsigned dir_out:1;
-};
+	u8	type_control:1;
+	u8	type_iso:1;
+	u8	type_bulk:1;
+	u8	type_int:1;
+	u8	dir_in:1;
+	u8	dir_out:1;
+	u8	reserve:2;
+} __packed;
 
 #define USB_EP_CAPS_TYPE_CONTROL     0x01
 #define USB_EP_CAPS_TYPE_ISO         0x02
@@ -230,6 +231,9 @@ struct usb_ep_caps {
  * @caps:The structure describing types and directions supported by endpoint.
  * @enabled: The current endpoint enabled/disabled state.
  * @claimed: True if this endpoint is claimed by a function.
+ * @dw1: trace event purpose
+ * @dw2: trace event purpose
+ * @dw3: trace event purpose
  * @maxpacket:The maximum packet size used on this endpoint.  The initial
  *	value can sometimes be reduced (hardware allowing), according to
  *	the endpoint descriptor used to configure the endpoint.
@@ -259,19 +263,89 @@ struct usb_ep {
 	const char		*name;
 	const struct usb_ep_ops	*ops;
 	struct list_head	ep_list;
-	struct usb_ep_caps	caps;
-	bool			claimed;
-	bool			enabled;
-	unsigned		maxpacket:16;
-	unsigned		maxpacket_limit:16;
-	unsigned		max_streams:16;
-	unsigned		mult:2;
-	unsigned		maxburst:5;
-	u8			address;
+	union {
+		struct {
+			u32	maxpacket:16;
+			u32	maxpacket_limit:16;
+		} __packed;
+		u32	dw1;
+	} __aligned(4);
+	union {
+		struct {
+			u32	max_streams:16;
+			u32	mult:2;
+			u32	maxburst:5;
+		} __packed;
+		u32	dw2;
+	} __aligned(4);
+	union {
+		struct {
+			struct usb_ep_caps	caps;
+			u8			claimed:1;
+			u8			enabled:1;
+			u8			address;
+		} __packed;
+		u32	dw3;
+	} __aligned(4);
 	const struct usb_endpoint_descriptor	*desc;
 	const struct usb_ss_ep_comp_descriptor	*comp_desc;
 };
 
+#define USB_EP_DW1_BITFIELD(n, name) \
+	({\
+	union {\
+		struct {\
+			u32	maxpacket:16;\
+			u32	maxpacket_limit:16;\
+		} __packed;\
+		u32		dw1;\
+	} __aligned(4) __e_u_##name;\
+	u32 __e_##name;\
+	BUILD_BUG_ON(sizeof(__e_u_##name) != 4);\
+	__e_u_##name.dw1 = (n); __e_##name = __e_u_##name.name;\
+	__e_##name; })
+
+#define USB_EP_MAXPACKET(n) USB_EP_DW1_BITFIELD((n), maxpacket)
+#define USB_EP_MAXPACKET_LIMIT(n) USB_EP_DW1_BITFIELD((n), maxpacket_limit)
+
+#define USB_EP_DW2_BITFIELD(n, name) \
+	({\
+	union {\
+		struct {\
+			u32	max_streams:16;\
+			u32	mult:2;\
+			u32	maxburst:5;\
+		} __packed;\
+		u32		dw2;\
+	} __aligned(4) __e_u_##name;\
+	u32 __e_##name; \
+	BUILD_BUG_ON(sizeof(__e_u_##name) != 4);\
+	__e_u_##name.dw2 = (n); __e_##name = __e_u_##name.name;\
+	__e_##name; })
+
+#define USB_EP_MAX_STREAMS(n) USB_EP_DW2_BITFIELD((n), max_streams)
+#define USB_EP_MULT(n) USB_EP_DW2_BITFIELD((n), mult)
+#define USB_EP_MAXBURST(n) USB_EP_DW2_BITFIELD((n), maxburst)
+
+
+#define USB_EP_NAME(n) \
+	({char __s[9]; /* max 8: ep127out */ \
+	union {\
+		struct {\
+			struct usb_ep_caps	caps;\
+			u8			claimed:1;\
+			u8			enabled:1;\
+			u8			address;\
+		} __packed;\
+		u32		dw3;\
+	} __aligned(4) __e_u_##name;\
+	BUILD_BUG_ON(sizeof(__e_u_##name) != 4);\
+	__e_u_##name.dw3 = (n);\
+	snprintf(__s, 9, "ep%d%s", __e_u_##name.address, \
+		(__e_u_##name.caps.dir_in && __e_u_##name.caps.dir_out) ? "" : \
+			__e_u_##name.caps.dir_in ? "in" : "out");\
+	__s; })
+
 /*-------------------------------------------------------------------------*/
 
 #if IS_ENABLED(CONFIG_USB_GADGET)
-- 
2.17.1

