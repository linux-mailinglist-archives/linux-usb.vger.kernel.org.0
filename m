Return-Path: <linux-usb+bounces-31295-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFF9CAE567
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 23:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E609A300A55C
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 22:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA062FD7AE;
	Mon,  8 Dec 2025 22:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="kYSQqbHF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68132E62B5
	for <linux-usb@vger.kernel.org>; Mon,  8 Dec 2025 22:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765233793; cv=none; b=oiQX3i3c3sflzUEXA8DNL3/px/6KaHFEpSo9OyjHDuhG3qovqolJF1h0d0WHAi4VTjKXifOl76B3xFj/qNAfqNL7hln0gP3GIXrhHJA75kiZCsbnuanFxacJ3Kxt3+dQjMU7yW+ts9Q26xJOAbcct/RsNgYxrTggbIt3Ax2gy9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765233793; c=relaxed/simple;
	bh=9GEZ1qcQcq+OU+/HJx1o4UIA998BTTxrtDXBo1mZRD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G1cfudwmzMWAb09qYUc7eRwB0+vynQVB82mUaFDkLHByOLQYnUb72Sj+raDXhKFRaiG/sc/Gqt9fjm4J29qNXKOWmxclJ4Llosn8hl8hWygSJrVFUXzw3FhYWtpoB15MksVO647n8BzRHDtxb1Q8nb/rTkSPaJ0e3cFnH92gt64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=kYSQqbHF; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjwj-00F31E-DR
	for linux-usb@vger.kernel.org; Mon, 08 Dec 2025 23:43:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=YGnBBG9ZzprxJLEp94vtepq3lcPSfdeE6BD41wIj1gg=; b=kYSQqbHFJhLqsnHQKHCnOz3z0p
	V/HhDLEPxJ7F81L4K5O8+HlPQjKhCSp5A1W25Dn5LQcwAEJ8gvZT6Oz6hBU/pFcQd7z8azayXTERA
	U+CMN+UWUMzoPk9fLh5K5PRrNttKNFPCkHlckDRODCbDSS9v0LpQQlwM7Rk8zGfVTtygie1cYE99l
	NU1JJk3SrPnotrwVtpZfvZyb6Pwac3nAm+qp5G835tseawoCyKRk+ps+hXLkiOb/yhE18L7NFIVOb
	/mNSQUTIpoT0cis2LJWlX3BAJ/NM41VVU4+7yYT9vfOVgSQwmHnfJp5vnqA53dJmTGv91reD2zhGs
	eQgMsigA==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjwj-0003Cx-2i; Mon, 08 Dec 2025 23:43:09 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vSjwh-00Ay0v-1a; Mon, 08 Dec 2025 23:43:07 +0100
From: david.laight.linux@gmail.com
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH 3/9] bitmap: Use FIELD_PREP() in expansion of FIELD_PREP_WM16()
Date: Mon,  8 Dec 2025 22:42:44 +0000
Message-Id: <20251208224250.536159-4-david.laight.linux@gmail.com>
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

Instead of directly expanding __BF_FIELD_CHECK() (which really ought
not be used outside bitfield) and open-coding the generation of the
masked value, just call FIELD_PREP() and add an extra check for
the mask being at most 16 bits.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/hw_bitfield.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/include/linux/hw_bitfield.h b/include/linux/hw_bitfield.h
index df202e167ce4..d7f21b60449b 100644
--- a/include/linux/hw_bitfield.h
+++ b/include/linux/hw_bitfield.h
@@ -23,15 +23,14 @@
  * register, a bit in the lower half is only updated if the corresponding bit
  * in the upper half is high.
  */
-#define FIELD_PREP_WM16(_mask, _val)					     \
-	({								     \
-		typeof(_val) __val = _val;				     \
-		typeof(_mask) __mask = _mask;				     \
-		__BF_FIELD_CHECK(__mask, ((u16)0U), __val,		     \
-				 "HWORD_UPDATE: ");			     \
-		(((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) | \
-		((__mask) << 16);					     \
-	})
+#define FIELD_PREP_WM16(mask, val)				\
+({								\
+	__auto_type _mask = mask;				\
+	u32 _val = FIELD_PREP(_mask, val);			\
+	BUILD_BUG_ON_MSG(_mask > 0xffffu,			\
+			 "FIELD_PREP_WM16: mask too large");	\
+	_val | (_mask << 16);					\
+})
 
 /**
  * FIELD_PREP_WM16_CONST() - prepare a constant bitfield element with a mask in
-- 
2.39.5


