Return-Path: <linux-usb+bounces-17812-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 321459D6C46
	for <lists+linux-usb@lfdr.de>; Sun, 24 Nov 2024 00:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 997C9280A17
	for <lists+linux-usb@lfdr.de>; Sat, 23 Nov 2024 23:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7BE1AAE39;
	Sat, 23 Nov 2024 23:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pen.gy header.i=@pen.gy header.b="VN10dnr+"
X-Original-To: linux-usb@vger.kernel.org
Received: from pv50p00im-ztdg10012001.me.com (pv50p00im-ztdg10012001.me.com [17.58.6.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111E21A38E3
	for <linux-usb@vger.kernel.org>; Sat, 23 Nov 2024 23:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732406125; cv=none; b=TVAIBjersMqgditWrTFh9llUi5ErXs89wM/u9Cr74mzfDrO5vveUPI6PWrl0Raqlz8qlSSRkNjqr+kH6K+9j5U5+EPDe8Aoy+u4ABPTcQ6fqU/Ld0zcwbQnon2y1NfIqlpccM6f271sTABBNw5+3cK7g3pZCLhrOA+f2YehyeF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732406125; c=relaxed/simple;
	bh=+IuoLCtpU9LEpq2qS4rg4AoNn6INUTDGShMb/r5V1VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3mXvU5DwK0952A8qYd/p6R6eq/Sdv4EtldzEQ51CPZiAYIXeqBWkjYH75DyjKcBSVTzhp4cqqcDTvXgwlC6ceznjlB6KAHazdMUH5E8RExhbvy/dO1DjzeMPsYE90qHbwPPgCASnHm6KBXm9CxEjhUUzsVWd8rEKnl1OAoowaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pen.gy; spf=pass smtp.mailfrom=pen.gy; dkim=pass (2048-bit key) header.d=pen.gy header.i=@pen.gy header.b=VN10dnr+; arc=none smtp.client-ip=17.58.6.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pen.gy
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pen.gy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pen.gy; s=sig1;
	t=1732406122; bh=8XGc+JFhBXvZG8lFIOrG5sLkIVFMKa9quSy8yU//xtw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=VN10dnr+vQyy9lHaq/d4vUadT4rapQt1+BU9L78T84tKp8+2PVBM2Snz+8XxOpbgY
	 1tE8HZ7gIZ++EMM+jpd61Bytgzd+ecKMPn3Eyfs1bPFKu5Z41rnP2juREA9Fa97myL
	 JU+dxWEuDpTBYXvyL+XS9xbwEWSafMCQ0OxPi3zyJLc6Nz/e2611h+E0IIuKY629Bp
	 iA7/ZmBLDROKDbdBY5/kG35UlOfOZu91jueFF3DQ+QBYmQo0rXsuON69dnMgJ16+2w
	 b5X76H/sEqqUC3t74pMjTMgUi+ca+IGM5SsBE5oYMyLCGGsh90EqyRUrQ2CGzf+Ywj
	 /K3LsojAniwcQ==
Received: from fossa.se1.pen.gy (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10012001.me.com (Postfix) with ESMTPSA id 05560A0139;
	Sat, 23 Nov 2024 23:55:17 +0000 (UTC)
From: Foster Snowhill <forst@pen.gy>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Georgi Valkov <gvalkov@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH net v3 2/6] usbnet: ipheth: fix possible overflow in DPE length check
Date: Sun, 24 Nov 2024 00:54:28 +0100
Message-ID: <20241123235432.821220-2-forst@pen.gy>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241123235432.821220-1-forst@pen.gy>
References: <20241123235432.821220-1-forst@pen.gy>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eiC_qm0aNVjK1upq75MBbx5lPlM6MX4K
X-Proofpoint-ORIG-GUID: eiC_qm0aNVjK1upq75MBbx5lPlM6MX4K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-23_19,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=670 malwarescore=0 clxscore=1030 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2411230200

Originally, it was possible for the DPE length check to overflow if
wDatagramIndex + wDatagramLength > U16_MAX. This could lead to an OoB
read.

Move the wDatagramIndex term to the other side of the inequality.

An existing condition ensures that wDatagramIndex < urb->actual_length.

Fixes: a2d274c62e44 ("usbnet: ipheth: add CDC NCM support")
Signed-off-by: Foster Snowhill <forst@pen.gy>
---
v3:
    Split out from a monolithic patch in v2 as an atomic change.
v2: https://lore.kernel.org/netdev/20240912211817.1707844-1-forst@pen.gy/
    No code changes. Update commit message to further clarify that
    `ipheth` is not and does not aim to be a complete or spec-compliant
    CDC NCM implementation.
v1: https://lore.kernel.org/netdev/20240907230108.978355-1-forst@pen.gy/
---
 drivers/net/usb/ipheth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/ipheth.c b/drivers/net/usb/ipheth.c
index 2084b940b4ea..4b590a5269fd 100644
--- a/drivers/net/usb/ipheth.c
+++ b/drivers/net/usb/ipheth.c
@@ -254,8 +254,8 @@ static int ipheth_rcvbulk_callback_ncm(struct urb *urb)
 	while (le16_to_cpu(dpe->wDatagramIndex) != 0 &&
 	       le16_to_cpu(dpe->wDatagramLength) != 0) {
 		if (le16_to_cpu(dpe->wDatagramIndex) >= urb->actual_length ||
-		    le16_to_cpu(dpe->wDatagramIndex) +
-		    le16_to_cpu(dpe->wDatagramLength) > urb->actual_length) {
+		    le16_to_cpu(dpe->wDatagramLength) > urb->actual_length -
+		    le16_to_cpu(dpe->wDatagramIndex)) {
 			dev->net->stats.rx_length_errors++;
 			return retval;
 		}
-- 
2.45.1


