Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBF4522711A
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 23:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728210AbgGTVl3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 17:41:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:59136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728473AbgGTVj2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jul 2020 17:39:28 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5511E22CBB;
        Mon, 20 Jul 2020 21:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595281168;
        bh=3Ntu81l2iPqRZi+s6BEQIwuKCV0gzsZOWwcMMWUJBYE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YuGVxMyw99FMPeqj4uQ90yzwWEhQSwdnAoKrxwtLct+ZN4Lm3dLVj18acf4kPXKHq
         BnrVetd5Dp4YdY4IAxA692VGVW13QsmWxiXhcdW1H3G3p/+JL28ln1f1yXD/yepZVn
         t3ox6olt+Jk7D0j4vhJf+CTuXUsX16R0GRPAAZ5A=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Felipe Balbi <balbi@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 10/13] usb: gadget: udc: gr_udc: fix memleak on error handling path in gr_ep_init()
Date:   Mon, 20 Jul 2020 17:39:11 -0400
Message-Id: <20200720213914.407919-10-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720213914.407919-1-sashal@kernel.org>
References: <20200720213914.407919-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Evgeny Novikov <novikov@ispras.ru>

[ Upstream commit c8f8529e2c4141afa2ebb487ad48e8a6ec3e8c99 ]

gr_ep_init() does not assign the allocated request anywhere if allocation
of memory for the buffer fails. This is a memory leak fixed by the given
patch.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
Signed-off-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/udc/gr_udc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/gr_udc.c b/drivers/usb/gadget/udc/gr_udc.c
index feb73a1c42ef9..be094f4e116b1 100644
--- a/drivers/usb/gadget/udc/gr_udc.c
+++ b/drivers/usb/gadget/udc/gr_udc.c
@@ -2000,9 +2000,12 @@ static int gr_ep_init(struct gr_udc *dev, int num, int is_in, u32 maxplimit)
 
 	if (num == 0) {
 		_req = gr_alloc_request(&ep->ep, GFP_ATOMIC);
+		if (!_req)
+			return -ENOMEM;
+
 		buf = devm_kzalloc(dev->dev, PAGE_SIZE, GFP_DMA | GFP_ATOMIC);
-		if (!_req || !buf) {
-			/* possible _req freed by gr_probe via gr_remove */
+		if (!buf) {
+			gr_free_request(&ep->ep, _req);
 			return -ENOMEM;
 		}
 
-- 
2.25.1

