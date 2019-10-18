Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5321BDCFAC
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 21:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440339AbfJRT5Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 15:57:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54356 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730242AbfJRT5Z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Oct 2019 15:57:25 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 1491D2A09D2;
        Fri, 18 Oct 2019 19:57:25 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-117-168.ams2.redhat.com [10.36.117.168])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8271B60BF4;
        Fri, 18 Oct 2019 19:57:23 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 3/3] platform/x86/intel_cht_int33fe: Add displayport-vdo property to the connector node
Date:   Fri, 18 Oct 2019 21:57:19 +0200
Message-Id: <20191018195719.94634-3-hdegoede@redhat.com>
In-Reply-To: <20191018195719.94634-1-hdegoede@redhat.com>
References: <20191018195719.94634-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 18 Oct 2019 19:57:25 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a displayport-vdo property to the usb-connector fwnode, devices
which use this driver support display-port altmode through the
PI3USB30532 USB switch, this enabled support for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel_cht_int33fe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel_cht_int33fe.c b/drivers/platform/x86/intel_cht_int33fe.c
index 1d5d877b9582..61f10b633678 100644
--- a/drivers/platform/x86/intel_cht_int33fe.c
+++ b/drivers/platform/x86/intel_cht_int33fe.c
@@ -129,6 +129,7 @@ static const struct property_entry usb_connector_props[] = {
 	PROPERTY_ENTRY_U32_ARRAY("source-pdos", src_pdo),
 	PROPERTY_ENTRY_U32_ARRAY("sink-pdos", snk_pdo),
 	PROPERTY_ENTRY_U32("op-sink-microwatt", 2500000),
+	PROPERTY_ENTRY_U32("displayport-vdo", 0x0c0086),
 	{ }
 };
 
-- 
2.23.0

