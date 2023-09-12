Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7DF279CEB2
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 12:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234563AbjILKsJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 06:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234583AbjILKrc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 06:47:32 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F332D4B
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 03:46:13 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C9RtA6010558;
        Tue, 12 Sep 2023 10:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=8M4AgEf7BUPsQ4dmaQnJp3c2CIOWt9PErAV8Og4DLmI=;
 b=PcsEcHEFlCrSYhCBJxxenUQkLU4o9wr7NnUWrAj+efWtak5pZpWzZ3WRajzZuPF7YJy0
 Rz3sPeFzm/jXppEESRquYIfZynLzogSecqdl4+/7gac7hBNJghq0927Zc60PPK8r0yeA
 19L8uRts4yWZSNGa8QLrKuwxuG8UcaCzm1kfDA89u12h14DpYmvRjWrOvfUW6T+XcY6s
 dQZc4q6kBW7Lcd+tIrkaO9Ehm5NB3Dy9o/fkPvAwGw3a+RGtcOXHq973/QaS8MNTtVgo
 cNiw2IB/71P9i2A0aOw00LJyxjqNMKXcVFIzRsSNa3RpZfqHBzCODs18kI8SQP24yWBf Qg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2ncp04vu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 10:45:21 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CAjJUX017901
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 10:45:19 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 12 Sep 2023 03:45:12 -0700
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
Subject: [PATCH v3 01/10] usb: gadget: add anonymous definition in struct usb_gadget
Date:   Tue, 12 Sep 2023 18:44:46 +0800
Message-ID: <20230912104455.7737-2-quic_linyyuan@quicinc.com>
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
X-Proofpoint-GUID: pmZcoj33haMeXw9geZiGL0vZuKA1uhLW
X-Proofpoint-ORIG-GUID: pmZcoj33haMeXw9geZiGL0vZuKA1uhLW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=776 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120090
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some UDC trace event will save usb gadget information, but it use one int
size buffer to save one bit information of usb gadget, so 19 int buffers
needed to save 19 bit fields which is not good.

Add one anonymous union which have one u32 member 'dw1' to struct
'usb_gadget', it inlclude all 19 bits and can be used by trace event
during fast assign stage to save more entries with same trace ring buffer
size.

Also move all original 19 bit fields into one anonymous struct which
inside struct 'usb_gadget'.

In order to allow trace event output stage access the bit from saved u32
'dw1', add following macro,
define USB_GADGET_BITFIELD(n, name) \
	({\
	union {\
		struct {\
			u32	sg_supported:1;\
			u32	is_otg:1;\
			u32	is_a_peripheral:1;\
			u32	b_hnp_enable:1;\
			u32	a_hnp_support:1;\
			u32	a_alt_hnp_support:1;\
			u32	hnp_polling_support:1;\
			u32	host_request_flag:1;\
			u32	quirk_ep_out_aligned_size:1;\
			u32	quirk_altset_not_supp:1;\
			u32	quirk_stall_not_supp:1;\
			u32	quirk_zlp_not_supp:1;\
			u32	quirk_avoids_skb_reserve:1;\
			u32	is_selfpowered:1;\
			u32	deactivated:1;\
			u32	connected:1;\
			u32	lpm_capable:1;\
			u32	wakeup_capable:1;\
			u32	wakeup_armed:1;\
		} __packed;\
		u32		dw1;\
	} __aligned(4) __g_u_##name;\
	u32 __g_##name; \
	BUILD_BUG_ON(sizeof(__g_u_##name) != 4);\
	__g_u_##name.dw1 = (n); __g_##name = __g_u_##name.name;\
	__g_##name; })

define USB_GADGET_SG_SUPPORTED(n) USB_GADGET_BITFIELD((n), sg_supported)
...
change to use this kind of macro for all related trace files later.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change
v3: change method to extract bit field

 include/linux/usb/gadget.h | 96 ++++++++++++++++++++++++++++++--------
 1 file changed, 77 insertions(+), 19 deletions(-)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 75bda0783395..f02e1bd20924 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -357,6 +357,7 @@ struct usb_gadget_ops {
  * @in_epnum: last used in ep number
  * @mA: last set mA value
  * @otg_caps: OTG capabilities of this gadget.
+ * @dw1: trace event purpose
  * @sg_supported: true if we can handle scatter-gather
  * @is_otg: True if the USB device port uses a Mini-AB jack, so that the
  *	gadget driver must provide a USB OTG descriptor.
@@ -432,30 +433,87 @@ struct usb_gadget {
 	unsigned			mA;
 	struct usb_otg_caps		*otg_caps;
 
-	unsigned			sg_supported:1;
-	unsigned			is_otg:1;
-	unsigned			is_a_peripheral:1;
-	unsigned			b_hnp_enable:1;
-	unsigned			a_hnp_support:1;
-	unsigned			a_alt_hnp_support:1;
-	unsigned			hnp_polling_support:1;
-	unsigned			host_request_flag:1;
-	unsigned			quirk_ep_out_aligned_size:1;
-	unsigned			quirk_altset_not_supp:1;
-	unsigned			quirk_stall_not_supp:1;
-	unsigned			quirk_zlp_not_supp:1;
-	unsigned			quirk_avoids_skb_reserve:1;
-	unsigned			is_selfpowered:1;
-	unsigned			deactivated:1;
-	unsigned			connected:1;
-	unsigned			lpm_capable:1;
-	unsigned			wakeup_capable:1;
-	unsigned			wakeup_armed:1;
+	union {
+		struct {
+			unsigned	sg_supported:1;
+			unsigned	is_otg:1;
+			unsigned	is_a_peripheral:1;
+			unsigned	b_hnp_enable:1;
+			unsigned	a_hnp_support:1;
+			unsigned	a_alt_hnp_support:1;
+			unsigned	hnp_polling_support:1;
+			unsigned	host_request_flag:1;
+			unsigned	quirk_ep_out_aligned_size:1;
+			unsigned	quirk_altset_not_supp:1;
+			unsigned	quirk_stall_not_supp:1;
+			unsigned	quirk_zlp_not_supp:1;
+			unsigned	quirk_avoids_skb_reserve:1;
+			unsigned	is_selfpowered:1;
+			unsigned	deactivated:1;
+			unsigned	connected:1;
+			unsigned	lpm_capable:1;
+			unsigned	wakeup_capable:1;
+			unsigned	wakeup_armed:1;
+		} __packed;
+
+		u32			dw1;
+	} __aligned(4);
 	int				irq;
 	int				id_number;
 };
 #define work_to_gadget(w)	(container_of((w), struct usb_gadget, work))
 
+#define USB_GADGET_BITFIELD(n, name) \
+	({\
+	union {\
+		struct {\
+			u32	sg_supported:1;\
+			u32	is_otg:1;\
+			u32	is_a_peripheral:1;\
+			u32	b_hnp_enable:1;\
+			u32	a_hnp_support:1;\
+			u32	a_alt_hnp_support:1;\
+			u32	hnp_polling_support:1;\
+			u32	host_request_flag:1;\
+			u32	quirk_ep_out_aligned_size:1;\
+			u32	quirk_altset_not_supp:1;\
+			u32	quirk_stall_not_supp:1;\
+			u32	quirk_zlp_not_supp:1;\
+			u32	quirk_avoids_skb_reserve:1;\
+			u32	is_selfpowered:1;\
+			u32	deactivated:1;\
+			u32	connected:1;\
+			u32	lpm_capable:1;\
+			u32	wakeup_capable:1;\
+			u32	wakeup_armed:1;\
+		} __packed;\
+		u32		dw1;\
+	} __aligned(4) __g_u_##name;\
+	u32 __g_##name; \
+	BUILD_BUG_ON(sizeof(__g_u_##name) != 4);\
+	__g_u_##name.dw1 = (n); __g_##name = __g_u_##name.name;\
+	__g_##name; })
+
+#define USB_GADGET_SG_SUPPORTED(n) USB_GADGET_BITFIELD((n), sg_supported)
+#define USB_GADGET_IS_OTG(n) USB_GADGET_BITFIELD((n), is_otg)
+#define USB_GADGET_IS_A_PERIPHERAL(n) USB_GADGET_BITFIELD((n), is_a_peripheral)
+#define USB_GADGET_B_HNP_ENABLE(n) USB_GADGET_BITFIELD((n), b_hnp_enable)
+#define USB_GADGET_A_HNP_SUPPORT(n) USB_GADGET_BITFIELD((n), a_hnp_support)
+#define USB_GADGET_A_ALT_HNP_SUPPORT(n) USB_GADGET_BITFIELD((n), a_alt_hnp_support)
+#define USB_GADGET_HNP_POLLING_SUPPORT(n) USB_GADGET_BITFIELD((n), hnp_polling_support)
+#define USB_GADGET_HOST_REQUEST_FLAG(n) USB_GADGET_BITFIELD((n), host_request_flag)
+#define USB_GADGET_QUIRK_EP_OUT_ALIGNED_SIZE(n) USB_GADGET_BITFIELD((n), quirk_ep_out_aligned_size)
+#define USB_GADGET_QUIRK_ALTSET_NOT_SUPP(n) USB_GADGET_BITFIELD((n), quirk_altset_not_supp)
+#define USB_GADGET_QUIRK_STALL_NOT_SUPP(n) USB_GADGET_BITFIELD((n), quirk_stall_not_supp)
+#define USB_GADGET_QUIRK_ZLP_NOT_SUPP(n) USB_GADGET_BITFIELD((n), quirk_zlp_not_supp)
+#define USB_GADGET_QUIRK_AVOIDS_SKB_RESERVE(n) USB_GADGET_BITFIELD((n), quirk_avoids_skb_reserve)
+#define USB_GADGET_IS_SELFPOWERED(n) USB_GADGET_BITFIELD((n), is_selfpowered)
+#define USB_GADGET_DEACTIVATED(n) USB_GADGET_BITFIELD((n), deactivated)
+#define USB_GADGET_CONNECTED(n) USB_GADGET_BITFIELD((n), connected)
+#define USB_GADGET_LPM_CAPABLE(n) USB_GADGET_BITFIELD((n), lpm_capable)
+#define USB_GADGET_WAKEUP_CAPABLE(n) USB_GADGET_BITFIELD((n), wakeup_capable)
+#define USB_GADGET_WAKEUP_ARMED(n) USB_GADGET_BITFIELD((n), wakeup_armed)
+
 /* Interface to the device model */
 static inline void set_gadget_data(struct usb_gadget *gadget, void *data)
 	{ dev_set_drvdata(&gadget->dev, data); }
-- 
2.17.1

