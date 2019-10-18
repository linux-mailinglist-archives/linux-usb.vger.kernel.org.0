Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5745DCFA8
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 21:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440152AbfJRT5W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 15:57:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43048 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730242AbfJRT5W (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Oct 2019 15:57:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 66EC7307BD27;
        Fri, 18 Oct 2019 19:57:21 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-117-168.ams2.redhat.com [10.36.117.168])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D2DC060BF4;
        Fri, 18 Oct 2019 19:57:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 1/3] usb: typec: tcpm: Remove tcpc_config configuration mechanism
Date:   Fri, 18 Oct 2019 21:57:17 +0200
Message-Id: <20191018195719.94634-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Fri, 18 Oct 2019 19:57:21 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

All configuration can and should be done through fwnodes instead of
through the tcpc_config struct and there are no existing users left of
struct tcpc_config, so lets remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 90 ++---------------------------------
 include/linux/usb/tcpm.h      | 41 ----------------
 2 files changed, 3 insertions(+), 128 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 5f61d9977a15..c5fa18759f8e 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -380,9 +380,6 @@ static enum tcpm_state tcpm_default_state(struct tcpm_port *port)
 			return SNK_UNATTACHED;
 		else if (port->try_role == TYPEC_SOURCE)
 			return SRC_UNATTACHED;
-		else if (port->tcpc->config &&
-			 port->tcpc->config->default_role == TYPEC_SINK)
-			return SNK_UNATTACHED;
 		/* Fall through to return SRC_UNATTACHED */
 	} else if (port->port_type == TYPEC_PORT_SNK) {
 		return SNK_UNATTACHED;
@@ -4131,7 +4128,7 @@ static int tcpm_try_role(const struct typec_capability *cap, int role)
 	mutex_lock(&port->lock);
 	if (tcpc->try_role)
 		ret = tcpc->try_role(tcpc, role);
-	if (!ret && (!tcpc->config || !tcpc->config->try_role_hw))
+	if (!ret)
 		port->try_role = role;
 	port->try_src_count = 0;
 	port->try_snk_count = 0;
@@ -4368,34 +4365,6 @@ void tcpm_tcpc_reset(struct tcpm_port *port)
 }
 EXPORT_SYMBOL_GPL(tcpm_tcpc_reset);
 
-static int tcpm_copy_pdos(u32 *dest_pdo, const u32 *src_pdo,
-			  unsigned int nr_pdo)
-{
-	unsigned int i;
-
-	if (nr_pdo > PDO_MAX_OBJECTS)
-		nr_pdo = PDO_MAX_OBJECTS;
-
-	for (i = 0; i < nr_pdo; i++)
-		dest_pdo[i] = src_pdo[i];
-
-	return nr_pdo;
-}
-
-static int tcpm_copy_vdos(u32 *dest_vdo, const u32 *src_vdo,
-			  unsigned int nr_vdo)
-{
-	unsigned int i;
-
-	if (nr_vdo > VDO_MAX_OBJECTS)
-		nr_vdo = VDO_MAX_OBJECTS;
-
-	for (i = 0; i < nr_vdo; i++)
-		dest_vdo[i] = src_vdo[i];
-
-	return nr_vdo;
-}
-
 static int tcpm_fw_get_caps(struct tcpm_port *port,
 			    struct fwnode_handle *fwnode)
 {
@@ -4698,35 +4667,10 @@ static int devm_tcpm_psy_register(struct tcpm_port *port)
 	return PTR_ERR_OR_ZERO(port->psy);
 }
 
-static int tcpm_copy_caps(struct tcpm_port *port,
-			  const struct tcpc_config *tcfg)
-{
-	if (tcpm_validate_caps(port, tcfg->src_pdo, tcfg->nr_src_pdo) ||
-	    tcpm_validate_caps(port, tcfg->snk_pdo, tcfg->nr_snk_pdo))
-		return -EINVAL;
-
-	port->nr_src_pdo = tcpm_copy_pdos(port->src_pdo, tcfg->src_pdo,
-					  tcfg->nr_src_pdo);
-	port->nr_snk_pdo = tcpm_copy_pdos(port->snk_pdo, tcfg->snk_pdo,
-					  tcfg->nr_snk_pdo);
-
-	port->nr_snk_vdo = tcpm_copy_vdos(port->snk_vdo, tcfg->snk_vdo,
-					  tcfg->nr_snk_vdo);
-
-	port->operating_snk_mw = tcfg->operating_snk_mw;
-
-	port->typec_caps.prefer_role = tcfg->default_role;
-	port->typec_caps.type = tcfg->type;
-	port->typec_caps.data = tcfg->data;
-	port->self_powered = tcfg->self_powered;
-
-	return 0;
-}
-
 struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 {
 	struct tcpm_port *port;
-	int i, err;
+	int err;
 
 	if (!dev || !tcpc ||
 	    !tcpc->get_vbus || !tcpc->set_cc || !tcpc->get_cc ||
@@ -4759,15 +4703,10 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	tcpm_debugfs_init(port);
 
 	err = tcpm_fw_get_caps(port, tcpc->fwnode);
-	if ((err < 0) && tcpc->config)
-		err = tcpm_copy_caps(port, tcpc->config);
 	if (err < 0)
 		goto out_destroy_wq;
 
-	if (!tcpc->config || !tcpc->config->try_role_hw)
-		port->try_role = port->typec_caps.prefer_role;
-	else
-		port->try_role = TYPEC_NO_PREFERRED_ROLE;
+	port->try_role = port->typec_caps.prefer_role;
 
 	port->typec_caps.fwnode = tcpc->fwnode;
 	port->typec_caps.revision = 0x0120;	/* Type-C spec release 1.2 */
@@ -4797,29 +4736,6 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 		goto out_role_sw_put;
 	}
 
-	if (tcpc->config && tcpc->config->alt_modes) {
-		const struct typec_altmode_desc *paltmode = tcpc->config->alt_modes;
-
-		i = 0;
-		while (paltmode->svid && i < ARRAY_SIZE(port->port_altmode)) {
-			struct typec_altmode *alt;
-
-			alt = typec_port_register_altmode(port->typec_port,
-							  paltmode);
-			if (IS_ERR(alt)) {
-				tcpm_log(port,
-					 "%s: failed to register port alternate mode 0x%x",
-					 dev_name(dev), paltmode->svid);
-				break;
-			}
-			typec_altmode_set_drvdata(alt, port);
-			alt->ops = &tcpm_altmode_ops;
-			port->port_altmode[i] = alt;
-			i++;
-			paltmode++;
-		}
-	}
-
 	mutex_lock(&port->lock);
 	tcpm_init(port);
 	mutex_unlock(&port->lock);
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index f516955a0cf4..e7979c01c351 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -46,45 +46,6 @@ enum tcpm_transmit_type {
 	TCPC_TX_BIST_MODE_2 = 7
 };
 
-/**
- * struct tcpc_config - Port configuration
- * @src_pdo:	PDO parameters sent to port partner as response to
- *		PD_CTRL_GET_SOURCE_CAP message
- * @nr_src_pdo:	Number of entries in @src_pdo
- * @snk_pdo:	PDO parameters sent to partner as response to
- *		PD_CTRL_GET_SINK_CAP message
- * @nr_snk_pdo:	Number of entries in @snk_pdo
- * @operating_snk_mw:
- *		Required operating sink power in mW
- * @type:	Port type (TYPEC_PORT_DFP, TYPEC_PORT_UFP, or
- *		TYPEC_PORT_DRP)
- * @default_role:
- *		Default port role (TYPEC_SINK or TYPEC_SOURCE).
- *		Set to TYPEC_NO_PREFERRED_ROLE if no default role.
- * @try_role_hw:True if try.{Src,Snk} is implemented in hardware
- * @alt_modes:	List of supported alternate modes
- */
-struct tcpc_config {
-	const u32 *src_pdo;
-	unsigned int nr_src_pdo;
-
-	const u32 *snk_pdo;
-	unsigned int nr_snk_pdo;
-
-	const u32 *snk_vdo;
-	unsigned int nr_snk_vdo;
-
-	unsigned int operating_snk_mw;
-
-	enum typec_port_type type;
-	enum typec_port_data data;
-	enum typec_role default_role;
-	bool try_role_hw;	/* try.{src,snk} implemented in hardware */
-	bool self_powered;	/* port belongs to a self powered device */
-
-	const struct typec_altmode_desc *alt_modes;
-};
-
 /* Mux state attributes */
 #define TCPC_MUX_USB_ENABLED		BIT(0)	/* USB enabled */
 #define TCPC_MUX_DP_ENABLED		BIT(1)	/* DP enabled */
@@ -92,7 +53,6 @@ struct tcpc_config {
 
 /**
  * struct tcpc_dev - Port configuration and callback functions
- * @config:	Pointer to port configuration
  * @fwnode:	Pointer to port fwnode
  * @get_vbus:	Called to read current VBUS state
  * @get_current_limit:
@@ -121,7 +81,6 @@ struct tcpc_config {
  * @mux:	Pointer to multiplexer data
  */
 struct tcpc_dev {
-	const struct tcpc_config *config;
 	struct fwnode_handle *fwnode;
 
 	int (*init)(struct tcpc_dev *dev);
-- 
2.23.0

