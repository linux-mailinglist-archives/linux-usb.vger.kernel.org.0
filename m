Return-Path: <linux-usb+bounces-23373-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED08DA98833
	for <lists+linux-usb@lfdr.de>; Wed, 23 Apr 2025 13:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51D691B64344
	for <lists+linux-usb@lfdr.de>; Wed, 23 Apr 2025 11:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B9827054D;
	Wed, 23 Apr 2025 11:10:46 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69F126C3A2
	for <linux-usb@vger.kernel.org>; Wed, 23 Apr 2025 11:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406646; cv=none; b=ATojoefa6mfS0wt9dKp+guijxHkL+iPCYoEdkY7SW6dgsMNLSlqcRliCyvYFQzlV6mMxul+cCqzGsDUd2p/HIlZZqeBDiBJgteimPW3RspqeAnd9NeRBDtic3nM2K9FmbeTw8uUD4HnsPRnO4sQgBCQQEal8A6rS/B5k2QhPSRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406646; c=relaxed/simple;
	bh=CHJOcYo7Bs5O1xW16KdETCdbru1c6MIRWxdjTwkNZCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0j3yjzjbimxMnUolH8K2pS8d7IiMDT+EpWt1IE5Y6Y0cO5UymALGIA6Kin7SndLE77Tdwmg3y+GTYduq93lHzv/8fimjrTn0xzjr0rRUJ7sl8Vn7JhVin6HXP0nhKEia/6mXNFmGMNHHx6N9cqZ7qZoL8/BO0VD/d4K1CKfTPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id 0D3F5233B9;
	Wed, 23 Apr 2025 14:10:41 +0300 (MSK)
Date: Wed, 23 Apr 2025 14:10:40 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, lvc-project@linuxtesting.org
Subject: [PATCH v1] usb: isp1760: increase buffer size to avoid overflow
Message-ID: <20250423111040.GC857@altlinux.org>
References: <20250422230000.GA857@altlinux.org>
 <rdsyrsjl67rjhkuatkaggnrfcruvzcxlwnfb6jgqgh5ninlnmj@hy2ofl7jlhei>
 <20250423110540.GB857@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250423110540.GB857@altlinux.org>

When isp1760_udc_init_hw() calls isp1760_set_pullup(), its call of
isp1760_field_set() may access the udc->fields array beyond the size
of DC_FIELD_MAX up to HC_FIELD_MAX, which is (now) bigger. Increase
the buffer size to max(DC_FIELD_MAX,HC_FIELD_MAX) to avoid possible
overflow.

Found by ALT Linux Team (altlinux.org) and Linux Verification Center
(linuxtesting.org).

Fixes: 1da9e1c06873 ("usb: isp1760: move to regmap for register access")
Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
---
 drivers/usb/isp1760/isp1760-hcd.h  | 2 +-
 drivers/usb/isp1760/isp1760-regs.h | 3 +++
 drivers/usb/isp1760/isp1760-udc.h  | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp1760-hcd.h
index ee3063a34de3bccf..34dacde96c4ae3cf 100644
--- a/drivers/usb/isp1760/isp1760-hcd.h
+++ b/drivers/usb/isp1760/isp1760-hcd.h
@@ -50,7 +50,7 @@ struct isp1760_hcd {
 	void __iomem		*base;
 
 	struct regmap		*regs;
-	struct regmap_field	*fields[HC_FIELD_MAX];
+	struct regmap_field	*fields[DC_HC_FIELD_MAX];
 
 	bool			is_isp1763;
 	const struct isp1760_memory_layout	*memory_layout;
diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/isp1760-regs.h
index 3a6751197e970013..a5a442015887ce0b 100644
--- a/drivers/usb/isp1760/isp1760-regs.h
+++ b/drivers/usb/isp1760/isp1760-regs.h
@@ -267,6 +267,9 @@ enum isp176x_device_controller_fields {
 	DC_FIELD_MAX,
 };
 
+#define	DC_HC_FIELD_MAX	\
+	(DC_FIELD_MAX > HC_FIELD_MAX ? DC_FIELD_MAX : HC_FIELD_MAX)
+
 /* ISP1763 */
 /* Initialization Registers */
 #define ISP1763_DC_ADDRESS		0x00
diff --git a/drivers/usb/isp1760/isp1760-udc.h b/drivers/usb/isp1760/isp1760-udc.h
index 22044e86bc0ecb84..609444bea306ba81 100644
--- a/drivers/usb/isp1760/isp1760-udc.h
+++ b/drivers/usb/isp1760/isp1760-udc.h
@@ -69,7 +69,7 @@ struct isp1760_udc {
 	char *irqname;
 
 	struct regmap *regs;
-	struct regmap_field *fields[DC_FIELD_MAX];
+	struct regmap_field *fields[DC_HC_FIELD_MAX];
 
 	struct usb_gadget_driver *driver;
 	struct usb_gadget gadget;

-- 
Alexey V. Vissarionov
gremlin נעי altlinux פ‏כ org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

