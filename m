Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5CA79BF46
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350790AbjIKVlX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236794AbjIKL0Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 07:26:16 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 518F0F5
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 04:26:11 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38BAFksT027662;
        Mon, 11 Sep 2023 11:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=mflJDi3GLwBCuBKZnLNSsttnuKIuq94XvuOaMubC30A=;
 b=aOrH0M6DWZtfrfqtcKle+oHW9OY6eYrpou2/s4esmdj4JcJwsLzXajtiriL9fiYnRHqC
 t1ytm1bRGYclegaddg8Royyf/98IM8GRN6rt9UEAgTKcCZUWREy4PdeHdukFNauOqI4b
 pH4LEuv6n4z9KBy3aCxsCmukxjkW5hBUaGa/+Zgz6goUL3D1J/M2849B5sahtYleAyje
 3jacrVavIlx4U9I96YAKwF+4jc5CgIJmtIOcmqEKBWyzNVXHWw2Yc5wUiYgzyPzSHAJ3
 sR6urdmFfAjBGx+IHlFbWXNo8MPzsC5FriEYoRHgPsJwWxqvFkHcq2iRRmpmywwkt+6M gA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t20yy03r2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 11:25:26 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BBPPcG002149
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 11:25:25 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 11 Sep 2023 04:25:18 -0700
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
Subject: [PATCH v2 03/11] usb: gadget: add anonymous definition in struct usb_ep
Date:   Mon, 11 Sep 2023 19:24:38 +0800
Message-ID: <20230911112446.1791-4-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230911112446.1791-1-quic_linyyuan@quicinc.com>
References: <20230911112446.1791-1-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8U42cyOpQJ8YZ1sMJZ6txpebHTb04mDf
X-Proofpoint-GUID: 8U42cyOpQJ8YZ1sMJZ6txpebHTb04mDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309110103
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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

 include/linux/usb/gadget.h | 74 +++++++++++++++++++++++++++++---------
 1 file changed, 58 insertions(+), 16 deletions(-)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 045ebd4637c5..8529d49ed05d 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -175,13 +175,13 @@ struct usb_ep_ops {
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
+} __packed;
 
 #define USB_EP_CAPS_TYPE_CONTROL     0x01
 #define USB_EP_CAPS_TYPE_ISO         0x02
@@ -211,6 +211,11 @@ struct usb_ep_caps {
  * @caps:The structure describing types and directions supported by endpoint.
  * @enabled: The current endpoint enabled/disabled state.
  * @claimed: True if this endpoint is claimed by a function.
+ * @dw1: trace event purpose
+ * @dw2: trace event purpose
+ * @epnum: trace event purpose
+ * @u1: trace event purpose
+ * @u2: trace event purpose
  * @maxpacket:The maximum packet size used on this endpoint.  The initial
  *	value can sometimes be reduced (hardware allowing), according to
  *	the endpoint descriptor used to configure the endpoint.
@@ -240,19 +245,56 @@ struct usb_ep {
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
+			u32	max_streams:16;
+			u32	mult:2;
+			u32	maxburst:5;
+		} __packed;
+		struct {
+			u32	dw1;
+			u32	dw2;
+		};
+#define		USB_EP_MAXPACKET(n)		((n) & 0xffff)
+#define		USB_EP_MAXPACKET_LIMIT(n)	(((n) >> 16) & 0xffff)
+#define		USB_EP_MAX_STREAMS(n)		((n) & 0xffff)
+#define		USB_EP_MULT(n)			(((n) >> 16) & 0x3)
+#define		USB_EP_MAXBURST(n)		(((n) >> 18) & 0x1f)
+	};
+	union {
+		struct {
+			union {
+				struct usb_ep_caps	caps;
+				u8			u1;
+			};
+			union {
+				struct {
+					u8		claimed:1;
+					u8		enabled:1;
+				} __packed;
+				u8			u2;
+			};
+			u8				address;
+			u8				epnum;
+		} __packed;
+		u32	dw3;
+#define		USB_EP_NUM(n)		(((n) >> 24) & 0xff)
+#define		USB_EP_DIR_BI(n)	((((n) >> 4) & 0x3) == 0x3)
+#define		USB_EP_DIR_IN(n)	(((n) >> 4) & 0x1)
+	};
 	const struct usb_endpoint_descriptor	*desc;
 	const struct usb_ss_ep_comp_descriptor	*comp_desc;
 };
 
+/* NOTE: it need UDC set epnum and dir info when init endpoints */
+#define USB_EP_NAME(n) \
+	({char __s[9]; /* max 8: ep127out */\
+	snprintf(__s, 9, "ep%d%s", USB_EP_NUM(n), \
+		USB_EP_DIR_BI(n) ? "" : (USB_EP_DIR_IN(n) ? "in" : "out"));\
+	__s; })
+
 /*-------------------------------------------------------------------------*/
 
 #if IS_ENABLED(CONFIG_USB_GADGET)
-- 
2.17.1

