Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8C442892
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2019 16:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439587AbfFLOPn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jun 2019 10:15:43 -0400
Received: from mga01.intel.com ([192.55.52.88]:8208 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407745AbfFLOPm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Jun 2019 10:15:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jun 2019 07:15:42 -0700
X-ExtLoop1: 1
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2019 07:15:41 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Vladimir Yerilov <openmindead@gmail.com>, linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: Make sure an alt mode exist before getting its partner
Date:   Wed, 12 Jun 2019 17:15:40 +0300
Message-Id: <20190612141540.73603-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adding check to typec_altmode_get_partner() to prevent
potential NULL pointer dereference.

Reported-by: Vladimir Yerilov <openmindead@gmail.com>
Fixes: ad74b8649bea ("usb: typec: ucsi: Preliminary support for alternate modes")
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index eda4a45f0d0a..70072e3705ca 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -192,7 +192,7 @@ EXPORT_SYMBOL_GPL(typec_altmode_vdm);
 const struct typec_altmode *
 typec_altmode_get_partner(struct typec_altmode *adev)
 {
-	return &to_altmode(adev)->partner->adev;
+	return adev ? &to_altmode(adev)->partner->adev : NULL;
 }
 EXPORT_SYMBOL_GPL(typec_altmode_get_partner);
 
-- 
2.20.1

