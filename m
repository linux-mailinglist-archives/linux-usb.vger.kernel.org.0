Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42980358E87
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 22:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbhDHUg3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 16:36:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46020 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231699AbhDHUg2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 16:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617914176;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=nYlNo4pRmFrrWItWawk4anbORgyTbTQM3farA+0SF18=;
        b=Tg39DwN89ZmSnmr6W+OtckoygRRblk7eMOiMZHLNzZh2YPqEWa5ipisxfT14CfBiapE8lJ
        y4j5sDTlCTvGfXoRMT1GkbVFbYys+prjo6ei/hHewW3LCqwz5YKYa6hYqDn4MIGKDj6SGI
        ScbrVQMQKeXPKbYn/wi8b5egbSW7zno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-8HcGfB2JNLSVl2ts1JpMKA-1; Thu, 08 Apr 2021 16:36:15 -0400
X-MC-Unique: 8HcGfB2JNLSVl2ts1JpMKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 039FF1B2C983;
        Thu,  8 Apr 2021 20:36:14 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-60.ams2.redhat.com [10.36.112.60])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E64A460BE5;
        Thu,  8 Apr 2021 20:36:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH] usb: roles: Cakk try_module_get() from usb_role_switch_find_by_fwnode()
Date:   Thu,  8 Apr 2021 22:36:11 +0200
Message-Id: <20210408203611.544005-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
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

