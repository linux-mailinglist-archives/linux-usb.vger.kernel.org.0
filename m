Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA8629319
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2019 10:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389281AbfEXIaw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 May 2019 04:30:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:55240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389046AbfEXIaw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 May 2019 04:30:52 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AFDC820675;
        Fri, 24 May 2019 08:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558686651;
        bh=LaMH0DdYjq5rg3L1e5BPZ+p49oTq9aeliqL1JW/ojlU=;
        h=From:To:Cc:Subject:Date:From;
        b=QIsq3/BGGt3b3B3VJjaeGaFaSS7Jyqm2uHzidunsg9tSStqkc3Hg+CQNyBpxY88XH
         SzBSkJR9iwd5cWW2nE8oW/cgQ1bzb8zC+mDBhr/qckzDqf2X0Q6Djh9tl8tdksVKMr
         14jmeGNwWqLfbsUfn5WYFpcps/wt/0DOwh54Kv6g=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Matthieu CASTET <castet.matthieu@free.fr>,
        Stanislaw Gruszka <stf_xl@wp.pl>,
        Damien Bergamini <damien.bergamini@free.fr>,
        Duncan Sands <duncan.sands@free.fr>
Subject: [PATCH 1/2] USB: atm: ueagle-atm.c: fix SPDX tag to be BSD2
Date:   Fri, 24 May 2019 10:30:39 +0200
Message-Id: <20190524083040.18179-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thomas rightly points out that I got the BSD clause count wrong for this
driver, it should be 2, not 3 based on the text in the license here, so
fix that up.

He also raises the question that the license text points to a v2 only
license, yet the text in the header says "or later".  Given that the
text in the header says "or later" and all of the other USB atm drivers
are licensed in that way, I am going to leave the string as-is for that
mark.

Reported-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Matthieu CASTET <castet.matthieu@free.fr>
Cc: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Damien Bergamini <damien.bergamini@free.fr>
Cc: Duncan Sands <duncan.sands@free.fr>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/atm/ueagle-atm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 2754b4ce7136..f0c622a87436 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
 /*-
  * Copyright (c) 2003, 2004
  *	Damien Bergamini <damien.bergamini@free.fr>. All rights reserved.
-- 
2.21.0

