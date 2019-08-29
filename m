Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75D82A23DA
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2019 20:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730368AbfH2SSN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Aug 2019 14:18:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:60458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729569AbfH2SSN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Aug 2019 14:18:13 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C4A02166E;
        Thu, 29 Aug 2019 18:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567102692;
        bh=xCREaTygv8b8nm+QPF3XKV3E36VYjZhtrpivCPCooeI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P/Khc7k/+0xf5ULlMHnsYgLQWlbxAwTC+YkKGgbQW0/+BbkWEsSu898chOa0MxLql
         KYYvwTmSiEEKqJrKI4s9grZX38m1+yMrRzOQl9joSK1W67Nns6maLOgv/YhIVZExO/
         1A0Cj8nwdbnTR63+5b9wAMot9H2nL0mpXJlnfYYY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Wenwen Wang <wenwen@cs.uga.edu>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 08/15] cx82310_eth: fix a memory leak bug
Date:   Thu, 29 Aug 2019 14:17:55 -0400
Message-Id: <20190829181802.9619-8-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190829181802.9619-1-sashal@kernel.org>
References: <20190829181802.9619-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Wenwen Wang <wenwen@cs.uga.edu>

[ Upstream commit 1eca92eef18719027d394bf1a2d276f43e7cf886 ]

In cx82310_bind(), 'dev->partial_data' is allocated through kmalloc().
Then, the execution waits for the firmware to become ready. If the firmware
is not ready in time, the execution is terminated. However, the allocated
'dev->partial_data' is not deallocated on this path, leading to a memory
leak bug. To fix this issue, free 'dev->partial_data' before returning the
error.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/cx82310_eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/cx82310_eth.c b/drivers/net/usb/cx82310_eth.c
index 947bea81d9241..dfbdea22fbad9 100644
--- a/drivers/net/usb/cx82310_eth.c
+++ b/drivers/net/usb/cx82310_eth.c
@@ -175,7 +175,8 @@ static int cx82310_bind(struct usbnet *dev, struct usb_interface *intf)
 	}
 	if (!timeout) {
 		dev_err(&udev->dev, "firmware not ready in time\n");
-		return -ETIMEDOUT;
+		ret = -ETIMEDOUT;
+		goto err;
 	}
 
 	/* enable ethernet mode (?) */
-- 
2.20.1

