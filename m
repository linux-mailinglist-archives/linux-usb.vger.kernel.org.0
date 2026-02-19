Return-Path: <linux-usb+bounces-33480-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMOvNC0/l2lXwAIAu9opvQ
	(envelope-from <linux-usb+bounces-33480-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 17:49:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCD2160C97
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 17:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 194B93031F14
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 16:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA36334C83C;
	Thu, 19 Feb 2026 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2dX7Fug"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CDB2868B5
	for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 16:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771519782; cv=none; b=T/ot/BhTDAtlsyFe5QLI8pDxlkK+9hMkmswlr6lIFmVuCBSmBqcRvZTaBqwkQx7YeO8Rlkklk8NuQMejKbpyd9+NEdYTv090kGarLqMTRl8EQ+fRPTBYW1MKj8rvTW5vzdGQg7ZVoZiBJL9VlreEXFQ1rfreQFeHvMELBPKOmVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771519782; c=relaxed/simple;
	bh=va+PakzRw6fFzgf0THEg+t4twGFZBRapAq3zMrIoOkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5HpMT82pcAHjyhhtFJFKS2Zanrjvd0YVF1d2eniM3HgUYUweGvjPJ1kUyy/c3lk/GXYd8KfkS//JeB9jkys7LyuS31jP19N0z1h9FxZNqAEd2KSeVr1KWsgVwErdm5WMxsn20hmlBjUTevKvG7VoeBRpa0RkwqQIUtBeOerlOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2dX7Fug; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cb40149037so122975985a.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 08:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771519779; x=1772124579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvVjQq51Yw3IHblaOiMvz5/BJuUBqfGpeZSft6K58nM=;
        b=X2dX7FugDbS6YED0qaZfY4n2WB/iiaydMN0YyZ6yyxGTd6EpwwMp3LAt+nzpFzhH5f
         lrBWeY0trQFIQFwj3M1LaC3S8Uy/TMm1Va4vufAifLMMSfTkg9KeZHlvS1+Nhm1nyYQj
         k1MKn5fCBZtLiZRF8i99wKegLgMMqgSKqQEalDFdTpE8W5GoF71VvilfuSewbU1ilYi3
         qT30+/6wp14SmZ54F+BY8nKo8Gs7z6m5WlVMOHAIhVzNF5/4ElpGvz/kU42POpPkMTv+
         qxXnuARrXEoX8OxcuCenqB3rCyAhodKVBNA2I5wk4LiM6a4AWjqUcVOmPhA5M6u1vQHC
         AESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771519779; x=1772124579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NvVjQq51Yw3IHblaOiMvz5/BJuUBqfGpeZSft6K58nM=;
        b=WRG9t4T4iVEL7C+t2N+oCpwUYBQFN9YOfly2E+T8EeDyC8KclgzyOd0yBOnvm/yVtB
         DQFvO/qQVgDuJiNYpsTWWB1oUAe+oy/SOohkDFMw/gHoV0pT7vcVsuZ5KgFVNRQ4qsCR
         M14zZ9ORCpV4P110HhTAhXWonnWd71eM+bF2NmsZYPH5wssblnWFvSqbRmqv/wUpbq2g
         WIT4UYpnU6kOuNo/HK9frrFn0PG3BXQUgdjNzMCK/oHYDBmza/DpifrvaNtAnl0xC4bK
         CItHWE7pyTJkc/gw+9YSylDQ43RBOTQqmn8zbm5bKkktyyozl9/WaAeAoDNMQQ4kXiM5
         A12Q==
X-Gm-Message-State: AOJu0Yx0y8J2l0z7BqLuHaaSdJNYl+SGiAxbXKT6ka6ZjtdOmZPaQ7oB
	DYUPsNjpR7STJmz/3XONUiA7Va7NjR+Bqx7zdlhgF2u0+lc+L8hx5dERyTzLhg==
X-Gm-Gg: AZuq6aIzN9GkDVpt8138bPzRlUdGg/u+mLlAkoyxb6AWIioq66D6jiPud6cYY3lC4Z/
	DGSPW0mv6lnCPZ/DglPA7IhNrVoKZximmBoyOH5p/Ifimnpz4YRc3sJJHkzk8CcT7G8bp15lK81
	GosiAYBIn9qAegWA7jR77JZrhU+62e3xDAEn03knvrG6UnXG/xJUoiYRBN0ZfjntFxSGhgSSk09
	4t5J7SD27pp278DGzs2+PFbyZ4EC+BhjKnDj5Y7Sf7RwIyZvDB3yhD85XyW8F+Qb44w7pIPxsDt
	WPRGxqM/S3VWJ5Zq7D899yh7dPhlXnkFWYcPVyCHCIXxZ5+Y2/R/jCy/nCBmFXAaDoqJ/2FPcDb
	Z7BbOdrm0wnz8tlemkbtuHYvctJ0YBDEobxu7Yn3GP+8+xo1uLA3Go1+tL3RuVdUp2D1kXFxEU6
	y63CEttmLcdxjjT7yeK6HZGVpmafKNBqRhQp4smqe31mtzW5qp7fPUdTX6riF5TGYLx1lXlk0G9
	Ikk4dackUH9j3VLYta+
X-Received: by 2002:a05:620a:454b:b0:8c6:a707:1b52 with SMTP id af79cd13be357-8cb79e92eebmr398837785a.4.1771519779440;
        Thu, 19 Feb 2026 08:49:39 -0800 (PST)
Received: from localhost.localdomain ([129.170.197.104])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0ce73fsm2259615685a.11.2026.02.19.08.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:49:39 -0800 (PST)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: [PATCH 1/2] usb: typec: ucsi: validate connector number in ucsi_connector_change()
Date: Thu, 19 Feb 2026 11:49:23 -0500
Message-ID: <20260219164925.3249-2-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20260219164925.3249-1-nathan.c.rebello@gmail.com>
References: <20260219164925.3249-1-nathan.c.rebello@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33480-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4BCD2160C97
X-Rspamd-Action: no action

ucsi_connector_change() uses the connector number from the CCI as an
index into the connector array without first verifying it falls within
the valid range. The connector number is extracted from the CCI register
via UCSI_CCI_CONNECTOR(), which returns a 7-bit value (1-127), but the
connector array is typically only 2-4 entries.

A malicious or malfunctioning device could report an out-of-range
connector number, causing an out-of-bounds array access.

Add a bounds check to reject invalid connector numbers before indexing.

Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
Signed-off-by: Nathan Rebello <nathan.c.rebello@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index a7b388dc7fa0..7109d3bd39b4 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1345,7 +1345,14 @@ static void ucsi_handle_connector_change(struct work_struct *work)
  */
 void ucsi_connector_change(struct ucsi *ucsi, u8 num)
 {
-	struct ucsi_connector *con = &ucsi->connector[num - 1];
+	struct ucsi_connector *con;
+
+	if (num < 1 || num > ucsi->cap.num_connectors) {
+		dev_warn(ucsi->dev, "invalid connector number %d\n", num);
+		return;
+	}
+
+	con = &ucsi->connector[num - 1];
 
 	if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
 		dev_dbg(ucsi->dev, "Early connector change event\n");
-- 
2.43.0.windows.1


