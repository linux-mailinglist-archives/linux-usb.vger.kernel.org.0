Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB20847C122
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 15:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237722AbhLUODz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 09:03:55 -0500
Received: from mga01.intel.com ([192.55.52.88]:45112 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229453AbhLUODz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Dec 2021 09:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640095435; x=1671631435;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M0KpLxryfUYRkcj7ZcX6Ou+YwWYCmWBEZb3gSA+tCLs=;
  b=kIrcqp22oVXUrfnIlege1x9ReVb6N/A5tHkvYjcOpsZGpFTAXAwbYLLE
   3EWp0pmSesb1JvoVKCKC9HoY5caCrR0nj9ictm3pIRRIgTp1GEtXyMgjr
   P+m3DboEst6BLMR2LCCF8/+1ucgNRoKJlyxc8+gHxjtjPJDmxV8yff/cA
   vSbkdx48+u1djFuf6BHoRMNV2e5jXEJjqKCr4ybZQ3Ud7/mElcAQNGCHW
   oFHZxllQn6I67sY5sVJC2+/WvDaNO1O6mlJK5gMcfPLYqGIAPbNG3XPfz
   T5PuXAnSRzezageZc1bjiP1F9gfNyWaD+fdCb1fWer783JufqswFHCCf/
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="264589084"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="264589084"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 06:03:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="663953093"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2021 06:03:44 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     linux-usb@vger.kernel.org,
        Chris Hixon <linux-kernel-bugs@hixontech.com>
Subject: [PATCH v2] usb: typec: ucsi: Only check the contract if there is a connection
Date:   Tue, 21 Dec 2021 17:03:52 +0300
Message-Id: <20211221140352.45501-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver must make sure there is an actual connection
before checking details about the USB Power Delivery
contract. Those details are not valid unless there is a
connection.

This fixes NULL pointer dereference that is caused by an
attempt to register bogus partner alternate mode that the
firmware on some platform may report before the actual
connection.

Reported-by: Chris Hixon <linux-kernel-bugs@hixontech.com>
Fixes: 6cbe4b2d5a3f ("usb: typec: ucsi: Check the partner alt modes always if there is PD contract")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=215117
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---

Hi,

Instead of using the "BugLink" tag, I'm now using "Link" tag with the
link to the bug as requested.

There was a request to have also another Link tag pointing to some
other discussion on the mailing list, but I failed to understand what
was the point with that - I also didn't find any commits where
something like that had been used before.

I may be mistaken here, but I got the impression that you create the
mailing list discussion just so you can have the extra Link tag
pointing to it, and that Link tag you want only because you have made
your scripts rely on it.

The extra email thread in any case does not seem to contain any real
additional information that the bug report does not have, so the extra
Link tag pointing to it does not provide any real value on top of the
link to bug itself.

thanks,

--
 drivers/usb/typec/ucsi/ucsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 9d6b7e02d6efb..f0c2fa19f3e0f 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1164,7 +1164,9 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 		ret = 0;
 	}
 
-	if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) == UCSI_CONSTAT_PWR_OPMODE_PD) {
+	if (con->partner &&
+	    UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
+	    UCSI_CONSTAT_PWR_OPMODE_PD) {
 		ucsi_get_src_pdos(con);
 		ucsi_check_altmodes(con);
 	}
-- 
2.34.1

