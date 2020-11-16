Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2E92B5216
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 21:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbgKPUMS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 15:12:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgKPUMR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 15:12:17 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47C6C0613CF
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 12:12:17 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id t21so7877872pgl.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 12:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TM34Y8/Xkbhi+35MDii+t1nA+9j+av7JM+nHGfjWGOI=;
        b=KuK5C60FGb0OkS1JeYNuK+sBpPP6TMURsm2/zlPeTiJsO5+A7OBpPseAaRRPbgm+po
         mtdcIf3rCYDmtf9lJIZXm9Qufu1cBEPtjIqcRP45wwj+cV/Z5vt8KoRAVazUvFqbkasA
         VUQSHgdNCJG6vSjN5SD3ALXec0K1CxZnKrfUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TM34Y8/Xkbhi+35MDii+t1nA+9j+av7JM+nHGfjWGOI=;
        b=coAjt9R+aYz5fseOFiN5uQ5EyhmohjsFa/NmI2RWXtN3fiD+Hv3v6tMsWLay/kAzZu
         J8Q6FGfgAYS6o7Se+CBFjWoYG3XsMpIZeCI69NcamEsvh5JoMYiGSMRFfiYCGfCEB29X
         +LARWlYDihTVDY2rtfQUIxFD/Lz3p7kHCVIfau2bHjESvcZcvlBlvGoT3ZGs6TuTSDw+
         xa3ZGPB7hZP1VUpDeCh0fdiQM/27ldbSs7RberrH3KLJjpSSGKcW0u3wDn4P5nMl7F2a
         tjtcdTZ+RUqgN2INgM1Vg1t3qyvvnk6EjQ8WmN3MHvCU8E2qUi/cEK/fcB0ktcV/bF5U
         RVNQ==
X-Gm-Message-State: AOAM531xolQSqUN6RdPFwkLmQeJpse1sUTUyLSEbttPwkPvOjIr6+P2x
        lUA+0fNIb0eCylI0iUwNsgCSXazg6tGLkQ==
X-Google-Smtp-Source: ABdhPJzicRYi1Z2xIFSKRLEjWTu4BcYXPR2VlejlzbefEvEyFDtZGOM3ew/a/YjWo0tuAhBWA1EIJQ==
X-Received: by 2002:a65:560b:: with SMTP id l11mr756789pgs.63.1605557537362;
        Mon, 16 Nov 2020 12:12:17 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id a12sm234577pjh.48.2020.11.16.12.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 12:12:17 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
        enric.balletbo@collabora.com
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v3 01/11] usb: pd: Add captive Type C cable type
Date:   Mon, 16 Nov 2020 12:11:38 -0800
Message-Id: <20201116201150.2919178-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
In-Reply-To: <20201116201150.2919178-1-pmalani@chromium.org>
References: <20201116201150.2919178-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB Power Delivery Specification R3.0 adds a captive cable type
to the "USB Type-C plug to USB Type-C/Captive" field (Bits 19-18,
Passive/Active Cable VDO, Table 6-38 & 6-39).

Add the corresponding definition to the Cable VDO header. Also add a
helper macro to get the Type C cable connector type, when provided
the cable VDO.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---

Changes in v3:
- Re-arranged patch order and combined it with related series of
  patches.
- Added Reviewed-by tags

Changes in v2:
- No changes.

 include/linux/usb/pd_vdo.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/usb/pd_vdo.h b/include/linux/usb/pd_vdo.h
index 68bdc4e2f5a9..8c5cb5830754 100644
--- a/include/linux/usb/pd_vdo.h
+++ b/include/linux/usb/pd_vdo.h
@@ -177,7 +177,7 @@
  * <31:28> :: Cable HW version
  * <27:24> :: Cable FW version
  * <23:20> :: Reserved, Shall be set to zero
- * <19:18> :: type-C to Type-A/B/C (00b == A, 01 == B, 10 == C)
+ * <19:18> :: type-C to Type-A/B/C/Captive (00b == A, 01 == B, 10 == C, 11 == Captive)
  * <17>    :: Type-C to Plug/Receptacle (0b == plug, 1b == receptacle)
  * <16:13> :: cable latency (0001 == <10ns(~1m length))
  * <12:11> :: cable termination type (11b == both ends active VCONN req)
@@ -193,6 +193,7 @@
 #define CABLE_ATYPE		0
 #define CABLE_BTYPE		1
 #define CABLE_CTYPE		2
+#define CABLE_CAPTIVE		3
 #define CABLE_PLUG		0
 #define CABLE_RECEPTACLE	1
 #define CABLE_CURR_1A5		0
@@ -208,6 +209,7 @@
 	 | (tx1d) << 10 | (tx2d) << 9 | (rx1d) << 8 | (rx2d) << 7	\
 	 | ((cur) & 0x3) << 5 | (vps) << 4 | (sopp) << 3		\
 	 | ((usbss) & 0x7))
+#define VDO_TYPEC_CABLE_TYPE(vdo)	(((vdo) >> 18) & 0x3)
 
 /*
  * AMA VDO
-- 
2.29.2.299.gdc1121823c-goog

