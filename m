Return-Path: <linux-usb+bounces-34283-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHyeLM+irmk9HAIAu9opvQ
	(envelope-from <linux-usb+bounces-34283-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:37:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5EA237365
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 305A2305ACA5
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 10:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50459390C98;
	Mon,  9 Mar 2026 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxvaVbAb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19B93921C4;
	Mon,  9 Mar 2026 10:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052429; cv=none; b=BAc9bAQ4rkwz78rCMDWNrosuGXOXAbqh3O4itF44MzA821XxSC1K7LkmZrLIz+/IW9bAtzQNE5EAPZCKEjw6ylC7GgNuxnfQGfHyTLog45jlTD1FCZmtWYe/K+XshhCGGgfv/DyWZ6a7DmYteQmVPcpmResKzAbekR8Z6NLm1nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052429; c=relaxed/simple;
	bh=wtlzZ7OpZ9t1rChmMG51K4g/14Em6sUccJhAe/r62y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3BuH5pZJkqwLgziJMuLMkZl+n3bkr5d2MyzI7OPBhGaSSOp48mB1BzyrAQDV7NyNzIQWx2WcZUN9UvuZOThZw1vdvtQ+jckzBLerW5RHLd6iRTb438ODw5iexbpmmcufTcHTUPu9CrncXgiu6SRJNlrEJng03D7RBrRh+l8jVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxvaVbAb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB682C19423;
	Mon,  9 Mar 2026 10:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773052429;
	bh=wtlzZ7OpZ9t1rChmMG51K4g/14Em6sUccJhAe/r62y4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jxvaVbAbkyBAivqrI6uxnpr+yshnbcBUBpBEO1kI3gqiHRJsZCxCwZf7ZfBmvcqEl
	 V9FQF3NJY1+pmWqoSi5lRovH8kTayP5Ok/ufJjpmlTwDwInc2G0jERBAhv+Uqtl2rK
	 2NCx06h085h3NCqyo4O96jPHfheLcCuy5jBN4xteqQGkKHXDnpyr9teQGTzId81AtW
	 KvETaPGlLO9/yhNGHyjrLVuL1VARVAsS9rZDbglsGfP3Nu7rRTmvGOAL4RDHfrrRKG
	 tdKm22Cqt7k0HnoSqNJUy85moaa4cHo8nL/JFmDapDaV9kFY5xawxAued1dNVTUWWO
	 ywBr2o2AUDoFg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 09 Mar 2026 11:33:01 +0100
Subject: [PATCH RFC/RFT 3/3] thunderbolt: Add some more descriptive probe
 error messages
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-topic-usb4_nonpcie_prepwork-v1-3-d901d85fc794@oss.qualcomm.com>
References: <20260309-topic-usb4_nonpcie_prepwork-v1-0-d901d85fc794@oss.qualcomm.com>
In-Reply-To: <20260309-topic-usb4_nonpcie_prepwork-v1-0-d901d85fc794@oss.qualcomm.com>
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773052420; l=2104;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=MG1akxL0nb54DDcc8UyAn6PeKPR2rxv6fJV9cH7fB5A=;
 b=N9DHob2jznpDh9ZNvdAoN4SIVMCjK2fuDQ9F+uw4ZIH6T1KKW3mFy0TyW2T2ublSxQ43J7yCc
 Q0eE3XnOY2oDc+Yv1cAE3s0wmVdd1SccQ1Bh4C40NSIXPp3vq9nmTaU
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 6B5EA237365
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34283-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.961];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently there's a lot of silent error-return paths in various places
where nhi_probe() can fail. Sprinkle some prints to make it clearer
where the problem is.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/nhi.c | 4 ++--
 drivers/thunderbolt/tb.c  | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index ca832f802ee7..9f39a837c731 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1184,7 +1184,7 @@ int nhi_probe_common(struct tb_nhi *nhi)
 	if (nhi->ops && nhi->ops->init) {
 		res = nhi->ops->init(nhi);
 		if (res)
-			return res;
+			return dev_err_probe(dev, res, "NHI specific init failed\n");
 	}
 
 	tb = nhi_select_cm(nhi);
@@ -1202,7 +1202,7 @@ int nhi_probe_common(struct tb_nhi *nhi)
 		 */
 		tb_domain_put(tb);
 		nhi_shutdown(nhi);
-		return res;
+		return dev_err_probe(dev, res, "tb_domain_add() failed\n");
 	}
 	dev_set_drvdata(dev, tb);
 
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 0126e38d9396..e743fb698b30 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2990,7 +2990,8 @@ static int tb_start(struct tb *tb, bool reset)
 
 	tb->root_switch = tb_switch_alloc(tb, &tb->dev, 0);
 	if (IS_ERR(tb->root_switch))
-		return PTR_ERR(tb->root_switch);
+		return dev_err_probe(tb->nhi->dev, PTR_ERR(tb->root_switch),
+				     "tb_switch_alloc() failed\n");
 
 	/*
 	 * ICM firmware upgrade needs running firmware and in native
@@ -3007,14 +3008,14 @@ static int tb_start(struct tb *tb, bool reset)
 	ret = tb_switch_configure(tb->root_switch);
 	if (ret) {
 		tb_switch_put(tb->root_switch);
-		return ret;
+		return dev_err_probe(tb->nhi->dev, ret, "Couldn't configure switch\n");
 	}
 
 	/* Announce the switch to the world */
 	ret = tb_switch_add(tb->root_switch);
 	if (ret) {
 		tb_switch_put(tb->root_switch);
-		return ret;
+		return dev_err_probe(tb->nhi->dev, ret, "Couldn't add switch\n");
 	}
 
 	/*

-- 
2.53.0


