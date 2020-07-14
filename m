Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A504221EF66
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 13:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727863AbgGNLgf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 07:36:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37176 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727095AbgGNLge (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 07:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594726593;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vl3SmicR68+CmgJUazXfQ79ngQF4AVIz+REX8jVdPoE=;
        b=glzkhBIT97EEHu9XirAhUNo5ojCCDqMhBOgwPP1Gjm+Uz0dpv9bsyILt3u4+junkPQiBQn
        WEOwmtWSyRykKY84Whkc6wETVGVBN0EA6NqoKxfeZ/FGHVdAkrIG0wuRKkcnt/BBeIF8Tn
        NIEcBdW61oXlKdSeEXqm/uA4cmFR7zI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-AaBnRBGcMOCtq6D0mzai7Q-1; Tue, 14 Jul 2020 07:36:31 -0400
X-MC-Unique: AaBnRBGcMOCtq6D0mzai7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2697980BCB1;
        Tue, 14 Jul 2020 11:36:30 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-109.ams2.redhat.com [10.36.114.109])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 39D1C797EF;
        Tue, 14 Jul 2020 11:36:27 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/4] usb: typec: tcpm: Add support for altmodes
Date:   Tue, 14 Jul 2020 13:36:16 +0200
Message-Id: <20200714113617.10470-4-hdegoede@redhat.com>
In-Reply-To: <20200714113617.10470-1-hdegoede@redhat.com>
References: <20200714113617.10470-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for altmodes described in the usb-connector fwnode
associated with the Type-C controller by calling the new
typec_port_register_altmodes_from_fwnode() helper for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 82b19ebd7838..b4a66e6bf68c 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4793,6 +4793,12 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 		goto out_role_sw_put;
 	}
 
+	typec_port_register_altmodes_from_fwnode(port->typec_port,
+						 &tcpm_altmode_ops, port,
+						 port->port_altmode,
+						 ALTMODE_DISCOVERY_MAX,
+						 tcpc->fwnode);
+
 	mutex_lock(&port->lock);
 	tcpm_init(port);
 	mutex_unlock(&port->lock);
-- 
2.26.2

