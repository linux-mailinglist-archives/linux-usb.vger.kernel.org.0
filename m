Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841263C2F51
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jul 2021 04:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbhGJCbG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jul 2021 22:31:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:42628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234205AbhGJC3Q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Jul 2021 22:29:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DED1F6142D;
        Sat, 10 Jul 2021 02:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625883938;
        bh=YdjrPX0dC2pAWZg7bMEfpM/Ww9iM33zjIjra4OHLvZc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kn2dEojzmC//4MpszbF+MKYkdrk6CIrjSL55qUsqoAKBPlCjLunYuQXBkLH4bMBdY
         rhyH8kGR4NKLpv5F55xQU0nrMKMQRAQLHPGLxIjuhBlPhart1vu29ZMupJ298scM7A
         uif4rzO9y7ZulsrkFISA4JwnzI4UJjwZL/XndnOlutDebGZUf8kJ471K7oLK5Dt/mz
         Ni64aJtANE9htNOZ9I4Vzd+DMkKOXkUtbaBm48gdcDyqE7TdxjHcc3k+sBMXUEccao
         nPTl8AhN59gdVToonIr0e7jeXzQJfWxh16dxu5ngtwgc2/od4+2f+nP4zFL37oos7S
         QLAezxJJQWKgQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Johan Hovold <johan@kernel.org>,
        syzbot+7dbcd9ff34dc4ed45240@syzkaller.appspotmail.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 53/93] USB: core: Avoid WARNings for 0-length descriptor requests
Date:   Fri,  9 Jul 2021 22:23:47 -0400
Message-Id: <20210710022428.3169839-53-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022428.3169839-1-sashal@kernel.org>
References: <20210710022428.3169839-1-sashal@kernel.org>
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
index 19ebb542befc..dba2baca486e 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -785,6 +785,9 @@ int usb_get_descriptor(struct usb_device *dev, unsigned char type,
 	int i;
 	int result;
 
+	if (size <= 0)		/* No point in asking for no data */
+		return -EINVAL;
+
 	memset(buf, 0, size);	/* Make sure we parse really received data */
 
 	for (i = 0; i < 3; ++i) {
@@ -833,6 +836,9 @@ static int usb_get_string(struct usb_device *dev, unsigned short langid,
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

