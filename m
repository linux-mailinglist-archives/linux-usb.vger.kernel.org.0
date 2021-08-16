Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B0B3EDA22
	for <lists+linux-usb@lfdr.de>; Mon, 16 Aug 2021 17:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233174AbhHPPrK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Aug 2021 11:47:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54288 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232842AbhHPPrK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Aug 2021 11:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629128798;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=2JXaX2nuccS6ozu4V+Lo9REczaGXpleQWmFdOysVfsg=;
        b=SK8573kwgemduCWJa08BvfQOG8rmjVYmEfKyIBCBHnysHUkks9h/djSjjlLH4yeOTPcC8V
        EkBWcS2VJooK9dG6rYNoxoTuC8r4DI9e2zmNsNkRMhcFYKg2uYkqllbfA+MyjF5FQsC8XD
        gJ0HvUhYpGVPabUav0XCsbBK33YKy7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-ciHXbVYZMEKpVgkaIPc3cA-1; Mon, 16 Aug 2021 11:46:36 -0400
X-MC-Unique: ciHXbVYZMEKpVgkaIPc3cA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92192801B3D;
        Mon, 16 Aug 2021 15:46:35 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.194.5])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CF4D62CD33;
        Mon, 16 Aug 2021 15:46:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Subject: [PATCH regression fix] usb: typec: tcpm: Fix VDMs sometimes not being forwarded to alt-mode drivers
Date:   Mon, 16 Aug 2021 17:46:32 +0200
Message-Id: <20210816154632.381968-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit a20dcf53ea98 ("usb: typec: tcpm: Respond Not_Supported if no
snk_vdo"), stops tcpm_pd_data_request() calling tcpm_handle_vdm_request()
when port->nr_snk_vdo is not set. But the VDM might be intended for an
altmode-driver, in which case nr_snk_vdo does not matter.

This change breaks the forwarding of connector hotplug (HPD) events
for displayport altmode on devices which don't set nr_snk_vdo.

tcpm_pd_data_request() is the only caller of tcpm_handle_vdm_request(),
so we can move the nr_snk_vdo check to inside it, at which point we
have already looked up the altmode device so we can check for this too.

Doing this check here also ensures that vdm_state gets set to
VDM_STATE_DONE if it was VDM_STATE_BUSY, even if we end up with
responding with PD_MSG_CTRL_NOT_SUPP later.

Note that tcpm_handle_vdm_request() was already sending
PD_MSG_CTRL_NOT_SUPP in some circumstances, after moving the nr_snk_vdo
check the same error-path is now taken when that check fails. So that
we have only one error-path for this and not two. Replace the
tcpm_queue_message(PD_MSG_CTRL_NOT_SUPP) used by the existing error-path
with the more robust tcpm_pd_handle_msg() from the (now removed) second
error-path.

Cc: Kyle Tso <kyletso@google.com>
Fixes: a20dcf53ea98 ("usb: typec: tcpm: Respond Not_Supported if no snk_vdo")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index b9bb63d749ec..f4079b5cb26d 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1737,6 +1737,10 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 	return rlen;
 }
 
+static void tcpm_pd_handle_msg(struct tcpm_port *port,
+			       enum pd_msg_request message,
+			       enum tcpm_ams ams);
+
 static void tcpm_handle_vdm_request(struct tcpm_port *port,
 				    const __le32 *payload, int cnt)
 {
@@ -1764,11 +1768,11 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 		port->vdm_state = VDM_STATE_DONE;
 	}
 
-	if (PD_VDO_SVDM(p[0])) {
+	if (PD_VDO_SVDM(p[0]) && (adev || tcpm_vdm_ams(port) || port->nr_snk_vdo)) {
 		rlen = tcpm_pd_svdm(port, adev, p, cnt, response, &adev_action);
 	} else {
 		if (port->negotiated_rev >= PD_REV30)
-			tcpm_queue_message(port, PD_MSG_CTRL_NOT_SUPP);
+			tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
 	}
 
 	/*
@@ -2471,10 +2475,7 @@ static void tcpm_pd_data_request(struct tcpm_port *port,
 					   NONE_AMS);
 		break;
 	case PD_DATA_VENDOR_DEF:
-		if (tcpm_vdm_ams(port) || port->nr_snk_vdo)
-			tcpm_handle_vdm_request(port, msg->payload, cnt);
-		else if (port->negotiated_rev > PD_REV20)
-			tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
+		tcpm_handle_vdm_request(port, msg->payload, cnt);
 		break;
 	case PD_DATA_BIST:
 		port->bist_request = le32_to_cpu(msg->payload[0]);
-- 
2.31.1

