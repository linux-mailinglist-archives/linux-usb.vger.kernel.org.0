Return-Path: <linux-usb+bounces-27354-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C82B3A639
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 18:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C6055E7CB5
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 16:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34F1322A1D;
	Thu, 28 Aug 2025 16:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oDjU0KnI"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689CC2D23A3
	for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756398434; cv=none; b=CHEo/XfV4vfGT/1dOPVZ9R206EpBspOKoQSDWDKYTE8o3/ss2A+RJdXqGj5DrlHyp7LjXditnhrSbU69x9xY3e9X7mPA41r0oKIrg2+Q9m2LQcvV4Ss+duR/ADly3moiapajgs3+ajizlLLPLW8OQWiIxgZCdOdj/U2syxDLyHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756398434; c=relaxed/simple;
	bh=vhIwjMEKHDUbgyw/UEvayi72XXEgzaWVlsm5VzzTmzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VMrV3xsSt8SRRuadFwCsLKPBGf0Ak3b0jXKBdmGR5HikvRHpVf7Z9qGwHfmN+nLjCHBOvvUiI35h9ByRDID5HINAor80RC9dsAzjrnSOxxo+0xqsxnWMIVPsKI4T8IxbrGZw939mEayIMEZQqX1wqMDWBmOwzg/jxCNjIzmKzsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oDjU0KnI; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756398420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LcTj8AYdceOqTQSQLAc0f2c7JRl5hi315MYDEFAy0FY=;
	b=oDjU0KnIjOdCGvWRlRvKOzLEFyXpZVCQdYpa3vBU7RH7GW7zIV+8apXzo+tW9pRB2fEMew
	P8PnkKt76JtLOUoExm5mJHbAEMVeBnuyG0wXxXfqCAwSjtYzvhRzsXJJHFsAs1jnqadTft
	Bsb03vAzsJuLdFQ7AfD9FU/MBJdHO0s=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] usb: storage: realtek_cr: Simplify residue calculation in rts51x_bulk_transport()
Date: Thu, 28 Aug 2025 18:26:24 +0200
Message-ID: <20250828162623.4840-3-thorsten.blum@linux.dev>
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

Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/usb/storage/realtek_cr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
index 2a6c7c567e1c..758258a569a6 100644
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


