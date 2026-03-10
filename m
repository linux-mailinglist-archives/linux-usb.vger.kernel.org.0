Return-Path: <linux-usb+bounces-34499-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OpEGVGCsGmwjwIAu9opvQ
	(envelope-from <linux-usb+bounces-34499-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 21:42:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC37E257FB2
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 21:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EE4D3159ACA
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 20:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AFC3E9295;
	Tue, 10 Mar 2026 20:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="og+BuGxl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B783E8C41
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 20:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773175316; cv=none; b=uWSW17RCGPEljYhVKj24PGktnEzPzMWf3Kd18c31UZe2NrjuRwYaMPzNtcLl1bl1LFIXetw5plb5+kZMRs/73Ggd/qfFTo/VniCASbOaHl+d5ZwUugNoNOYQLrl3jszCBGgb8db/d/c2j/DlxlPiFXm+mj25PBrTslGRYNTVnq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773175316; c=relaxed/simple;
	bh=vQYq1gy/+ms8DFsoybWdQExdLq9oVYK1dKhC27tDqpA=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=qr/a74fRO1qp68ypAVpKem16cWFvgBme4yJoPFOEiUhefK5u/iXB94mRa5fVE44o2ysmEuu0xyN/RG7pDFNCb8iGTeoOdbiOPymRGufj93bMXxic5ZCJt9PDkwy6oqlngXLRYauNb+D8pq80bWcGr3JavmG3lckIaFdUd2q6xos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=og+BuGxl; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ae49080364so80726915ad.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 13:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773175315; x=1773780115; darn=vger.kernel.org;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G39XrjQD6P2h2p8Omajy3SkL5M5ReWD9W/m6w4WKKdo=;
        b=og+BuGxlMBbaroFUgUqeFNAeTmlrIDYpUIGkHa/amqLvUqSe5vpRlM1mx6Ym/I3LN0
         4lZCJs3HCyDr8yHgkMs41TaKEEfZ2krE2c6t543oTmDTrzUvjwh4HK9ufVjbpsgH30q4
         La8GkDHyC7yXCgzUkIilDBMcDOYtcCqckNJ74tvgEzRZdL9pG8AekcHMy9l0MgT2SRFi
         kh+POJSVp3cxtPH3INa2jSh0M/13f3vJkZ81HLsY/PDvmBsqCOAjVtyfr09RtjWmug72
         Nir80pdkzb07Zxjo41kgF+dx+4OYnv5kOidYEgSW560HD4knbmmOV64rscCooDab517Y
         7PeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773175315; x=1773780115;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G39XrjQD6P2h2p8Omajy3SkL5M5ReWD9W/m6w4WKKdo=;
        b=r2mE5tXtnDCqLUi9XCCvwPLMgP0mfz3Mr6dF1KMpaHdO1lXvCDtULkmi11urQOC0WH
         PPN/jsfO1hwX/cbihxXUlFGvKBqevQccHBhNQ2XkvSGSykEvOh004C/eeZwBCiA0xeYe
         9JyFHIvbEjfb2vpplgsWyT231LIyFTN3/qwF3JWvX1qqm62J/oJ3VRKIY6SbpOn0Rq7T
         duOOZZksIdWJWO+gKLGwEqLR1GTM54THSJ+LglCyetzC0pBEHu+PTllq8Ez2EROJjDR0
         6pEwVGUsX8Wp/KLezOip+QT03O7FkKhqu6AaaO6rNfKbQzOQ86ZBTgswoVNNwZ6DwUIs
         jLEg==
X-Forwarded-Encrypted: i=1; AJvYcCXtVkEVSXdvNa/ktce5T3lVvV4fFCtsN4HS8U/qsipcFqqkdhsZpYU8pJw/S4iwO1ewlGnPdqKwvk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvczvdwzwNQ9IhN+PCpv0x6EKFq5jiCGJqyrnL/ouKqyo29ZTs
	k/+h88+8cQo69yBzzS+dv4qEgkJ4rs1WYL6KnbP/KKLhC7P+ON8ZDBvjHQ1CbklcMkoWelN8c2k
	YYo8CQ0VBbUKqnKgxaQ==
X-Received: from plbh22.prod.google.com ([2002:a17:902:eed6:b0:2ae:4f98:6bcf])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:32c7:b0:2ae:7ed6:7829 with SMTP id d9443c01a7336-2aeae95de8bmr1108265ad.56.1773175314704;
 Tue, 10 Mar 2026 13:41:54 -0700 (PDT)
Date: Tue, 10 Mar 2026 20:41:05 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=0B74D21BCA57BD40083A73A0DB00FC8CD80B20A1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631; i=rdbabiera@google.com;
 h=from:subject; bh=vQYq1gy/+ms8DFsoybWdQExdLq9oVYK1dKhC27tDqpA=;
 b=owGbwMvMwCV2m+FPzw1uhYWMp9WSGDI3ND4KWTC7ea+R/8SFc5OW73mwn9vdulMwR4zLaKJh/
 rTnk2JudZSyMIhxMciKKbJwl1ySPhW+14HDqngBzBxWJpAhDFycAjCRzlaGvwLnSqqnmswtZBab
 +YZtR97BcOMpwotOy79Q+dr3LGrXnBSGf4Y7ls/92qqT52BdutWHc2Wo4A7ZmxVlJS6LDrK6S2U s5wMA
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260310204106.3939862-2-rdbabiera@google.com>
Subject: [PATCH v1] usb: typec: altmode/displayport: set displayport signaling
 rate in configure message
From: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	utkarsh.h.patel@intel.com, andriy.shevchenko@linux.intel.com, 
	badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	RD Babiera <rdbabiera@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: BC37E257FB2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MISSING_TO(2.00)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34499-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdbabiera@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

dp_altmode_configure sets the signaling rate to the current
configuration's rate and then shifts the value to the Select
Configuration bitfield. On the initial configuration, dp->data.conf
is 0 to begin with, so the signaling rate field is never set, which
leads to some DisplayPort Alt Mode partners sending NAK to the
Configure message.

Set the signaling rate to the capabilities supported by both the
port and the port partner. If the cable supports DisplayPort Alt Mode,
then include its capabilities as well.

Fixes: a17fae8fc38e ("usb: typec: Add Displayport Alternate Mode 2.1 Support")
Cc: stable@kernel.org
Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/altmodes/displayport.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index d185688a16b1..35d9c3086990 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -100,9 +100,14 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
 {
 	u8 pin_assign = 0;
 	u32 conf;
+	u32 signal;
 
 	/* DP Signalling */
-	conf = (dp->data.conf & DP_CONF_SIGNALLING_MASK) >> DP_CONF_SIGNALLING_SHIFT;
+	signal = DP_CAP_DP_SIGNALLING(dp->port->vdo) & DP_CAP_DP_SIGNALLING(dp->alt->vdo);
+	if (dp->plug_prime)
+		signal &= DP_CAP_DP_SIGNALLING(dp->plug_prime->vdo);
+
+	conf = signal << DP_CONF_SIGNALLING_SHIFT;
 
 	switch (con) {
 	case DP_STATUS_CON_DISABLED:

base-commit: bb375c251ab40bdbc5272008fcf2bc6cd5266610
-- 
2.53.0.473.g4a7958ca14-goog


