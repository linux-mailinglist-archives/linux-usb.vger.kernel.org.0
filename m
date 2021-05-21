Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C09938C4FA
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 12:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbhEUKdS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 06:33:18 -0400
Received: from mail-m9764.mail.163.com ([123.126.97.64]:50452 "EHLO
        mail-m9764.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234459AbhEUKbb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 May 2021 06:31:31 -0400
X-Greylist: delayed 910 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 May 2021 06:31:29 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=dYX1o
        +aSL622HsiL7bI048V16tlR+t072uYzyHtC3AM=; b=IUsU5aBklxAKyk7FM87zn
        1aYl0r1xlliVWAEp9i8/MF2IETkYkOixfR1voXYPtPAU88Hh7HIB6+EV4od9xh3z
        7jFih+RwwyI/S0K61uhY6haEn/A4dfy/bWofMY+9yDyu7XBnBtv4vGLwZdUfhkAg
        sWkTAo5KWPThxd/jYy4SCs=
Received: from COOL-20201210PM.ccdomain.com (unknown [218.94.48.178])
        by smtp11 (Coremail) with SMTP id D8CowADHzQkjhKdgg3plBg--.89S2;
        Fri, 21 May 2021 17:58:04 +0800 (CST)
From:   zuoqilin1@163.com
To:     gregkh@linuxfoundation.org, info@metux.net
Cc:     accessrunner-general@lists.sourceforge.net,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        zuoqilin <zuoqilin@yulong.com>
Subject: [PATCH] usb:atm: Fix typo
Date:   Fri, 21 May 2021 17:58:04 +0800
Message-Id: <20210521095804.773-1-zuoqilin1@163.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowADHzQkjhKdgg3plBg--.89S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUra0mUUUUU
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 52xr1xpolqiqqrwthudrp/1tbiHgyZiVSIurei1AAAsl
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: zuoqilin <zuoqilin@yulong.com>

Change 'contol' to 'control'.

Signed-off-by: zuoqilin <zuoqilin@yulong.com>
---
 drivers/usb/atm/cxacru.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
index 4d39474..4ce7cba 100644
--- a/drivers/usb/atm/cxacru.c
+++ b/drivers/usb/atm/cxacru.c
@@ -180,7 +180,7 @@ struct cxacru_data {
 	struct mutex poll_state_serialize;
 	enum cxacru_poll_state poll_state;
 
-	/* contol handles */
+	/* control handles */
 	struct mutex cm_serialize;
 	u8 *rcv_buf;
 	u8 *snd_buf;
-- 
1.9.1

