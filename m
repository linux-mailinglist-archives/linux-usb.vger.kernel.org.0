Return-Path: <linux-usb+bounces-26795-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76562B24701
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 12:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35C5C1887D1A
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 10:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B092F3C11;
	Wed, 13 Aug 2025 10:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NQ5KxT9Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E662F1FFE
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 10:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755080053; cv=none; b=WEFWdwSZcd+MomGC6nvF6iJGLWoHKgdWo/OlzdXE5KjUP51IJchDoJ+lA1/nzAaSI9rPlNCLhxRcSI+BgSUZHG+4vJpNJfjEvmFWQntyHrTyxT1+rCx+DjSutakVmQ+fbuJIPsteUVP58N7qc2OjidCbvSu82ApF4jSnTkz/F8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755080053; c=relaxed/simple;
	bh=OYpe7DAdLvRO87bKrUFvEGG9lC6rkBTuK48BfxHjrZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qWuRBHTWpE8SIhbV2GusLtEsE8NFhzra4P2J1y+Bmr8bB1F+H1B0N3mUp4TuXem4/P7tuQK+7o9eQjoHzZwRtIWWsto5kmD8LZsYKXEkIpejF2I0udKWS4QgzKTyGxTJZfjPrLDc65jeT+LkYiHY5b1YSbQ1rQ47qyqxnsBgKm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NQ5KxT9Z; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755080049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SMBG032zU6ickgstPxN/GJlE9tfEuBGsOIIn38UsQNA=;
	b=NQ5KxT9ZSq63nCB3OSk2zTbf6DuOs5atXToDIWhdGUo0XPMIG/97Y2beMQ505ej0ucR+Xa
	D8x5O1eevdRQ9PdiNdGr/aC22hIQe0hKjWyFCJ4Pe8j52l6OswWZtczLGM3U1a9sWF8uL0
	EwViKXhean66C0CsPIXNq112EoJI4bA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] usb: storage: realtek_cr: Simplify residue calculation in rts51x_bulk_transport()
Date: Wed, 13 Aug 2025 12:12:49 +0200
Message-ID: <20250813101249.158270-4-thorsten.blum@linux.dev>
In-Reply-To: <20250813101249.158270-2-thorsten.blum@linux.dev>
References: <20250813101249.158270-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Simplify the calculation of 'residue' in rts51x_bulk_transport() and
avoid unnecessarily reassigning 'residue' to itself.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/usb/storage/realtek_cr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
index d2c3e3a39693..8a4d7c0f2662 100644
--- a/drivers/usb/storage/realtek_cr.c
+++ b/drivers/usb/storage/realtek_cr.c
@@ -261,8 +261,8 @@ static int rts51x_bulk_transport(struct us_data *us, u8 lun,
 	 * try to compute the actual residue, based on how much data
 	 * was really transferred and what the device tells us
 	 */
-	if (residue)
-		residue = residue < buf_len ? residue : buf_len;
+	if (residue > buf_len)
+		residue = buf_len;
 
 	if (act_len)
 		*act_len = buf_len - residue;
-- 
2.50.1


