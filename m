Return-Path: <linux-usb+bounces-2448-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC1A7DED8A
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 08:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E072C1C20E9E
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 07:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9261963DE;
	Thu,  2 Nov 2023 07:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oAL8lnC8"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A623A63C6
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 07:38:49 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4BA137
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 00:38:47 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a8d9dcdd2bso14366627b3.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Nov 2023 00:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698910726; x=1699515526; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LGFCJdqQxn9oQK435WcXslLgFBam9J/xIR0uzxICWZc=;
        b=oAL8lnC8C6v7HwEB6QhUwr0yyv32Q3K6+EJwFYgYqJ/XvGE96d0v3NGqhm3moMtktb
         8XmMHa2Oqns1GuEat0a5EMMpm7OUNTPHS3Lwoe9NsihTenXhLtyfvViNvC889bEle4rJ
         eovFgD7jbGiooV16j6BEcTjK0ZMVNm1yexKL0N6DYJRXiNRcQzq7xEzdk93F1sbqVUOw
         Kwxoaupdwyc1tasw2Oaq4ph2n1PD5CIKx774o6SlDMxf1Fsr53MLugYbsWi/veD/Hn1/
         iAvKZsFYTY5ModLguSzpS0J8f/1L8vlMpID2Bb3CQl9bnU54zl96vlWJx3cnJZ3Z6SLw
         hLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698910726; x=1699515526;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGFCJdqQxn9oQK435WcXslLgFBam9J/xIR0uzxICWZc=;
        b=Cs+WJ86m132c6X8W/YK1pwCmHXR8qfTsOJFbA2FaIQIoxCUPUpFEjTF5k1Ixi8U1KU
         1oU68r4Vy2Sk8LtexypItFeI/Zfli0KNzx8BRz75C4t00wWZqfBJ/Wb1U4U3yxVJCmFC
         OBilpLWcXrDnGcklRNio2sMx7PVRvkGMlZIrqfI0g+fCyDsQZA942ZPISrK2Ixa0zBML
         09hE1RmW4Cy6cBrmr+O2wyUALEbs0Kpm+zpDJUSbuXY/gNqUX1r4shW4JjaEq04tSVOq
         vtC3Zc2L4A0+jnBZ0JBnkbhQs1QWJA8r4T/pXGXSMLd6vGYfjVC/cN0L3KAVIEd/leNm
         uKfQ==
X-Gm-Message-State: AOJu0YxPjZnEZHxwWCMMuqEwTC2bpuhtjdz9ujfZLUb9nZd8dTnJXn4n
	RGXEAdg6WvcH2GEpUlIyJlX+DPp4v6Eq
X-Google-Smtp-Source: AGHT+IG+tTos8laLfIX9e5/iwUpTAZExM/+m86dYIDWNBa1YzBAkHxzJSrlMchNnfQREXc/DRykLZa0780V1
X-Received: from maurora-apa.c.googlers.com ([fda3:e722:ac3:cc00:3:22c1:c0a8:1184])
 (user=maurora job=sendgmr) by 2002:a81:83c8:0:b0:59b:ccba:1249 with SMTP id
 t191-20020a8183c8000000b0059bccba1249mr416235ywf.10.1698910726644; Thu, 02
 Nov 2023 00:38:46 -0700 (PDT)
Date: Thu,  2 Nov 2023 07:38:40 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231102073840.1579540-1-maurora@google.com>
Subject: [PATCH] usb: dwc3: Support EBC feature of DWC_usb31
From: Manan Aurora <maurora@google.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	manugautam@google.com, badhri@google.com, Manan Aurora <maurora@google.com>
Content-Type: text/plain; charset="UTF-8"

Support configuration and use of bulk endpoints in the so-called EBC
mode described in the DBC_usb31 databook (appendix E)

Added a bit fifo_mode to usb_ep to indicate to the UDC driver that a
specific endpoint is to operate in the EBC (or equivalent) mode when
enabled

Added macros for bits 15 and 14 of DEPCFG parameter 1 to indicate EBC
mode and write back behaviour. These bits will be set to 1 when
configuring an EBC endpoint as described in the programming guide

Signed-off-by: Manan Aurora <maurora@google.com>
---
 drivers/usb/dwc3/core.h    | 1 +
 drivers/usb/dwc3/gadget.c  | 6 ++++++
 drivers/usb/dwc3/gadget.h  | 2 ++
 include/linux/usb/gadget.h | 4 ++++
 4 files changed, 13 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index efe6caf4d0e8..c5b578188cd3 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -374,6 +374,7 @@
 /* Global HWPARAMS4 Register */
 #define DWC3_GHWPARAMS4_HIBER_SCRATCHBUFS(n)	(((n) & (0x0f << 13)) >> 13)
 #define DWC3_MAX_HIBER_SCRATCHBUFS		15
+#define DWC3_EXT_BUFF_CONTROL		BIT(21)
 
 /* Global HWPARAMS6 Register */
 #define DWC3_GHWPARAMS6_BCSUPPORT		BIT(14)
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 858fe4c299b7..47d2737d528b 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -673,6 +673,12 @@ static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
 		params.param1 |= DWC3_DEPCFG_BINTERVAL_M1(bInterval_m1);
 	}
 
+	if (dep->endpoint.fifo_mode) {
+		if (!(dwc->hwparams.hwparams4 & DWC3_EXT_BUFF_CONTROL))
+			return -EINVAL;
+		params.param1 |= DWC3_DEPCFG_EBC_HWO_NOWB | DWC3_DEPCFG_USE_EBC;
+	}
+
 	return dwc3_send_gadget_ep_cmd(dep, DWC3_DEPCMD_SETEPCONFIG, &params);
 }
 
diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
index 55a56cf67d73..fd7a4e94397e 100644
--- a/drivers/usb/dwc3/gadget.h
+++ b/drivers/usb/dwc3/gadget.h
@@ -26,6 +26,8 @@ struct dwc3;
 #define DWC3_DEPCFG_XFER_NOT_READY_EN	BIT(10)
 #define DWC3_DEPCFG_FIFO_ERROR_EN	BIT(11)
 #define DWC3_DEPCFG_STREAM_EVENT_EN	BIT(13)
+#define DWC3_DEPCFG_EBC_HWO_NOWB	BIT(14)
+#define DWC3_DEPCFG_USE_EBC		BIT(15)
 #define DWC3_DEPCFG_BINTERVAL_M1(n)	(((n) & 0xff) << 16)
 #define DWC3_DEPCFG_STREAM_CAPABLE	BIT(24)
 #define DWC3_DEPCFG_EP_NUMBER(n)	(((n) & 0x1f) << 25)
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 6532beb587b1..c526ae09bcee 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -209,6 +209,9 @@ struct usb_ep_caps {
  *	by this EP (0 - 16, actual number is 2^n)
  * @mult: multiplier, 'mult' value for SS Isoc EPs
  * @maxburst: the maximum number of bursts supported by this EP (for usb3)
+ * @fifo_mode: indicates that the control of this EP is handed off to an
+ *	hardware fifo device. Depends on hardware support eg. EBC feature
+ *	of DWC usb3.1 device or equivalent. Set before enabling the EP
  * @driver_data:for use by the gadget driver.
  * @address: used to identify the endpoint when finding descriptor that
  *	matches connection speed
@@ -236,6 +239,7 @@ struct usb_ep {
 	unsigned		max_streams:16;
 	unsigned		mult:2;
 	unsigned		maxburst:5;
+	unsigned		fifo_mode:1;
 	u8			address;
 	const struct usb_endpoint_descriptor	*desc;
 	const struct usb_ss_ep_comp_descriptor	*comp_desc;
-- 
2.42.0.820.g83a721a137-goog


