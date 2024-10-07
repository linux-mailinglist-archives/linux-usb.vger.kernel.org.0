Return-Path: <linux-usb+bounces-15810-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4774A992DF3
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 15:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 853B1B22D77
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 13:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882851D6DDC;
	Mon,  7 Oct 2024 13:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sgSTqS+I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719661D6DAE
	for <linux-usb@vger.kernel.org>; Mon,  7 Oct 2024 13:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728309332; cv=none; b=puuoU9RcbnesREla+jsPOM4fSMgKXoU9UgUcjA4hMDzAXSUjMGzFZwJXcorKIgscs5/X0cSTkKAh7Es9lOr9nQPbVYHpMKrkE1k62BsevW9nVkHzy0UA6ORMPZtThVzwtJcBck4+JBS1jM3FD33ov/c6ItuzPpSgfsHI9K6HklU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728309332; c=relaxed/simple;
	bh=hozD34R+1r+AOEtpIL+3KZ2W+shD6S4TBvGWV06zetk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u+g3EeQqRL/hKxNlvOGhb0DLsYzmrSmAk1AuCKC/apbWgh376ZPBcTwzDAwxKfJi2pqyZYNZbJiSBwMpP17Y1iPwD+bGB7+00JxwJMq7NA82QbiIg/BofP5FADdvxz0PPCkDwcgqH4f1bFe4W9N45NBVnO/+tSGEwivwNjBPSr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sgSTqS+I; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e24a0daf98eso4521103276.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2024 06:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728309328; x=1728914128; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LUZWXIYmMgx7eQT8FX3UW0dYEBsjOxQkFr0vicKGH/A=;
        b=sgSTqS+IgzrDXaIf3EkBcrNqKuaY+jSihBNRra/QDZbzLAQN1cQ5y/MGVE2LC2mabH
         ccJafmHqBrWjmaN8xYqx4weiT4ibsCjBGucH7li/Eq63lW+bb2vs5ePz7QzLLbcjJ6FX
         7c018ctgA+qch/cFLsS9dmh5WsnoogCEEAHsS6fvjUW5M1aICzikVeJU0RNmHyIWiWZV
         cSVqjgQ0deEXbOJp0nZe+r96DZykyHRk1dULf420ELNN6KL/Y1irffrqN6wnhacFgpha
         Li7WpU8BrO/Vjg/8zgiWoOYXaLgcUhw3yDhle0pb/lLjkV4P25wVLscacgEIVWomdstM
         J9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309328; x=1728914128;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LUZWXIYmMgx7eQT8FX3UW0dYEBsjOxQkFr0vicKGH/A=;
        b=acdgpsys0XmVaeOw3WVLinT6azfny+wGiLJEqn1Ik4dmSSTsNKba+96SsjNgir2G6L
         NTCF8EMEXSQnOt6xsZQ98BaVwhPgnWJoPJBCbPdgYPQvEOrTivFCaOUw0KEvwzZCgL0h
         DEVIOCuuhxlRg0y/9qGYT2WvmqClyO4ORd99wJl97//OXyxMDBcs0m3IQTTBZ0xGoNmV
         CBw9fedt5wAEGaPt+ZEogI5WFiZ8R/O+6UoGHlfdto0hF0SiXqD/jaKabXvTH7AQnBpL
         NAOSUs/X7a+jbQ7wthC9L+f/b+uvcEJNdKcDk2vHPHpxOluI4Py7f6UOmpp2/Ijcpvd0
         UGPg==
X-Gm-Message-State: AOJu0YwyMGB+Fd2CYd4fEn14Pw0+qC8r4KBJIAFzbfhU10pSKpg/Qal1
	vskrNy6LxsSM9/alsTQa+EkyQXYTuAgdLbHvxLW6UcZuyFoW7wdIBW8wmxnoGIagegpZyeLlO8v
	mKogxWbOlHg==
X-Google-Smtp-Source: AGHT+IHAjKT4qNlRsQdqeZv5m+rXvrWxHJ+iDczfE+jTXAOP5PTHzUEVzRCM39ErLrwzhS0XlNSExa1A5e5xhQ==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:1817:b0:e24:9f58:dd17 with SMTP
 id 3f1490d57ef6-e28936bf5d1mr34659276.1.1728309328396; Mon, 07 Oct 2024
 06:55:28 -0700 (PDT)
Date: Mon,  7 Oct 2024 13:55:07 +0000
In-Reply-To: <20241007135508.3143756-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241007135508.3143756-1-joychakr@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241007135508.3143756-4-joychakr@google.com>
Subject: [PATCH 2/2] usb: dwc3: Program USB Gen2 de-emphasis defined in PIPE4 spec
From: Joy Chakraborty <joychakr@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

Set 18bit TxDeemph[17:0] in LCSR_TX_DEEMPH(n) register for USB3 Gen2
Normal Operation as defined in PIPE4 spec based on dt quirk
"snps,tx_gen2_de_emphasis_quirk" and "snps,tx_gen2_de_emphasis".

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/usb/dwc3/core.c | 13 +++++++++++++
 drivers/usb/dwc3/core.h |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 9eb085f359ce..25e19aea364a 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -693,6 +693,11 @@ static int dwc3_ss_phy_setup(struct dwc3 *dwc, int index)
 
 	dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(index), reg);
 
+	if (dwc->tx_gen2_de_emphasis_quirk) {
+		reg = dwc->tx_gen2_de_emphasis;
+		dwc3_writel(dwc->regs, DWC3_LCSR_TX_DEEMPH(index), reg);
+	}
+
 	return 0;
 }
 
@@ -1654,6 +1659,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	u8			tx_thr_num_pkt_prd = 0;
 	u8			tx_max_burst_prd = 0;
 	u8			tx_fifo_resize_max_num;
+	u32			tx_gen2_de_emphasis = 0;
 	const char		*usb_psy_name;
 	int			ret;
 
@@ -1797,8 +1803,15 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->dis_split_quirk = device_property_read_bool(dev,
 				"snps,dis-split-quirk");
 
+	dwc->tx_gen2_de_emphasis_quirk = device_property_read_bool(dev,
+								   "snps,tx_gen2_de_emphasis_quirk");
+	if (dwc->tx_gen2_de_emphasis_quirk)
+		device_property_read_u32(dev, "snps,tx_gen2_de_emphasis",
+					 &tx_gen2_de_emphasis);
+
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
 	dwc->tx_de_emphasis = tx_de_emphasis;
+	dwc->tx_gen2_de_emphasis = tx_gen2_de_emphasis;
 
 	dwc->hird_threshold = hird_threshold;
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index c71240e8f7c7..fa9db38b7e15 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -179,7 +179,9 @@
 #define DWC3_OEVTEN		0xcc0C
 #define DWC3_OSTS		0xcc10
 
+/* Link Registers */
 #define DWC3_LLUCTL		0xd024
+#define DWC3_LCSR_TX_DEEMPH(n)	(0xd060 + ((n) * 0x80))
 
 /* Bit fields */
 
@@ -1145,6 +1147,8 @@ struct dwc3_scratchpad_array {
  *	1	- -3.5dB de-emphasis
  *	2	- No de-emphasis
  *	3	- Reserved
+ * @tx_gen2_de_emphasis_quirk: set if we enable USB Gen2 Tx de-emphasis quirk
+ * @tx_gen2_de_emphasis: Tx de-emphasis value used in USB Gen2 with PIPE4
  * @dis_metastability_quirk: set to disable metastability quirk.
  * @dis_split_quirk: set to disable split boundary.
  * @sys_wakeup: set if the device may do system wakeup.
@@ -1374,6 +1378,8 @@ struct dwc3 {
 
 	unsigned		tx_de_emphasis_quirk:1;
 	unsigned		tx_de_emphasis:2;
+	unsigned		tx_gen2_de_emphasis_quirk:1;
+	unsigned		tx_gen2_de_emphasis:18;
 
 	unsigned		dis_metastability_quirk:1;
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog


