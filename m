Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76648FC534
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2019 12:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfKNLSr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Nov 2019 06:18:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51541 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726087AbfKNLSr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Nov 2019 06:18:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573730325;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=XwljjQeeqS0wEfDP0ymNvPDmW+RGZZM8zC8glh9va6Y=;
        b=gxP7eoSQThJLTtOJYp2uVRGXz9d+xodSTXHw++dc6dhejLtDmpzYt1UXSt/dEh/EnSIC3o
        6kmkBqaCnIYtI3kkK7HGZlsWgfuWtORHb7OHhfOOGbpn8sZkvonRGsQoV80F+XAbneAxdc
        od6tCiqabk9C3sPCIcoypDrryuBzJpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-EJD8_FelPk-3bW89B109ag-1; Thu, 14 Nov 2019 06:18:44 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AC851852E24;
        Thu, 14 Nov 2019 11:18:43 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.128])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 227A45C541;
        Thu, 14 Nov 2019 11:18:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH resend] usb: typec: tcpm: Remove tcpc_config configuration mechanism
Date:   Thu, 14 Nov 2019 12:18:40 +0100
Message-Id: <20191114111840.40876-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: EJD8_FelPk-3bW89B109ag-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
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
@@ -380,9 +380,6 @@ static enum tcpm_state tcpm_default_state(struct tcpm_p=
ort *port)
 =09=09=09return SNK_UNATTACHED;
 =09=09else if (port->try_role =3D=3D TYPEC_SOURCE)
 =09=09=09return SRC_UNATTACHED;
-=09=09else if (port->tcpc->config &&
-=09=09=09 port->tcpc->config->default_role =3D=3D TYPEC_SINK)
-=09=09=09return SNK_UNATTACHED;
 =09=09/* Fall through to return SRC_UNATTACHED */
 =09} else if (port->port_type =3D=3D TYPEC_PORT_SNK) {
 =09=09return SNK_UNATTACHED;
@@ -4131,7 +4128,7 @@ static int tcpm_try_role(const struct typec_capabilit=
y *cap, int role)
 =09mutex_lock(&port->lock);
 =09if (tcpc->try_role)
 =09=09ret =3D tcpc->try_role(tcpc, role);
-=09if (!ret && (!tcpc->config || !tcpc->config->try_role_hw))
+=09if (!ret)
 =09=09port->try_role =3D role;
 =09port->try_src_count =3D 0;
 =09port->try_snk_count =3D 0;
@@ -4368,34 +4365,6 @@ void tcpm_tcpc_reset(struct tcpm_port *port)
 }
 EXPORT_SYMBOL_GPL(tcpm_tcpc_reset);
=20
-static int tcpm_copy_pdos(u32 *dest_pdo, const u32 *src_pdo,
-=09=09=09  unsigned int nr_pdo)
-{
-=09unsigned int i;
-
-=09if (nr_pdo > PDO_MAX_OBJECTS)
-=09=09nr_pdo =3D PDO_MAX_OBJECTS;
-
-=09for (i =3D 0; i < nr_pdo; i++)
-=09=09dest_pdo[i] =3D src_pdo[i];
-
-=09return nr_pdo;
-}
-
-static int tcpm_copy_vdos(u32 *dest_vdo, const u32 *src_vdo,
-=09=09=09  unsigned int nr_vdo)
-{
-=09unsigned int i;
-
-=09if (nr_vdo > VDO_MAX_OBJECTS)
-=09=09nr_vdo =3D VDO_MAX_OBJECTS;
-
-=09for (i =3D 0; i < nr_vdo; i++)
-=09=09dest_vdo[i] =3D src_vdo[i];
-
-=09return nr_vdo;
-}
-
 static int tcpm_fw_get_caps(struct tcpm_port *port,
 =09=09=09    struct fwnode_handle *fwnode)
 {
@@ -4698,35 +4667,10 @@ static int devm_tcpm_psy_register(struct tcpm_port =
*port)
 =09return PTR_ERR_OR_ZERO(port->psy);
 }
=20
-static int tcpm_copy_caps(struct tcpm_port *port,
-=09=09=09  const struct tcpc_config *tcfg)
-{
-=09if (tcpm_validate_caps(port, tcfg->src_pdo, tcfg->nr_src_pdo) ||
-=09    tcpm_validate_caps(port, tcfg->snk_pdo, tcfg->nr_snk_pdo))
-=09=09return -EINVAL;
-
-=09port->nr_src_pdo =3D tcpm_copy_pdos(port->src_pdo, tcfg->src_pdo,
-=09=09=09=09=09  tcfg->nr_src_pdo);
-=09port->nr_snk_pdo =3D tcpm_copy_pdos(port->snk_pdo, tcfg->snk_pdo,
-=09=09=09=09=09  tcfg->nr_snk_pdo);
-
-=09port->nr_snk_vdo =3D tcpm_copy_vdos(port->snk_vdo, tcfg->snk_vdo,
-=09=09=09=09=09  tcfg->nr_snk_vdo);
-
-=09port->operating_snk_mw =3D tcfg->operating_snk_mw;
-
-=09port->typec_caps.prefer_role =3D tcfg->default_role;
-=09port->typec_caps.type =3D tcfg->type;
-=09port->typec_caps.data =3D tcfg->data;
-=09port->self_powered =3D tcfg->self_powered;
-
-=09return 0;
-}
-
 struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *=
tcpc)
 {
 =09struct tcpm_port *port;
-=09int i, err;
+=09int err;
=20
 =09if (!dev || !tcpc ||
 =09    !tcpc->get_vbus || !tcpc->set_cc || !tcpc->get_cc ||
@@ -4759,15 +4703,10 @@ struct tcpm_port *tcpm_register_port(struct device =
*dev, struct tcpc_dev *tcpc)
 =09tcpm_debugfs_init(port);
=20
 =09err =3D tcpm_fw_get_caps(port, tcpc->fwnode);
-=09if ((err < 0) && tcpc->config)
-=09=09err =3D tcpm_copy_caps(port, tcpc->config);
 =09if (err < 0)
 =09=09goto out_destroy_wq;
=20
-=09if (!tcpc->config || !tcpc->config->try_role_hw)
-=09=09port->try_role =3D port->typec_caps.prefer_role;
-=09else
-=09=09port->try_role =3D TYPEC_NO_PREFERRED_ROLE;
+=09port->try_role =3D port->typec_caps.prefer_role;
=20
 =09port->typec_caps.fwnode =3D tcpc->fwnode;
 =09port->typec_caps.revision =3D 0x0120;=09/* Type-C spec release 1.2 */
@@ -4797,29 +4736,6 @@ struct tcpm_port *tcpm_register_port(struct device *=
dev, struct tcpc_dev *tcpc)
 =09=09goto out_role_sw_put;
 =09}
=20
-=09if (tcpc->config && tcpc->config->alt_modes) {
-=09=09const struct typec_altmode_desc *paltmode =3D tcpc->config->alt_mode=
s;
-
-=09=09i =3D 0;
-=09=09while (paltmode->svid && i < ARRAY_SIZE(port->port_altmode)) {
-=09=09=09struct typec_altmode *alt;
-
-=09=09=09alt =3D typec_port_register_altmode(port->typec_port,
-=09=09=09=09=09=09=09  paltmode);
-=09=09=09if (IS_ERR(alt)) {
-=09=09=09=09tcpm_log(port,
-=09=09=09=09=09 "%s: failed to register port alternate mode 0x%x",
-=09=09=09=09=09 dev_name(dev), paltmode->svid);
-=09=09=09=09break;
-=09=09=09}
-=09=09=09typec_altmode_set_drvdata(alt, port);
-=09=09=09alt->ops =3D &tcpm_altmode_ops;
-=09=09=09port->port_altmode[i] =3D alt;
-=09=09=09i++;
-=09=09=09paltmode++;
-=09=09}
-=09}
-
 =09mutex_lock(&port->lock);
 =09tcpm_init(port);
 =09mutex_unlock(&port->lock);
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index f516955a0cf4..e7979c01c351 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -46,45 +46,6 @@ enum tcpm_transmit_type {
 =09TCPC_TX_BIST_MODE_2 =3D 7
 };
=20
-/**
- * struct tcpc_config - Port configuration
- * @src_pdo:=09PDO parameters sent to port partner as response to
- *=09=09PD_CTRL_GET_SOURCE_CAP message
- * @nr_src_pdo:=09Number of entries in @src_pdo
- * @snk_pdo:=09PDO parameters sent to partner as response to
- *=09=09PD_CTRL_GET_SINK_CAP message
- * @nr_snk_pdo:=09Number of entries in @snk_pdo
- * @operating_snk_mw:
- *=09=09Required operating sink power in mW
- * @type:=09Port type (TYPEC_PORT_DFP, TYPEC_PORT_UFP, or
- *=09=09TYPEC_PORT_DRP)
- * @default_role:
- *=09=09Default port role (TYPEC_SINK or TYPEC_SOURCE).
- *=09=09Set to TYPEC_NO_PREFERRED_ROLE if no default role.
- * @try_role_hw:True if try.{Src,Snk} is implemented in hardware
- * @alt_modes:=09List of supported alternate modes
- */
-struct tcpc_config {
-=09const u32 *src_pdo;
-=09unsigned int nr_src_pdo;
-
-=09const u32 *snk_pdo;
-=09unsigned int nr_snk_pdo;
-
-=09const u32 *snk_vdo;
-=09unsigned int nr_snk_vdo;
-
-=09unsigned int operating_snk_mw;
-
-=09enum typec_port_type type;
-=09enum typec_port_data data;
-=09enum typec_role default_role;
-=09bool try_role_hw;=09/* try.{src,snk} implemented in hardware */
-=09bool self_powered;=09/* port belongs to a self powered device */
-
-=09const struct typec_altmode_desc *alt_modes;
-};
-
 /* Mux state attributes */
 #define TCPC_MUX_USB_ENABLED=09=09BIT(0)=09/* USB enabled */
 #define TCPC_MUX_DP_ENABLED=09=09BIT(1)=09/* DP enabled */
@@ -92,7 +53,6 @@ struct tcpc_config {
=20
 /**
  * struct tcpc_dev - Port configuration and callback functions
- * @config:=09Pointer to port configuration
  * @fwnode:=09Pointer to port fwnode
  * @get_vbus:=09Called to read current VBUS state
  * @get_current_limit:
@@ -121,7 +81,6 @@ struct tcpc_config {
  * @mux:=09Pointer to multiplexer data
  */
 struct tcpc_dev {
-=09const struct tcpc_config *config;
 =09struct fwnode_handle *fwnode;
=20
 =09int (*init)(struct tcpc_dev *dev);
--=20
2.23.0

