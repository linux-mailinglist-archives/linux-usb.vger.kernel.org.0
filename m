Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 669FC1B4674
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 15:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgDVNoi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 09:44:38 -0400
Received: from mga14.intel.com ([192.55.52.115]:9793 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgDVNoh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Apr 2020 09:44:37 -0400
IronPort-SDR: 7DGhhW0SEhXkpS/yFowap0rWQSErsJ35I94znTDDUNqYJZRaB6mpau1iYQ17ZTnsvvMFQ3fvRV
 YJubbLa6CKmg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 06:44:08 -0700
IronPort-SDR: +4STx1UK3/Hm38GyntJqvBI5G822kYJfxaOdSd2Lig5MHhC6X895lD2gq29OIBwiwqPAz4Ejf2
 dDCix3e2r4fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; 
   d="diff'?scan'208";a="365678861"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 22 Apr 2020 06:44:06 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 22 Apr 2020 16:44:06 +0300
Date:   Wed, 22 Apr 2020 16:44:05 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Adding tps65986 to your tps6598x driver
Message-ID: <20200422134405.GD618654@kuha.fi.intel.com>
References: <d4a9214a-7a55-72ea-75b9-8388bc39d0dd@linaro.org>
 <20200414151505.GK2828150@kuha.fi.intel.com>
 <d64d7b21-4f03-05e8-e0db-aa8c75ba847e@linaro.org>
 <20200422132533.GC618654@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Y7xTucakfITjPcLV"
Content-Disposition: inline
In-Reply-To: <20200422132533.GC618654@kuha.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 22, 2020 at 04:25:36PM +0300, Heikki Krogerus wrote:
> I'm attaching a diff that has all the changes that you should need to
> do to the tps6598x.c in order to get the role swapping working on your
> board.

Trying again...

-- 
heikki

--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="role_switch_for_tps6598x.diff"

diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
index 0698addd1185..5f51397f0007 100644
--- a/drivers/usb/typec/tps6598x.c
+++ b/drivers/usb/typec/tps6598x.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/interrupt.h>
+#include <linux/usb/role.h>
 #include <linux/usb/typec.h>
 
 /* Register offsets */
@@ -94,6 +95,8 @@ struct tps6598x {
 	struct typec_port *port;
 	struct typec_partner *partner;
 	struct usb_pd_identity partner_identity;
+
+	struct usb_role_switch *role_sw;
 };
 
 /*
@@ -175,6 +178,18 @@ tps6598x_write_4cc(struct tps6598x *tps, u8 reg, const char *val)
 	return tps6598x_block_write(tps, reg, val, 4);
 }
 
+static int tps6598x_set_data_role(struct tps6598x *tps,
+				  enum typec_data_role role)
+{
+	enum usb_role usb_role;
+
+	usb_role = role == TYPEC_HOST ? USB_ROLE_HOST : USB_ROLE_DEVICE;
+
+	typec_set_data_role(tps->port, role);
+
+	return usb_role_switch_set_role(tps->role_sw, usb_role);
+}
+
 static int tps6598x_read_partner_identity(struct tps6598x *tps)
 {
 	struct tps6598x_rx_identity_reg id;
@@ -220,7 +235,7 @@ static int tps6598x_connect(struct tps6598x *tps, u32 status)
 	typec_set_pwr_opmode(tps->port, mode);
 	typec_set_pwr_role(tps->port, TPS_STATUS_PORTROLE(status));
 	typec_set_vconn_role(tps->port, TPS_STATUS_VCONN(status));
-	typec_set_data_role(tps->port, TPS_STATUS_DATAROLE(status));
+	tps6598x_set_data_role(tps, TPS_STATUS_DATAROLE(status));
 
 	tps->partner = typec_register_partner(tps->port, &desc);
 	if (IS_ERR(tps->partner))
@@ -241,6 +256,7 @@ static void tps6598x_disconnect(struct tps6598x *tps, u32 status)
 	typec_set_pwr_role(tps->port, TPS_STATUS_PORTROLE(status));
 	typec_set_vconn_role(tps->port, TPS_STATUS_VCONN(status));
 	typec_set_data_role(tps->port, TPS_STATUS_DATAROLE(status));
+	usb_role_switch_set_role(tps->role_sw, USB_ROLE_NONE);
 }
 
 static int tps6598x_exec_cmd(struct tps6598x *tps, const char *cmd,
@@ -328,7 +344,7 @@ static int tps6598x_dr_set(struct typec_port *port, enum typec_data_role role)
 		goto out_unlock;
 	}
 
-	typec_set_data_role(tps->port, role);
+	ret = tps6598x_set_data_role(tps, role);
 
 out_unlock:
 	mutex_unlock(&tps->lock);
@@ -472,6 +488,10 @@ static int tps6598x_probe(struct i2c_client *client)
 	if (ret < 0 || !vid)
 		return -ENODEV;
 
+	tps->role_sw = usb_role_switch_get(&client->dev);
+	if (IS_ERR(tps->role_sw))
+		return PTR_ERR(tps->role_sw);
+
 	/*
 	 * Checking can the adapter handle SMBus protocol. If it can not, the
 	 * driver needs to take care of block reads separately.

--Y7xTucakfITjPcLV--
