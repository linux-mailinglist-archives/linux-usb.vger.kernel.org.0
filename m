Return-Path: <linux-usb+bounces-30751-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE4AC715AF
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 23:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 188143049D
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 22:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81601322768;
	Wed, 19 Nov 2025 22:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="PlFDAXm9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AC0337BBA
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 22:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763592179; cv=none; b=oUxsfBU/bW3k6BjBkYsKJu5giCK1NxxpmdjIWmpGeVUynu9VbBrdv3HwYmJQ7agEnVAlo6HMdCzA4NRZlSpneg8N5pRwe/oZ0aPxU0Hz/2ouV+954yA0VEQw6Lw0/ySNpnA51f7cqpZAAu/es+QANThuAz43coEzAkRVohYHo9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763592179; c=relaxed/simple;
	bh=cM5V7HEzzL0U3ww5wmvTfgyAchIHG0E1WvqQwcwtJTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BeWHEhwcDtTflgzmGgetHjSh4Nbcw3anLoUVUQdi8ISEA/17NA9Me7B5boLwBeBE43i5/fqh3425wJRqP+WF7j8kxuMcBz7fWj6ljoGd5847NNrp6I7ixKyFU1xbBNm5yK64Z/8pl4SGEjvFgqy2A5pPBGdet4mWsfJ80uCcZOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=PlFDAXm9; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vLqt4-006yxN-8x; Wed, 19 Nov 2025 23:42:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=kOefzjf50j/74iGOTPMlZK++sMONcJKR9VFlFhM1mCo=; b=PlFDAXm9RjRdKW/sCB0nmCb5xC
	/0vBr9aRUWXR7wkH7VP6pe7YSCBrI1gFUHgW+aKWdhhFu46N0oVBmW+IKdpsAen5U4UHRN5XO7qQU
	wD6Rdx5793894P2OhI47vFTydCvpCtGH7jOWX4W+eWaNNQ67ufAnS2JMVML3m3DmF2DXczjAB79J2
	U7msPriRSucJ1O6Ccm1JDjX7u782dGWeidLpKHdSCNMhtNGdAygOuF+LGBVcgpMdCPV0DK8fgPX+M
	q1GNLTu8pBfCMTdgAfy7VcULMG+AvwRh05l7D1A5pvgke29rkfnuWJm7xM2gxt+7dG2aISlSCXkAI
	Z3rcJoWQ==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vLqt3-0000EA-OW; Wed, 19 Nov 2025 23:42:54 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vLqsi-00Fos6-26; Wed, 19 Nov 2025 23:42:32 +0100
From: david.laight.linux@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH 28/44] drivers/usb/storage: use min() instead of min_t()
Date: Wed, 19 Nov 2025 22:41:24 +0000
Message-Id: <20251119224140.8616-29-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251119224140.8616-1-david.laight.linux@gmail.com>
References: <20251119224140.8616-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Laight <david.laight.linux@gmail.com>

min_t(unsigned int, a, b) casts an 'unsigned long' to 'unsigned int'.
Use min(a, b) instead as it promotes any 'unsigned int' to 'unsigned long'
and so cannot discard significant bits.

In this case the 'unsigned long' value is small enough that the result
is ok.

Detected by an extra check added to min_t().

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 drivers/usb/storage/protocol.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/storage/protocol.c b/drivers/usb/storage/protocol.c
index 9033e505db7f..0cff54ad90fa 100644
--- a/drivers/usb/storage/protocol.c
+++ b/drivers/usb/storage/protocol.c
@@ -139,8 +139,7 @@ unsigned int usb_stor_access_xfer_buf(unsigned char *buffer,
 		return cnt;
 
 	while (sg_miter_next(&miter) && cnt < buflen) {
-		unsigned int len = min_t(unsigned int, miter.length,
-				buflen - cnt);
+		unsigned int len = min(miter.length, buflen - cnt);
 
 		if (dir == FROM_XFER_BUF)
 			memcpy(buffer + cnt, miter.addr, len);
-- 
2.39.5


