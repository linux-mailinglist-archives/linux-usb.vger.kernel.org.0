Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8326216D27
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 14:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgGGMvH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 7 Jul 2020 08:51:07 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:48793 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbgGGMvH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 08:51:07 -0400
Received: from sogo7.sd4.0x35.net (sogo7.sd4.0x35.net [10.200.201.57])
        (Authenticated sender: kerneldev@karsmulder.nl)
        by relay11.mail.gandi.net (Postfix) with ESMTPA id 48642100005;
        Tue,  7 Jul 2020 12:51:02 +0000 (UTC)
From:   "Kars Mulder" <kerneldev@karsmulder.nl>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date:   Tue, 07 Jul 2020 14:51:02 +0200
Cc:     "Pavel Machek" <pavel@denx.de>,
        "David Laight" <David.Laight@ACULAB.COM>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Kai-Heng Feng" <kai.heng.feng@canonical.com>,
        "Andy Shevchenko" <andy.shevchenko@gmail.com>,
        "Oliver Neukum" <oneukum@suse.com>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
MIME-Version: 1.0
Message-ID: <2eb7-5f046f80-f7-5cdcc200@136674391>
Subject: =?utf-8?q?=5BPATCH?==?utf-8?q?_v2=5D?==?utf-8?q?_usb=3A?=
 =?utf-8?q?_core=3A?= fix =?utf-8?q?quirks=5Fparam=5Fset=28=29?= writing to 
 a const pointer
User-Agent: SOGoMail 4.3.2
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The function quirks_param_set() takes as argument a const char* pointer
to the new value of the usbcore.quirks parameter. It then casts this
pointer to a non-const char* pointer and passes it to the strsep()
function, which overwrites the value.

Fix this by creating a copy of the value using kstrdup() and letting
that copy be written to by strsep().

Fixes: 027bd6cafd9a ("usb: core: Add "quirks" parameter for usbcore")
Signed-off-by: Kars Mulder <kerneldev@karsmulder.nl>

---
 drivers/usb/core/quirks.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index e0b77674869c..c96c50faccf7 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -25,17 +25,23 @@ static unsigned int quirk_count;
 
 static char quirks_param[128];
 
-static int quirks_param_set(const char *val, const struct kernel_param *kp)
+static int quirks_param_set(const char *value, const struct kernel_param *kp)
 {
-	char *p, *field;
+	char *val, *p, *field;
 	u16 vid, pid;
 	u32 flags;
 	size_t i;
 	int err;
 
+	val = kstrdup(value, GFP_KERNEL);
+	if (!val)
+		return -ENOMEM;
+
 	err = param_set_copystring(val, kp);
-	if (err)
+	if (err) {
+		kfree(val);
 		return err;
+	}
 
 	mutex_lock(&quirk_mutex);
 
@@ -60,10 +66,11 @@ static int quirks_param_set(const char *val, const struct kernel_param *kp)
 	if (!quirk_list) {
 		quirk_count = 0;
 		mutex_unlock(&quirk_mutex);
+		kfree(val);
 		return -ENOMEM;
 	}
 
-	for (i = 0, p = (char *)val; p && *p;) {
+	for (i = 0, p = val; p && *p;) {
 		/* Each entry consists of VID:PID:flags */
 		field = strsep(&p, ":");
 		if (!field)
@@ -144,6 +151,7 @@ static int quirks_param_set(const char *val, const struct kernel_param *kp)
 
 unlock:
 	mutex_unlock(&quirk_mutex);
+	kfree(val);
 
 	return 0;
 }
-- 
2.27.0

