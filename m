Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA892645FF
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 14:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730716AbgIJM1n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 08:27:43 -0400
Received: from mx2.suse.de ([195.135.220.15]:54890 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730618AbgIJMYT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 08:24:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8BED3B023;
        Thu, 10 Sep 2020 12:21:34 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 6/6] CDC-WDM: correct error reporting in write()
Date:   Thu, 10 Sep 2020 14:21:05 +0200
Message-Id: <20200910122105.13398-6-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200910122105.13398-1-oneukum@suse.com>
References: <20200910122105.13398-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case our wait was interrupted by a disconnect, we should report
that.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 89929f6438e3..f952eec87b0f 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -396,6 +396,9 @@ static ssize_t wdm_write
 	if (test_bit(WDM_RESETTING, &desc->flags))
 		r = -EIO;
 
+	if (test_bit(WDM_DISCONNECTING, &desc->flags))
+		r = -ENODEV;
+
 	if (r < 0) {
 		rv = r;
 		goto out_free_mem_pm;
-- 
2.16.4

