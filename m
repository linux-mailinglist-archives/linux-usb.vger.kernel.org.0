Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD591E2227
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 14:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389209AbgEZMo0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 08:44:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:34438 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388917AbgEZMo0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 May 2020 08:44:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id E8CDDABE4;
        Tue, 26 May 2020 12:44:27 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] CDC-ACM: heed quirk also in error handling
Date:   Tue, 26 May 2020 14:44:20 +0200
Message-Id: <20200526124420.22160-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If buffers are iterated over in the error case, the lower limits
for quirky devices must be heeded.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Reported-by: Jean Rene Dawin <jdawin@math.uni-bielefeld.de>
Fixes: a4e7279cd1d19 ("cdc-acm: introduce a cool down")
---
 drivers/usb/class/cdc-acm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 7678ae4afd53..be4543569822 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -585,7 +585,7 @@ static void acm_softint(struct work_struct *work)
 	}
 
 	if (test_and_clear_bit(ACM_ERROR_DELAY, &acm->flags)) {
-		for (i = 0; i < ACM_NR; i++) 
+		for (i = 0; i < acm->rx_buflimit; i++) 
 			if (test_and_clear_bit(i, &acm->urbs_in_error_delay))
 					acm_submit_read_urb(acm, i, GFP_NOIO);
 	}
-- 
2.16.4

