Return-Path: <linux-usb+bounces-2373-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E917DC4F4
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 04:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16F74B20EBE
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 03:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E70353BA;
	Tue, 31 Oct 2023 03:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fjOO6srO"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ACD5663
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 03:46:50 +0000 (UTC)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60AFE6
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 20:46:48 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d9cb4de3bf0so5419050276.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 20:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698724008; x=1699328808; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XLDwkSvHH9wdnTtbtMwEJ+1MXhphfGEAd2XlaB9k1Nc=;
        b=fjOO6srOlaep4/iSPOs838d5D3tYwuJ8cjzhx9WKa/aQNxL/hVwuzFKGwjguKxk7uC
         +4JZatS1dqPAxmKvdEY/fh1g5JBm2OgNvSOqHOszkrOfIKa5+XbI50tHvCQao+n8xwbl
         oH8HBNmY9ZVjYtSVRjk9OyPWTu60yEZQ/2j698jg2ojP/BiqYYc4HwxXQ8nBdGgN01sx
         B3phBnL+GfHk6fmwygpvpiS95x/M1pHSLGM6yV+4p12Jtn1UsueD5Z+sYZCosBopGC29
         qcVb2cugIsAzBGl2Nd5X3n/kgz19QuCq5YaeHsuJ+abFriXJW50zFJr6m4MDAblTrlQ2
         WLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698724008; x=1699328808;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XLDwkSvHH9wdnTtbtMwEJ+1MXhphfGEAd2XlaB9k1Nc=;
        b=DPKIgSXyGZCS4J40v3UJODQui8bAN+pM4eeClv/thER6VDOkrGJp3lYRTRv2tMae/e
         mbabqL6Fr6hIXd2bnFZ5ywq0YKDdeqHq6I5Hs0g/f9WXjQqeKmaLUD0Yok6k3yOieszr
         v7wZOGM/K2diiOerU/c92SOuaOhwP8afh79bd4h7iZEbM4qQxCn0EQkf+0hQUuguwMef
         x+RbiO+d0j1IPLEpXb4wU2yVL0+DctzHgvn2mq5vg2cjshC9KwuexVP/dOuWAD5S6cE2
         2//mxQE0F3fFCPgxWVnbQOmDoe1VO5M7D3E7r59U1Y8XaosStEEz2I6KNTMW4SWC9E50
         jDzg==
X-Gm-Message-State: AOJu0YxKOdxVFY9ANBZzKVKHDL8hn5IB7QSLvSLr9av57aD2UczArxkS
	V8Zeb00r85F7Akcmk0g5HIR06/OqxCgO
X-Google-Smtp-Source: AGHT+IF3tuZqB3jnScYggN4DVKsq1S9lGHS1D1+k8sI5gTcavbD4kXrSGzWArI8YRXyO8uCMehXkVW8twUo3
X-Received: from maurora-apa.c.googlers.com ([fda3:e722:ac3:cc00:3:22c1:c0a8:1184])
 (user=maurora job=sendgmr) by 2002:a25:68cc:0:b0:da0:622b:553b with SMTP id
 d195-20020a2568cc000000b00da0622b553bmr206246ybc.12.1698724008159; Mon, 30
 Oct 2023 20:46:48 -0700 (PDT)
Date: Tue, 31 Oct 2023 03:46:41 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231031034641.660606-1-maurora@google.com>
Subject: [PATCH] usb: dwc3: Support EBC feature of DWC_usb31
From: Manan Aurora <maurora@google.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	manugautam@google.com, Manan Aurora <maurora@google.com>
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
 include/linux/usb/gadget.h | 1 +
 4 files changed, 10 insertions(+)

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
index 6532beb587b1..a771ccc038ac 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -236,6 +236,7 @@ struct usb_ep {
 	unsigned		max_streams:16;
 	unsigned		mult:2;
 	unsigned		maxburst:5;
+	unsigned		fifo_mode:1;
 	u8			address;
 	const struct usb_endpoint_descriptor	*desc;
 	const struct usb_ss_ep_comp_descriptor	*comp_desc;
-- 
2.42.0.820.g83a721a137-goog


