Return-Path: <linux-usb+bounces-35809-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNqWHyGJzWnFegYAu9opvQ
	(envelope-from <linux-usb+bounces-35809-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 23:07:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F3D3807DC
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 23:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 719F130530FE
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 21:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E5B3B895F;
	Wed,  1 Apr 2026 21:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgAtuK9Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F40E3B776A;
	Wed,  1 Apr 2026 21:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775077330; cv=none; b=O0PL9L51oGu9CV4S9tnucchSVq0QIMocwxDFZNf62ynfFVrKCfKGgb85TRsABnOUQ5h5Ygc1+bon/ODU+skTLe5RVjS4wRzdiwxpUAnNxsD9TZtGYT6ZSSdJpyb9/Z/u4X3FKjYBAZEOmrlmy2aWjrZNDKrwNIuIu9PwJHlg9fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775077330; c=relaxed/simple;
	bh=L58uh9aBIxg/CIlqDRb0F/mkohK+bfSXFUrxnHGWD8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nlaew38aV73SRAjW6ANkE46DhjcMdx4jFMrDa3rDqAB6vZIOHqG7rFR/StVOYR7qcif0UEMnIKyMsY2GL4v9p0kExkwh19cFYaO0EVqAY2ysPC9sioSLccI8GCQ0nI153bQTUzt//jwAxp9ezd17eGdXxg7PZ+CTqHFvAVfbgNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgAtuK9Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED5C4C2BCAF;
	Wed,  1 Apr 2026 21:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775077330;
	bh=L58uh9aBIxg/CIlqDRb0F/mkohK+bfSXFUrxnHGWD8Y=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=BgAtuK9Zwc4o/0bEs/8qJVhXL0gF2JbgdfEc6pUsUymfio/WR1Yjd8tKehcoGCg8A
	 2nfq8zB/iuNil1xU6QBXeCgYr1Ffs4UZin91hgY9td0lbbLkJ8rHTezWiTcKi8o/bt
	 Ti9oQmsJvFx3gdQOb0/+RYSbEK9pv0bdjwoKnHMmSUhc+BuJWvDIuOLokcX/1RNXi1
	 B1zuVXyp6BKhRoS4tABSR2TSMwuUxGpyNFAjSHb5rRWustjsjzNr9rz+TFpGJLZ7PC
	 ssU4R9IxU2MyUENOSiQlBwbzeTXBKY3GefqLalg56gy3k1eGQenNFTWSuw+gJDgnnO
	 Qyh37XGoH6zeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D940A10FCADC;
	Wed,  1 Apr 2026 21:02:09 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Wed, 01 Apr 2026 21:02:08 +0000
Subject: [PATCH] mfd: max77759: fix comment style for enums
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-fix-mfd-max77759-usb-next-v1-1-174ec23ad824@google.com>
X-B4-Tracking: v=1; b=H4sIAM+HzWkC/x2MywqAIBAAfyX23IL2svqV6GC51R6y0ApB+vek4
 8DMRPDkmDz0WQRHD3s+bAKZZzBv2q6EbBJDIYpGVELiwgH3xeCug1Kq7vD2E1oKF1LTKmNkOYt
 WQ+pPR0n+38P4vh9S0MymawAAAA==
X-Change-ID: 20260401-fix-mfd-max77759-usb-next-e687dd13c08a
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775077329; l=3284;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=7DZ+8ZRZWuwCTzw0kJR0me2ttfQ1oXwKqAtj79QG1jU=;
 b=VnHr0xONR1kTvZZjHhd/sHmSTg6nOJjtG0cMtUhG3f8l0yxRUnWvR+/kHXJXey0rklvh+ED/e
 EiFG1L9BdqlBSemk4B8NzdgE6dq8NC1CcOFfMePc4eQCnmAsASYPwsL
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35809-lists,linux-usb=lfdr.de,amitsd.google.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	HAS_REPLYTO(0.00)[amitsd@google.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D5F3D3807DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Amit Sunil Dhamne <amitsd@google.com>

Fix comment style for enums so they're kernel-doc compliant.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
This patch is a follow-up to the series [1]. [1] has been accepted in
the USB subsystem tree (usb-next). However, since Lee has additional
feedback [2], I am sending this patch to fix it. Please note that this
patch is based out of usb-next branch on usb tree. This patch should be
applied on top of b422f7c072ac ("mfd: max77759: add register bitmasks
and modify irq configs for charger").

[1] https://lore.kernel.org/all/20260325-max77759-charger-v9-0-4486dd297adc@google.com/
[2] https://lore.kernel.org/all/20260331123138.GE3795166@google.com/
---
Output of kernel-doc script (none format)
$ scripts/kernel-doc -v -none -Wall include/linux/mfd/max77759.h
Info: include/linux/mfd/max77759.h:134 Scanning doc for enum max77759_chgr_chgin_dtls_status
Info: include/linux/mfd/max77759.h:152 Scanning doc for enum max77759_chgr_bat_dtls_states
Info: include/linux/mfd/max77759.h:174 Scanning doc for enum max77759_chgr_chg_dtls_states
Info: include/linux/mfd/max77759.h:212 Scanning doc for struct max77759
Info: include/linux/mfd/max77759.h:235 Scanning doc for struct max77759_maxq_command
Info: include/linux/mfd/max77759.h:247 Scanning doc for struct max77759_maxq_response
Info: include/linux/mfd/max77759.h:258 Scanning doc for function max77759_maxq_command
---
 include/linux/mfd/max77759.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77759.h
index ad1aa4c2b779..ec19be952877 100644
--- a/include/linux/mfd/max77759.h
+++ b/include/linux/mfd/max77759.h
@@ -131,12 +131,12 @@
 #define MAX77759_MAXQ_OPCODE_USER_SPACE_READ     0x81
 #define MAX77759_MAXQ_OPCODE_USER_SPACE_WRITE    0x82
 
-/*
+/**
  * enum max77759_chgr_chgin_dtls_status - Charger Input Status
  * @MAX77759_CHGR_CHGIN_DTLS_VBUS_UNDERVOLTAGE:
  *     Charger input voltage (Vchgin) < Under Voltage Threshold (Vuvlo)
- * @MAX77759_CHGR_CHGIN_DTLS_VBUS_MARGINAL_VOLTAGE: Vchgin > Vuvlo and
- *     Vchgin < (Battery Voltage (Vbatt) + system voltage (Vsys))
+ * @MAX77759_CHGR_CHGIN_DTLS_VBUS_MARGINAL_VOLTAGE:
+ *     Vchgin > Vuvlo and Vchgin < (Battery Voltage (Vbatt) + system voltage (Vsys))
  * @MAX77759_CHGR_CHGIN_DTLS_VBUS_OVERVOLTAGE:
  *     Vchgin > Over Voltage threshold (Vovlo)
  * @MAX77759_CHGR_CHGIN_DTLS_VBUS_VALID:
@@ -149,7 +149,7 @@ enum max77759_chgr_chgin_dtls_status {
 	MAX77759_CHGR_CHGIN_DTLS_VBUS_VALID,
 };
 
-/*
+/**
  * enum max77759_chgr_bat_dtls_states - Battery Details
  * @MAX77759_CHGR_BAT_DTLS_NO_BATT_CHG_SUSP:	No battery and the charger suspended
  * @MAX77759_CHGR_BAT_DTLS_DEAD_BATTERY:	Vbatt < Vtrickle
@@ -171,7 +171,7 @@ enum max77759_chgr_bat_dtls_states {
 	MAX77759_CHGR_BAT_DTLS_BAT_ONLY_MODE,
 };
 
-/*
+/**
  * enum max77759_chgr_chg_dtls_states - Charger Details
  * @MAX77759_CHGR_CHG_DTLS_PREQUAL:		Charger in prequalification mode
  * @MAX77759_CHGR_CHG_DTLS_CC:			Charger in fast charge const curr mode

---
base-commit: 81ebd43cc0d6d106ce7b6ccbf7b5e40ca7f5503d
change-id: 20260401-fix-mfd-max77759-usb-next-e687dd13c08a

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



