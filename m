Return-Path: <linux-usb+bounces-31296-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7742CAE579
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 23:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 985853088A1B
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 22:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC642FD7BE;
	Mon,  8 Dec 2025 22:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="nl5RIDVU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C122DEA90
	for <linux-usb@vger.kernel.org>; Mon,  8 Dec 2025 22:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765233793; cv=none; b=Zg0roxB1ViOR/E5RIbJ8/mjPzBM6ogm0moUKdSt7BN8PsnP0Zo/hf/kjMEP6T7IzkhM7IK6964wzGwufle964CXlVNP+FZK5wgrGkvW6q7niOL2gdfr4nDoIV0JRLMAp/NzWy2edQbdvLZJqw46cRsWTzzPR9WO1K/Ca9X8JTao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765233793; c=relaxed/simple;
	bh=j3EM9vwF8jfgyFYKrbFC2169fDDUS7n4xUANAz/Tg68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CU6xH06g0I/OYHSVvJWrfqgg2rQsCYsqdhbgmYd8RSBc8oI/dYQ7Wam2bl12pvvPXMDO4TAOFBOF3zGagvdW1uyPxFY1ZIlh6gr3OWsM5CrFiACKfKgLktNFF5x8+2YscUGP20wwSisn2e89pXsBBJ4ivBQOpvj4ZEKNeg+JKhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=nl5RIDVU; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjwj-00F317-0L; Mon, 08 Dec 2025 23:43:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=Tw0kZy0+QPkTSZB4LgJsoDNSboZbkMKQvG1G43UWtIA=; b=nl5RIDVUdfXauFV6O87orHw6zH
	J3qDyEjHw8K2Uz5MaWPZwkjhLbLzT/q4AuoX5FQeYuuE6MyR1sMrOqPEVFMrE8nuv/dJjhndA+5/J
	2ojMpzrly1tIofzkBS/UPbsZjzzSZp/ay/NkcIVi5XOKud4R9rx1yqDY+vDRxpp/uWf7FY2jFPlng
	5WOKKBQdibxrz40ek8kBQ4Qokyw9r6XObPlGvdLdNkPTuGstVIP4XZkdcjLzrlWIgjQrNjCmwzmCU
	BHR7+92z7YHr/v0nii3k+xpqH2FZJwi1wyGmrFTfYWLNjvOy1AUfGItfc+8kxw3+NTOX8CINbOyIr
	QdYDExtw==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSjwi-0001tm-Kx; Mon, 08 Dec 2025 23:43:08 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vSjwh-00Ay0v-Lm; Mon, 08 Dec 2025 23:43:07 +0100
From: david.laight.linux@gmail.com
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH 4/9] bitfield: Copy #define parameters to locals
Date: Mon,  8 Dec 2025 22:42:45 +0000
Message-Id: <20251208224250.536159-5-david.laight.linux@gmail.com>
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

Use __auto_type to take copies of parameters to both ensure they are
evaluated only once and to avoid bloating the pre-processor output.
In particular 'mask' is likely to be GENMASK() and the expension
of FIELD_GET() is then about 18KB.

Remove any extra (), update kerneldoc.

Consistently use xxx for #define formal parameters and _xxx for
local variables.

Rather than use (typeof(mask))(val) to ensure bits aren't lost when
val is shifted left, use '__auto_type _val = 1 ? (val) : _mask;'
relying on the ?: operator to generate a type that is large enough.

Remove the (typeof(mask)) cast from __FIELD_GET(), it can only make
a difference if 'reg' is larger than 'mask' and the caller cares about
the actual type.
Note that mask usually comes from GENMASK() and is then 'unsigned long'.

Rename the internal defines __FIELD_PREP to __BF_FIELD_PREP and
__FIELD_GET to __BF_FIELD_GET.

Now that field_prep() and field_get() copy their parameters there is
no need for the __field_prep() and __field_get() defines.
But add a define to generate the required 'shift' to use in both defines.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/bitfield.h | 150 ++++++++++++++++++++-------------------
 1 file changed, 78 insertions(+), 72 deletions(-)

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index 126dc5b380af..3e013da9ea12 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -61,17 +61,17 @@
 
 #define __bf_cast_unsigned(type, x)	((__unsigned_scalar_typeof(type))(x))
 
-#define __BF_FIELD_CHECK_MASK(_mask, _val, _pfx)			\
+#define __BF_FIELD_CHECK_MASK(mask, val, pfx)				\
 	({								\
-		BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),		\
-				 _pfx "mask is not constant");		\
-		BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");	\
-		BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?		\
-				 ~((_mask) >> __bf_shf(_mask)) &	\
-					(0 + (_val)) : 0,		\
-				 _pfx "value too large for the field"); \
-		__BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +			\
-					      (1ULL << __bf_shf(_mask))); \
+		BUILD_BUG_ON_MSG(!__builtin_constant_p(mask),		\
+				 pfx "mask is not constant");		\
+		BUILD_BUG_ON_MSG((mask) == 0, _pfx "mask is zero");	\
+		BUILD_BUG_ON_MSG(__builtin_constant_p(val) ?		\
+				 ~((mask) >> __bf_shf(mask)) &		\
+					(0 + (val)) : 0,		\
+				 pfx "value too large for the field");	\
+		__BUILD_BUG_ON_NOT_POWER_OF_2((mask) +			\
+					      (1ULL << __bf_shf(mask))); \
 	})
 
 #define __BF_FIELD_CHECK_REG(mask, reg, pfx)				\
@@ -85,64 +85,69 @@
 		__BF_FIELD_CHECK_REG(mask, reg, pfx);			\
 	})
 
-#define __FIELD_PREP(mask, val, pfx)					\
+#define __BF_FIELD_PREP(mask, val, pfx)					\
 	({								\
 		__BF_FIELD_CHECK_MASK(mask, val, pfx);			\
-		((typeof(mask))(val) << __bf_shf(mask)) & (mask);	\
+		((val) << __bf_shf(mask)) & (mask);			\
 	})
 
-#define __FIELD_GET(mask, reg, pfx)					\
+#define __BF_FIELD_GET(mask, reg, pfx)					\
 	({								\
 		__BF_FIELD_CHECK_MASK(mask, 0U, pfx);			\
-		(typeof(mask))(((reg) & (mask)) >> __bf_shf(mask));	\
+		((reg) & (mask)) >> __bf_shf(mask);			\
 	})
 
 /**
  * FIELD_MAX() - produce the maximum value representable by a field
- * @_mask: shifted mask defining the field's length and position
+ * @mask: shifted mask defining the field's length and position
  *
  * FIELD_MAX() returns the maximum value that can be held in the field
- * specified by @_mask.
+ * specified by @mask.
  */
-#define FIELD_MAX(_mask)						\
+#define FIELD_MAX(mask)							\
 	({								\
+		__auto_type _mask = mask;				\
 		__BF_FIELD_CHECK(_mask, 0ULL, 0ULL, "FIELD_MAX: ");	\
-		(typeof(_mask))((_mask) >> __bf_shf(_mask));		\
+		(_mask >> __bf_shf(_mask));				\
 	})
 
 /**
  * FIELD_FIT() - check if value fits in the field
- * @_mask: shifted mask defining the field's length and position
- * @_val:  value to test against the field
+ * @mask: shifted mask defining the field's length and position
+ * @val:  value to test against the field
  *
- * Return: true if @_val can fit inside @_mask, false if @_val is too big.
+ * Return: true if @val can fit inside @mask, false if @val is too big.
  */
-#define FIELD_FIT(_mask, _val)						\
+#define FIELD_FIT(mask, val)						\
 	({								\
+		__auto_type _mask = mask;				\
+		__auto_type _val = 1 ? (val) : _mask;			\
 		__BF_FIELD_CHECK(_mask, 0ULL, 0ULL, "FIELD_FIT: ");	\
-		!((((typeof(_mask))_val) << __bf_shf(_mask)) & ~(_mask)); \
+		!((_val << __bf_shf(_mask)) & ~_mask); 			\
 	})
 
 /**
  * FIELD_PREP() - prepare a bitfield element
- * @_mask: shifted mask defining the field's length and position
- * @_val:  value to put in the field
+ * @mask: shifted mask defining the field's length and position
+ * @val:  value to put in the field
  *
  * FIELD_PREP() masks and shifts up the value.  The result should
  * be combined with other fields of the bitfield using logical OR.
  */
-#define FIELD_PREP(_mask, _val)						\
+#define FIELD_PREP(mask, val)						\
 	({								\
+		__auto_type _mask = mask;				\
+		__auto_type _val = 1 ? (val) : _mask;			\
 		__BF_FIELD_CHECK_REG(_mask, 0ULL, "FIELD_PREP: ");	\
-		__FIELD_PREP(_mask, _val, "FIELD_PREP: ");		\
+		__BF_FIELD_PREP(_mask, _val, "FIELD_PREP: ");		\
 	})
 
 #define __BF_CHECK_POW2(n)	BUILD_BUG_ON_ZERO(((n) & ((n) - 1)) != 0)
 
 /**
  * FIELD_PREP_CONST() - prepare a constant bitfield element
- * @_mask: shifted mask defining the field's length and position
- * @_val:  value to put in the field
+ * @mask: shifted mask defining the field's length and position
+ * @val:  value to put in the field
  *
  * FIELD_PREP_CONST() masks and shifts up the value.  The result should
  * be combined with other fields of the bitfield using logical OR.
@@ -151,47 +156,52 @@
  * be used in initializers. Error checking is less comfortable for this
  * version, and non-constant masks cannot be used.
  */
-#define FIELD_PREP_CONST(_mask, _val)					\
+#define FIELD_PREP_CONST(mask, val)					\
 	(								\
 		/* mask must be non-zero */				\
-		BUILD_BUG_ON_ZERO((_mask) == 0) +			\
+		BUILD_BUG_ON_ZERO((mask) == 0) +			\
 		/* check if value fits */				\
-		BUILD_BUG_ON_ZERO(~((_mask) >> __bf_shf(_mask)) & (_val)) + \
+		BUILD_BUG_ON_ZERO(~((mask) >> __bf_shf(mask)) & (val)) + \
 		/* check if mask is contiguous */			\
-		__BF_CHECK_POW2((_mask) + (1ULL << __bf_shf(_mask))) +	\
+		__BF_CHECK_POW2((mask) + (1ULL << __bf_shf(mask))) +	\
 		/* and create the value */				\
-		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))	\
+		(((typeof(mask))(val) << __bf_shf(mask)) & (mask))	\
 	)
 
 /**
  * FIELD_GET() - extract a bitfield element
- * @_mask: shifted mask defining the field's length and position
- * @_reg:  value of entire bitfield
+ * @mask: shifted mask defining the field's length and position
+ * @reg:  value of entire bitfield
  *
- * FIELD_GET() extracts the field specified by @_mask from the
- * bitfield passed in as @_reg by masking and shifting it down.
+ * FIELD_GET() extracts the field specified by @mask from the
+ * bitfield passed in as @reg by masking and shifting it down.
  */
-#define FIELD_GET(_mask, _reg)						\
+#define FIELD_GET(mask, reg)						\
 	({								\
+		__auto_type _mask = mask;				\
+		__auto_type _reg = reg;					\
 		__BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: ");	\
-		__FIELD_GET(_mask, _reg, "FIELD_GET: ");		\
+		__BF_FIELD_GET(_mask, _reg, "FIELD_GET: ");		\
 	})
 
 /**
  * FIELD_MODIFY() - modify a bitfield element
- * @_mask: shifted mask defining the field's length and position
- * @_reg_p: pointer to the memory that should be updated
- * @_val: value to store in the bitfield
+ * @mask: shifted mask defining the field's length and position
+ * @reg_p: pointer to the memory that should be updated
+ * @val: value to store in the bitfield
  *
- * FIELD_MODIFY() modifies the set of bits in @_reg_p specified by @_mask,
- * by replacing them with the bitfield value passed in as @_val.
+ * FIELD_MODIFY() modifies the set of bits in @reg_p specified by @mask,
+ * by replacing them with the bitfield value passed in as @val.
  */
-#define FIELD_MODIFY(_mask, _reg_p, _val)						\
+#define FIELD_MODIFY(mask, reg_p, val)							\
 	({										\
+		__auto_type _mask = mask;						\
+		__auto_type _reg_p = reg_p;						\
+		__auto_type _val = 1 ? (val) : _mask;					\
 		typecheck_pointer(_reg_p);						\
-		__BF_FIELD_CHECK(_mask, *(_reg_p), _val, "FIELD_MODIFY: ");		\
-		*(_reg_p) &= ~(_mask);							\
-		*(_reg_p) |= (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask));	\
+		__BF_FIELD_CHECK(_mask, *_reg_p, _val, "FIELD_MODIFY: ");		\
+		*_reg_p &= ~_mask;							\
+		*_reg_p |= ((_val << __bf_shf(_mask)) & _mask);				\
 	})
 
 extern void __compiletime_error("value doesn't fit into mask")
@@ -241,23 +251,9 @@ __MAKE_OP(64)
 #undef __MAKE_OP
 #undef ____MAKE_OP
 
-#define __field_prep(mask, val)						\
-	({								\
-		__auto_type __mask = (mask);				\
-		typeof(__mask) __val = (val);				\
-		unsigned int __shift = BITS_PER_TYPE(__mask) <= 32 ?	\
-				       __ffs(__mask) : __ffs64(__mask);	\
-		(__val << __shift) & __mask;				\
-	})
-
-#define __field_get(mask, reg)						\
-	({								\
-		__auto_type __mask = (mask);				\
-		typeof(__mask) __reg =  (reg);				\
-		unsigned int __shift = BITS_PER_TYPE(__mask) <= 32 ?	\
-				       __ffs(__mask) : __ffs64(__mask);	\
-		(__reg & __mask) >> __shift;				\
-	})
+/* As __bf_shf() but for non-zero variables */
+#define __BF_SHIFT(mask) \
+	(BITS_PER_TYPE(_mask) <= 32 ? __ffs(_mask) : __ffs64(_mask))
 
 /**
  * field_prep() - prepare a bitfield element
@@ -275,9 +271,14 @@ __MAKE_OP(64)
  * If you want to ensure that @mask is a compile-time constant, please use
  * FIELD_PREP() directly instead.
  */
-#define field_prep(mask, val)						\
-	(__builtin_constant_p(mask) ? __FIELD_PREP(mask, val, "field_prep: ") \
-				    : __field_prep(mask, val))
+#define field_prep(mask, val)					\
+({								\
+	__auto_type _mask = mask;				\
+	__auto_type _val = 1 ? (val) : _mask;			\
+	__builtin_constant_p(_mask) ?				\
+		__BF_FIELD_PREP(_mask, _val, "field_prep: ") :	\
+		(_val << __BF_SHIFT(_mask)) & _mask;		\
+})
 
 /**
  * field_get() - extract a bitfield element
@@ -295,8 +296,13 @@ __MAKE_OP(64)
  * If you want to ensure that @mask is a compile-time constant, please use
  * FIELD_GET() directly instead.
  */
-#define field_get(mask, reg)						\
-	(__builtin_constant_p(mask) ? __FIELD_GET(mask, reg, "field_get: ") \
-				    : __field_get(mask, reg))
+#define field_get(mask, reg)					\
+({								\
+	__auto_type _mask = mask;				\
+	__auto_type _reg = reg;					\
+	__builtin_constant_p(_mask) ?				\
+		__BF_FIELD_GET(_mask, _reg, "field_get: ") :	\
+		(_reg & _mask) >> __BF_SHIFT(_mask);		\
+})
 
 #endif
-- 
2.39.5


