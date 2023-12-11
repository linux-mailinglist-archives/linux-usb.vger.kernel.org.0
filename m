Return-Path: <linux-usb+bounces-3959-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3EA80C2C9
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 09:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D5A51C2096F
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 08:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBC520B30;
	Mon, 11 Dec 2023 08:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DQhMPHbX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE6E20B27
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 08:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7CCC433C8;
	Mon, 11 Dec 2023 08:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702282307;
	bh=7l7te64f1FxKTV3SgTp3erflOzHo7PMH4lk5tGacn+M=;
	h=Subject:To:From:Date:From;
	b=DQhMPHbXbQifEixXetEz+d4Rrd9qF0QZ5qXF+9xvXQI9Q+Mv1t4QP6dQYhTuynt2U
	 /pSJwpQsYUokavuK2PU5q5cnaDUDPzBT5vKzyl+xJ6yhD8wKpe7XqC2Dk6LHi8EDVd
	 K4Tdfo05teR/GuyiVPXGA8HzvEeakkfmMytjpTxo=
Subject: patch "usb: cdns3: starfive: don't misuse /** comment" added to usb-next
To: rdunlap@infradead.org,gregkh@linuxfoundation.org,linux-usb@vger.kernel.org,minda.chen@starfivetech.com,pawell@cadence.com,peter.chen@kernel.org,rogerq@kernel.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Dec 2023 09:11:44 +0100
Message-ID: <2023121144-shrivel-unsubtle-fba7@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit


This is a note to let you know that I've just added the patch titled

    usb: cdns3: starfive: don't misuse /** comment

to my usb git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
in the usb-next branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will also be merged in the next major kernel release
during the merge window.

If you have any questions about this process, please let me know.


From 5cc623a4edaf383eea39546104084b089f3035ca Mon Sep 17 00:00:00 2001
From: Randy Dunlap <rdunlap@infradead.org>
Date: Wed, 6 Dec 2023 10:13:17 -0800
Subject: usb: cdns3: starfive: don't misuse /** comment

Use a common C comment "/*" instead of "/**" to prevent a warning
from scripts/kernel-doc.

cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Minda Chen <minda.chen@starfivetech.com>
Cc: Peter Chen <peter.chen@kernel.org>
Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:  <linux-usb@vger.kernel.org>
Acked-by: Peter Chen <peter.chen@kernel.org>
Link: https://lore.kernel.org/r/20231206181317.27515-1-rdunlap@infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/cdns3/cdns3-starfive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-starfive.c b/drivers/usb/cdns3/cdns3-starfive.c
index a7265b86e427..c04d196abd87 100644
--- a/drivers/usb/cdns3/cdns3-starfive.c
+++ b/drivers/usb/cdns3/cdns3-starfive.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * cdns3-starfive.c - StarFive specific Glue layer for Cadence USB Controller
  *
  * Copyright (C) 2023 StarFive Technology Co., Ltd.
-- 
2.43.0



