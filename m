Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3ED079CEB1
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 12:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234556AbjILKsH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 06:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234580AbjILKrb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 06:47:31 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0012D49
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 03:46:13 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C7RmCn029021;
        Tue, 12 Sep 2023 10:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=GaT13gaZ5ErTcPmyi7wI80e49jYlWh55hml06Bp2juQ=;
 b=Iq2l2sjzX9F9duzjUQcDSdLw0/B9bDVJ8uWxdOfK5A4D41jo83iYqAYIA/6UQ+SDGZCD
 iKNgTj1vTzFSl92nrOHI2fIOJlexYDNjarB1MuX2XCCUvu1CH47MO4sjWA07emsc6hQm
 gxN474fU0kBDB1UUdQ73mTJ9lULYLFMatrYW1oAfIpOV6IXDD4as7JdAA+zcPR/MHSz0
 +BuSOO1nMWVJrOMIRB2V/4i6gzO8YMLfwlUh12sx8Cib9X8VKAKHGMPrdIVeX1b8aL4Z
 iCbtNWPKzJ+oBDUGfNLQo8boUGvcwF01yfPwSUvNxSqYQJe49kCnsaJwwDdXRV7cQpLP Vg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t268fj3f3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 10:45:28 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CAjQwu019293
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 10:45:27 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 12 Sep 2023 03:45:19 -0700
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
Subject: [PATCH v3 02/10] usb: gadget: add anonymous definition in struct usb_request
Date:   Tue, 12 Sep 2023 18:44:47 +0800
Message-ID: <20230912104455.7737-3-quic_linyyuan@quicinc.com>
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
X-Proofpoint-GUID: cWFi6nQRTGT7iEZ_IL4l-TrI_eR5kiOP
X-Proofpoint-ORIG-GUID: cWFi6nQRTGT7iEZ_IL4l-TrI_eR5kiOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=535 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309120090
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some UDC trace event will save usb request information, but it will use
one int size buffer to save one bit information of usb request, so more
than one int buffer to save several bit fields which is not good.

First add an anonymous union which have one u32 member dw1 which can be
used by trace event during fast assign stage to reduce trace buffer
usage, add related macro to extract bit fields from dw1 for later trace
event output state usage.

Also move exist stread_id and other bit fields into one anonymous struct
which inside anonymous union, change them from unsigned to u32 type,
it will make sure union member have same memory size as dw1.

In order to allow trace event output stage access the bit from saved u32
'dw1', add following macros,
define USB_REQ_BITFIELD(n, name) \
	({\
	union {\
		struct {\
			u32	stream_id:16;\
			u32	is_last:1;\
			u32	no_interrupt:1;\
			u32	zero:1;\
			u32	short_not_ok:1;\
			u32	dma_mapped:1;\
		} __packed;\
		u32		dw1;\
	} __aligned(4) __r_u_##name;\
	u32 __r_##name; \
	BUILD_BUG_ON(sizeof(__r_u_##name) != 4);\
	__r_u_##name.dw1 = (n); __r_##name = __r_u_##name.name;\
	__r_##name; })

define USB_REQ_STREAM_ID(n) USB_REQ_BITFIELD((n), stream_id)
...
change to use this kind of macros for all related trace files later.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change
v3: change method to extract bit field

 include/linux/usb/gadget.h | 43 ++++++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index f02e1bd20924..a1717c633942 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -41,6 +41,7 @@ struct usb_ep;
  * @num_sgs: number of SG entries
  * @num_mapped_sgs: number of SG entries mapped to DMA (internal)
  * @length: Length of that data
+ * @dw1: trace event purpose
  * @stream_id: The stream id, when USB3.0 bulk streams are being used
  * @is_last: Indicates if this is the last request of a stream_id before
  *	switching to a different stream (required for DWC3 controllers).
@@ -105,12 +106,17 @@ struct usb_request {
 	unsigned		num_sgs;
 	unsigned		num_mapped_sgs;
 
-	unsigned		stream_id:16;
-	unsigned		is_last:1;
-	unsigned		no_interrupt:1;
-	unsigned		zero:1;
-	unsigned		short_not_ok:1;
-	unsigned		dma_mapped:1;
+	union {
+		struct {
+			u32	stream_id:16;
+			u32	is_last:1;
+			u32	no_interrupt:1;
+			u32	zero:1;
+			u32	short_not_ok:1;
+			u32	dma_mapped:1;
+		} __packed;
+		u32		dw1;
+	} __aligned(4);
 
 	void			(*complete)(struct usb_ep *ep,
 					struct usb_request *req);
@@ -123,6 +129,31 @@ struct usb_request {
 	unsigned		actual;
 };
 
+#define USB_REQ_BITFIELD(n, name) \
+	({\
+	union {\
+		struct {\
+			u32	stream_id:16;\
+			u32	is_last:1;\
+			u32	no_interrupt:1;\
+			u32	zero:1;\
+			u32	short_not_ok:1;\
+			u32	dma_mapped:1;\
+		} __packed;\
+		u32		dw1;\
+	} __aligned(4) __r_u_##name;\
+	u32 __r_##name; \
+	BUILD_BUG_ON(sizeof(__r_u_##name) != 4);\
+	__r_u_##name.dw1 = (n); __r_##name = __r_u_##name.name;\
+	__r_##name; })
+
+#define USB_REQ_STREAM_ID(n) USB_REQ_BITFIELD((n), stream_id)
+#define USB_REQ_IS_LAST(n) USB_REQ_BITFIELD((n), stream_id)
+#define USB_REQ_NO_INTERRUPT(n) USB_REQ_BITFIELD((n), stream_id)
+#define USB_REQ_ZERO(n) USB_REQ_BITFIELD((n), stream_id)
+#define USB_REQ_SHORT_NOT_OK(n) USB_REQ_BITFIELD((n), stream_id)
+#define USB_REQ_DMA_MAPPED(n) USB_REQ_BITFIELD((n), stream_id)
+
 /*-------------------------------------------------------------------------*/
 
 /* endpoint-specific parts of the api to the usb controller hardware.
-- 
2.17.1

