Return-Path: <linux-usb+bounces-36790-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEmpI+qG82l04wEAu9opvQ
	(envelope-from <linux-usb+bounces-36790-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 18:44:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF61F4A5EAF
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 18:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E2C5307D8FF
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 16:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95EDF47884A;
	Thu, 30 Apr 2026 16:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aBApgiEB"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B3B337BAC;
	Thu, 30 Apr 2026 16:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567229; cv=none; b=YKA5f/6FeraA+VoAmUWKVt+ufTEEHNyPMp3o4jQzIun9/TRN6tBv0AyiyfWxQJ/Xli6aLErEXSqNbWYPzEvGmwwRzCOTZKaj4KAjSqS9laEbRLDPbbihSKbVgq1540XfbaOVWSifqOoQ3zDht6mrvTxtB3yqD7ah8qg4CBLqwEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567229; c=relaxed/simple;
	bh=+E992wzniah1sWwkNrlSqzVJL/pB4W3oz+j8HWD7/E8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dWWIgeBKG2dTEn34YBV15UpL8TUr9ZezzigF5Fco6R1bJVIla21m+/KVcyxEK8McdWC8kLLiuzFMoiXo95P4V+SZ4fHyIGYUTwT84BGgnDpVJg0dNjA0wN7SVMiPR6J4bmJOaDdWJBLUNJ7IWceudhHS0g4ggUavB6duwKz9omw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aBApgiEB; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=88
	3GNpBzpZT0kzzAWtcd9tO1xmCz7U41eOWRk1IoUcE=; b=aBApgiEBRCh8GzVMLy
	sYAoVuCiAGbqNJcc7dwTsdqcy5YuCx3TX3zgJNtGzX5N9/hKFb/C+KMomq9mKTa6
	24S/FWE+ZpeXof0dISgzC74Co3jjfwtR58/OAHFrtIa6Olem0V8VtXxDViYDgyFJ
	GffQj64057y+SfMYmnXG7iuSs=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnUmm+hfNptZrZCg--.19910S5;
	Fri, 01 May 2026 00:39:29 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	mathias.nyman@intel.com,
	chunfeng.yun@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	badhri@google.com,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 3/6] usb: dwc3: dwc3-octeon: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:39:16 +0800
Message-Id: <20260430163919.47372-4-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430163919.47372-1-18255117159@163.com>
References: <20260430163919.47372-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnUmm+hfNptZrZCg--.19910S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW7uF4fKFyxAryfZFyrWFg_yoW8Aw4rpw
	n8C3WSyFnFkrn5uw45Gay8Aryrtay2krW8KryDJ3yxZw4DXrn7Wayqkw4rtrn8Wa4xtF10
	k3yvyrW3uFW5AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi-B_bUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AHojGnzhcHZvgAA3w
X-Rspamd-Queue-Id: EF61F4A5EAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[synopsys.com,linuxfoundation.org,linaro.org,intel.com,mediatek.com,gmail.com,collabora.com,google.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	TAGGED_FROM(0.00)[bounces-36790-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,163.com];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.992];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/usb/dwc3/dwc3-octeon.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 42bfc14ae0c4..2201f0f34abb 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -296,8 +296,7 @@ static int dwc3_octeon_setup(struct dwc3_octeon *octeon,
 		return div;
 	}
 	val = dwc3_octeon_readq(uctl_ctl_reg);
-	val &= ~USBDRD_UCTL_CTL_H_CLKDIV_SEL;
-	val |= FIELD_PREP(USBDRD_UCTL_CTL_H_CLKDIV_SEL, div);
+	FIELD_MODIFY(USBDRD_UCTL_CTL_H_CLKDIV_SEL, &val, div);
 	val |= USBDRD_UCTL_CTL_H_CLK_EN;
 	dwc3_octeon_writeq(uctl_ctl_reg, val);
 	val = dwc3_octeon_readq(uctl_ctl_reg);
@@ -314,14 +313,11 @@ static int dwc3_octeon_setup(struct dwc3_octeon *octeon,
 	/* Step 5a: Reference clock configuration. */
 	val = dwc3_octeon_readq(uctl_ctl_reg);
 	val &= ~USBDRD_UCTL_CTL_REF_CLK_DIV2;
-	val &= ~USBDRD_UCTL_CTL_REF_CLK_SEL;
-	val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_SEL, ref_clk_sel);
+	FIELD_MODIFY(USBDRD_UCTL_CTL_REF_CLK_SEL, &val, ref_clk_sel);
 
-	val &= ~USBDRD_UCTL_CTL_REF_CLK_FSEL;
-	val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_FSEL, ref_clk_fsel);
+	FIELD_MODIFY(USBDRD_UCTL_CTL_REF_CLK_FSEL, &val, ref_clk_fsel);
 
-	val &= ~USBDRD_UCTL_CTL_MPLL_MULTIPLIER;
-	val |= FIELD_PREP(USBDRD_UCTL_CTL_MPLL_MULTIPLIER, mpll_mul);
+	FIELD_MODIFY(USBDRD_UCTL_CTL_MPLL_MULTIPLIER, &val, mpll_mul);
 
 	/* Step 5b: Configure and enable spread-spectrum for SuperSpeed. */
 	val |= USBDRD_UCTL_CTL_SSC_EN;
-- 
2.34.1


