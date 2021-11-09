Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D61B44B57F
	for <lists+linux-usb@lfdr.de>; Tue,  9 Nov 2021 23:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343592AbhKIWVG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Nov 2021 17:21:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:41190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245422AbhKIWUd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Nov 2021 17:20:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 226B461211;
        Tue,  9 Nov 2021 22:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636496248;
        bh=wUtuqPafkjHuIBSa8o+gQLFE+TdhXk32F5NW/Iv+NVQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wb307X7E2XAs67F+wUJUgSQaF4wjqLP9tEb2vExBmqX61QduUfYHel+vYmGfZj3P/
         EGjKnLDS0Hq1S2lsNvlkHmkIcL0bV1yZlQJmSBeF0bHJ/IyRBwd5p57QsNNeJy58Uj
         ZTYilD6oPNmnY7WNthD6egfi+Z2KzGI+VLyFEYQA1zjTP+zFLEY28ExO50tAz/3OdP
         PDUiMUB39B9ddd3l2Bv9C1RAxun0/Xdu3opdd3YXWQ0LkPZ53UzQNPuHA7Fmyqt10K
         ghgP2A7/ghJiHWaAfcMjBk5NZc2FllL3hJT7tp71EzufCxktjjxGnmG3E8DhEIkxIE
         73g9jQt+6WvWw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sven Peter <sven@svenpeter.dev>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 22/82] usb: typec: tipd: Remove WARN_ON in tps6598x_block_read
Date:   Tue,  9 Nov 2021 17:15:40 -0500
Message-Id: <20211109221641.1233217-22-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109221641.1233217-1-sashal@kernel.org>
References: <20211109221641.1233217-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sven Peter <sven@svenpeter.dev>

[ Upstream commit b7a0a63f3fed57d413bb857de164ea9c3984bc4e ]

Calling tps6598x_block_read with a higher than allowed len can be
handled by just returning an error. There's no need to crash systems
with panic-on-warn enabled.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
Link: https://lore.kernel.org/r/20210914140235.65955-3-sven@svenpeter.dev
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index ea4cc0a6e40cc..97f50f301f13b 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -117,7 +117,7 @@ tps6598x_block_read(struct tps6598x *tps, u8 reg, void *val, size_t len)
 	u8 data[TPS_MAX_LEN + 1];
 	int ret;
 
-	if (WARN_ON(len + 1 > sizeof(data)))
+	if (len + 1 > sizeof(data))
 		return -EINVAL;
 
 	if (!tps->i2c_protocol)
-- 
2.33.0

