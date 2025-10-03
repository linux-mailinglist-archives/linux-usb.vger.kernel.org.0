Return-Path: <linux-usb+bounces-28886-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EE1BB6720
	for <lists+linux-usb@lfdr.de>; Fri, 03 Oct 2025 12:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 55E354E5BC9
	for <lists+linux-usb@lfdr.de>; Fri,  3 Oct 2025 10:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C1C2E9EAE;
	Fri,  3 Oct 2025 10:34:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EF92E9729
	for <linux-usb@vger.kernel.org>; Fri,  3 Oct 2025 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759487669; cv=none; b=ARtj19WzPTCjfkC0F7sfCpJsvpG1In3MS4S6rJvEo1YkvfvpOdQ1HZNXtHlwiE2LxmMEsVVuY9VnTs4ZNgapC3W34tHsqkdkaXCfHwvc0LwJzX0L5ZvL+5t4uAbpWJIJTr7R3mzh0U+mn12vVPnQ1KEzgIImYo9rXlSYepyt5co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759487669; c=relaxed/simple;
	bh=FuZOv+azcsX0guHnOWDKkZREFsxr0dVTEvleJK83Shs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=frsmqU1fZha9EIUUsOy3rAE+ca7l2t/7bCJzYmgbTuWqXVcGmyei7EnlpwHa0WSEkcmfq/a8KSGdLLNgu5RDQxrZvoVJDWI28HLueXi+FUK9zsosSu+oCrkJYUMxTrg4E2SmQkM7atJ7A6xJr7CdyWUwE1WzrP60pdBb1j4UgKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1v4d7A-0002xz-5C; Fri, 03 Oct 2025 12:34:16 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1v4d79-001jO4-0E;
	Fri, 03 Oct 2025 12:34:15 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1v4d79-00000008VMD-020b;
	Fri, 03 Oct 2025 12:34:15 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Fri, 03 Oct 2025 12:33:56 +0200
Subject: [PATCH] tcpm: switch check for role_sw device with fw_node
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-b4-ml-topic-tcpm-v1-1-3cdd05588acb@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAJOm32gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwNj3SQT3dwc3ZL8gsxk3ZLkglxdI3NDEzNzI/MUc7NEJaC2gqLUtMw
 KsJHRsbW1ANxN+spiAAAA
X-Change-ID: 20251003-b4-ml-topic-tcpm-27146727d76a
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@pengutronix.de, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=FuZOv+azcsX0guHnOWDKkZREFsxr0dVTEvleJK83Shs=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBo36am6Qdyh1LltjU/en+Bw6BvVAdXQUhwvV+Ba
 pBYm79ddRuJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCaN+mpgAKCRC/aVhE+XH0
 qy7WD/9KSiWBEjgtptIsNckQZaIWKSjWJzUedh/QjhSYLlV7+q8pEFba0R3pHnEfUh9nR/MqN+7
 uR9U5JEUwOHk9GZSSDqqZpIjnY1AiyW+Yk1EsGUkVyRx1/SYuDij3yO5SuI2bSkQr9dyUPC9Sku
 oDHIo0mZ52fh89uWZgI7YVSyNQTdReLdQerPUvYxl+vvObmftuF0bcTrfnnsEYe9NjpQIdORDS0
 kWgpAE76vP731vA1jDOZdACg2rk/p9bbwyDkUILpjwMtP+xU8EojFG4fUy7/+Yw40fwFS8V9miV
 twiJlOAvB+hvHMr4ixKbwbh1NuD0OS/5vRMr2jw0btUZivqLs8mYKBKwyvQy3SiwUFhRfnYeRX7
 HlSeymKUyeOLpaMysZ8aPpGgUysMKFMNNhAkIMQCnl+xYHRIWkzqTFyxipvJBFS2lvhOCg2KHEH
 KyTw2q00kjr07AcT3GTTJNmkg4HDM/+znSnCNamtboNksQPtDWb0NfYXP92vSOyiQLyM9VtoY5N
 a7rCvySlxVgL9UASY41C1MSpziZJzyXmOwyS2LYEdOi3vyICzKoM8Df9XWn8PgTAN5qjtMVVyYF
 LxdQg6gD8nTfV7/n9/G3XTA0+xOpmgRLOQl/Dy+KS5+yCYGTj4ER9yFoiQryygPkNon0kfaHSig
 n8cBvgmyq0FDsag==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

When there is no port entry in the tcpci entry itself, the driver will
trigger an error message "OF: graph: no port node found in /...../typec" .

It is documented that the dts node should contain an connector entry
with ports and several port pointing to devices witch usb-role-switch
property set. Only when those connecter entry is missing, it should
check for port entries in the main node.

We switch the search order for looking after ports, which will avoid the
failure message while there are explicit connector entries.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/typec/tcpm/tcpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index b2a568a5bc9b0ba5c50b7031d8e21ee09cefa349..cc78770509dbc6460d75816f544173d6ab4ef873 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -7876,9 +7876,9 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 
 	port->partner_desc.identity = &port->partner_ident;
 
-	port->role_sw = usb_role_switch_get(port->dev);
+	port->role_sw = fwnode_usb_role_switch_get(tcpc->fwnode);
 	if (!port->role_sw)
-		port->role_sw = fwnode_usb_role_switch_get(tcpc->fwnode);
+		port->role_sw = usb_role_switch_get(port->dev);
 	if (IS_ERR(port->role_sw)) {
 		err = PTR_ERR(port->role_sw);
 		goto out_destroy_wq;

---
base-commit: e406d57be7bd2a4e73ea512c1ae36a40a44e499e
change-id: 20251003-b4-ml-topic-tcpm-27146727d76a

Best regards,
-- 
Michael Grzeschik <m.grzeschik@pengutronix.de>


