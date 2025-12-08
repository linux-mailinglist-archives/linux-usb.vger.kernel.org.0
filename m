Return-Path: <linux-usb+bounces-31299-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DED4CAE597
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 23:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9C0C30CAD2F
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 22:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553CD2FD7AE;
	Mon,  8 Dec 2025 22:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="m5NGDosF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C022D1F64
	for <linux-usb@vger.kernel.org>; Mon,  8 Dec 2025 22:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765233811; cv=none; b=Fn1pWX2ke9o2vz5OPpZ8LHgkHE2wL5rzv2+0L/nuC7f5QfYnr9mrZQydOTV6zDRTgIabZCsUtMsGdDa3y6D+VHHIZxy4sTMpTAxNICt1JN9jsIfKasD8sepYRrZ3RbgM0bQ3I2ufxbsBWH698G5madjektIfboXsv98zNPVkaPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765233811; c=relaxed/simple;
	bh=tSCid1sPM0NX+JcS8589gqV/qYOqQ9nwuLmgYPNoSTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M2j6D4q7vDsBmn8+bjHt2k8v0TX37gvNjaQZrR+3MnR+HHUWvTsVigfq3EtqRDabVO6obM8sWVkJOvyacPaLGZefbg6pC1WIxZ3F+rc8rIs8c/B3QYEsxIFwlTBGVcOpVz6+mNxJoEw3dpgHNoIpxQJDMzjq28cK/f0pgDEeHRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=m5NGDosF; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjx1-00Epvq-1c; Mon, 08 Dec 2025 23:43:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=OPG7fOtrkSC18N/RtHW1QBQqlawki4Y6k2/a0XZqajk=; b=m5NGDosFYbIE5QrMO2Kh5w7Tlv
	SXlJytA7EUVGKj2UXALD3AcPBWoYvkaY98QtvYMf7x+SAIKi0cxjQgZNPV07OJeKlo1PsdsURDmuZ
	NiooLxnVwK6rxPDJLXTz2TVZYMn1RHwYG4yQFtulo8OCehby9DkEkuLfxVRTq17z01hKmTf1X/nyy
	1LaQZwnFSGY2XOUxVbCrWy9rC4geRCTw3sh+iUhDtpnRuS/o0/6+wwlDA4FH6lFAu/yq8UzfWzrh5
	GplQe0XrbKoJ8unYuOfsS8Q3FK9tiHkAX5JHi27Rg2s0wXlLn1XEvtYoMM0GtgHcjm0uwKETP92/L
	XOc5CDxA==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjx0-0001vQ-Ni; Mon, 08 Dec 2025 23:43:26 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vSjwi-00Ay0v-M7; Mon, 08 Dec 2025 23:43:08 +0100
From: david.laight.linux@gmail.com
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH 6/9] bitfield: Update sanity checks
Date: Mon,  8 Dec 2025 22:42:47 +0000
Message-Id: <20251208224250.536159-7-david.laight.linux@gmail.com>
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

Simplify the check for 'reg' being large enough to hold 'mask' using
sizeof (reg) rather than a convoluted scheme to generate an unsigned
type the same size as 'reg'.

There are three places where the mask is checked for being non-zero
and contiguous. Add a simple expression that checks it and use in
all three places.

Three of the five calls to __BF_FIELD_CHECK_MASK() don't have a 'value'
to check, separate out as was done to __BF_FIELD_CHECK_REG().

There is no point checking a 'val' of zero or a 'reg' of 0ULL (both
are placeholders) - remove/change the calls.

There should be a check of __BF_FIELD_CHECK_REG() when __BF_FIELD_GET()
is called from field_get().
Move the check from FIELD_GET() into __BF_FIELD_GET().

Delete the now-unused __BF_FIELD_CHECK().

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/bitfield.h | 74 ++++++++++++++--------------------------
 1 file changed, 26 insertions(+), 48 deletions(-)

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index 3e0e8533bb66..7e8d436b6571 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -45,55 +45,38 @@
 
 #define __bf_shf(x) (__builtin_ffsll(x) - 1)
 
-#define __scalar_type_to_unsigned_cases(type)				\
-		unsigned type:	(unsigned type)0,			\
-		signed type:	(unsigned type)0
+#define __BF_VALIDATE_MASK(mask) \
+	(!(mask) || ((mask) & ((mask) + ((mask) & -(mask)))))
 
-#define __unsigned_scalar_typeof(x) typeof(				\
-		_Generic((x),						\
-			char:	(unsigned char)0,			\
-			__scalar_type_to_unsigned_cases(char),		\
-			__scalar_type_to_unsigned_cases(short),		\
-			__scalar_type_to_unsigned_cases(int),		\
-			__scalar_type_to_unsigned_cases(long),		\
-			__scalar_type_to_unsigned_cases(long long),	\
-			default: (x)))
-
-#define __bf_cast_unsigned(type, x)	((__unsigned_scalar_typeof(type))(x))
-
-#define __BF_FIELD_CHECK_MASK(mask, val, pfx)				\
-	({								\
+#define __BF_FIELD_CHECK_MASK(mask, pfx)				\
+	do {								\
 		BUILD_BUG_ON_MSG(!__builtin_constant_p(mask),		\
 				 pfx "mask is not constant");		\
-		BUILD_BUG_ON_MSG((mask) == 0, _pfx "mask is zero");	\
-		BUILD_BUG_ON_MSG(__builtin_constant_p(val) ?		\
-				 ~((mask) >> __bf_shf(mask)) &		\
-					(0 + (val)) : 0,		\
-				 pfx "value too large for the field");	\
-		__BUILD_BUG_ON_NOT_POWER_OF_2((mask) +			\
-					      (1ULL << __bf_shf(mask))); \
-	})
+		BUILD_BUG_ON_MSG(__BF_VALIDATE_MASK(mask),		\
+				 pfx "mask is zero or not contiguous");	\
+	} while (0)
+
+#define __BF_FIELD_CHECK_VAL(mask, val, pfx)			\
+	BUILD_BUG_ON_MSG(__builtin_constant_p(val) &&		\
+			 ~((mask) >> __bf_shf(mask)) & (val),	\
+			 pfx "value too large for the field")
 
 #define __BF_FIELD_CHECK_REG(mask, reg, pfx)				\
-	BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >		\
-			 __bf_cast_unsigned(reg, ~0ull),		\
+	BUILD_BUG_ON_MSG(mask + 0U + 0UL + 0ULL >			\
+			 ~0ULL >> (64 - 8 * sizeof (reg)),		\
 			 pfx "type of reg too small for mask")
 
-#define __BF_FIELD_CHECK(mask, reg, val, pfx)				\
-	({								\
-		__BF_FIELD_CHECK_MASK(mask, val, pfx);			\
-		__BF_FIELD_CHECK_REG(mask, reg, pfx);			\
-	})
-
 #define __BF_FIELD_PREP(mask, val, pfx)					\
 	({								\
-		__BF_FIELD_CHECK_MASK(mask, val, pfx);			\
+		__BF_FIELD_CHECK_MASK(mask, pfx);			\
+		__BF_FIELD_CHECK_VAL(mask, val, pfx);			\
 		((val) << __bf_shf(mask)) & (mask);			\
 	})
 
 #define __BF_FIELD_GET(mask, reg, pfx)					\
 	({								\
-		__BF_FIELD_CHECK_MASK(mask, 0U, pfx);			\
+		__BF_FIELD_CHECK_MASK(mask, pfx);			\
+		__BF_FIELD_CHECK_REG(mask, reg, pfx);			\
 		((reg) & (mask)) >> __bf_shf(mask);			\
 	})
 
@@ -107,7 +90,7 @@
 #define FIELD_MAX(mask)							\
 	({								\
 		__auto_type _mask = mask;				\
-		__BF_FIELD_CHECK(_mask, 0ULL, 0ULL, "FIELD_MAX: ");	\
+		__BF_FIELD_CHECK_MASK(_mask, "FIELD_MAX: ");		\
 		(_mask >> __bf_shf(_mask));				\
 	})
 
@@ -122,7 +105,7 @@
 	({								\
 		__auto_type _mask = mask;				\
 		__auto_type _val = 1 ? (val) : _mask;			\
-		__BF_FIELD_CHECK(_mask, 0ULL, 0ULL, "FIELD_FIT: ");	\
+		__BF_FIELD_CHECK_MASK(_mask, "FIELD_FIT: ");		\
 		!((_val << __bf_shf(_mask)) & ~_mask); 			\
 	})
 
@@ -138,12 +121,9 @@
 	({								\
 		__auto_type _mask = mask;				\
 		__auto_type _val = 1 ? (val) : _mask;			\
-		__BF_FIELD_CHECK_REG(_mask, 0ULL, "FIELD_PREP: ");	\
 		__BF_FIELD_PREP(_mask, _val, "FIELD_PREP: ");		\
 	})
 
-#define __BF_CHECK_POW2(n)	BUILD_BUG_ON_ZERO(((n) & ((n) - 1)) != 0)
-
 /**
  * FIELD_PREP_CONST() - prepare a constant bitfield element
  * @mask: shifted mask defining the field's length and position
@@ -158,12 +138,10 @@
  */
 #define FIELD_PREP_CONST(mask, val)					\
 	(								\
-		/* mask must be non-zero */				\
-		BUILD_BUG_ON_ZERO((mask) == 0) +			\
+		/* mask must be non-zero and contiguous */		\
+		BUILD_BUG_ON_ZERO(__BF_VALIDATE_MASK(mask)) +		\
 		/* check if value fits */				\
 		BUILD_BUG_ON_ZERO(~((mask) >> __bf_shf(mask)) & (val)) + \
-		/* check if mask is contiguous */			\
-		__BF_CHECK_POW2((mask) + (1ULL << __bf_shf(mask))) +	\
 		/* and create the value */				\
 		(((typeof(mask))(val) << __bf_shf(mask)) & (mask))	\
 	)
@@ -180,7 +158,6 @@
 	({								\
 		__auto_type _mask = mask;				\
 		__auto_type _reg = reg;					\
-		__BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: ");	\
 		__BF_FIELD_GET(_mask, _reg, "FIELD_GET: ");		\
 	})
 
@@ -198,8 +175,9 @@
 		__auto_type _mask = mask;						\
 		__auto_type _reg_p = reg_p;						\
 		__auto_type _val = 1 ? (val) : _mask;					\
-		typecheck_pointer(_reg_p);						\
-		__BF_FIELD_CHECK(_mask, *_reg_p, _val, "FIELD_MODIFY: ");		\
+		__BF_FIELD_CHECK_MASK(_mask, "FIELD_MODIFY: ");				\
+		__BF_FIELD_CHECK_VAL(_mask, _val, "FIELD_MODIFY: ");			\
+		__BF_FIELD_CHECK_REG(_mask, *_reg_p, "FIELD_MODIFY: ");			\
 		*_reg_p = (*_reg_p & ~_mask) | ((_val << __bf_shf(_mask)) & _mask);	\
 	})
 
@@ -209,7 +187,7 @@ extern void __compiletime_error("bad bitfield mask")
 __bad_mask(void);
 static __always_inline u64 field_multiplier(u64 field)
 {
-	if ((field | (field - 1)) & ((field | (field - 1)) + 1))
+	if (__BF_VALIDATE_MASK(field))
 		__bad_mask();
 	return field & -field;
 }
-- 
2.39.5


