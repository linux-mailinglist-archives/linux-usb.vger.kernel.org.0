Return-Path: <linux-usb+bounces-31298-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A66CAE588
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 23:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE34430364AF
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 22:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C072FD7A3;
	Mon,  8 Dec 2025 22:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="jWJHGCT3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104612F39AD;
	Mon,  8 Dec 2025 22:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765233811; cv=none; b=XawMp/8xMKgGEdJeirtE09vwzR4DTAMSsTZeePlpY/PpOK7mEnmu/EXkI3VParKj7iqYTf+fUpySB1eDvvlgU3n74J3lni29m6sE6veUP4uL+WmfwgWqdT0T8sCp1cyYcilm+uF5Evyt0mzSdEEGYRTGD013vifXzVqYaW7cJRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765233811; c=relaxed/simple;
	bh=r0JyqLB5s8BUcwpuoP7IpOoZ4xhcyEvbalDSYeF1rWU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U687Nqh45RrqT3S4T7K9a4z5aOjsReYPpAHbmlaD7RBNvoztRoaR/MJCTIZNINRG+ziMzWzqMILIMQwqkpo3UJrsPfFwBXKxtxXYrEqhxAnPkP4IoV0q8D7EG4lDBA+6oXwcWHTBYaShQo5YOJjlRtVrx3Ro5JzlyGa32eOyXFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=jWJHGCT3; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjx1-00F32N-DX; Mon, 08 Dec 2025 23:43:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=KikFFrDxLsLsfdxtpsUWRZaSixAcB7BcUoyENyDfy4k=; b=jWJHGCT3y0NseuBdld2Ne1QTuf
	FeV1qrnyWzBng5mOIeHas7FIVICJKU+XnUOoV1ZZkBRhmNlD04lbYvp7Yia33BvoU8mYwukNxyTkP
	wqW47butQVEUoQ9y2fjgE3ZhSeRIBS6Ct4wqifXEb3uJeW3dmAk+fa/Ttz+jGQSXdwl4PcUrAlAqt
	jO0WZf5JfadVe3jrYO0OeHXyuZqfZT+gP+oSTCxL+CykkS/dT+j9KEIgEIsn3VAAojrlUNZZhPTOT
	baPIP514yzvmUJPnCvXTxRiLM5/hTjJ0IrqF7hI9RaoZSVdgi/RgTwbYXX/B8wFeV5gYRg150B6yD
	lfKSkAGg==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjx1-0003EZ-4U; Mon, 08 Dec 2025 23:43:27 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vSjwi-00Ay0v-6j; Mon, 08 Dec 2025 23:43:08 +0100
From: david.laight.linux@gmail.com
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH 5/9] bitfield: FIELD_MODIFY: Only do a single read/write on the target
Date: Mon,  8 Dec 2025 22:42:46 +0000
Message-Id: <20251208224250.536159-6-david.laight.linux@gmail.com>
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

Replace the:
        *reg &= ~mask; *reg |= new_value;
with a single assignment.
While the compiler will usually optimise the extra access away
it isn't guaranteed.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/bitfield.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index 3e013da9ea12..3e0e8533bb66 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -200,8 +200,7 @@
 		__auto_type _val = 1 ? (val) : _mask;					\
 		typecheck_pointer(_reg_p);						\
 		__BF_FIELD_CHECK(_mask, *_reg_p, _val, "FIELD_MODIFY: ");		\
-		*_reg_p &= ~_mask;							\
-		*_reg_p |= ((_val << __bf_shf(_mask)) & _mask);				\
+		*_reg_p = (*_reg_p & ~_mask) | ((_val << __bf_shf(_mask)) & _mask);	\
 	})
 
 extern void __compiletime_error("value doesn't fit into mask")
-- 
2.39.5


