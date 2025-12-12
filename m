Return-Path: <linux-usb+bounces-31423-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C42CB9BF3
	for <lists+linux-usb@lfdr.de>; Fri, 12 Dec 2025 21:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81AE03049D1E
	for <lists+linux-usb@lfdr.de>; Fri, 12 Dec 2025 20:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6C530CDB3;
	Fri, 12 Dec 2025 20:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="V44ODLQ+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4BF2848A4;
	Fri, 12 Dec 2025 20:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765570471; cv=none; b=lV/I6etjjoKTUe9Py0O5YMef9DFsucqhz2VJcVqL7H09NO4ToC2Onis/O0Njg94zEZEpUWnJUWqt4SrfM17NyJMvVsaYHr3r7HYba0jBeEo9i24wknm2iR+aso81hPvp3quvJN0OCCABffAbNEPw0Ut+6zXZotEbKyz1YT8scYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765570471; c=relaxed/simple;
	bh=rrMpiY2/32uiPUxnNhqmlvJHbOrcOpzblK5lbAIbRbk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jl0D+TTw47iFRjzdYwe51sCOfnYulbONwj2R4zsJzO7uwPgY5+cdfDxzkK0VFgU83kuzsmsf036uhMvoSYc/X7Lm7SRV/LcBtQe2FTPz/6kB/JD93hRQAObzbDP3ANcA6fQzU8UQz+RsEtmvkusmH1AmJ3h6iBu8X/WLaqSoUJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=V44ODLQ+; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vU8xw-0087f1-Vk; Fri, 12 Dec 2025 20:38:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=XcOghhLB9x/wa6Uum/aSGpecagme4zwlntT5IjlJr3M=; b=V44ODLQ+lRgGqyb8F3/YQo74rb
	evsoP15xN7rXIKPmlxe6TPFmmNoTy0ucJiW/coe/xJioVH6J+3GLLYV0mlu31L9GinwvaZfuCuVeX
	eptBv1kmqug6H38uY8TrSlyKntc39s8JIhc1PqaapytK6DcJkNtWxwFRVXIJiroGzIPlcFRCca8gq
	AYJGhqpSDAI2OmK8GJ7Un+N40YS7siSvOuCZiYDfz3ceRVWC3OPcdWxMu/r9RNFjTAaI9ZTPQxcO/
	/0wM/LFGBDVNssoa3EZf56Fy99Yow1efbWRPXx94LyABiruiviFiPwKCebYdl3FSmHK6vJUlXykC/
	Wg6AMe+A==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vU8xw-0003AG-BA; Fri, 12 Dec 2025 20:38:12 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vU8xp-0030pR-93; Fri, 12 Dec 2025 20:38:05 +0100
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
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v2 16/16] build_bug.h; Remove __BUILD_BUG_ON_NOT_POWER_OF_2()
Date: Fri, 12 Dec 2025 19:37:21 +0000
Message-Id: <20251212193721.740055-17-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251212193721.740055-1-david.laight.linux@gmail.com>
References: <20251212193721.740055-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Laight <david.laight.linux@gmail.com>

It was added for, and only used by, bitfield.h.
That not longer uses it so it can be removed.

It should have been called BUILD_BUG_ON_NOT_ZERO_OR_POWER_OF_2()
but there is no real need for such a specialised function.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/build_bug.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/build_bug.h b/include/linux/build_bug.h
index 2cfbb4c65c78..0ca6cb79f704 100644
--- a/include/linux/build_bug.h
+++ b/include/linux/build_bug.h
@@ -17,8 +17,6 @@
 	__BUILD_BUG_ON_ZERO_MSG(e, ##__VA_ARGS__, #e " is true")
 
 /* Force a compilation error if a constant expression is not a power of 2 */
-#define __BUILD_BUG_ON_NOT_POWER_OF_2(n)	\
-	BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
 #define BUILD_BUG_ON_NOT_POWER_OF_2(n)			\
 	BUILD_BUG_ON((n) == 0 || (((n) & ((n) - 1)) != 0))
 
-- 
2.39.5


