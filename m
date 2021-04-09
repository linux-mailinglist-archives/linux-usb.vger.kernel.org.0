Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5686035A017
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 15:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233655AbhDINlB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 09:41:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25137 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233587AbhDINlA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 09:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617975647;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I8lNmTWeFJeCRoNCPnN3eakh8e2Qo1egO6nCTM4vpAc=;
        b=OIfN6gRxtyDWDbhIbC+Z4e2XShKBnWqbEpqmPwt0E36iXXEsDM99CCCDZQEpeCd4R15G2S
        4At5Ednr9eZ8cPByBgrfkvX6rhqqZepxHOHdCve33Dz6i4pRqY55LNDWD0jwhyDcbPEtAi
        zIRaVdfXMXs+qnMJWP7vyO9R8j3TCjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-2PpECgOsOSGhyh81pkeYYg-1; Fri, 09 Apr 2021 09:40:42 -0400
X-MC-Unique: 2PpECgOsOSGhyh81pkeYYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5334187A83B;
        Fri,  9 Apr 2021 13:40:41 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-60.ams2.redhat.com [10.36.113.60])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E8AFA19704;
        Fri,  9 Apr 2021 13:40:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 3/3] platform/x86/intel_cht_int33fe: Add displayport altmode fwnode to the connector fwnode
Date:   Fri,  9 Apr 2021 15:40:33 +0200
Message-Id: <20210409134033.105834-4-hdegoede@redhat.com>
In-Reply-To: <20210409134033.105834-1-hdegoede@redhat.com>
References: <20210409134033.105834-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

