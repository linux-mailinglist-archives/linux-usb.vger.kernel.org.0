Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D50D835A016
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 15:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233603AbhDINk7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 09:40:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49968 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233587AbhDINkz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 09:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617975642;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gBM5JXpL4pJwdcQzAJH3cBmnPMGwMs7hfo7536iMGfc=;
        b=KQk5NXMyUuwKxD2b9rRXA3yad0dzhbWqrtvRwaJcJrusY0vnHqxEpUumpMTcC3mr97STPC
        zxreglf0XfMwg6fEPQhycwerIstaEjqZp9daZ4K8YOgmXLnCmA2qVblp/DDeQ7lW3/EulR
        baM5shSv4u8Gcxq4hBaIEAyMzZxF7Zo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-zUUw2Bx6OrOvKk1lrV9uww-1; Fri, 09 Apr 2021 09:40:41 -0400
X-MC-Unique: zUUw2Bx6OrOvKk1lrV9uww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A200583DD22;
        Fri,  9 Apr 2021 13:40:39 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-60.ams2.redhat.com [10.36.113.60])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 43FAE19727;
        Fri,  9 Apr 2021 13:40:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 2/3] usb: typec: tcpm: Add support for altmodes
Date:   Fri,  9 Apr 2021 15:40:32 +0200
Message-Id: <20210409134033.105834-3-hdegoede@redhat.com>
In-Reply-To: <20210409134033.105834-1-hdegoede@redhat.com>
References: <20210409134033.105834-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for altmodes described in the usb-connector fwnode
associated with the Type-C controller by calling the new
typec_port_register_altmodes_from_fwnode() helper for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index ce7af398c7c1..70a5d6ca0053 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6072,6 +6072,10 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 		goto out_role_sw_put;
 	}
 
+	typec_port_register_altmodes(port->typec_port,
+				     &tcpm_altmode_ops, port,
+				     port->port_altmode, ALTMODE_DISCOVERY_MAX);
+
 	mutex_lock(&port->lock);
 	tcpm_init(port);
 	mutex_unlock(&port->lock);
-- 
2.30.2

