Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C36039588E
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 11:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbhEaJ7v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 May 2021 05:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbhEaJ7g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 May 2021 05:59:36 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83FFFC061761
        for <linux-usb@vger.kernel.org>; Mon, 31 May 2021 02:57:54 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id n12-20020a0c8c0c0000b02901edb8963d4dso8610913qvb.18
        for <linux-usb@vger.kernel.org>; Mon, 31 May 2021 02:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=45MmF2175m6BORzn8ZUbzSkbaNCtvNwuTViwFrWZrTc=;
        b=Kj23KSlLpLDfe7ImGRWB2sLzj2uTilgD5Hr6rKAuZ1a7XCbsDQBUXkMC0vRiKaj5s9
         I1uJuOxtkb6A+KgLH6zsT5KuE43qRN/8hTZhqSqdKwAmYmOicqM1uS9GlU5vFszAIP1v
         Gice3Fx8fNHm7rFJmndUQSQ9DHojMzSrCl7qLklpXaTdz9whpmN3/tPxkUj/15ZCYa37
         2EsCQ4gryMKyD2T3I6BmrH3DsJPElmUsjDPHput2SNjYAtYLLK3dZjOhQW9b5VYfLInN
         pKvkaLrPJFw50NEBW+2+TFXbIsr2phQUn2QzczXd+1vw71UEletIqY4LIJ4QlcFa4LjP
         dEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=45MmF2175m6BORzn8ZUbzSkbaNCtvNwuTViwFrWZrTc=;
        b=I3id7bNtFRkiYnsLmnVxLEXt6TkG5krBP9U2GYcJaN4geFdf245aZUoXaZk0z9uncl
         yWmro59m7dS8LlYM9r4TcySOtvcyrfWsN50LaOeq+7nOEVSgUcKi5rno5akDgmNJP6Go
         UL2omxJmNTRbSahao/Tgqn5Xze8zUbskOqhy6wzQ6sbhstWAhd99zUg0YaBqhfe8PT0W
         Of9i19Y7AAoE27t0SeyBZRDC9r4V85jyArBlOcK7wx1ZdSGQhFAWG+rGqaxsNZx8Vjaj
         BWEdKkpWSiCWoOzuEUiFRLpiUVLyCKg8a7SWwNJtwpyLi7Eyl8nctWye8sSOC+Oito3U
         ao9g==
X-Gm-Message-State: AOAM533NmRzKDkCwVdAoPzuj7UO6KnosBgj+bebS7efkl6/4WQ2ZgTag
        DAnzcDtzqyQ3eIVmGzMuNfIqRFJFYA4I
X-Google-Smtp-Source: ABdhPJzWXncTd4LovIUoiupmiRxOy3KOHtSUyQhsAlDNERr9qIfzRqaL3OLjXJbIOHO9X8NtYVH4LtyByq5U
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:1330:7a47:8be2:d9b7])
 (user=kyletso job=sendgmr) by 2002:a0c:aa13:: with SMTP id
 d19mr128228qvb.3.1622455073694; Mon, 31 May 2021 02:57:53 -0700 (PDT)
Date:   Mon, 31 May 2021 17:57:36 +0800
In-Reply-To: <20210531095737.2258642-1-kyletso@google.com>
Message-Id: <20210531095737.2258642-3-kyletso@google.com>
Mime-Version: 1.0
References: <20210531095737.2258642-1-kyletso@google.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
Subject: [PATCH v2 2/3] dt-bindings: connector: Add PD rev 2.0 VDO definition
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the VDO definition for USB PD rev 2.0 in the bindings and define a
new property snk-vdos-v1 containing legacy VDOs as the responses to the
port partner which only supports PD rev 2.0.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
changes since v1:
- no change

 .../bindings/connector/usb-connector.yaml     | 15 ++++
 include/dt-bindings/usb/pd.h                  | 69 ++++++++++++++++++-
 2 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 32509b98142e..92b49bc37939 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -149,6 +149,17 @@ properties:
     maxItems: 6
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
+  sink-vdos-v1:
+    description: An array of u32 with each entry, a Vendor Defined Message Object (VDO),
+      providing additional information corresponding to the product, the detailed bit
+      definitions and the order of each VDO can be found in
+      "USB Power Delivery Specification Revision 2.0, Version 1.3" chapter 6.4.4.3.1 Discover
+      Identity. User can specify the VDO array via VDO_IDH/_CERT/_PRODUCT/_CABLE/_AMA defined in
+      dt-bindings/usb/pd.h.
+    minItems: 3
+    maxItems: 6
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
   op-sink-microwatt:
     description: Sink required operating power in microwatt, if source can't
       offer the power, Capability Mismatch is set. Required for power sink and
@@ -207,6 +218,10 @@ properties:
       SNK_READY for non-pd link.
     type: boolean
 
+dependencies:
+  sink-vdos-v1: [ 'sink-vdos' ]
+  sink-vdos: [ 'sink-vdos-v1' ]
+
 required:
   - compatible
 
diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
index fef3ef65967f..9e47f9673405 100644
--- a/include/dt-bindings/usb/pd.h
+++ b/include/dt-bindings/usb/pd.h
@@ -106,6 +106,10 @@
  * <20:16>  :: Reserved, Shall be set to zero
  * <15:0>   :: USB-IF assigned VID for this cable vendor
  */
+
+/* PD Rev2.0 definition */
+#define IDH_PTYPE_UNDEF		0
+
 /* SOP Product Type (UFP) */
 #define IDH_PTYPE_NOT_UFP       0
 #define IDH_PTYPE_HUB           1
@@ -228,7 +232,25 @@
 	 | ((pnum) & 0x1f))
 
 /*
- * Passive Cable VDO
+ * Cable VDO (for both Passive and Active Cable VDO in PD Rev2.0)
+ * ---------
+ * <31:28> :: Cable HW version
+ * <27:24> :: Cable FW version
+ * <23:20> :: Reserved, Shall be set to zero
+ * <19:18> :: type-C to Type-A/B/C/Captive (00b == A, 01 == B, 10 == C, 11 == Captive)
+ * <17>    :: Reserved, Shall be set to zero
+ * <16:13> :: cable latency (0001 == <10ns(~1m length))
+ * <12:11> :: cable termination type (11b == both ends active VCONN req)
+ * <10>    :: SSTX1 Directionality support (0b == fixed, 1b == cfgable)
+ * <9>     :: SSTX2 Directionality support
+ * <8>     :: SSRX1 Directionality support
+ * <7>     :: SSRX2 Directionality support
+ * <6:5>   :: Vbus current handling capability (01b == 3A, 10b == 5A)
+ * <4>     :: Vbus through cable (0b == no, 1b == yes)
+ * <3>     :: SOP" controller present? (0b == no, 1b == yes)
+ * <2:0>   :: USB SS Signaling support
+ *
+ * Passive Cable VDO (PD Rev3.0+)
  * ---------
  * <31:28> :: Cable HW version
  * <27:24> :: Cable FW version
@@ -244,7 +266,7 @@
  * <4:3>   :: Reserved, Shall be set to zero
  * <2:0>   :: USB highest speed
  *
- * Active Cable VDO 1
+ * Active Cable VDO 1 (PD Rev3.0+)
  * ---------
  * <31:28> :: Cable HW version
  * <27:24> :: Cable FW version
@@ -266,7 +288,9 @@
 #define CABLE_VDO_VER1_0	0
 #define CABLE_VDO_VER1_3	3
 
-/* Connector Type */
+/* Connector Type (_ATYPE and _BTYPE are for PD Rev2.0 only) */
+#define CABLE_ATYPE		0
+#define CABLE_BTYPE		1
 #define CABLE_CTYPE		2
 #define CABLE_CAPTIVE		3
 
@@ -303,12 +327,22 @@
 #define CABLE_CURR_3A		1
 #define CABLE_CURR_5A		2
 
+/* USB SuperSpeed Signaling Support (PD Rev2.0) */
+#define CABLE_USBSS_U2_ONLY	0
+#define CABLE_USBSS_U31_GEN1	1
+#define CABLE_USBSS_U31_GEN2	2
+
 /* USB Highest Speed */
 #define CABLE_USB2_ONLY		0
 #define CABLE_USB32_GEN1	1
 #define CABLE_USB32_4_GEN2	2
 #define CABLE_USB4_GEN3		3
 
+#define VDO_CABLE(hw, fw, cbl, lat, term, tx1d, tx2d, rx1d, rx2d, cur, vps, sopp, usbss) \
+	(((hw) & 0x7) << 28 | ((fw) & 0x7) << 24 | ((cbl) & 0x3) << 18		\
+	 | ((lat) & 0x7) << 13 | ((term) & 0x3) << 11 | (tx1d) << 10		\
+	 | (tx2d) << 9 | (rx1d) << 8 | (rx2d) << 7 | ((cur) & 0x3) << 5		\
+	 | (vps) << 4 | (sopp) << 3 | ((usbss) & 0x7))
 #define VDO_PCABLE(hw, fw, ver, conn, lat, term, vbm, cur, spd)			\
 	(((hw) & 0xf) << 28 | ((fw) & 0xf) << 24 | ((ver) & 0x7) << 21		\
 	 | ((conn) & 0x3) << 18 | ((lat) & 0xf) << 13 | ((term) & 0x3) << 11	\
@@ -373,6 +407,35 @@
 	 | ((hops) & 0x3) << 6 | (u2) << 5 | (u32) << 4 | (lane) << 3		\
 	 | (iso) << 2 | (gen))
 
+/*
+ * AMA VDO (PD Rev2.0)
+ * ---------
+ * <31:28> :: Cable HW version
+ * <27:24> :: Cable FW version
+ * <23:12> :: Reserved, Shall be set to zero
+ * <11>    :: SSTX1 Directionality support (0b == fixed, 1b == cfgable)
+ * <10>    :: SSTX2 Directionality support
+ * <9>     :: SSRX1 Directionality support
+ * <8>     :: SSRX2 Directionality support
+ * <7:5>   :: Vconn power
+ * <4>     :: Vconn power required
+ * <3>     :: Vbus power required
+ * <2:0>   :: USB SS Signaling support
+ */
+#define VDO_AMA(hw, fw, tx1d, tx2d, rx1d, rx2d, vcpwr, vcr, vbr, usbss) \
+	(((hw) & 0x7) << 28 | ((fw) & 0x7) << 24			\
+	 | (tx1d) << 11 | (tx2d) << 10 | (rx1d) << 9 | (rx2d) << 8	\
+	 | ((vcpwr) & 0x7) << 5 | (vcr) << 4 | (vbr) << 3		\
+	 | ((usbss) & 0x7))
+
+#define PD_VDO_AMA_VCONN_REQ(vdo)	(((vdo) >> 4) & 1)
+#define PD_VDO_AMA_VBUS_REQ(vdo)	(((vdo) >> 3) & 1)
+
+#define AMA_USBSS_U2_ONLY	0
+#define AMA_USBSS_U31_GEN1	1
+#define AMA_USBSS_U31_GEN2	2
+#define AMA_USBSS_BBONLY	3
+
 /*
  * VPD VDO
  * ---------
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

