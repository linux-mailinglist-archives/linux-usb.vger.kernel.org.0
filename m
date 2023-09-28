Return-Path: <linux-usb+bounces-695-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D06B97B1981
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 13:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 88471282AC5
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 11:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E480937178;
	Thu, 28 Sep 2023 11:04:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B3B37144
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 11:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46A2C433C9;
	Thu, 28 Sep 2023 11:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695899068;
	bh=slu/w5rI+KXxDY+5fpzzCTL3L8BN0xD+uN4a6hp53rY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GI7swmbVibd1tjnpl/jAkDP9LmrrY1nhy3unkOrf0gYEvrV9e9PCt3H2+UCFavHjE
	 U2ynj3iONb40+fZ5mpQ4FOwKUOcLuP02UXSoHignubFnOPEscgNc43+oxi3Avi7a/E
	 yGSuUbxkLF99cgYAQdsuIahGPKcofVDZPrISq886MwofoYoXcFTDsaY0FsRWqOnwjA
	 i8hFXvoUv70ngcew2yEjJ7BB/7ZcF4SHKXF4qMKUwRcNUEUMYQRQqRzorxu5he45Ru
	 61F7zWbFo9C5MNYOujXCAz427YNK1L1L/liwrSvDDgx3h0grwXE0mKxcIHYZrCYWDN
	 yCZyYBzSzQmMQ==
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 14/87] drivers/usb/gadget/legacy: convert to new inode {a,m}time accessors
Date: Thu, 28 Sep 2023 07:02:23 -0400
Message-ID: <20230928110413.33032-13-jlayton@kernel.org>
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
 drivers/usb/gadget/legacy/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index ce9e31f3d26b..cdc0926100fd 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1969,7 +1969,7 @@ gadgetfs_make_inode (struct super_block *sb,
 		inode->i_mode = mode;
 		inode->i_uid = make_kuid(&init_user_ns, default_uid);
 		inode->i_gid = make_kgid(&init_user_ns, default_gid);
-		inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
+		simple_inode_init_ts(inode);
 		inode->i_private = data;
 		inode->i_fop = fops;
 	}
-- 
2.41.0


