Return-Path: <linux-usb+bounces-317-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBB57A485D
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 13:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 460091C210A2
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 11:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E23F1C6A2;
	Mon, 18 Sep 2023 11:27:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C3338F8F
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 11:27:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135DC120
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 04:26:17 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38IBCa2V003199;
	Mon, 18 Sep 2023 11:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=kDJ2h5IVc76hK3BR57cqwq62RgTyPvIH5wAVcpDvvHU=;
 b=lpCouYeHYiIMsGgQ/MmIMVWVhstXmsDvXScKGoseYbKTLHTaRepNeP94010gGHxRuWoz
 S2BlknP750CQ3dPUpxomMoKyir+NLUJ+0bd8QiM0pR4uShyvIkSf+P+HfvnMgzE1t0Z7
 kjdmK8K4FL1ecxHcI7Rvfd3cmK3PYBUHPObLLGjzRs4fDCPcaarDhmmI69BWdjb/n8AO
 DBem2p2GKBtLPNlNMJ/I8g/E//cGqsqG+KhVIN/UFM2kROrzMBoukFxwSOT5QJRZy8aV
 5KLeNDLACtrUWWEN020oobIbc2RtrL0mdsnlX0J9KmDa2EjJ2ts5XjwQeFMyeHItZlJZ 2A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t53ps2w50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 11:25:51 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38IBPoGl023169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 11:25:50 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 18 Sep 2023 04:25:48 -0700
From: Linyu Yuan <quic_linyyuan@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern
	<stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v7 2/4] usb: gadget: add anonymous definition in some struct for trace purpose
Date: Mon, 18 Sep 2023 19:25:32 +0800
Message-ID: <20230918112534.2108-3-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230918112534.2108-1-quic_linyyuan@quicinc.com>
References: <20230918112534.2108-1-quic_linyyuan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZAcJaFho4XbWa27MlCmr9xnDDPCgYqAP
X-Proofpoint-GUID: ZAcJaFho4XbWa27MlCmr9xnDDPCgYqAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_03,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=571 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309180100
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

In order to access each bit with BIT() macro, add different definition for
each bit fields according host little/big endian to make sure it has same
eacho bit field have same bit position in memory.

Add some macros or helper for later trace event usage which follow the
udc structs, As when possible future changes to udc related structs,
developers will easy notice them.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 include/linux/usb/gadget.h | 266 +++++++++++++++++++++++++++++++------
 1 file changed, 226 insertions(+), 40 deletions(-)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 5b5a8c5f2c47..e06a3b972268 100644
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
 
 struct usb_ep;
@@ -39,6 +43,7 @@ struct usb_ep;
  * @num_sgs: number of SG entries
  * @num_mapped_sgs: number of SG entries mapped to DMA (internal)
  * @length: Length of that data
+ * @dw1: trace event purpose
  * @stream_id: The stream id, when USB3.0 bulk streams are being used
  * @is_last: Indicates if this is the last request of a stream_id before
  *	switching to a different stream (required for DWC3 controllers).
@@ -103,12 +108,28 @@ struct usb_request {
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
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
+			u32	stream_id:16;
+			u32	is_last:1;
+			u32	no_interrupt:1;
+			u32	zero:1;
+			u32	short_not_ok:1;
+			u32	dma_mapped:1;
+			u32	pad:11;
+#else
+			u32	pad:11;
+			u32	dma_mapped:1;
+			u32	short_not_ok:1;
+			u32	zero:1;
+			u32	no_interrupt:1;
+			u32	is_last:1;
+			u32	stream_id:16;
+#endif
+		};
+		u32		dw1;
+	};
 
 	void			(*complete)(struct usb_ep *ep,
 					struct usb_request *req);
@@ -121,6 +142,20 @@ struct usb_request {
 	unsigned		actual;
 };
 
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
+
 /*-------------------------------------------------------------------------*/
 
 /* endpoint-specific parts of the api to the usb controller hardware.
@@ -161,12 +196,23 @@ struct usb_ep_ops {
  * @dir_out:Endpoint supports OUT direction.
  */
 struct usb_ep_caps {
-	unsigned type_control:1;
-	unsigned type_iso:1;
-	unsigned type_bulk:1;
-	unsigned type_int:1;
-	unsigned dir_in:1;
-	unsigned dir_out:1;
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
+	u8	type_control:1;
+	u8	type_iso:1;
+	u8	type_bulk:1;
+	u8	type_int:1;
+	u8	dir_in:1;
+	u8	dir_out:1;
+	u8	pad:2;
+#else
+	u8	pad:2;
+	u8	dir_out:1;
+	u8	dir_in:1;
+	u8	type_int:1;
+	u8	type_bulk:1;
+	u8	type_iso:1;
+	u8	type_control:1;
+#endif
 };
 
 #define USB_EP_CAPS_TYPE_CONTROL     0x01
@@ -197,6 +243,9 @@ struct usb_ep_caps {
  * @caps:The structure describing types and directions supported by endpoint.
  * @enabled: The current endpoint enabled/disabled state.
  * @claimed: True if this endpoint is claimed by a function.
+ * @dw1: trace event purpose
+ * @dw2: trace event purpose
+ * @dw3: trace event purpose
  * @maxpacket:The maximum packet size used on this endpoint.  The initial
  *	value can sometimes be reduced (hardware allowing), according to
  *	the endpoint descriptor used to configure the endpoint.
@@ -226,19 +275,84 @@ struct usb_ep {
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
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
+			u32	maxpacket:16;
+			u32	maxpacket_limit:16;
+#else
+			u32	maxpacket_limit:16;
+			u32	maxpacket:16;
+#endif
+		};
+		u32	dw1;
+	};
+	union {
+		struct {
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
+			u32	max_streams:16;
+			u32	mult:2;
+			u32	maxburst:5;
+			u32	pad:9;
+#else
+			u32	pad:9;
+			u32	maxburst:5;
+			u32	mult:2;
+			u32	max_streams:16;
+#endif
+		};
+		u32	dw2;
+	};
+	union {
+		struct {
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
+			struct usb_ep_caps	caps;
+			u8			claimed:1;
+			u8			enabled:1;
+			u8			pad1:6;
+			u8			address;
+			u8			reserved;
+#else
+			u8			reserved;
+			u8			address;
+			u8			pad1:6;
+			u8			enabled:1;
+			u8			claimed:1;
+			struct usb_ep_caps	caps;
+#endif
+		};
+		u32	dw3;
+	};
 	const struct usb_endpoint_descriptor	*desc;
 	const struct usb_ss_ep_comp_descriptor	*comp_desc;
 };
 
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
 /*-------------------------------------------------------------------------*/
 
 #if IS_ENABLED(CONFIG_USB_GADGET)
@@ -355,6 +469,7 @@ struct usb_gadget_ops {
  * @in_epnum: last used in ep number
  * @mA: last set mA value
  * @otg_caps: OTG capabilities of this gadget.
+ * @dw1: trace event purpose
  * @sg_supported: true if we can handle scatter-gather
  * @is_otg: True if the USB device port uses a Mini-AB jack, so that the
  *	gadget driver must provide a USB OTG descriptor.
@@ -430,30 +545,101 @@ struct usb_gadget {
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
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
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
+			u32		pad:13;
+#else
+			u32		pad:13;
+			u32		wakeup_armed:1;
+			u32		wakeup_capable:1;
+			u32		lpm_capable:1;
+			u32		connected:1;
+			u32		deactivated:1;
+			u32		is_selfpowered:1;
+			u32		quirk_avoids_skb_reserve:1;
+			u32		quirk_zlp_not_supp:1;
+			u32		quirk_stall_not_supp:1;
+			u32		quirk_altset_not_supp:1;
+			u32		quirk_ep_out_aligned_size:1;
+			u32		host_request_flag:1;
+			u32		hnp_polling_support:1;
+			u32		a_alt_hnp_support:1;
+			u32		a_hnp_support:1;
+			u32		b_hnp_enable:1;
+			u32		is_a_peripheral:1;
+			u32		is_otg:1;
+			u32		sg_supported:1;
+#endif
+		};
+
+		u32			dw1;
+	};
 	int				irq;
 	int				id_number;
 };
 #define work_to_gadget(w)	(container_of((w), struct usb_gadget, work))
 
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
 /* Interface to the device model */
 static inline void set_gadget_data(struct usb_gadget *gadget, void *data)
 	{ dev_set_drvdata(&gadget->dev, data); }
-- 
2.17.1


