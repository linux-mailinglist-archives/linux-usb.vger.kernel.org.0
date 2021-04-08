Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B289B358E74
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 22:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbhDHUb7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 16:31:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23714 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232091AbhDHUb6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 16:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617913906;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8HsHyrYvNsJ2EBquF9BD7h4e+bgseUlInL7EhF5TJOE=;
        b=IdQog+oaPBYPcc0nkk2yhtFv8FcgbURwhzwfEXtCa0mOLTzh9+CRrIboQccU1blZTWPfhA
        DULK6UdfUSy3Pf7OhFYtWLBUcrIfJuprgYmXMZ8d37S0DlaftNjVx7psBYBs7n66a8r6A/
        PJFWrPmB0Y0Dhoj5L+NmmYXubyAC2AQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-YMAkX9LEM_6CBOMNHuqoHw-1; Thu, 08 Apr 2021 16:31:42 -0400
X-MC-Unique: YMAkX9LEM_6CBOMNHuqoHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57FAA19DB061;
        Thu,  8 Apr 2021 20:31:41 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-60.ams2.redhat.com [10.36.112.60])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F0CFB6A045;
        Thu,  8 Apr 2021 20:31:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 2/3] usb: typec: tcpm: Add support for altmodes
Date:   Thu,  8 Apr 2021 22:31:28 +0200
Message-Id: <20210408203129.526604-3-hdegoede@redhat.com>
In-Reply-To: <20210408203129.526604-1-hdegoede@redhat.com>
References: <20210408203129.526604-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for altmodes described in the usb-connector fwnode
associated with the Type-C controller by calling the new
typec_port_register_altmodes_from_fwnode() helper for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index ce7af398c7c1..4aec8441772c 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6072,6 +6072,11 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 		goto out_role_sw_put;
 	}
 
+	typec_port_register_altmodes_from_fwnode(port->typec_port,
+						 &tcpm_altmode_ops, port,
+						 port->port_altmode,
+						 ALTMODE_DISCOVERY_MAX);
+
 	mutex_lock(&port->lock);
 	tcpm_init(port);
 	mutex_unlock(&port->lock);
-- 
2.30.2

