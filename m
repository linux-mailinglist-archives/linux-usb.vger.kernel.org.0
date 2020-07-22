Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43223229556
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 11:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731876AbgGVJqf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 05:46:35 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:38619 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731846AbgGVJqb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 05:46:31 -0400
Received: from localhost.localdomain (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 15ADB200004;
        Wed, 22 Jul 2020 09:46:29 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 2/2] USB: Fix source path in header
Date:   Wed, 22 Jul 2020 11:46:28 +0200
Message-Id: <20200722094628.4236-2-hadess@hadess.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200722094628.4236-1-hadess@hadess.net>
References: <20200722094628.4236-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/usb/core/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index a6187dd2186c..bd346e683af3 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * drivers/usb/driver.c - most of the driver model stuff for usb
+ * drivers/usb/core/driver.c - most of the driver model stuff for usb
  *
  * (C) Copyright 2005 Greg Kroah-Hartman <gregkh@suse.de>
  *
-- 
2.26.2

