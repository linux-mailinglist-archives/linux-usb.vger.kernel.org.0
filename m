Return-Path: <linux-usb+bounces-1091-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A897B8B75
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 20:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 1E16B281E65
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 18:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E989821365;
	Wed,  4 Oct 2023 18:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAhF7P5l"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED5321343
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 18:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDD5C433C9;
	Wed,  4 Oct 2023 18:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696445640;
	bh=kZrh+m6BDY/ck3IWsHLCZAJqaOXaS2UN3A122cBdzhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gAhF7P5lMuXWXH49Rpf51O/OLX0M0ZEsgDfjQrpk9W2DK0YUYYoRh/f2aSH+KL6d5
	 sgZiX73KgobMg9z/BizZRGIb/g4ShNe7EAbv5CiOoRsKhsfaonx7KRYcPFpD4UN+42
	 YWr5DBFHgoC0WwTPHZUvCHFP+IIdtoLMYGuB+JfOdzekgLCmjOyTPjxxUgadDKFXrB
	 GpulwzDj85mve/HJCVE+IEVzBDiJJLduRqeCpk0AktG6V11OnymLPp18Z8M2wzZE2S
	 UDchCCh5Q4H5W+VYlrxt6ZRID9uJAFYOxagHFZi4vfLBCG36iUNdQeU0FCpydHksbH
	 H7O4/nPJ1qP1Q==
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v2 13/89] legacy: convert to new timestamp accessors
Date: Wed,  4 Oct 2023 14:51:58 -0400
Message-ID: <20231004185347.80880-11-jlayton@kernel.org>
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


