Return-Path: <linux-usb+bounces-31321-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8B6CAF8AC
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 11:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F9B23015149
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 10:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF5031ED93;
	Tue,  9 Dec 2025 10:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="Y97+WlGs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E284A2FF14F;
	Tue,  9 Dec 2025 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765274616; cv=none; b=suiIW1GMzICus1357csBQRut/mwfPv/q+8aa0xOk1oWnE4JN+YUcCIxAqddGObgjjF7p9aIvss/NuzJF5+kZIRzK0sx7YK7DyL0RczW9GKrHON1uspuo66WkVQTL/dKz+nsUQeU7j+4XM6c0B6hGCXNFwwgN/RAJImdjXbM55N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765274616; c=relaxed/simple;
	bh=bZ63dbuTIfAobODlW60dWN4FIiJkGkip2hP19VOFpPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a4+LeG3qhxiuIa9yMwyRPu3uNGp+ZAsD/XveC3V2WRAb0HmlDNAGQ8JPDgJ3WpZMXWeP50TvBhjIvoNwPg110269s2Y3I54RhJ+EA2wQp6JmGJwTscThdchaereoMwAGGEXgtxlf0L5530NV3tG6m3KLIbbgbmDB7aSrJLh7x38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=Y97+WlGs; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSuZ9-00HD5F-7x; Tue, 09 Dec 2025 11:03:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=s5qu4+g3giptobjZuw21YQ9JrNuy8EW0sZD8ggimS5M=; b=Y97+WlGsTWr8ayyMAX7yQFexlb
	vd1Rn1Ax5VrBMfyA/JYZNqLl+1aR8Vv7Je/NC4qrFord6ZSUC5q9HxVSfqTIiO5rMhZfT9LpqxPXp
	udmRO7p8FdYeYmXxXgaVibJQx7HL7X/U2orXfDh/33+VTi/bph06fxjq6V1J3htPDoTP6ooZgKfhD
	wRex3LMVhuegS89r/0LwdPvIMNj3fQ/OpqIVWu8471uFcxqMVxX7lTbG7uzvmg9WELl6dBry2A9PS
	gT7pF1NaJ2R1yCDLsDRfzjxxciUYCsbA2P3xeTy+KxwG0sWp/m2UnmAMtawcHhJXY2+BqQYhXRKow
	fFTg4+NA==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSuZ8-000758-Ps; Tue, 09 Dec 2025 11:03:30 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vSuZ8-00CND9-8w; Tue, 09 Dec 2025 11:03:30 +0100
From: david.laight.linux@gmail.com
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Crt Mori <cmo@melexis.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Simon Horman <simon.horman@netronome.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH 7/9] bitfield: Reduce indentation
Date: Tue,  9 Dec 2025 10:03:11 +0000
Message-Id: <20251209100313.2867-8-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251209100313.2867-1-david.laight.linux@gmail.com>
References: <20251209100313.2867-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Laight <david.laight.linux@gmail.com>

There is no need to double indent the body of #defines.
Leave the opening ( and closing ) on their own lines.

Delete extra tabs before continuation markers.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/bitfield.h | 132 +++++++++++++++++++--------------------
 1 file changed, 66 insertions(+), 66 deletions(-)

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index 7e8d436b6571..bfd80ebd25b1 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -48,37 +48,37 @@
 #define __BF_VALIDATE_MASK(mask) \
 	(!(mask) || ((mask) & ((mask) + ((mask) & -(mask)))))
 
-#define __BF_FIELD_CHECK_MASK(mask, pfx)				\
-	do {								\
-		BUILD_BUG_ON_MSG(!__builtin_constant_p(mask),		\
-				 pfx "mask is not constant");		\
-		BUILD_BUG_ON_MSG(__BF_VALIDATE_MASK(mask),		\
-				 pfx "mask is zero or not contiguous");	\
-	} while (0)
+#define __BF_FIELD_CHECK_MASK(mask, pfx)			\
+do {								\
+	BUILD_BUG_ON_MSG(!__builtin_constant_p(mask),		\
+			 pfx "mask is not constant");		\
+	BUILD_BUG_ON_MSG(__BF_VALIDATE_MASK(mask),		\
+			 pfx "mask is zero or not contiguous");	\
+} while (0)
 
 #define __BF_FIELD_CHECK_VAL(mask, val, pfx)			\
 	BUILD_BUG_ON_MSG(__builtin_constant_p(val) &&		\
 			 ~((mask) >> __bf_shf(mask)) & (val),	\
 			 pfx "value too large for the field")
 
-#define __BF_FIELD_CHECK_REG(mask, reg, pfx)				\
-	BUILD_BUG_ON_MSG(mask + 0U + 0UL + 0ULL >			\
-			 ~0ULL >> (64 - 8 * sizeof (reg)),		\
+#define __BF_FIELD_CHECK_REG(mask, reg, pfx)			\
+	BUILD_BUG_ON_MSG(mask + 0U + 0UL + 0ULL >		\
+			 ~0ULL >> (64 - 8 * sizeof (reg)),	\
 			 pfx "type of reg too small for mask")
 
-#define __BF_FIELD_PREP(mask, val, pfx)					\
-	({								\
-		__BF_FIELD_CHECK_MASK(mask, pfx);			\
-		__BF_FIELD_CHECK_VAL(mask, val, pfx);			\
-		((val) << __bf_shf(mask)) & (mask);			\
-	})
+#define __BF_FIELD_PREP(mask, val, pfx)		\
+({						\
+	__BF_FIELD_CHECK_MASK(mask, pfx);	\
+	__BF_FIELD_CHECK_VAL(mask, val, pfx);	\
+	((val) << __bf_shf(mask)) & (mask);	\
+})
 
-#define __BF_FIELD_GET(mask, reg, pfx)					\
-	({								\
-		__BF_FIELD_CHECK_MASK(mask, pfx);			\
-		__BF_FIELD_CHECK_REG(mask, reg, pfx);			\
-		((reg) & (mask)) >> __bf_shf(mask);			\
-	})
+#define __BF_FIELD_GET(mask, reg, pfx)		\
+({						\
+	__BF_FIELD_CHECK_MASK(mask, pfx);	\
+	__BF_FIELD_CHECK_REG(mask, reg, pfx);	\
+	((reg) & (mask)) >> __bf_shf(mask);	\
+})
 
 /**
  * FIELD_MAX() - produce the maximum value representable by a field
@@ -87,12 +87,12 @@
  * FIELD_MAX() returns the maximum value that can be held in the field
  * specified by @mask.
  */
-#define FIELD_MAX(mask)							\
-	({								\
-		__auto_type _mask = mask;				\
-		__BF_FIELD_CHECK_MASK(_mask, "FIELD_MAX: ");		\
-		(_mask >> __bf_shf(_mask));				\
-	})
+#define FIELD_MAX(mask)					\
+({							\
+	__auto_type _mask = mask;			\
+	__BF_FIELD_CHECK_MASK(_mask, "FIELD_MAX: ");	\
+	(_mask >> __bf_shf(_mask));			\
+})
 
 /**
  * FIELD_FIT() - check if value fits in the field
@@ -101,13 +101,13 @@
  *
  * Return: true if @val can fit inside @mask, false if @val is too big.
  */
-#define FIELD_FIT(mask, val)						\
-	({								\
-		__auto_type _mask = mask;				\
-		__auto_type _val = 1 ? (val) : _mask;			\
-		__BF_FIELD_CHECK_MASK(_mask, "FIELD_FIT: ");		\
-		!((_val << __bf_shf(_mask)) & ~_mask); 			\
-	})
+#define FIELD_FIT(mask, val)				\
+({							\
+	__auto_type _mask = mask;			\
+	__auto_type _val = 1 ? (val) : _mask;		\
+	__BF_FIELD_CHECK_MASK(_mask, "FIELD_FIT: ");	\
+	!((_val << __bf_shf(_mask)) & ~_mask); 		\
+})
 
 /**
  * FIELD_PREP() - prepare a bitfield element
@@ -117,12 +117,12 @@
  * FIELD_PREP() masks and shifts up the value.  The result should
  * be combined with other fields of the bitfield using logical OR.
  */
-#define FIELD_PREP(mask, val)						\
-	({								\
-		__auto_type _mask = mask;				\
-		__auto_type _val = 1 ? (val) : _mask;			\
-		__BF_FIELD_PREP(_mask, _val, "FIELD_PREP: ");		\
-	})
+#define FIELD_PREP(mask, val)				\
+({							\
+	__auto_type _mask = mask;			\
+	__auto_type _val = 1 ? (val) : _mask;		\
+	__BF_FIELD_PREP(_mask, _val, "FIELD_PREP: ");	\
+})
 
 /**
  * FIELD_PREP_CONST() - prepare a constant bitfield element
@@ -136,15 +136,15 @@
  * be used in initializers. Error checking is less comfortable for this
  * version, and non-constant masks cannot be used.
  */
-#define FIELD_PREP_CONST(mask, val)					\
-	(								\
-		/* mask must be non-zero and contiguous */		\
-		BUILD_BUG_ON_ZERO(__BF_VALIDATE_MASK(mask)) +		\
-		/* check if value fits */				\
-		BUILD_BUG_ON_ZERO(~((mask) >> __bf_shf(mask)) & (val)) + \
-		/* and create the value */				\
-		(((typeof(mask))(val) << __bf_shf(mask)) & (mask))	\
-	)
+#define FIELD_PREP_CONST(mask, val)				\
+(								\
+	/* mask must be non-zero and contiguous */		\
+	BUILD_BUG_ON_ZERO(__BF_VALIDATE_MASK(mask)) +		\
+	/* check if value fits */				\
+	BUILD_BUG_ON_ZERO(~((mask) >> __bf_shf(mask)) & (val)) + \
+	/* and create the value */				\
+	(((typeof(mask))(val) << __bf_shf(mask)) & (mask))	\
+)
 
 /**
  * FIELD_GET() - extract a bitfield element
@@ -154,12 +154,12 @@
  * FIELD_GET() extracts the field specified by @mask from the
  * bitfield passed in as @reg by masking and shifting it down.
  */
-#define FIELD_GET(mask, reg)						\
-	({								\
-		__auto_type _mask = mask;				\
-		__auto_type _reg = reg;					\
-		__BF_FIELD_GET(_mask, _reg, "FIELD_GET: ");		\
-	})
+#define FIELD_GET(mask, reg)				\
+({							\
+	__auto_type _mask = mask;			\
+	__auto_type _reg = reg;				\
+	__BF_FIELD_GET(_mask, _reg, "FIELD_GET: ");	\
+})
 
 /**
  * FIELD_MODIFY() - modify a bitfield element
@@ -170,16 +170,16 @@
  * FIELD_MODIFY() modifies the set of bits in @reg_p specified by @mask,
  * by replacing them with the bitfield value passed in as @val.
  */
-#define FIELD_MODIFY(mask, reg_p, val)							\
-	({										\
-		__auto_type _mask = mask;						\
-		__auto_type _reg_p = reg_p;						\
-		__auto_type _val = 1 ? (val) : _mask;					\
-		__BF_FIELD_CHECK_MASK(_mask, "FIELD_MODIFY: ");				\
-		__BF_FIELD_CHECK_VAL(_mask, _val, "FIELD_MODIFY: ");			\
-		__BF_FIELD_CHECK_REG(_mask, *_reg_p, "FIELD_MODIFY: ");			\
-		*_reg_p = (*_reg_p & ~_mask) | ((_val << __bf_shf(_mask)) & _mask);	\
-	})
+#define FIELD_MODIFY(mask, reg_p, val)						\
+({										\
+	__auto_type _mask = mask;						\
+	__auto_type _reg_p = reg_p;						\
+	__auto_type _val = 1 ? (val) : _mask;					\
+	__BF_FIELD_CHECK_MASK(_mask, "FIELD_MODIFY: ");				\
+	__BF_FIELD_CHECK_VAL(_mask, _val, "FIELD_MODIFY: ");			\
+	__BF_FIELD_CHECK_REG(_mask, *_reg_p, "FIELD_MODIFY: ");			\
+	*_reg_p = (*_reg_p & ~_mask) | ((_val << __bf_shf(_mask)) & _mask);	\
+})
 
 extern void __compiletime_error("value doesn't fit into mask")
 __field_overflow(void);
-- 
2.39.5


