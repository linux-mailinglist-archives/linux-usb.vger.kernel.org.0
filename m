Return-Path: <linux-usb+bounces-4131-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E57A8119DA
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 17:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B5431C21118
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 16:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A863B79D;
	Wed, 13 Dec 2023 16:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Plg/RkoE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AC53A8FF
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 16:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8150DC433C9;
	Wed, 13 Dec 2023 16:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702485794;
	bh=+jJ0AZEvag610YYMeIA2DZY9vRhnQ1MUWo6qd+Qzkcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Plg/RkoEgxcb5oLFgT/r2pbwVa+OiOKfDqeFr23Y4XhEqyZ5uVBDN++Xkp9njtYA/
	 e/ZmXCZgAUTOyvm1+MRDRVjk/Goo8EXcyPKp/Z5Jq6vkTd7Z0kpFegYh/Cr9+MFWQC
	 ExHTW5hlY3r+qo8ZKQSDl3P2AIFZRW2roFNhvsQBR8o6zm7rZPMr8nRhSijOrPYRQB
	 jum+fusgZZy+M4y8zPPL3U6Btq5SJH2c8BRlGS5oiDRK4vX1rVhGb5qPcu+A+1FypL
	 eGsgpAVmBSsoR8RBqoGoAYvcP7xcmaFTF+SCgp92suHe8vT62kPWYfSnmce8dWivHj
	 6fNgbUfjI7k1Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 09/12] usb: mon_stat: Replace snprintf() with the safer scnprintf() variant
Date: Wed, 13 Dec 2023 16:42:38 +0000
Message-ID: <20231213164246.1021885-10-lee@kernel.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231213164246.1021885-1-lee@kernel.org>
References: <20231213164246.1021885-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a general misunderstanding amongst engineers that {v}snprintf()
returns the length of the data *actually* encoded into the destination
array.  However, as per the C99 standard {v}snprintf() really returns
the length of the data that *would have been* written if there were
enough space for it.  This misunderstanding has led to buffer-overruns
in the past.  It's generally considered safer to use the {v}scnprintf()
variants in their place (or even sprintf() in simple cases).  So let's
do that.

Link: https://lwn.net/Articles/69419/
Link: https://github.com/KSPP/linux/issues/105
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/usb/mon/mon_stat.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/mon/mon_stat.c b/drivers/usb/mon/mon_stat.c
index 98ab0cc473d67..3c23805ab1a44 100644
--- a/drivers/usb/mon/mon_stat.c
+++ b/drivers/usb/mon/mon_stat.c
@@ -35,9 +35,9 @@ static int mon_stat_open(struct inode *inode, struct file *file)
 
 	mbus = inode->i_private;
 
-	sp->slen = snprintf(sp->str, STAT_BUF_SIZE,
-	    "nreaders %d events %u text_lost %u\n",
-	    mbus->nreaders, mbus->cnt_events, mbus->cnt_text_lost);
+	sp->slen = scnprintf(sp->str, STAT_BUF_SIZE,
+			     "nreaders %d events %u text_lost %u\n",
+			     mbus->nreaders, mbus->cnt_events, mbus->cnt_text_lost);
 
 	file->private_data = sp;
 	return 0;
-- 
2.43.0.472.g3155946c3a-goog


