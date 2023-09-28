Return-Path: <linux-usb+bounces-694-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D727E7B1980
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 13:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 907A02828E4
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 11:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B3E3716C;
	Thu, 28 Sep 2023 11:04:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D50D37144
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 11:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF61C43391;
	Thu, 28 Sep 2023 11:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695899067;
	bh=BjT5FOHm+eazmJSyqelvN0UNyLg8HYUUwJ3M3CdqJxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tBRF09ysU7N2igynCW093NVQflZFAh+gsZ3yeIMONpafyrjtuB5FRDk0jdIGxfBy/
	 bzy5MZTW/WBmqP7cJIpKOZQwqFtJdpQowwjd/RlVj1j3zhhVpALHNhkrzhqHdkMGdG
	 C83PebiDEHuEZq/fRlMdeC2xe4NR9YAK/CwxVzsnK3U9H1fDLO7rCo4BPEBjBVuqJG
	 2jguEeIc4dODzqxPPUeOcrVr+DXAYxZSAm0FYGckqnVyrLnXrMZTRWJaGo1AN3Kctv
	 A/Gg9A0rI7Ep6Oy/e0uxDaWgq/n64BeUoobMJTKZ0NK91j8mK7dFNgr5meU5JaZaHe
	 SQp25SpvR3yWA==
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 13/87] drivers/usb/gadget/function: convert to new inode {a,m}time accessors
Date: Thu, 28 Sep 2023 07:02:22 -0400
Message-ID: <20230928110413.33032-12-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928110413.33032-1-jlayton@kernel.org>
References: <20230928110300.32891-1-jlayton@kernel.org>
 <20230928110413.33032-1-jlayton@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/usb/gadget/function/f_fs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 6e9ef35a43a7..ec26df0306f2 100644
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


