Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE43E21C496
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jul 2020 15:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbgGKN6e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jul 2020 09:58:34 -0400
Received: from smtp.al2klimov.de ([78.46.175.9]:60026 "EHLO smtp.al2klimov.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727004AbgGKN6d (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 11 Jul 2020 09:58:33 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 674A2BC078;
        Sat, 11 Jul 2020 13:58:31 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] usb: typec: Replace HTTP links with HTTPS ones
Date:   Sat, 11 Jul 2020 15:58:25 +0200
Message-Id: <20200711135825.19862-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not just HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 drivers/usb/typec/tps6598x.c   | 2 +-
 drivers/usb/typec/ucsi/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
index b7c9fe5caabe..3db33bb622c3 100644
--- a/drivers/usb/typec/tps6598x.c
+++ b/drivers/usb/typec/tps6598x.c
@@ -100,7 +100,7 @@ struct tps6598x {
 
 /*
  * Max data bytes for Data1, Data2, and other registers. See ch 1.3.2:
- * http://www.ti.com/lit/ug/slvuan1a/slvuan1a.pdf
+ * https://www.ti.com/lit/ug/slvuan1a/slvuan1a.pdf
  */
 #define TPS_MAX_LEN	64
 
diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index 15c2ac7db02d..2192d7c4fec7 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -18,7 +18,7 @@ config TYPEC_UCSI
 	  for every supported interface method.
 
 	  The UCSI specification can be downloaded from:
-	  http://www.intel.com/content/www/us/en/io/universal-serial-bus/usb-type-c-ucsi-spec.html
+	  https://www.intel.com/content/www/us/en/io/universal-serial-bus/usb-type-c-ucsi-spec.html
 
 	  To compile the driver as a module, choose M here: the module will be
 	  called typec_ucsi.
-- 
2.27.0

