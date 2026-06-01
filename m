Return-Path: <linux-usb+bounces-38217-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAiqCOUmHWq6VwkAu9opvQ
	(envelope-from <linux-usb+bounces-38217-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 08:29:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8888B61A2DC
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 08:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 316433012BC0
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 06:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8C3348445;
	Mon,  1 Jun 2026 06:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="i6lT4Iho"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415A1273D6D;
	Mon,  1 Jun 2026 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295388; cv=none; b=Avf63WCMJy3DXg58ESNbBevM7UyesHodUME9+XnmMSGlxFICdk5kqmWvqLsjSzWb29/5dGfO/tqcxe+g0NiqBq1LiQFPoZyLZZVDxAHxINWxBgjIuQ+HRHckNJ7RNQToVttTGP+gZ+CBoQbVPTnN2TzTiSmn6V64bkAI41eQEic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295388; c=relaxed/simple;
	bh=34dwax8FP0xXFaRd9w+w3UJgXZFtWS1sTQBckIqFJUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fBOko3xMGKiEXyjZkmQYftb4mIZrG7A/Lby6QqCHqWgjPvuLdu+oY8xztxOJR5my9sKHR6YQmu+SpTFH25ldNB9PfnpA4nDR6Bm5/pvIoXyzy9Jd8OcpD/RrlaEaY3bG7DXuCv4tnxWBJgIH3VSI46hlg8LK7cc7kTAufrM5fdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=i6lT4Iho; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780295353;
	bh=Fba7teV7Wu4qEr43jgXjCDmnNDa9jDRHeMXc6+W2bjg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=i6lT4IhoQpt5bh+JzBnv7UkPjDGuCVH/x/gAWZFOXg3zVwonsDVPkCG0fBsAwo1la
	 9Ayd+kPOJKYzILhS9dSM7hOVhtotiUHvS+wRVUj6pfGHYw67GPcONy9UHX8hh5Uvij
	 fHJVDEakcHkraVXe6ZDN++tYac1fYCdXlrid/iFE=
X-QQ-mid: zesmtpsz6t1780295338t3e284d66
X-QQ-Originating-IP: OIe07FfnJ1Ub9F+H1gA1Qy+96sYGmYNPrr5GpmCSxSc=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 01 Jun 2026 14:28:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5179332692064258532
EX-QQ-RecipientCnt: 6
From: Xu Rao <raoxu@uniontech.com>
To: andreas.noever@gmail.com
Cc: westeri@kernel.org,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] thunderbolt: test: release third DP tunnel
Date: Mon,  1 Jun 2026 14:28:54 +0800
Message-ID: <523C55ED1A2B868E+20260601062854.4334-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MTGYztYhR5ET5H/R20ph7Ev85W9U2ES8GOlMFqskLpVb8ZYCpmXcN/W4
	LNB+jT5X+12YGHiakxWScGsoiHWZEKrh0iLJckfERrEo/ah44Jp6YsWgYMjZl2xmyj9V25v
	h2YT2d2UEY74LPc1+bhhmOz13Vdqn0A+PRQZRlJjLa1sJ6hKkTTOrAn1IwQX3IlBrlt0Lh8
	JuTblS5hYvqgA158IXus8DG0vZ7PDb26jiJwEUVXMMoRhsO5auME4h1ql+3d0B+92n53HMM
	Xvo53pCg1jxk9joM0z5vgjSJZcpXqMONvPkMkAfJrdgfkQtRmDR2RE40EFg3lp7vKU0IXRJ
	mLWonhePVlm9gvT3P+vECQ42k3ZZqsctgtSc/WW7Get49uQp5hWtvMnC/z5p+fWCH6q85OR
	BJcsnERBrmeadjjt0vZZftPbDjooLDyS2tDYd2/+hb1oNflY5wdM9InS7WL/eVSEaD6hPQ6
	6ZwSQbMkJA8I1685jSM1U4zDQcRTXG3r+W3GwFzceGe3hM6Z6cYAxaB3bmULzPHph4BqazF
	vmmyIPWd1tHdB88tveTni5fYxpT8spuiFN2w3QsyTqAap44LXJH3poAY1hU8iaE6D+2wz9g
	sxKlDUjoTpz9yRXBleXq9pA2c1eczM7R0pEyLYzzLgOs9J0DDjEm57Ur8p0YqQquVu3Y7fF
	2aDpiTad+vca5VK/9GtOYzhVdpZtTF83VZv7Cw5G/uDtPTMVnlN1HVAx3mAZnLYHReWrfcQ
	8mSGK3sRsYBrDkoqshS4oE5zf5U8HScisPO2gdGvHvrQJFSew+fZhhv8mtG3yJs6A/pbW+E
	kjXNyTyh765TNLgFP3oWP7eC9q0R9QdNRuqVN0yWNDU6U/8i8YqinkL0N7yw+LNqK3QMI1A
	Iu+oeWjWTl5mYywKE3UjcN3CspFjjkn7dQyQrvuj0ov0CYLGInVUNXOjT6kxc4X40v8iA6R
	5ne04hVmjyLAOBfKWpufKTrr2uPYX3cHIlV7DxKJpwb38s3gsDR8delthmc8Klh66/VNJVa
	3STxvLeRVGQNvpMKVa
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,uniontech.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-38217-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,uniontech.com:email,uniontech.com:mid,uniontech.com:dkim]
X-Rspamd-Queue-Id: 8888B61A2DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tb_test_tunnel_3dp() allocates three DisplayPort tunnels
but only releases the first two before returning. Release the
third tunnel as well to keep the test cleanup balanced.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/thunderbolt/test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 1f4318249c22..675ab2f24ea1 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -1661,6 +1661,7 @@ static void tb_test_tunnel_3dp(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, tunnel3->npaths, 3);
 	KUNIT_ASSERT_EQ(test, tunnel3->paths[0]->path_length, 3);

+	tb_tunnel_put(tunnel3);
 	tb_tunnel_put(tunnel2);
 	tb_tunnel_put(tunnel1);
 }
--
2.50.1


