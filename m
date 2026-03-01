Return-Path: <linux-usb+bounces-33847-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFd7Mr1vpGnCgwUAu9opvQ
	(envelope-from <linux-usb+bounces-33847-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 01 Mar 2026 17:56:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C228A1D0C13
	for <lists+linux-usb@lfdr.de>; Sun, 01 Mar 2026 17:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 924203012CF0
	for <lists+linux-usb@lfdr.de>; Sun,  1 Mar 2026 16:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC373310655;
	Sun,  1 Mar 2026 16:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="LLwC0pGX"
X-Original-To: linux-usb@vger.kernel.org
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC73F33509B;
	Sun,  1 Mar 2026 16:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772384182; cv=none; b=Xng7NkmUkhKDF1pOyTV2W7CduZW7pkffnqUigAn8LU+ZFyBGr4qJQSvoBcYYmmZvsPjIa19EaYhPuLer5rToqSUW2pdD7U///TjUjFR94Hd4gReP2DM+u7/7skEQN1RffqtbfqK4gEHyfXWXrMCJS692CQANvelQ3KkhvFH0zSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772384182; c=relaxed/simple;
	bh=/2N2mut5xyhdCDV+Jgsm5XGZjuyhaDQ6DHibmsDf9ok=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Y7jZo72JEEN2mPMglp3SYPGi39XxoxAs3aPpyAhYyrnHMjuioMqh1fsV2YHfke8yPygqmr4pnw8VvhblJFA06OndyFg8BHPPr21BVmutPuqUlMGLfY9PoQO5qxqNDVfMwqbrB4OfGUHAqFGkloVDVSVqelDu8xHV6AY4AfuqFl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=LLwC0pGX; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772384174; bh=AGKfJIOqCfJn6YyVIORFGSHEpFhevr6E05nHroftI9I=;
	h=From:To:Cc:Subject:Date;
	b=LLwC0pGXlKBbiN3pFw4OZTlUJBXHi29KQHqZY3lItWREZVj/F50C0UPK3bZ3/zlwr
	 2vqYJa1i/ULp6PvrlkN5DIpMpNcdqXMZzroopacrU8lMIOPv/uwQCuwP/l+OD3jHVw
	 5FY2dVrsBJpy5+ZA+aABX8QG9m9m7dAqD7VJhito=
Received: from admin.. ([2001:da8:205:20a0:6eeb:b6ff:fe15:94a7])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id E0B9685E; Mon, 02 Mar 2026 00:56:11 +0800
X-QQ-mid: xmsmtpt1772384171t52bk8rnn
Message-ID: <tencent_358DF7F3BD49A6407C17B7B26307A3B0AC0A@qq.com>
X-QQ-XMAILINFO: MapnONytPuziie/+Dl/eU+NaMa7Ov1VVOtdJZl7fE9/JhdMXvasAF32pW0V8Dz
	 Q8ltQwfKM4YJOWNtOmWydYTmGXfPTcL0lSBCGgSrd83aa0FL3lEWFQTTxx/jyPhXm76TALBy3tgP
	 JGhSNt4ZVJuHrmU2ACAgsVnLACZ2M00bajpkEBbaybibUZ9N44vopSD1eobMWFKcY6OHOhWUR0tT
	 OECmoreJr08pooEEYXItby7VgMGfebO961cTpT60RYmq7aCjYr9JPk9u5Waezw8OL0j8DFmbOW1g
	 02JtnkPpZIMiHhF044Zv68k8sa0+YJcGUmlcbx32Asa7lBi8iJGFzRHm9fWu5fgbZz0nhb4ddL0O
	 lAb91mILBArmLxzEynN02rea02vFyeX0f3crp+A/KXboZN17e9eo1EHOLmyY6UZx9h0GSaqbyVT9
	 PITUs+TdrJliiRx2iWed0hmM/Zz8RsFc1ePESArwy/j7Rs2N2L9ilhlWCY9CJD7MN8nPZvw7S3gm
	 KoqC7dEaBZULgQjPraizOsPBUbQzG3na5A2cM812Y8ln74tZ2nCa4xodAXkxMXS5KSi7jfDvRXoU
	 H1jG4Q77aUvnxI3Zb4TBHJZSnjBfySVRCWLICdOg4Pu1xlitUG+8F+4YmLGp+hT+TwNB7Al7L919
	 pcbR4RjIfX8j4Af7nb/TeLApYSTrCD8KZvpY0Z3Rg7YXQa/ud8Is6VNJAHUhJ62P/7V4Ph7yWiRD
	 a7BW1+0dMAwsceImHOHFmV2+DkX8eqlW4gTB3t0Qaxsskecwdt5wvskX9aayO+/SyfbRSTaYnPmt
	 myyGF0a+9PDWMn5pIhc7s/g53TFQ4RTDMKxsnO/aHezTCJo60f4Ub/6h7RNHaYXQmqgZvcSvdlub
	 ygXREhLsVn0QPczqnha9BeZruBf4+6GYbfUeJPyVDRCX+wUt/3XHyO31ckiTCWUMm5LSad9AxWsI
	 TEapmt/15zClNIA4/6v+ZUXMbtwHeSWwzLrJ6aJH2+iPm64gvVT58bAs1ZKjSsX9yKxL+7xG7DU8
	 JR12R/pOdIlcRj5ovgg6HC2IIINiQ32ARhhacN6chsee6r3PhuqU3wCtwfXwtCMDV8bYbCDcvzQV
	 3ls7k706MpgBoGjwk=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhaoyang Yu <2426767509@qq.com>
To: sergei.shtylyov@gmail.com,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	gregkh@linuxfoundation.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhaoyang Yu <2426767509@qq.com>
Subject: [PATCH] USB: pxa27x_udc: check return value of clk_enable
Date: Sun,  1 Mar 2026 16:55:53 +0000
X-OQ-MSGID: <20260301165553.270546-1-2426767509@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33847-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,zonque.org,free.fr,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,qq.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2426767509@qq.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[qq.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C228A1D0C13
X-Rspamd-Action: no action

clk_enable() may fail according to the API contract.
Previously, udc_enable() ignored its return value.
This patch checks the return value and logs an error
without continuing initialization if clk_enable fails.

Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 897f53601b5b..006d6d0a5f9a 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -1693,10 +1693,16 @@ static void udc_init_data(struct pxa_udc *dev)
  */
 static void udc_enable(struct pxa_udc *udc)
 {
+	int ret;
+
 	if (udc->enabled)
 		return;
 
-	clk_enable(udc->clk);
+	ret = clk_enable(udc->clk);
+	if (ret) {
+		dev_err(udc->dev, "clk_enable failed: %d\n", ret);
+		return;
+	}
 	udc_writel(udc, UDCICR0, 0);
 	udc_writel(udc, UDCICR1, 0);
 	udc_clear_mask_UDCCR(udc, UDCCR_UDE);
-- 
2.34.1


