Return-Path: <linux-usb+bounces-31320-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 203B8CAF8B2
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 11:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0433B30A085D
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 10:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE7A3009F0;
	Tue,  9 Dec 2025 10:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="mDF7JJRg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F562FC86C
	for <linux-usb@vger.kernel.org>; Tue,  9 Dec 2025 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765274616; cv=none; b=oINJ0fW/DmARPDL0gwDM4EFkhmPeqvA51rJWyiBlhv4YgPj+7vD/H4XiyWZRxUBro64CLYgXB4F0dMdw3gUJo10FQvmSwUyce02e/2IN/b14Xuop9jPea4WxyOlKTvW88AnLvz4bq7OqreMKLw3LBYssj4q/LevfC1HByCx0G+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765274616; c=relaxed/simple;
	bh=ElQoc6Q6ybtyS+Hep2dc9k8iOBrdGzj7Eg1MlmnxTac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OC8C07oRdXtnLQ+frpKrEFlmq4bwMTIMBtzb9QyYqiWLCvnpupePCAZgAKtaHiXM7K+yNE/DzTEdoHhVTDarMI+HwlF6AtBmIepxYrtII8WhuBVeDquVFUGdTSaT8nNgMl1z09cQxIus952TtbQ2uGPFAi4go1SIcIIVI0GLzfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=mDF7JJRg; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSuZ8-00Gyzm-Dn; Tue, 09 Dec 2025 11:03:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=9/ne1fM+49A5MdyQAccO5Q+S8uNSJksiax63cH+c4Rw=; b=mDF7JJ
	RggUJ2tyGz6PkVOXawBRxJO3wdiBWv7A+9DhopCTU4Sl5/xD4ts/SodvDSu3DFzZlAygQOgfYnnt/
	gceWzwBrHOC1hJb4cpEvnP2YgngCHx8x203PqjNTr/vfCkwDNYWZ571bYgYURjJjNg1pEDqbfSTYa
	2zht8lJI/SISneWYqm4J1xVLlbYOpCqv2z28pUj7jZW6c0i87z7hHB+O6a+q2xkCdRdrudeP4rQ+7
	DZ35ms99jpSjdXeMyYiYQsKECxN9pwGIHwzbsz2tcPxm/UHTI2tXz/RSGd3M1w/9bTctEo6WSrapV
	IAtmpdE2muFMyO3GIgF8vvJPKhig==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vSuZ7-000752-TU; Tue, 09 Dec 2025 11:03:30 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vSuZ0-00CND9-4z; Tue, 09 Dec 2025 11:03:22 +0100
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
Subject: [PATCH 0/9] bitfield: tidy up bitfield.h
Date: Tue,  9 Dec 2025 10:03:04 +0000
Message-Id: <20251209100313.2867-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Laight <david.laight.linux@gmail.com>

Re-send with patches going to everyone.
(I'd forgotten I'd set 'ccCover = 0'.)

I noticed some very long (18KB) error messages from the compiler.
Turned out they were errors on lines that passed GENMASK() to FIELD_PREP().
Since most of the #defines are already statement functions the values
can be copied to locals so the actual parameters only get expanded once.

The 'bloat' is reduced further by using a simple test to ensure 'reg'
is large enough, slightly simplifying the test for constant 'val' and
only checking 'reg' and 'val' when the parameters are present.

The first two patches are slightly problematic.

drivers/net/ethernet/netronome/nfp/nfpcore/nfp_nsp_eth.c manages to use
a #define that should be an internal to bitfield.h, the changed file
is actually more similar to the previous version.

drivers/thunderbolt/tb.h passes a bifield to FIELD_GET(), these can't
be used with sizeof or __auto_type. The usual solution is to add zero,
but that can't be done in FIELD_GET() because it doesn't want the value
promoted to 'int' (no idea how _Generic() treated it.)
The fix is just to add zero at the call site.
(The bitfield seems to be in a structure rad from hardware - no idea
how that works on BE (or any LE that uses an unusual order for bitfields.)

Both changes may need to to through the same tree as the header file changes.

The changes are based on 'next' and contain the addition of field_prep()
and field_get() for non-constant values.

I also know it is the merge window.
I expect to be generating a v2 in the new year (someone always has a comment).

David Laight (9):
  nfp: Call FIELD_PREP() in NFP_ETH_SET_BIT_CONFIG() wrapper
  thunderblot: Don't pass a bitfield to FIELD_GET
  bitmap: Use FIELD_PREP() in expansion of FIELD_PREP_WM16()
  bitfield: Copy #define parameters to locals
  bitfield: FIELD_MODIFY: Only do a single read/write on the target
  bitfield: Update sanity checks
  bitfield: Reduce indentation
  bitfield: Add comment block for the host/fixed endian functions
  bitfield: Update comments for le/be functions

 .../netronome/nfp/nfpcore/nfp_nsp_eth.c       |  16 +-
 drivers/thunderbolt/tb.h                      |   2 +-
 include/linux/bitfield.h                      | 278 ++++++++++--------
 include/linux/hw_bitfield.h                   |  17 +-
 4 files changed, 166 insertions(+), 147 deletions(-)

-- 
2.39.5


