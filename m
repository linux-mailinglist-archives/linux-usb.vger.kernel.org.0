Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06ADE359EF4
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 14:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233569AbhDIMl5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 08:41:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55315 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233554AbhDIMl5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 08:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617972104;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=uwXMvvbEM3VDlO9wjCvrJFUMf6jyDnRo6sig/zpcO5k=;
        b=WvBOTPUddPXWOdxcTlG62qy2viowxU0pv+4ztHDkChmk/fpn5WdRGTadyCgJSwpnr6xgrx
        AZIQME2q/OHVjx9Gcr4R7gbTjR+JnOWwf/kHd9NaO6XugpvYZrr+lUJB4AeG0ur0nBHFJh
        aHbvnEvsXC2U3HT+6s3a/FlkpIZmHXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-yFz3SBDsOg2djKmXV_yQMA-1; Fri, 09 Apr 2021 08:41:40 -0400
X-MC-Unique: yFz3SBDsOg2djKmXV_yQMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 108081020C21;
        Fri,  9 Apr 2021 12:41:39 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-60.ams2.redhat.com [10.36.113.60])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EB7E2627DC;
        Fri,  9 Apr 2021 12:41:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2] usb: roles: Call try_module_get() from usb_role_switch_find_by_fwnode()
Date:   Fri,  9 Apr 2021 14:41:36 +0200
Message-Id: <20210409124136.65591-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_role_switch_find_by_fwnode() returns a reference to the role-switch
which must be put by calling usb_role_switch_put().

usb_role_switch_put() calls module_put(sw->dev.parent->driver->owner),
add a matching try_module_get() to usb_role_switch_find_by_fwnode(),
making it behave the same as the other usb_role_switch functions
which return a reference.

This avoids a WARN_ON being hit at kernel/module.c:1158 due to the
module-refcount going below 0.

Fixes: c6919d5e0cd1 ("usb: roles: Add usb_role_switch_find_by_fwnode()")
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Fix typo in Subject
- Add Fixes tag
---
 drivers/usb/roles/class.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index 97f37077b7f9..33b637d0d8d9 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -189,6 +189,8 @@ usb_role_switch_find_by_fwnode(const struct fwnode_handle *fwnode)
 		return NULL;
 
 	dev = class_find_device_by_fwnode(role_class, fwnode);
+	if (dev)
+		WARN_ON(!try_module_get(dev->parent->driver->owner));
 
 	return dev ? to_role_switch(dev) : NULL;
 }
-- 
2.30.2

