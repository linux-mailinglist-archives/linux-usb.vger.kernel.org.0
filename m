Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02C8B195988
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 16:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbgC0PEO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 11:04:14 -0400
Received: from mail.horus.com ([78.46.148.228]:49547 "EHLO mail.horus.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727322AbgC0PEO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Mar 2020 11:04:14 -0400
Received: from lenny.lan (193-83-225-155.adsl.highway.telekom.at [193.83.225.155])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "E-Mail Matthias Reichl Lenny", Issuer "HiassofT CA 2014" (verified OK))
        by mail.horus.com (Postfix) with ESMTPSA id 6E612640AE;
        Fri, 27 Mar 2020 16:04:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
        s=20180324; t=1585321452;
        bh=jzrJa97gngOuEsLDSp7j99HNV6vcsFyI+qOIZ0pY84k=;
        h=From:To:Cc:Subject:Date:From;
        b=YNwjOlfXb2VN/VpIJhGuaQfm+qnFP0i2ES7p0eiEIfvD/xJQVm5j17r20gO3SznFA
         JJiSJyL0ESuw5Rbl9QnElw+NXzX+ckSfp705FsJP0vvMw9/Bm66CpVK35JcorJMsaK
         lxRKWdEWe53YS9qVfPFmtxTKCOFct7rT4RgSbV/Y=
Received: by lenny.lan (Postfix, from userid 1000)
        id E42A1202E5E; Fri, 27 Mar 2020 16:04:11 +0100 (CET)
From:   Matthias Reichl <hias@horus.com>
To:     Anthony Mallet <anthony.mallet@laas.fr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org, Matthias Reichl <hias@horus.com>
Subject: [PATCH] USB: cdc-acm: restore capability check order
Date:   Fri, 27 Mar 2020 16:03:50 +0100
Message-Id: <20200327150350.3657-1-hias@horus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

commit b401f8c4f492c ("USB: cdc-acm: fix rounding error in TIOCSSERIAL")
introduced a regression by changing the order of capability and close
settings change checks. When running with CAP_SYS_ADMIN setting the
close settings to the values already set resulted in -EOPNOTSUPP.

Fix this by changing the check order back to how it was before.

Fixes: b401f8c4f492c ("USB: cdc-acm: fix rounding error in TIOCSSERIAL")
Signed-off-by: Matthias Reichl <hias@horus.com>
---
 drivers/usb/class/cdc-acm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 47f09a6ce7bda..84d6f7df09a4e 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -923,16 +923,16 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
 
 	mutex_lock(&acm->port.mutex);
 
-	if ((ss->close_delay != old_close_delay) ||
-            (ss->closing_wait != old_closing_wait)) {
-		if (!capable(CAP_SYS_ADMIN))
+	if (!capable(CAP_SYS_ADMIN)) {
+		if ((ss->close_delay != old_close_delay) ||
+		    (ss->closing_wait != old_closing_wait))
 			retval = -EPERM;
-		else {
-			acm->port.close_delay  = close_delay;
-			acm->port.closing_wait = closing_wait;
-		}
-	} else
-		retval = -EOPNOTSUPP;
+		else
+			retval = -EOPNOTSUPP;
+	} else {
+		acm->port.close_delay  = close_delay;
+		acm->port.closing_wait = closing_wait;
+	}
 
 	mutex_unlock(&acm->port.mutex);
 	return retval;
-- 
2.20.1

