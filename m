Return-Path: <linux-usb+bounces-116-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E5B7A1569
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 07:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8864E1C21159
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 05:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D90611F;
	Fri, 15 Sep 2023 05:27:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E10A611C
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 05:27:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684062729
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 22:27:38 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38F3bqQm022297;
	Fri, 15 Sep 2023 05:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=pyGHVjqnVgknx8VJnvjMNs6jpb/74wUv0QOm5syLwz4=;
 b=SGkxTL0pu8nPRj+visPN23YBkVTUdrm4fqs8PTt3/TuT3+em4/a8yc/31BHMhIekv1sT
 Or+O2Ygoc7HAqMNCjwcO2VvnPWxkT1oILvm4g2dAbV1QoL4bVKbW9NtQa03o9amBHu0Q
 rCvH+JW5ETgo4tO1sRmA9WSPN18IoaIb17BWD+3krg4dXYFr1Ih5MiufJeLFIIhB9Y2p
 oWgaodtxKzhsI4Etw+0VtfpWH7oM+EGj/VV83CRsVLWs+Opji9c01KiV8f/m+k70wnFm
 y47P77koBrKLVKc3qnEZ5iru2LVvlcNK6gOpetK89XhZRlcrXfgKQA5eTTNDXluOj4BC vg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4f6v08av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 05:27:31 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38F5RTnV011591
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 05:27:29 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Thu, 14 Sep 2023 22:27:27 -0700
From: Linyu Yuan <quic_linyyuan@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern
	<stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v6 1/3] usb: gadget: add anonymous definition in some struct for trace purpose
Date: Fri, 15 Sep 2023 13:27:14 +0800
Message-ID: <20230915052716.28540-2-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230915052716.28540-1-quic_linyyuan@quicinc.com>
References: <20230915052716.28540-1-quic_linyyuan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eORiizD95DPosuMi1B77z2djmbhbjpC9
X-Proofpoint-ORIG-GUID: eORiizD95DPosuMi1B77z2djmbhbjpC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_05,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=793 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150048
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Some UDC trace event will save usb udc information, but it use one int
size buffer to save one bit information of usb udc, it waste trace buffer.

Add anonymous union which have u32 members can be used by trace event
during fast assign stage to save more entries with same trace ring buffer
size.

Also add some trace event purpose macro in this file for all possiable
use.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 include/linux/usb/gadget.h | 201 +++++++++++++++++++++++++++++--------
 1 file changed, 160 insertions(+), 41 deletions(-)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 75bda0783395..2c0f7aafd2d3 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -24,6 +24,10 @@
 #include <linux/scatterlist.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
+#include <linux/stdarg.h>
+#include <linux/bitops.h>
+#include <linux/sprintf.h>
+#include <linux/bitfield.h>
 #include <linux/usb/ch9.h>
 
 #define UDC_TRACE_STR_MAX	512
@@ -41,6 +45,7 @@ struct usb_ep;
  * @num_sgs: number of SG entries
  * @num_mapped_sgs: number of SG entries mapped to DMA (internal)
  * @length: Length of that data
+ * @dw1: trace event purpose
  * @stream_id: The stream id, when USB3.0 bulk streams are being used
  * @is_last: Indicates if this is the last request of a stream_id before
  *	switching to a different stream (required for DWC3 controllers).
@@ -105,12 +110,17 @@ struct usb_request {
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
+	};
 
 	void			(*complete)(struct usb_ep *ep,
 					struct usb_request *req);
@@ -163,13 +173,13 @@ struct usb_ep_ops {
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
@@ -199,6 +209,9 @@ struct usb_ep_caps {
  * @caps:The structure describing types and directions supported by endpoint.
  * @enabled: The current endpoint enabled/disabled state.
  * @claimed: True if this endpoint is claimed by a function.
+ * @dw1: trace event purpose
+ * @dw2: trace event purpose
+ * @dw3: trace event purpose
  * @maxpacket:The maximum packet size used on this endpoint.  The initial
  *	value can sometimes be reduced (hardware allowing), according to
  *	the endpoint descriptor used to configure the endpoint.
@@ -228,15 +241,30 @@ struct usb_ep {
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
+	};
+	union {
+		struct {
+			u32	max_streams:16;
+			u32	mult:2;
+			u32	maxburst:5;
+		} __packed;
+		u32	dw2;
+	};
+	union {
+		struct {
+			struct usb_ep_caps	caps;
+			u8			claimed:1;
+			u8			enabled:1;
+			u8			address;
+		} __packed;
+		u32	dw3;
+	};
 	const struct usb_endpoint_descriptor	*desc;
 	const struct usb_ss_ep_comp_descriptor	*comp_desc;
 };
@@ -357,6 +385,7 @@ struct usb_gadget_ops {
  * @in_epnum: last used in ep number
  * @mA: last set mA value
  * @otg_caps: OTG capabilities of this gadget.
+ * @dw1: trace event purpose
  * @sg_supported: true if we can handle scatter-gather
  * @is_otg: True if the USB device port uses a Mini-AB jack, so that the
  *	gadget driver must provide a USB OTG descriptor.
@@ -432,25 +461,31 @@ struct usb_gadget {
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
+
+		u32			dw1;
+	};
 	int				irq;
 	int				id_number;
 };
@@ -960,4 +995,88 @@ extern void usb_ep_autoconfig_release(struct usb_ep *);
 
 extern void usb_ep_autoconfig_reset(struct usb_gadget *);
 
+/*-------------------------------------------------------------------------*/
+/* trace only, data in __le32 format at trace event fast assign stage */
+#define		USB_GADGET_SG_SUPPORTED			BIT(0)
+#define		USB_GADGET_IS_OTG			BIT(1)
+#define		USB_GADGET_IS_A_PERIPHERAL		BIT(2)
+#define		USB_GADGET_B_HNP_ENABLE			BIT(3)
+#define		USB_GADGET_A_HNP_SUPPORT		BIT(4)
+#define		USB_GADGET_A_ALT_HNP_SUPPORT		BIT(5)
+#define		USB_GADGET_HNP_POLLING_SUPPORT		BIT(6)
+#define		USB_GADGET_HOST_REQUEST_FLAG		BIT(7)
+#define		USB_GADGET_QUIRK_EP_OUT_ALIGNED_SIZE	BIT(8)
+#define		USB_GADGET_QUIRK_ALTSET_NOT_SUPP	BIT(9)
+#define		USB_GADGET_QUIRK_STALL_NOT_SUPP		BIT(10)
+#define		USB_GADGET_QUIRK_ZLP_NOT_SUPP		BIT(11)
+#define		USB_GADGET_QUIRK_AVOIDS_SKB_RESERVE	BIT(12)
+#define		USB_GADGET_IS_SELFPOWERED		BIT(13)
+#define		USB_GADGET_DEACTIVATED			BIT(14)
+#define		USB_GADGET_CONNECTED			BIT(15)
+#define		USB_GADGET_LPM_CAPABLE			BIT(16)
+#define		USB_GADGET_WAKEUP_CAPABLE		BIT(17)
+#define		USB_GADGET_WAKEUP_ARMED			BIT(18)
+
+#define USB_GADGET_FLAGS	\
+	{USB_GADGET_SG_SUPPORTED, "sg"},\
+	{USB_GADGET_IS_OTG, "OTG"},\
+	{USB_GADGET_IS_A_PERIPHERAL, "a_peripheral"},\
+	{USB_GADGET_B_HNP_ENABLE, "b_hnp"},\
+	{USB_GADGET_A_HNP_SUPPORT, "a_hnp"},\
+	{USB_GADGET_A_ALT_HNP_SUPPORT, "a_alt_hnp"},\
+	{USB_GADGET_HNP_POLLING_SUPPORT, "hnp_poll"},\
+	{USB_GADGET_HOST_REQUEST_FLAG, "hostreq"},\
+	{USB_GADGET_QUIRK_EP_OUT_ALIGNED_SIZE, "out_aligned"},\
+	{USB_GADGET_QUIRK_ALTSET_NOT_SUPP, "no_altset"},\
+	{USB_GADGET_QUIRK_STALL_NOT_SUPP, "no_stall"},\
+	{USB_GADGET_QUIRK_ZLP_NOT_SUPP, "no_zlp"},\
+	{USB_GADGET_QUIRK_AVOIDS_SKB_RESERVE, "no_skb_reserve"},\
+	{USB_GADGET_IS_SELFPOWERED, "self-powered"},\
+	{USB_GADGET_DEACTIVATED, "deactivated"},\
+	{USB_GADGET_CONNECTED, "connected"},\
+	{USB_GADGET_LPM_CAPABLE, "lpm-capable"},\
+	{USB_GADGET_WAKEUP_CAPABLE, "wakeup-capable"},\
+	{USB_GADGET_WAKEUP_ARMED, "wakeup-armed"}
+
+#define		USB_EP_MAXPACKET		GENMASK(15, 0)
+#define		USB_EP_MAXPACKET_LIMIT		GENMASK(31, 16)
+#define		USB_EP_MAX_STREAMS		GENMASK(15, 0)
+#define		USB_EP_MULT			GENMASK(17, 16)
+#define		USB_EP_MAXBURST			GENMASK(22, 18)
+#define		USB_EP_DIR_BI			GENMASK(5, 4)
+#define		USB_EP_DIR_IN			BIT(4)
+#define		USB_EP_DIR_OUT			BIT(5)
+#define		USB_EP_CLAIMED			BIT(8)
+#define		USB_EP_ENABLED			BIT(9)
+#define		USB_EP_ADDRESS			GENMASK(23, 16)
+
+#define USB_EP_FLAGS	\
+	{USB_EP_CLAIMED, "claimed"},\
+	{USB_EP_ENABLED, "enabled"}
+
+#define USB_EP_MAX_NAME_LEN	16
+static inline char *usb_gadget_ep_name(char *s, u32 dw)
+{
+	snprintf(s, USB_EP_MAX_NAME_LEN, "ep%d%s", u32_get_bits(dw, USB_EP_ADDRESS),
+		u32_get_bits(dw, USB_EP_DIR_BI) == 3 ? "" :
+		u32_get_bits(dw, USB_EP_DIR_IN) ? "in" : "out");
+
+	return s;
+}
+
+#define		USB_REQ_STREAM_ID	GENMASK(15, 0)
+#define		USB_REQ_IS_LAST		BIT(16)
+#define		USB_REQ_NO_INTERRUPT	BIT(17)
+#define		USB_REQ_ZERO		BIT(18)
+#define		USB_REQ_SHORT_NOT_OK	BIT(19)
+#define		USB_REQ_DMA_MAPPED	BIT(20)
+
+#define USB_REQ_FLAGS	\
+	{USB_REQ_IS_LAST, "last"},\
+	{USB_REQ_NO_INTERRUPT, "no-irq"},\
+	{USB_REQ_ZERO, "zero-len"},\
+	{USB_REQ_SHORT_NOT_OK, "short-not-ok"},\
+	{USB_REQ_DMA_MAPPED, "dma-mapped"}
+/*-------------------------------------------------------------------------*/
+
 #endif /* __LINUX_USB_GADGET_H */
-- 
2.17.1


