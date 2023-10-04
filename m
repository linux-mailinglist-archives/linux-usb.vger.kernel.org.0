Return-Path: <linux-usb+bounces-1090-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5777B8B74
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 20:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 04E6E28177F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 18:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8F021110;
	Wed,  4 Oct 2023 18:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWNMv/15"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D72208AF
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 18:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29917C433CD;
	Wed,  4 Oct 2023 18:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696445639;
	bh=hJ13L6+0t085ntXpxQD42WXHyl1kwHHYbjDB4aBhDeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aWNMv/15ARZhZhz2JIW4IT6BxNZIhAACW1IpWm0oA5a0Ku7/GgtXJemfhpVudk59l
	 5TX1yy/V28obFUalsAn2irlBZqK4IX+8M05sQiNWwaPmDE+RV7rjbYMGz3XTXZEW6g
	 2rXQ/vgtA8cpZ4DgnSomxppCGHmNkZTfBnm/zpfy/0fghx4/xx4hPtJ3msfs437il7
	 0N1S6+RtCDL5wMmnG4xbxq9Iyh4li4JUCRW2J8lbo4g1AKcXpSb3i7IuxlNGXFrhKo
	 GargV9EdMqWGJ1gNyFpiopMdi/ljmC3utqxNumBMbn1wk7Tftp4WaISQiWgenC2xG1
	 c4yMnckWz8Fjw==
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v2 12/89] function: convert to new timestamp accessors
Date: Wed,  4 Oct 2023 14:51:57 -0400
Message-ID: <20231004185347.80880-10-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004185347.80880-1-jlayton@kernel.org>
References: <20231004185221.80802-1-jlayton@kernel.org>
 <20231004185347.80880-1-jlayton@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to using the new inode timestamp accessor functions.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/usb/gadget/function/f_fs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index af400d083777..efe3e3b85769 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1383,8 +1383,8 @@ ffs_sb_make_inode(struct super_block *sb, void *data,
 		inode->i_mode    = perms->mode;
 		inode->i_uid     = perms->uid;
 		inode->i_gid     = perms->gid;
-		inode->i_atime   = ts;
-		inode->i_mtime   = ts;
+		inode_set_atime_to_ts(inode, ts);
+		inode_set_mtime_to_ts(inode, ts);
 		inode->i_private = data;
 		if (fops)
 			inode->i_fop = fops;
-- 
2.41.0


