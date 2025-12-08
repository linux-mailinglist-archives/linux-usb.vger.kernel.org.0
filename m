Return-Path: <linux-usb+bounces-31300-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F1ACAE58B
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 23:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9F5F3028520
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 22:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FB42FDC30;
	Mon,  8 Dec 2025 22:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="lLzE9jSA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7B02C1585
	for <linux-usb@vger.kernel.org>; Mon,  8 Dec 2025 22:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765233812; cv=none; b=e5KCGILs/u5h04s5eJNXfvfmFIBk8uOflsK1nIx8AvYc4UEeuum3WCyT4l4wb+yFxR4B7CFX46v9SUc1bsDMO4ax3H9fRre8CnkZZ4/7nIeOL9bM8s1DeTIpQNRbD07nsuCm+zc+UpFqhyFtOhVLEAn5h5WveAbqFD+fQHrVZHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765233812; c=relaxed/simple;
	bh=fXGZ2M7xxYHgmTpQmtTDzEYbKvZXrYIjTdOkA45M/Q4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pLYpjVcHNE8AjJb8aMWo1Q+EkiO3mc4o6PMo+pYjKocLliT5JRuO8sCkz1UZZHYHNxUlP3CMgYSG9P+yvpJDRWuzQBXdqsjFGmzNkq1NV1LzJrt+kTFZcso0XM0tPsm7haeSHg6xAQwdoZ6wSMa7GEUKuPT+CBFH68xamFq8Wjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=lLzE9jSA; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjx2-00EpwA-Kv; Mon, 08 Dec 2025 23:43:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=pDzfAzksr2ZkqPsHEML95dRnTX61DmWnWyNEXtTl4FY=; b=lLzE9jSAe7v1sg+nYY9wWUTZz6
	F3zBf94BxvGYhskX/Vit7iwvYDCW+4BKTsrSU7tcEd6rWjAJrh89oySdijqlLXOR0jfya4c0PDFD+
	pMJK4NTIqHigTuzxFMhgLC36T3Qh+BSMvuMy7ChgZA/cP0SP2f1N/A1WkwrxzEeWGUCsxV7lfYgvq
	BX0jCejT92hqMy/8trQUQNkiJTUrEcxzZRng26WYrXDGD29s3Tcip+hLDLvXWHa2Wasku/EUeS1UG
	MZYeEtg0ku+qcUVnX+MIg6n1itJ/W8VIcIfCW5DW4Tz8RgCJuXQoDihtH3ZdrXLwZCzPKCNm2tGlY
	z9HnR00Q==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjx2-0003Ek-As; Mon, 08 Dec 2025 23:43:28 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vSjwj-00Ay0v-Tc; Mon, 08 Dec 2025 23:43:10 +0100
From: david.laight.linux@gmail.com
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH 8/9] bitfield: Add comment block for the host/fixed endian functions
Date: Mon,  8 Dec 2025 22:42:49 +0000
Message-Id: <20251208224250.536159-9-david.laight.linux@gmail.com>
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

Copied almost verbatim from the commit message that added the functions.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/bitfield.h | 43 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index bfd80ebd25b1..9feb489a8da3 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -181,6 +181,49 @@ do {								\
 	*_reg_p = (*_reg_p & ~_mask) | ((_val << __bf_shf(_mask)) & _mask);	\
 })
 
+/*
+ * Primitives for manipulating bitfields both in host- and fixed-endian.
+ *
+ * * u32 le32_get_bits(__le32 val, u32 field) extracts the contents of the
+ *   bitfield specified by @field in little-endian 32bit object @val and
+ *   converts it to host-endian.
+ *
+ * * void le32p_replace_bits(__le32 *p, u32 v, u32 field) replaces
+ *   the contents of the bitfield specified by @field in little-endian
+ *   32bit object pointed to by @p with the value of @v.  New value is
+ *   given in host-endian and stored as little-endian.
+ *
+ * * __le32 le32_replace_bits(__le32 old, u32 v, u32 field) is equivalent to
+ *   ({__le32 tmp = old; le32p_replace_bits(&tmp, v, field); tmp;})
+ *   In other words, instead of modifying an object in memory, it takes
+ *   the initial value and returns the modified one.
+ *
+ * * __le32 le32_encode_bits(u32 v, u32 field) is equivalent to
+ *   le32_replace_bits(0, v, field).  In other words, it returns a little-endian
+ *   32bit object with the bitfield specified by @field containing the
+ *   value of @v and all bits outside that bitfield being zero.
+ *
+ * Such set of helpers is defined for each of little-, big- and host-endian
+ * types; e.g. u64_get_bits(val, field) will return the contents of the bitfield
+ * specified by @field in host-endian 64bit object @val, etc.  Of course, for
+ * host-endian no conversion is involved.
+ *
+ * Fields to access are specified as GENMASK() values - an N-bit field
+ * starting at bit #M is encoded as GENMASK(M + N - 1, M).  Note that
+ * bit numbers refer to endianness of the object we are working with -
+ * e.g. GENMASK(11, 0) in __be16 refers to the second byte and the lower
+ * 4 bits of the first byte.  In __le16 it would refer to the first byte
+ * and the lower 4 bits of the second byte, etc.
+ *
+ * Field specification must be a constant; __builtin_constant_p() doesn't
+ * have to be true for it, but compiler must be able to evaluate it at
+ * build time.  If it cannot or if the value does not encode any bitfield,
+ * the build will fail.
+ *
+ * If the value being stored in a bitfield is a constant that does not fit
+ * into that bitfield, a warning will be generated at compile time.
+ */
+
 extern void __compiletime_error("value doesn't fit into mask")
 __field_overflow(void);
 extern void __compiletime_error("bad bitfield mask")
-- 
2.39.5


