Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 408D3358E73
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 22:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhDHUb7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 16:31:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58967 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231940AbhDHUb5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 16:31:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617913906;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I8lNmTWeFJeCRoNCPnN3eakh8e2Qo1egO6nCTM4vpAc=;
        b=OOs/XDm0CeQRTMFcb6+5ENtePK46tCaOpCAmGwzyhJ0hQv+cHXxxUN9jyccKJN+Wkn9J4V
        OvuIreoz1V9P5vKmC/eKej67p0ZJGV+Pigulb4ODNJR+R+9sFSaYC+zj0e5fCZjBndFL2T
        FlW/6S1FJQN7BkRL/SLQKLrKFHfIoBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-onQYqOPpNqKP7hLcsn9DuA-1; Thu, 08 Apr 2021 16:31:44 -0400
X-MC-Unique: onQYqOPpNqKP7hLcsn9DuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F392A19DB062;
        Thu,  8 Apr 2021 20:31:42 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-60.ams2.redhat.com [10.36.112.60])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9C37F6A045;
        Thu,  8 Apr 2021 20:31:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 3/3] platform/x86/intel_cht_int33fe: Add displayport altmode fwnode to the connector fwnode
Date:   Thu,  8 Apr 2021 22:31:29 +0200
Message-Id: <20210408203129.526604-4-hdegoede@redhat.com>
In-Reply-To: <20210408203129.526604-1-hdegoede@redhat.com>
References: <20210408203129.526604-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a displayport altmode fwnode to the usb-connector fwnode,
devices which use this driver support display-port altmode through
the PI3USB30532 USB switch, this enables support for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/intel_cht_int33fe_typec.c    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/intel_cht_int33fe_typec.c b/drivers/platform/x86/intel_cht_int33fe_typec.c
index 48638d1c56e5..b61bad9cc8d2 100644
--- a/drivers/platform/x86/intel_cht_int33fe_typec.c
+++ b/drivers/platform/x86/intel_cht_int33fe_typec.c
@@ -124,12 +124,31 @@ static const struct software_node usb_connector_node = {
 	.properties = usb_connector_properties,
 };
 
+static const struct software_node altmodes_node = {
+	.name = "altmodes",
+	.parent = &usb_connector_node,
+};
+
+static const struct property_entry dp_altmode_properties[] = {
+	PROPERTY_ENTRY_U32("svid", 0xff01),
+	PROPERTY_ENTRY_U32("vdo", 0x0c0086),
+	{ }
+};
+
+static const struct software_node dp_altmode_node = {
+	.name = "displayport-altmode",
+	.parent = &altmodes_node,
+	.properties = dp_altmode_properties,
+};
+
 static const struct software_node *node_group[] = {
 	&fusb302_node,
 	&max17047_node,
 	&pi3usb30532_node,
 	&displayport_node,
 	&usb_connector_node,
+	&altmodes_node,
+	&dp_altmode_node,
 	NULL
 };
 
-- 
2.30.2

