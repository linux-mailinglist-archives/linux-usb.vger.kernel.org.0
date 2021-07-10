Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AFDA3C30C0
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jul 2021 04:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234654AbhGJCgh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jul 2021 22:36:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:53326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234032AbhGJCfa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Jul 2021 22:35:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F2F2613F2;
        Sat, 10 Jul 2021 02:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625884349;
        bh=PY5otcidCrBlxgzw6sEr1yBO0QN1sHRuzs7o75iBBz0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pEUcr+EDkdz1r5MCRz4c/kOHEXj94FGD621b9qz0RSuA6nrQ+IwHDnfAc3/BIUFYS
         YcKXn4z+SAePRcvaiS8euc6sC8dLcqTkfU0tchI7TICCNbXmdjDOqhcBxrE8mMn2YH
         7vjYzwJdF4o3ryrWKX6J1s9F64dhsEZNwESFGjqxh4KmTNoaYoEiv4rFTY5DHLt2an
         kSNBovt3s/sdAKakCF5suAUYy63HZz3fQHieEAfLGXHQ61etWV+zBk4qN4bgzP+XEr
         GS3uyc1s52dJq/vgTKG7O0NXaVOHxuGgFReTOtk7c5WS1gOO0A+0LGMawBiMLUJbWq
         cns8TdXFoyotQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Johan Hovold <johan@kernel.org>,
        syzbot+7dbcd9ff34dc4ed45240@syzkaller.appspotmail.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 20/39] USB: core: Avoid WARNings for 0-length descriptor requests
Date:   Fri,  9 Jul 2021 22:31:45 -0400
Message-Id: <20210710023204.3171428-20-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710023204.3171428-1-sashal@kernel.org>
References: <20210710023204.3171428-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Alan Stern <stern@rowland.harvard.edu>

[ Upstream commit 60dfe484cef45293e631b3a6e8995f1689818172 ]

The USB core has utility routines to retrieve various types of
descriptors.  These routines will now provoke a WARN if they are asked
to retrieve 0 bytes (USB "receive" requests must not have zero
length), so avert this by checking the size argument at the start.

CC: Johan Hovold <johan@kernel.org>
Reported-and-tested-by: syzbot+7dbcd9ff34dc4ed45240@syzkaller.appspotmail.com
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Link: https://lore.kernel.org/r/20210607152307.GD1768031@rowland.harvard.edu
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/core/message.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 152228d33ad2..2d1012d4bb33 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -647,6 +647,9 @@ int usb_get_descriptor(struct usb_device *dev, unsigned char type,
 	int i;
 	int result;
 
+	if (size <= 0)		/* No point in asking for no data */
+		return -EINVAL;
+
 	memset(buf, 0, size);	/* Make sure we parse really received data */
 
 	for (i = 0; i < 3; ++i) {
@@ -695,6 +698,9 @@ static int usb_get_string(struct usb_device *dev, unsigned short langid,
 	int i;
 	int result;
 
+	if (size <= 0)		/* No point in asking for no data */
+		return -EINVAL;
+
 	for (i = 0; i < 3; ++i) {
 		/* retry on length 0 or stall; some devices are flakey */
 		result = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
-- 
2.30.2

