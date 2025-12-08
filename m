Return-Path: <linux-usb+bounces-31301-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C84CAE5A3
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 23:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBD4E30D5CCB
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 22:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24A42DEA90;
	Mon,  8 Dec 2025 22:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="g+o5oV8N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458DD2FD1B0;
	Mon,  8 Dec 2025 22:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765233813; cv=none; b=ZCwvXpa7sezw1HOzLXjVYYTHXR4INII70hhnd8F05Bux5kLQAhoGCtn7Ern4K+HMiQqdC77fNB/OzRU8xWv112zhE9+jAnC4Y/i74VBHHJKFM+5wLC1FK5Mv5Zq8JGA22R1ZRThxz3R5gSAMjzhh2y3XC4YA55cDw2RcS4CG67k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765233813; c=relaxed/simple;
	bh=E4cqdyWnTy6bAeX8CvB1yK9sMkTu2li1KwGCMYFsl7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qot6oHKXevXiZMxou1YFrzIcjruJNQb5Po+bKHnbUyH8ff6yIqNn1IWtpdKEsCAmatCXmJLnYNNZB6/R4dGb8z+9oN7BtrPwzPDaCsQoLuxTZSyxfJ60RdWemEfucfAKC2u5ntEiTAI4DAkHgvG5pTGcmB9MSe7z5A4cm6oZCaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=g+o5oV8N; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjx3-00F33O-Gd; Mon, 08 Dec 2025 23:43:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=bsZokk41/Z+0gE+q67wcjT3/DTqcuPp1ab0Znae2e7U=; b=g+o5oV8NSuFfMe0JfQ9dKxLtAu
	fBH0WhZaWwW4i1Tm8j6QClBL1Tie+1EmtNznufVeZuDnlhE5mYLx1xatwbj6E4SkYyILTxftHB2qw
	wEA6Ta5J7yrUYefkjNclHxFg+PDUQraY877fx1f9Mwe322N4MCRETAFcXdymqnejRdPMZKq2X6DN8
	z9O2iai70dJyNyqCTy+ap0gWbyWP/7JPvRvqVYYB97frQFXqKaKqhSwnE05U/0RRTSTAfdihUjAvp
	jS9cIOeBA26klgW/kmWBbUl9PdQQarmun8pTLWMapmnVj8awZ18Kmu53cilo8gMnQGIATxT8kQhnn
	F7Xqexxg==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjx3-0003Eq-5X; Mon, 08 Dec 2025 23:43:29 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vSjwk-00Ay0v-I1; Mon, 08 Dec 2025 23:43:10 +0100
From: david.laight.linux@gmail.com
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH 9/9] bitfield: Update comments for le/be functions
Date: Mon,  8 Dec 2025 22:42:50 +0000
Message-Id: <20251208224250.536159-10-david.laight.linux@gmail.com>
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

Make it clear the the values are converted to host order before
being acted on.
Order the explantions with the simple functions first.

These still need converting to kerneldoc format.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/bitfield.h | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index 9feb489a8da3..dcc4809b4706 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -184,24 +184,24 @@ do {								\
 /*
  * Primitives for manipulating bitfields both in host- and fixed-endian.
  *
- * * u32 le32_get_bits(__le32 val, u32 field) extracts the contents of the
- *   bitfield specified by @field in little-endian 32bit object @val and
- *   converts it to host-endian.
  *
- * * void le32p_replace_bits(__le32 *p, u32 v, u32 field) replaces
- *   the contents of the bitfield specified by @field in little-endian
- *   32bit object pointed to by @p with the value of @v.  New value is
- *   given in host-endian and stored as little-endian.
+ * * u32 le32_get_bits(__le32 val, u32 field) converts the little-endian 32bit
+ *   object @val to host-endian then extracts the contents of the bitfield
+ *   specified by @field.
+ *
+ * * __le32 le32_encode_bits(u32 v, u32 field) encodes the value of @v into
+ *   the bitfield specified by @field then converts the value to little-endian.
+ *   All the bits outside that bitfield being zero.
  *
- * * __le32 le32_replace_bits(__le32 old, u32 v, u32 field) is equivalent to
- *   ({__le32 tmp = old; le32p_replace_bits(&tmp, v, field); tmp;})
- *   In other words, instead of modifying an object in memory, it takes
- *   the initial value and returns the modified one.
+ * * __le32 le32_replace_bits(__le32 old, u32 v, u32 field) converts the
+ *   little-endian 32bit object @old to host order, replaces the contents
+ *   of the bitfield specified by @field with @v, then returns the value
+ *   converted back to little-endian.
  *
- * * __le32 le32_encode_bits(u32 v, u32 field) is equivalent to
- *   le32_replace_bits(0, v, field).  In other words, it returns a little-endian
- *   32bit object with the bitfield specified by @field containing the
- *   value of @v and all bits outside that bitfield being zero.
+ * * void le32p_replace_bits(__le32 *p, u32 v, u32 field) replaces
+ *   the contents of the bitfield specified by @field in little-endian
+ *   32bit object pointed to by @p with the value of @v.
+ *   Equivalent to *p = le32_replace_bits(*p, v, field).
  *
  * Such set of helpers is defined for each of little-, big- and host-endian
  * types; e.g. u64_get_bits(val, field) will return the contents of the bitfield
@@ -210,15 +210,13 @@ do {								\
  *
  * Fields to access are specified as GENMASK() values - an N-bit field
  * starting at bit #M is encoded as GENMASK(M + N - 1, M).  Note that
- * bit numbers refer to endianness of the object we are working with -
+ * bit numbers refer to the value after being converted to host order -
  * e.g. GENMASK(11, 0) in __be16 refers to the second byte and the lower
  * 4 bits of the first byte.  In __le16 it would refer to the first byte
  * and the lower 4 bits of the second byte, etc.
  *
- * Field specification must be a constant; __builtin_constant_p() doesn't
- * have to be true for it, but compiler must be able to evaluate it at
- * build time.  If it cannot or if the value does not encode any bitfield,
- * the build will fail.
+ * Field specification must be a non-zero constant, otherwise the build
+ * will fail.
  *
  * If the value being stored in a bitfield is a constant that does not fit
  * into that bitfield, a warning will be generated at compile time.
-- 
2.39.5


