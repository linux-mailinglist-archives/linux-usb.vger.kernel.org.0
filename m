Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE81C79A26A
	for <lists+linux-usb@lfdr.de>; Mon, 11 Sep 2023 06:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbjIKEaH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 00:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbjIKEaE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 00:30:04 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944FF19C
        for <linux-usb@vger.kernel.org>; Sun, 10 Sep 2023 21:29:59 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B4BDl0027988;
        Mon, 11 Sep 2023 04:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=wrRchE3PqfEAvXWcyNncQzXjPTD1W0RhzF2VGVrekFE=;
 b=N1Ma07RGwwz82DxTp43sAJA0m2F5Gdp3Diapps6GYMkuhsE1+THMLhGdjnHNox+ihsLf
 t0umXB8bJPxHj7EFC35pNVjlO219dVazribwe1LA3EyoqTQhPnmfo81stsuFlMbdYGmr
 WmRZAOtgLRL1eKcqUGyY7G76VYXir4N8sEIQ0WP/8bXDTgnnuycqiGIP2tRj2nOxq5Mw
 SGAmqr9+GP1KuTJc4LodwH9sSSi++XTHPl1XP6j8eSPsuX/+FupcAuoq7tqSN1XhABOv
 zPJ7KVBuAQTRfyWHa3ItpOcJv5sc+J29gE+yTdFjs9/ruPkE8tYbKNx97AIteq+fQsV1 UA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0g1rjh8a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:29:18 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38B4TGae031546
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:29:16 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Sun, 10 Sep 2023 21:29:09 -0700
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
Subject: [PATCH 02/11] usb: gadget: add anonymous definition in struct usb_request
Date:   Mon, 11 Sep 2023 12:28:34 +0800
Message-ID: <20230911042843.2711-3-quic_linyyuan@quicinc.com>
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
X-Proofpoint-GUID: o8lnhos5vIZ-KDDqUPK6rt1v9SvQ6ksv
X-Proofpoint-ORIG-GUID: o8lnhos5vIZ-KDDqUPK6rt1v9SvQ6ksv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-10_18,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 mlxlogscore=566 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309110040
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
which inside anonymous union, Change them from unsigned to u32 type,
it will make sure union member have same memory size as dw1.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 include/linux/usb/gadget.h | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index cdf62e7f34e7..045ebd4637c5 100644
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
@@ -105,12 +106,23 @@ struct usb_request {
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
+#define		USB_REQ_STREAM_ID(n)	((n) & 0xffff)
+#define		USB_REQ_IS_LAST(n)	(((n) >> 16) & 1)
+#define		USB_REQ_NO_INTERRUPT(n)	(((n) >> 17) & 1)
+#define		USB_REQ_ZERO(n)		(((n) >> 18) & 1)
+#define		USB_REQ_SHORT_NOT_OK(n)	(((n) >> 19) & 1)
+#define		USB_REQ_DMA_MAPPED(n)	(((n) >> 20) & 1)
+	};
 
 	void			(*complete)(struct usb_ep *ep,
 					struct usb_request *req);
-- 
2.17.1

