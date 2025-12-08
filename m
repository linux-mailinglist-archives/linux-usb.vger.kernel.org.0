Return-Path: <linux-usb+bounces-31293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D180CAE56D
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 23:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 031873064AD6
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 22:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267782FD67B;
	Mon,  8 Dec 2025 22:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="ZSlq7pTI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8462A2D1F64;
	Mon,  8 Dec 2025 22:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765233793; cv=none; b=d6l+LxqCAbffz9ikXBPlVtlcUo3Dkm/eO/+1T33ncivBaXfWXqvztULKNbiS76Sq2ITgjmy2ogDQNrCVk9Htsu9B1eGJ5+jcjCOYoDTJdAM385C3Liae22R0OpJLITHJPL2JqDOZ/KjbnGj3vYrYFYojfqaPGxn3G0inV3hf9WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765233793; c=relaxed/simple;
	bh=tsxt7GqGU2Y6aR3ftGYfuyEw4FuK0QVGoidAfI/vkNw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OdM8YxvWr2rQ8nDqAWQIifp3MnzpnhqhQofpS2bDDOGq9dSISsGviQ1KvPbj2ojBK2dcEvuKPCwWN86PW0IyKQ2CHI+/+l+DbVtLr2y5ATve985s7nF3mDf84VJL5ujZ+TKlCk/xpSk9JLbmMIfcNsYSODiH+2j/Enqi0mUek00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=ZSlq7pTI; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjwi-00F30t-GI; Mon, 08 Dec 2025 23:43:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=pUFM0r0NZk4jg8TL6THMB9VhU15mhoWWVIu+KybWqt4=; b=ZSlq7pTIpMz/P3V3HZicUTGcEv
	IYGCgmfhds2xy3t2xCnA22WJjJG25Tg8EAeyM2fEEpGZNsSnCv3zcwsFNR5tQgF6lw2MY+ee4EWgV
	51nBLn0QYPpq2m4ZIXo8D8JetAo3IdjGuj51zLUB9bFQKJqU3yqnVkoTM3kDfocFBXyIA/xGHirEQ
	y7BKdQ4Lob6TzORtWp+mOCn0rJUcndHSpeb/eNN7+EYzvhjU07dFBcjcXITL4HC6KvIG3DYAM7sEh
	h3qtq4ruHtkwwlzil4DsFhfQkEZRwfVoh/JPK9VVOvx85u3xeW1Oggvn1eiXuDJ/J2CHLIqUrJiAZ
	fWziXVKw==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjwi-0003Cs-6c; Mon, 08 Dec 2025 23:43:08 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vSjwg-00Ay0v-FW; Mon, 08 Dec 2025 23:43:06 +0100
From: david.laight.linux@gmail.com
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH 2/9] thunderblot: Don't pass a bitfield to FIELD_GET
Date: Mon,  8 Dec 2025 22:42:43 +0000
Message-Id: <20251208224250.536159-3-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251208224250.536159-1-david.laight.linux@gmail.com>
References: <20251208224250.536159-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Laight <david.laight.linux@gmail.com>

FIELD_GET needs to use __auto_type to get the value of the 'reg'
parameter, this can't be used with bifields.

FIELD_GET also want to verify the size of 'reg' so can't add zero
to force the type to int.

So add a zero here.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 drivers/thunderbolt/tb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e96474f17067..7ca2b5a0f01e 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1307,7 +1307,7 @@ static inline struct tb_retimer *tb_to_retimer(struct device *dev)
  */
 static inline unsigned int usb4_switch_version(const struct tb_switch *sw)
 {
-	return FIELD_GET(USB4_VERSION_MAJOR_MASK, sw->config.thunderbolt_version);
+	return FIELD_GET(USB4_VERSION_MAJOR_MASK, sw->config.thunderbolt_version + 0);
 }
 
 /**
-- 
2.39.5


