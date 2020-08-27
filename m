Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A17253C62
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 05:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgH0D5f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 23:57:35 -0400
Received: from cmta18.telus.net ([209.171.16.91]:42711 "EHLO cmta18.telus.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726794AbgH0D5f (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 23:57:35 -0400
Received: from montezuma.home ([154.5.226.127])
        by cmsmtp with SMTP
        id B92aka3uwqUs3B92bkc8x0; Wed, 26 Aug 2020 21:57:34 -0600
X-Telus-Authed: none
X-Authority-Analysis: v=2.3 cv=Mo8sFFSe c=1 sm=1 tr=0
 a=f8b3WT/FcTuUJCJtQO1udw==:117 a=f8b3WT/FcTuUJCJtQO1udw==:17
 a=kj9zAlcOel0A:10 a=x7bEGLp0ZPQA:10 a=COSDN44dAAMA:10
 a=c_-Yv4DCP1QCl3x5kY8A:9 a=CjuIK1q_8ugA:10 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=UDnyf2zBuKT2w-IlGP_r:22
Date:   Wed, 26 Aug 2020 20:57:31 -0700 (PDT)
From:   Zwane Mwaikambo <zwanem@gmail.com>
To:     Zwane Mwaikambo <zwane@yosper.io>
cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 2/2] usb/typec: fix array overruns in ucsi.c
 partner_altmode[]
In-Reply-To: <alpine.DEB.2.21.2008262051190.12661@montezuma.home>
Message-ID: <alpine.DEB.2.21.2008262055440.12661@montezuma.home>
References: <alpine.DEB.2.21.2008131842080.26061@montezuma.home> <20200824112106.GB189773@kuha.fi.intel.com> <CAD3Xbfq_nUsY7WKaDwUTnbTdx8SvWW8qCys+iOPAeoq3DtD46g@mail.gmail.com> <alpine.DEB.2.21.2008262041300.12661@montezuma.home>
 <alpine.DEB.2.21.2008262051190.12661@montezuma.home>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CMAE-Envelope: MS4wfOtT4ZJpzo2X2RAlG74s+RLx0aknEGKmiRaJI1EgmSkQlFGO/1BMZga2NRXZZNlNnZDG1yZFZZ2qCtGmMbkLee3De6ayZvkLhjnGBInmmZngvae18nOA
 w1cGfQVW8VuawTLhX1dKhMOrejKkI+G2eV6nplikwVc/HIo+C1LGIqHvh5FPc2QhgpHGmOt2TkOZOJidIzBkFSG7+k2nN5ncgYvlrwl8tl6l9jgizM+y4BT5
 kMA1nq1F8bt10ItYSyDoFA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This fixes the other occurence of the array overrun in ucsi.c, this time 
in ucsi_unregister_altmodes.

Signed-off-by: Zwane Mwaikambo <zwane@yosper.io>
---
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index d0c63afaf..79061705e 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -479,7 +480,10 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 		return;
 	}
 
-	while (adev[i]) {
+	for (i = 0; i < UCSI_MAX_ALTMODES; i++) {
+		if (!adev[i])
+			break;
+
 		if (recipient == UCSI_RECIPIENT_SOP &&
 		    (adev[i]->svid == USB_TYPEC_DP_SID ||
 			(adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID &&
@@ -488,7 +492,7 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 			ucsi_displayport_remove_partner((void *)pdev);
 		}
 		typec_unregister_altmode(adev[i]);
-		adev[i++] = NULL;
+		adev[i] = NULL;
 	}
 }
 
