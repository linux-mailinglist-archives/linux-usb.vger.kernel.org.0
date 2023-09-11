Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 362E779A26F
	for <lists+linux-usb@lfdr.de>; Mon, 11 Sep 2023 06:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233572AbjIKEad (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 00:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233550AbjIKEac (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 00:30:32 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D0110D
        for <linux-usb@vger.kernel.org>; Sun, 10 Sep 2023 21:30:25 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B49cud028465;
        Mon, 11 Sep 2023 04:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=/y92d+RCnxKfc5pwj36KazoiOHCerE5IcaCSyr3vVJc=;
 b=Q3hl/M2hyCv7AKjVUb46oxOcozIBGgOkBcjsudj+aE7sy433QcyFysnMIl84TIjJbJVz
 3uTOpQZno+rJC+EnM2MnkPBwHN+e46QyANP1emP0aGpEc8mqYFlIThE0LWoawhadDiqE
 F++FHgKvpNPRAooMqW6s054lxfnsrmfGRZva97VFLfYAzNBTYbf7+9LhhWvHmuQbGoXp
 Z+fnW1FxlGM3Y6DZ8dTRl58Nd3u1pTeBGeDor3eCoaJj11h0HoQSOeoFsuY7GfUEGIn4
 7Dv5cdlHr8X3/IPOIPpl368pLNXjUZn0pzZCKw1p1UyldAJSCmJIAaw+TqNdGjYBazKa iA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0edmjw5a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:29:40 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38B4T9P6015489
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 04:29:09 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Sun, 10 Sep 2023 21:29:02 -0700
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
Subject: [PATCH 01/11] usb: gadget: add anonymous definition in struct usb_gadget
Date:   Mon, 11 Sep 2023 12:28:33 +0800
Message-ID: <20230911042843.2711-2-quic_linyyuan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: c6HQiKlgbLYPyWJMrVBYphOYS1AABoLV
X-Proofpoint-GUID: c6HQiKlgbLYPyWJMrVBYphOYS1AABoLV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_01,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=762 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110041
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some UDC trace event will save usb gadget information, but it will use
one int size buffer to save one bit information of usb gadget, so more
than one int buffer to save several bit fields which is not good.

Add one anonymous union have three u32 members which can be used by trace
event during fast assign stage to reduce trace buffer usage, and add
related macro to extract bit fields from u32 members for later trace event
output state usage.

Also move sg_supported and other bit fields into one anonymous struct
which inside anonymous union and Change bit fields from unsigned to u32
type, it will make sure union member have expected u32 size.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 include/linux/usb/gadget.h | 63 ++++++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 19 deletions(-)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 75bda0783395..cdf62e7f34e7 100644
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
@@ -432,25 +433,49 @@ struct usb_gadget {
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
+			u32		sg_supported:1;
+			u32		is_otg:1;
+			u32		is_a_peripheral:1;
+			u32		b_hnp_enable:1;
+			u32		a_hnp_support:1;
+			u32		a_alt_hnp_support:1;
+			u32		hnp_polling_support:1;
+			u32		host_request_flag:1;
+			u32		quirk_ep_out_aligned_size:1;
+			u32		quirk_altset_not_supp:1;
+			u32		quirk_stall_not_supp:1;
+			u32		quirk_zlp_not_supp:1;
+			u32		quirk_avoids_skb_reserve:1;
+			u32		is_selfpowered:1;
+			u32		deactivated:1;
+			u32		connected:1;
+			u32		lpm_capable:1;
+			u32		wakeup_capable:1;
+			u32		wakeup_armed:1;
+		} __packed;
+		u32			dw1;
+#define		USB_GADGET_SG_SUPPORTED(n)			((n) & BIT(0))
+#define		USB_GADGET_IS_OTG(n)				((n) & BIT(1))
+#define		USB_GADGET_IS_A_PERIPHERAL(n)			((n) & BIT(2))
+#define		USB_GADGET_B_HNP_ENABLE(n)			((n) & BIT(3))
+#define		USB_GADGET_A_HNP_SUPPORT(n)			((n) & BIT(4))
+#define		USB_GADGET_A_ALT_HNP_SUPPORT(n)			((n) & BIT(5))
+#define		USB_GADGET_HNP_POLLING_SUPPORT(n)		((n) & BIT(6))
+#define		USB_GADGET_HOST_REQUEST_FLAG(n)			((n) & BIT(7))
+#define		USB_GADGET_QUIRK_EP_OUT_ALIGNED_SIZE(n)		((n) & BIT(8))
+#define		USB_GADGET_QUIRK_ALTSET_NOT_SUPP(n)		((n) & BIT(9))
+#define		USB_GADGET_QUIRK_STALL_NOT_SUPP(n)		((n) & BIT(10))
+#define		USB_GADGET_QUIRK_ZLP_NOT_SUPP(n)		((n) & BIT(11))
+#define		USB_GADGET_QUIRK_AVOIDS_SKB_RESERVE(n)		((n) & BIT(12))
+#define		USB_GADGET_IS_SELFPOWERED(n)			((n) & BIT(13))
+#define		USB_GADGET_DEACTIVATED(n)			((n) & BIT(14))
+#define		USB_GADGET_CONNECTED(n)				((n) & BIT(15))
+#define		USB_GADGET_LPM_CAPABLE(n)			((n) & BIT(16))
+#define		USB_GADGET_WAKEUP_CAPABLE(n)			((n) & BIT(17))
+#define		USB_GADGET_WAKEUP_ARMED(n)			((n) & BIT(18))
+	};
 	int				irq;
 	int				id_number;
 };
-- 
2.17.1

