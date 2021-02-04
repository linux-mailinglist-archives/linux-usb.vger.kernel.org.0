Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026B330BB17
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 10:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233050AbhBBJgO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 04:36:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232997AbhBBJfQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 04:35:16 -0500
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E39D6C0617A7
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 01:33:58 -0800 (PST)
Received: by mail-qv1-xf4a.google.com with SMTP id d8so13262144qvs.1
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 01:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=e/QMaejLrsy+W7WMjY8j20WDgidoHsnLG8479jZIASk=;
        b=OyvmRxPbLQreaFUm7L5baIZd1clUE/2QdRgU2/FJBrFghbCB9wjqaupiKqiGkcHSYu
         DwnYnYedqxFmx/fHlic1YNAxK1hrT5YgiZiiSTpuz5xMQu0nTZjcTaHk50vNKttJk0El
         GqPgUdJ4gLa8EqzRaQHGhrSoc6EP5OJxg9Obx91ZbExQoSt+xP/B0mD1eAR6R5YgkFLv
         EVhLfLR+iwZ30Z/BHqZKPvLuUvyM8lk5NPZO+fTZue0qSflloVwe0Q3t5OKIGUuG2Gel
         zLGLjauRMbAcSX+QEdJv0OFCLqolgb8MnEL2eT9NyvjLCcKKzGrGqk091pwNrbr5D/TB
         VESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=e/QMaejLrsy+W7WMjY8j20WDgidoHsnLG8479jZIASk=;
        b=uJ/8gneY++UBnu9w/l6mnIVKm0IPkc+rlOFEtqEsnDELHIwe1wELupEi45n7EP+rBt
         DxUqUmhWx1SMGc4LZfHuoGNT4nnnmHqGZMYie7Y6t14v1/EYV9q5Ic5j4Yjb0ifYs2Y4
         W5ygXHQzhNCd/C4r3MhL+6cL3ltwgHtyCFULy6UX+DZ5Vwb31v0/zroIXDzmsct4iWps
         B5j7sT8eSWhWJTsYvnsJoaBEnPaXR9aNpZ34VxMdxlxULs5AlknmStr+//+qP11C9lZ9
         J1BBw5qIXtH0jKDV52zioWp3J2loU/14ZNWzSR82U2wQ4Yix7hrPfppk4WHkxxNr2RLL
         gGvg==
X-Gm-Message-State: AOAM530hraf3DsVD/esHTt80g1p2nM8ztughp5gUUJpvi3g5CKQALovz
        gf2gW5kdwcGNx7OVkArSxE+gHeABTbKN
X-Google-Smtp-Source: ABdhPJxwcCJuhIaVM+KdXWEYtpqMPv3F9OtljbLC/R/LKfXpA8Z03FFBX4JpTqwx1R5NYFk9gsTtTZMSETAW
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:dd94:c753:a81d:c855])
 (user=kyletso job=sendgmr) by 2002:a0c:aed0:: with SMTP id
 n16mr19540449qvd.22.1612258438028; Tue, 02 Feb 2021 01:33:58 -0800 (PST)
Date:   Tue,  2 Feb 2021 17:33:36 +0800
In-Reply-To: <20210202093342.738691-1-kyletso@google.com>
Message-Id: <20210202093342.738691-3-kyletso@google.com>
Mime-Version: 1.0
References: <20210202093342.738691-1-kyletso@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v4 2/8] usb: pd: Update VDO definitions
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, hdegoede@redhat.com, robh+dt@kernel.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

"PD Spec Revision 3.0 Version 2.0 + ECNs 2020-12-10" introduces several
changes regarding the ID Header VDO and the Product Type VDOs.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/class.c  |   8 +-
 include/linux/usb/pd_vdo.h | 308 ++++++++++++++++++++++++++++---------
 2 files changed, 242 insertions(+), 74 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 42d1be1eece9..1db08138b75d 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -89,7 +89,7 @@ static const char * const typec_accessory_modes[] = {
 
 /* Product types defined in USB PD Specification R3.0 V2.0 */
 static const char * const product_type_ufp[8] = {
-	[IDH_PTYPE_UNDEF]		= "undefined",
+	[IDH_PTYPE_NOT_UFP]		= "not_ufp",
 	[IDH_PTYPE_HUB]			= "hub",
 	[IDH_PTYPE_PERIPH]		= "peripheral",
 	[IDH_PTYPE_PSD]			= "psd",
@@ -97,17 +97,17 @@ static const char * const product_type_ufp[8] = {
 };
 
 static const char * const product_type_dfp[8] = {
-	[IDH_PTYPE_DFP_UNDEF]		= "undefined",
+	[IDH_PTYPE_NOT_DFP]		= "not_dfp",
 	[IDH_PTYPE_DFP_HUB]		= "hub",
 	[IDH_PTYPE_DFP_HOST]		= "host",
 	[IDH_PTYPE_DFP_PB]		= "power_brick",
-	[IDH_PTYPE_DFP_AMC]		= "amc",
 };
 
 static const char * const product_type_cable[8] = {
-	[IDH_PTYPE_UNDEF]		= "undefined",
+	[IDH_PTYPE_NOT_CABLE]		= "not_cable",
 	[IDH_PTYPE_PCABLE]		= "passive",
 	[IDH_PTYPE_ACABLE]		= "active",
+	[IDH_PTYPE_VPD]			= "vpd",
 };
 
 static struct usb_pd_identity *get_pd_identity(struct device *dev)
diff --git a/include/linux/usb/pd_vdo.h b/include/linux/usb/pd_vdo.h
index 8c08eeb9a74b..e9b6822c54c2 100644
--- a/include/linux/usb/pd_vdo.h
+++ b/include/linux/usb/pd_vdo.h
@@ -103,34 +103,46 @@
  * --------------------
  * <31>     :: data capable as a USB host
  * <30>     :: data capable as a USB device
- * <29:27>  :: product type (UFP / Cable)
+ * <29:27>  :: product type (UFP / Cable / VPD)
  * <26>     :: modal operation supported (1b == yes)
- * <25:16>  :: product type (DFP)
+ * <25:23>  :: product type (DFP) (SVDM version 2.0+ only; set to zero in version 1.0)
+ * <22:21>  :: connector type (SVDM version 2.0+ only; set to zero in version 1.0)
+ * <20:16>  :: Reserved, Shall be set to zero
  * <15:0>   :: USB-IF assigned VID for this cable vendor
  */
-#define IDH_PTYPE_UNDEF		0
+/* SOP Product Type (UFP) */
+#define IDH_PTYPE_NOT_UFP	0
 #define IDH_PTYPE_HUB		1
 #define IDH_PTYPE_PERIPH	2
 #define IDH_PTYPE_PSD		3
 #define IDH_PTYPE_AMA		5
 
+/* SOP' Product Type (Cable Plug / VPD) */
+#define IDH_PTYPE_NOT_CABLE	0
 #define IDH_PTYPE_PCABLE	3
 #define IDH_PTYPE_ACABLE	4
+#define IDH_PTYPE_VPD		6
 
-#define IDH_PTYPE_DFP_UNDEF	0
+/* SOP Product Type (DFP) */
+#define IDH_PTYPE_NOT_DFP	0
 #define IDH_PTYPE_DFP_HUB	1
 #define IDH_PTYPE_DFP_HOST	2
 #define IDH_PTYPE_DFP_PB	3
-#define IDH_PTYPE_DFP_AMC	4
 
-#define VDO_IDH(usbh, usbd, ptype, is_modal, vid)		\
-	((usbh) << 31 | (usbd) << 30 | ((ptype) & 0x7) << 27	\
-	 | (is_modal) << 26 | ((vid) & 0xffff))
+/* ID Header Mask */
+#define IDH_DFP_MASK		GENMASK(25, 23)
+#define IDH_CONN_MASK		GENMASK(22, 21)
+
+#define VDO_IDH(usbh, usbd, ufp_cable, is_modal, dfp, conn, vid)		\
+	((usbh) << 31 | (usbd) << 30 | ((ufp_cable) & 0x7) << 27		\
+	 | (is_modal) << 26 | ((dfp) & 0x7) << 23 | ((conn) & 0x3) << 21	\
+	 | ((vid) & 0xffff))
 
 #define PD_IDH_PTYPE(vdo)	(((vdo) >> 27) & 0x7)
 #define PD_IDH_VID(vdo)		((vdo) & 0xffff)
 #define PD_IDH_MODAL_SUPP(vdo)	((vdo) & (1 << 26))
 #define PD_IDH_DFP_PTYPE(vdo)	(((vdo) >> 23) & 0x7)
+#define PD_IDH_CONN_TYPE(vdo)	(((vdo) >> 21) & 0x3)
 
 /*
  * Cert Stat VDO
@@ -138,6 +150,7 @@
  * <31:0>  : USB-IF assigned XID for this cable
  */
 #define PD_CSTAT_XID(vdo)	(vdo)
+#define VDO_CERT(xid)		((xid) & 0xffffffff)
 
 /*
  * Product VDO
@@ -149,112 +162,267 @@
 #define PD_PRODUCT_PID(vdo)	(((vdo) >> 16) & 0xffff)
 
 /*
- * UFP VDO1
+ * UFP VDO (PD Revision 3.0+ only)
  * --------
  * <31:29> :: UFP VDO version
  * <28>    :: Reserved
  * <27:24> :: Device capability
- * <23:6>  :: Reserved
+ * <23:22> :: Connector type (10b == receptacle, 11b == captive plug)
+ * <21:11> :: Reserved
+ * <10:8>  :: Vconn power (AMA only)
+ * <7>     :: Vconn required (AMA only, 0b == no, 1b == yes)
+ * <6>     :: Vbus required (AMA only, 0b == yes, 1b == no)
  * <5:3>   :: Alternate modes
  * <2:0>   :: USB highest speed
  */
-#define PD_VDO1_UFP_DEVCAP(vdo)	(((vdo) & GENMASK(27, 24)) >> 24)
+#define PD_VDO_UFP_DEVCAP(vdo)	(((vdo) & GENMASK(27, 24)) >> 24)
+
+/* UFP VDO Version */
+#define UFP_VDO_VER1_2		2
 
+/* Device Capability */
 #define DEV_USB2_CAPABLE	BIT(0)
 #define DEV_USB2_BILLBOARD	BIT(1)
 #define DEV_USB3_CAPABLE	BIT(2)
 #define DEV_USB4_CAPABLE	BIT(3)
 
+/* Connector Type */
+#define UFP_RECEPTACLE		2
+#define UFP_CAPTIVE		3
+
+/* Vconn Power (AMA only, set to AMA_VCONN_NOT_REQ if Vconn is not required) */
+#define AMA_VCONN_PWR_1W	0
+#define AMA_VCONN_PWR_1W5	1
+#define AMA_VCONN_PWR_2W	2
+#define AMA_VCONN_PWR_3W	3
+#define AMA_VCONN_PWR_4W	4
+#define AMA_VCONN_PWR_5W	5
+#define AMA_VCONN_PWR_6W	6
+
+/* Vconn Required (AMA only) */
+#define AMA_VCONN_NOT_REQ	0
+#define AMA_VCONN_REQ		1
+
+/* Vbus Required (AMA only) */
+#define AMA_VBUS_REQ		0
+#define AMA_VBUS_NOT_REQ	1
+
+/* Alternate Modes */
+#define UFP_ALTMODE_NOT_SUPP	0
+#define UFP_ALTMODE_TBT3	BIT(0)
+#define UFP_ALTMODE_RECFG	BIT(1)
+#define UFP_ALTMODE_NO_RECFG	BIT(2)
+
+/* USB Highest Speed */
+#define UFP_USB2_ONLY		0
+#define UFP_USB32_GEN1		1
+#define UFP_USB32_4_GEN2	2
+#define UFP_USB4_GEN3		3
+
+#define VDO_UFP(ver, cap, conn, vcpwr, vcr, vbr, alt, spd)			\
+	(((ver) & 0x7) << 29 | ((cap) & 0xf) << 24 | ((conn) & 0x3) << 22	\
+	 | ((vcpwr) & 0x7) << 8 | (vcr) << 7 | (vbr) << 6 | ((alt) & 0x7) << 3	\
+	 | ((spd) & 0x7))
+
 /*
- * DFP VDO
+ * DFP VDO (PD Revision 3.0+ only)
  * --------
  * <31:29> :: DFP VDO version
  * <28:27> :: Reserved
  * <26:24> :: Host capability
- * <23:5>  :: Reserved
+ * <23:22> :: Connector type (10b == receptacle, 11b == captive plug)
+ * <21:5>  :: Reserved
  * <4:0>   :: Port number
  */
 #define PD_VDO_DFP_HOSTCAP(vdo)	(((vdo) & GENMASK(26, 24)) >> 24)
 
+#define DFP_VDO_VER1_1		1
 #define HOST_USB2_CAPABLE	BIT(0)
 #define HOST_USB3_CAPABLE	BIT(1)
 #define HOST_USB4_CAPABLE	BIT(2)
+#define DFP_RECEPTACLE		2
+#define DFP_CAPTIVE		3
+
+#define VDO_DFP(ver, cap, conn, pnum)						\
+	(((ver) & 0x7) << 29 | ((cap) & 0x7) << 24 | ((conn) & 0x3) << 22	\
+	 | ((pnum) & 0x1f))
 
 /*
- * Cable VDO
+ * Passive Cable VDO
  * ---------
  * <31:28> :: Cable HW version
  * <27:24> :: Cable FW version
- * <23:20> :: Reserved, Shall be set to zero
- * <19:18> :: type-C to Type-A/B/C/Captive (00b == A, 01 == B, 10 == C, 11 == Captive)
- * <17>    :: Type-C to Plug/Receptacle (0b == plug, 1b == receptacle)
+ * <23:21> :: VDO version
+ * <20>    :: Reserved, Shall be set to zero
+ * <19:18> :: Type-C to Type-C/Captive (10b == C, 11b == Captive)
+ * <17>    :: Reserved, Shall be set to zero
  * <16:13> :: cable latency (0001 == <10ns(~1m length))
- * <12:11> :: cable termination type (11b == both ends active VCONN req)
- * <10>    :: SSTX1 Directionality support (0b == fixed, 1b == cfgable)
- * <9>     :: SSTX2 Directionality support
- * <8>     :: SSRX1 Directionality support
- * <7>     :: SSRX2 Directionality support
- * <6:5>   :: Vbus current handling capability
+ * <12:11> :: cable termination type (10b == Vconn not req, 01b == Vconn req)
+ * <10:9>  :: Maximum Vbus voltage (00b == 20V, 01b == 30V, 10b == 40V, 11b == 50V)
+ * <8:7>   :: Reserved, Shall be set to zero
+ * <6:5>   :: Vbus current handling capability (01b == 3A, 10b == 5A)
+ * <4:3>   :: Reserved, Shall be set to zero
+ * <2:0>   :: USB highest speed
+ *
+ * Active Cable VDO 1
+ * ---------
+ * <31:28> :: Cable HW version
+ * <27:24> :: Cable FW version
+ * <23:21> :: VDO version
+ * <20>    :: Reserved, Shall be set to zero
+ * <19:18> :: Connector type (10b == C, 11b == Captive)
+ * <17>    :: Reserved, Shall be set to zero
+ * <16:13> :: cable latency (0001 == <10ns(~1m length))
+ * <12:11> :: cable termination type (10b == one end active, 11b == both ends active VCONN req)
+ * <10:9>  :: Maximum Vbus voltage (00b == 20V, 01b == 30V, 10b == 40V, 11b == 50V)
+ * <8>     :: SBU supported (0b == supported, 1b == not supported)
+ * <7>     :: SBU type (0b == passive, 1b == active)
+ * <6:5>   :: Vbus current handling capability (01b == 3A, 10b == 5A)
  * <4>     :: Vbus through cable (0b == no, 1b == yes)
  * <3>     :: SOP" controller present? (0b == no, 1b == yes)
- * <2:0>   :: USB SS Signaling support
+ * <2:0>   :: USB highest speed
  */
-#define CABLE_ATYPE		0
-#define CABLE_BTYPE		1
+/* Cable VDO Version */
+#define CABLE_VDO_VER1_0	0
+#define CABLE_VDO_VER1_3	3
+
+/* Connector Type */
 #define CABLE_CTYPE		2
 #define CABLE_CAPTIVE		3
-#define CABLE_PLUG		0
-#define CABLE_RECEPTACLE	1
-#define CABLE_CURR_1A5		0
+
+/* Cable Latency */
+#define CABLE_LATENCY_1M	1
+#define CABLE_LATENCY_2M	2
+#define CABLE_LATENCY_3M	3
+#define CABLE_LATENCY_4M	4
+#define CABLE_LATENCY_5M	5
+#define CABLE_LATENCY_6M	6
+#define CABLE_LATENCY_7M	7
+#define CABLE_LATENCY_7M_PLUS	8
+
+/* Cable Termination Type */
+#define PCABLE_VCONN_NOT_REQ	0
+#define PCABLE_VCONN_REQ	1
+#define ACABLE_ONE_END		2
+#define ACABLE_BOTH_END		3
+
+/* Maximum Vbus Voltage */
+#define CABLE_MAX_VBUS_20V	0
+#define CABLE_MAX_VBUS_30V	1
+#define CABLE_MAX_VBUS_40V	2
+#define CABLE_MAX_VBUS_50V	3
+
+/* Active Cable SBU Supported/Type */
+#define ACABLE_SBU_SUPP		0
+#define ACABLE_SBU_NOT_SUPP	1
+#define ACABLE_SBU_PASSIVE	0
+#define ACABLE_SBU_ACTIVE	1
+
+/* Vbus Current Handling Capability */
+#define CABLE_CURR_DEF		0
 #define CABLE_CURR_3A		1
 #define CABLE_CURR_5A		2
-#define CABLE_USBSS_U2_ONLY	0
-#define CABLE_USBSS_U31_GEN1	1
-#define CABLE_USBSS_U31_GEN2	2
-#define VDO_CABLE(hw, fw, cbl, gdr, lat, term, tx1d, tx2d, rx1d, rx2d, cur,\
-		  vps, sopp, usbss) \
-	(((hw) & 0x7) << 28 | ((fw) & 0x7) << 24 | ((cbl) & 0x3) << 18	\
-	 | (gdr) << 17 | ((lat) & 0x7) << 13 | ((term) & 0x3) << 11	\
-	 | (tx1d) << 10 | (tx2d) << 9 | (rx1d) << 8 | (rx2d) << 7	\
-	 | ((cur) & 0x3) << 5 | (vps) << 4 | (sopp) << 3		\
-	 | ((usbss) & 0x7))
+
+/* USB Highest Speed */
+#define CABLE_USB2_ONLY		0
+#define CABLE_USB32_GEN1	1
+#define CABLE_USB32_4_GEN2	2
+#define CABLE_USB4_GEN3		3
+
+#define VDO_PCABLE(hw, fw, ver, conn, lat, term, vbm, cur, spd)			\
+	(((hw) & 0xf) << 28 | ((fw) & 0xf) << 24 | ((ver) & 0x7) << 21		\
+	 | ((conn) & 0x3) << 18 | ((lat) & 0xf) << 13 | ((term) & 0x3) << 11	\
+	 | ((vbm) & 0x3) << 9 | ((cur) & 0x3) << 5 | ((spd) & 0x7))
+#define VDO_ACABLE1(hw, fw, ver, conn, lat, term, vbm, sbu, sbut, cur, vbt, sopp, spd) \
+	(((hw) & 0xf) << 28 | ((fw) & 0xf) << 24 | ((ver) & 0x7) << 21		\
+	 | ((conn) & 0x3) << 18	| ((lat) & 0xf) << 13 | ((term) & 0x3) << 11	\
+	 | ((vbm) & 0x3) << 9 | (sbu) << 8 | (sbut) << 7 | ((cur) & 0x3) << 5	\
+	 | (vbt) << 4 | (sopp) << 3 | ((spd) & 0x7))
+
 #define VDO_TYPEC_CABLE_TYPE(vdo)	(((vdo) >> 18) & 0x3)
 
 /*
- * AMA VDO
+ * Active Cable VDO 2
  * ---------
- * <31:28> :: Cable HW version
- * <27:24> :: Cable FW version
- * <23:12> :: Reserved, Shall be set to zero
- * <11>    :: SSTX1 Directionality support (0b == fixed, 1b == cfgable)
- * <10>    :: SSTX2 Directionality support
- * <9>     :: SSRX1 Directionality support
- * <8>     :: SSRX2 Directionality support
- * <7:5>   :: Vconn power
- * <4>     :: Vconn power required
- * <3>     :: Vbus power required
- * <2:0>   :: USB SS Signaling support
+ * <31:24> :: Maximum operating temperature
+ * <23:16> :: Shutdown temperature
+ * <15>    :: Reserved, Shall be set to zero
+ * <14:12> :: U3/CLd power
+ * <11>    :: U3 to U0 transition mode (0b == direct, 1b == through U3S)
+ * <10>    :: Physical connection (0b == copper, 1b == optical)
+ * <9>     :: Active element (0b == redriver, 1b == retimer)
+ * <8>     :: USB4 supported (0b == yes, 1b == no)
+ * <7:6>   :: USB2 hub hops consumed
+ * <5>     :: USB2 supported (0b == yes, 1b == no)
+ * <4>     :: USB3.2 supported (0b == yes, 1b == no)
+ * <3>     :: USB lanes supported (0b == one lane, 1b == two lanes)
+ * <2>     :: Optically isolated active cable (0b == no, 1b == yes)
+ * <1>     :: Reserved, Shall be set to zero
+ * <0>     :: USB gen (0b == gen1, 1b == gen2+)
  */
-#define VDO_AMA(hw, fw, tx1d, tx2d, rx1d, rx2d, vcpwr, vcr, vbr, usbss) \
-	(((hw) & 0x7) << 28 | ((fw) & 0x7) << 24			\
-	 | (tx1d) << 11 | (tx2d) << 10 | (rx1d) << 9 | (rx2d) << 8	\
-	 | ((vcpwr) & 0x7) << 5 | (vcr) << 4 | (vbr) << 3		\
-	 | ((usbss) & 0x7))
-
-#define PD_VDO_AMA_VCONN_REQ(vdo)	(((vdo) >> 4) & 1)
-#define PD_VDO_AMA_VBUS_REQ(vdo)	(((vdo) >> 3) & 1)
+/* U3/CLd Power*/
+#define ACAB2_U3_CLD_10MW_PLUS	0
+#define ACAB2_U3_CLD_10MW	1
+#define ACAB2_U3_CLD_5MW	2
+#define ACAB2_U3_CLD_1MW	3
+#define ACAB2_U3_CLD_500UW	4
+#define ACAB2_U3_CLD_200UW	5
+#define ACAB2_U3_CLD_50UW	6
+
+/* Other Active Cable VDO 2 Fields */
+#define ACAB2_U3U0_DIRECT	0
+#define ACAB2_U3U0_U3S		1
+#define ACAB2_PHY_COPPER	0
+#define ACAB2_PHY_OPTICAL	1
+#define ACAB2_REDRIVER		0
+#define ACAB2_RETIMER		1
+#define ACAB2_USB4_SUPP		0
+#define ACAB2_USB4_NOT_SUPP	1
+#define ACAB2_USB2_SUPP		0
+#define ACAB2_USB2_NOT_SUPP	1
+#define ACAB2_USB32_SUPP	0
+#define ACAB2_USB32_NOT_SUPP	1
+#define ACAB2_LANES_ONE		0
+#define ACAB2_LANES_TWO		1
+#define ACAB2_OPT_ISO_NO	0
+#define ACAB2_OPT_ISO_YES	1
+#define ACAB2_GEN_1		0
+#define ACAB2_GEN_2_PLUS	1
+
+#define VDO_ACABLE2(mtemp, stemp, u3p, trans, phy, ele, u4, hops, u2, u32, lane, iso, gen)	\
+	(((mtemp) & 0xff) << 24 | ((stemp) & 0xff) << 16 | ((u3p) & 0x7) << 12	\
+	 | (trans) << 11 | (phy) << 10 | (ele) << 9 | (u4) << 8			\
+	 | ((hops) & 0x3) << 6 | (u2) << 5 | (u32) << 4 | (lane) << 3		\
+	 | (iso) << 2 | (gen))
 
-#define AMA_VCONN_PWR_1W	0
-#define AMA_VCONN_PWR_1W5	1
-#define AMA_VCONN_PWR_2W	2
-#define AMA_VCONN_PWR_3W	3
-#define AMA_VCONN_PWR_4W	4
-#define AMA_VCONN_PWR_5W	5
-#define AMA_VCONN_PWR_6W	6
-#define AMA_USBSS_U2_ONLY	0
-#define AMA_USBSS_U31_GEN1	1
-#define AMA_USBSS_U31_GEN2	2
-#define AMA_USBSS_BBONLY	3
+/*
+ * VPD VDO
+ * ---------
+ * <31:28> :: HW version
+ * <27:24> :: FW version
+ * <23:21> :: VDO version
+ * <20:17> :: Reserved, Shall be set to zero
+ * <16:15> :: Maximum Vbus voltage (00b == 20V, 01b == 30V, 10b == 40V, 11b == 50V)
+ * <14>    :: Charge through current support (0b == 3A, 1b == 5A)
+ * <13>    :: Reserved, Shall be set to zero
+ * <12:7>  :: Vbus impedance
+ * <6:1>   :: Ground impedance
+ * <0>     :: Charge through support (0b == no, 1b == yes)
+ */
+#define VPD_VDO_VER1_0		0
+#define VPD_MAX_VBUS_20V	0
+#define VPD_MAX_VBUS_30V	1
+#define VPD_MAX_VBUS_40V	2
+#define VPD_MAX_VBUS_50V	3
+#define VPDCT_CURR_3A		0
+#define VPDCT_CURR_5A		1
+#define VPDCT_NOT_SUPP		0
+#define VPDCT_SUPP		1
+
+#define VDO_VPD(hw, fw, ver, vbm, curr, vbi, gi, ct)			\
+	(((hw) & 0xf) << 28 | ((fw) & 0xf) << 24 | ((ver) & 0x7) << 21	\
+	 | ((vbm) & 0x3) << 15 | (curr) << 14 | ((vbi) & 0x3f) << 7	\
+	 | ((gi) & 0x3f) << 1 | (ct))
 
 /*
  * SVDM Discover SVIDs request -> response
-- 
2.30.0.365.g02bc693789-goog

