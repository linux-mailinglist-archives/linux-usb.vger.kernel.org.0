Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF48479A269
	for <lists+linux-usb@lfdr.de>; Mon, 11 Sep 2023 06:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232654AbjIKEaF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 00:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233427AbjIKE37 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 00:29:59 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2821810C
        for <linux-usb@vger.kernel.org>; Sun, 10 Sep 2023 21:29:54 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B3rNgU026019;
        Mon, 11 Sep 2023 04:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=B1YEQUITE/Sk1BQXOT9ElxJ0s3CIOsJ8dklYA87MdaU=;
 b=MxjPajn/MQaKnqoOZ9aZObTwfGyUId15jBdYOytuar8nogplwhcAaiSrbzmhaxrGkF0Q
 XMSz3gyG4/lmS7s1TFtGBqoSa2i/wOr/ByXrs9yQPZAy/AbcXrNSnzXUJVF42ZOYJ7x/
 hjjjCEZhjcVVukMTWJikrxST+I6jZoyTcgbdg64257zfCsza2VkXb0vu6q7NprFnJHX8
 UaVY1m4xO6n/TX7x7hD+dTnNl8JNsa0mD6BT41ZI3mo4f9rOOLVcaXfG9iLz7ps1dJ0q
 3dhPLGhrsUCwHCCHsQ2LO96WRdqySmlKKtYHxKhnzKPoxYXGKbfS0+agi+sHbQqgJ7+W Lg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0gt1ag5u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:29:25 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38B4TONK012888
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:29:24 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Sun, 10 Sep 2023 21:29:16 -0700
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
Subject: [PATCH 03/11] usb: gadget: add anonymous definition in struct usb_ep
Date:   Mon, 11 Sep 2023 12:28:35 +0800
Message-ID: <20230911042843.2711-4-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230911042843.2711-1-quic_linyyuan@quicinc.com>
References: <20230911042843.2711-1-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8NFlz1jXIjzzKi4uL0P7stabBT2DHNym
X-Proofpoint-GUID: 8NFlz1jXIjzzKi4uL0P7stabBT2DHNym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_01,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110040
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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

