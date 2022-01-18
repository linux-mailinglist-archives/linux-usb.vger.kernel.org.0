Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC76491C4E
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jan 2022 04:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350184AbiARDOl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jan 2022 22:14:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346675AbiARDI7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jan 2022 22:08:59 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8612C06175C;
        Mon, 17 Jan 2022 18:51:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A9D36118D;
        Tue, 18 Jan 2022 02:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC9BC36AE3;
        Tue, 18 Jan 2022 02:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642474285;
        bh=46ZQ2Ukvtqdel2YKeI9Beyu+coFEEPVZxoQUk1YKJUY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d4lYVqFw6aGpGNN+0oqJHxCxpQ82tzcyTmWQDS64qh5clK5lIkSQLfZJVL6VEN9uu
         a+9u6S+TWLIncBrgYPZO/oqcp3RXeksBklrYgaCaRAiyBsG/6G1l2vmDYM14LY+HFH
         MevQPkK+e53kWgdr2037HGshrPxCpTUPkDrSRI8dHv/qdThU0BVO5WxR+qK9KssUaM
         P2tY9gk3w8fTbIYQvUY5TGwCXHUTc0UMZm0LAX9Xv32JD6EWwuIBKDhM9SIEtLks0s
         pIR2vfYIRPGggE+qyaXPeSLZP+/2T4YQ6x7u9IPjeJ8uf2mr6pnVNMDWTQ2mz8oiTe
         EpS/zpyRv4DfA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, balbi@kernel.org,
        axboe@kernel.dk, dean@sensoray.com, wcheng@codeaurora.org,
        salah.triki@gmail.com, jj251510319013@gmail.com,
        plr.vincent@gmail.com, andrew_gabbasov@mentor.com, lkp@intel.com,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 04/33] usb: gadget: f_fs: Use stream_open() for endpoint files
Date:   Mon, 17 Jan 2022 21:50:46 -0500
Message-Id: <20220118025116.1954375-4-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118025116.1954375-1-sashal@kernel.org>
References: <20220118025116.1954375-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Pavankumar Kondeti <quic_pkondeti@quicinc.com>

[ Upstream commit c76ef96fc00eb398c8fc836b0eb2f82bcc619dc7 ]

Function fs endpoint file operations are synchronized via an interruptible
mutex wait. However we see threads that do ep file operations concurrently
are getting blocked for the mutex lock in __fdget_pos(). This is an
uninterruptible wait and we see hung task warnings and kernel panic
if hung_task_panic systcl is enabled if host does not send/receive
the data for long time.

The reason for threads getting blocked in __fdget_pos() is due to
the file position protection introduced by the commit 9c225f2655e3
("vfs: atomic f_pos accesses as per POSIX"). Since function fs
endpoint files does not have the notion of the file position, switch
to the stream mode. This will bypass the file position mutex and
threads will be blocked in interruptible state for the function fs
mutex.

It should not affects user space as we are only changing the task state
changes the task state from UNINTERRUPTIBLE to INTERRUPTIBLE while waiting
for the USB transfers to be finished. However there is a slight change to
the O_NONBLOCK behavior. Earlier threads that are using O_NONBLOCK are also
getting blocked inside fdget_pos(). Now they reach to function fs and error
code is returned. The non blocking behavior is actually honoured now.

Reviewed-by: John Keeping <john@metanate.com>
Signed-off-by: Pavankumar Kondeti <quic_pkondeti@quicinc.com>
Link: https://lore.kernel.org/r/1636712682-1226-1-git-send-email-quic_pkondeti@quicinc.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/function/f_fs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 0336392686935..e4826454de1a7 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -608,7 +608,7 @@ static int ffs_ep0_open(struct inode *inode, struct file *file)
 	file->private_data = ffs;
 	ffs_data_opened(ffs);
 
-	return 0;
+	return stream_open(inode, file);
 }
 
 static int ffs_ep0_release(struct inode *inode, struct file *file)
@@ -1071,7 +1071,7 @@ ffs_epfile_open(struct inode *inode, struct file *file)
 	file->private_data = epfile;
 	ffs_data_opened(epfile->ffs);
 
-	return 0;
+	return stream_open(inode, file);
 }
 
 static int ffs_aio_cancel(struct kiocb *kiocb)
-- 
2.34.1

