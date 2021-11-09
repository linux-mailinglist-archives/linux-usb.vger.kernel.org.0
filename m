Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C065644B6AB
	for <lists+linux-usb@lfdr.de>; Tue,  9 Nov 2021 23:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245594AbhKIW3U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Nov 2021 17:29:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:50284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344385AbhKIW0W (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Nov 2021 17:26:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7DF961354;
        Tue,  9 Nov 2021 22:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636496382;
        bh=4CRT7RCXMKiOsgu3ogcz06kWJVI2Tfh4ozMN2bCKil8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n5waRlWO7po4Lf75ZqKwIvexrxM18DuYyu7FPf8lJltx0UNAezey5l/q0cFh6AP0i
         SFcPMw/cBqvGi7eKSu895VSnb3PAnGiD8tnClnFz56KWcVhS8T5IZjZrNnr1BpxaID
         l+VbP713rJi5PfFXMRU6DW6eidpFKuZpUlBCmi6iz809HdACVWLB8btslIgDMtg2G4
         hRMkES8F8NJRorKQBkB3xYL1nXzQYdcBOhX4icnGkSdicEGipTfSlJUnSqI0p0yyPp
         kTihV0UmjG+GLV/x35+KbpKUCRPkzSDjZYgMPDskEpk+vQJrVU3OUYaPwVgO/uHiGO
         eq76PGAdfzMaQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yang Yingliang <yangyingliang@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, balbi@ti.com,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 20/75] usb: musb: tusb6010: check return value after calling platform_get_resource()
Date:   Tue,  9 Nov 2021 17:18:10 -0500
Message-Id: <20211109221905.1234094-20-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109221905.1234094-1-sashal@kernel.org>
References: <20211109221905.1234094-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yang Yingliang <yangyingliang@huawei.com>

[ Upstream commit 14651496a3de6807a17c310f63c894ea0c5d858e ]

It will cause null-ptr-deref if platform_get_resource() returns NULL,
we need check the return value.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Link: https://lore.kernel.org/r/20210915034925.2399823-1-yangyingliang@huawei.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/musb/tusb6010.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index c968ecda42aa8..7ed4cc348d993 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -1104,6 +1104,11 @@ static int tusb_musb_init(struct musb *musb)
 
 	/* dma address for async dma */
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!mem) {
+		pr_debug("no async dma resource?\n");
+		ret = -ENODEV;
+		goto done;
+	}
 	musb->async = mem->start;
 
 	/* dma address for sync dma */
-- 
2.33.0

