Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E35643C33C
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 08:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhJ0Gvd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 02:51:33 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:28209 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235258AbhJ0Gvb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Oct 2021 02:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635317347; x=1666853347;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3VZbzj/mwTYx1C0FNEboDSho7NnWajQVHdw0N1pGQ6Q=;
  b=leohdFG0wBgIG8uzYhEUVewvR19/yJ5z4SOGcSJofm5WWKodSyf2Namp
   qSa1pyse7uw/IY7suj5/ygMsnX/otqmF42PufDLbQXaOOwGnueyF7fDAH
   XxfwoMErbd/K6V+oiSpuhMeou6mnRZCJBUIDTyPFsO62Uw8XaHPY/eUBt
   s=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 26 Oct 2021 23:49:07 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2021 23:49:06 -0700
Received: from jackp-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 26 Oct 2021 23:49:05 -0700
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     <linux-usb@vger.kernel.org>,
        Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@google.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
Subject: [PATCH] usb: typec: ucsi: Only get source PDOs from the actual source
Date:   Tue, 26 Oct 2021 23:48:42 -0700
Message-ID: <20211027064842.6901-1-quic_jackp@quicinc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The intent of ucsi_get_src_pdos() is to obtain the source's PDOs
in order to provide the power_supply object the required data to
report the mininum, maximum and currently operating voltage &
current should a PD contract be in place.

If however, the port is operating as a PD source, this call would
invoke GET_PDOS on the partner causing the PPM to send a
Get_Source_Caps PD message to the port partner which may not make
sense especially if the partner is not a dual-power role capable
device.  Further, it has been observed that certain DisplayPort
adapter cables (which are power sink-only devices) even fail to
bring up the display link after receiving a Get_Source_Caps
message, suggesting they can't cope well with an unsupported PD
message to the point that it renders them functionally inoperable.

Fix this by checking the connector status flags for the power
direction and use this to decide whether to send the GET_PDOs
query to the partner or the port.  This also helps to make the
power_supply VOLTAGE_{MIN,MAX,NOW} and CURRENT_{MAX,NOW}
properties more consistent when the port is in source mode.

Signed-off-by: Jack Pham <quic_jackp@quicinc.com>
---
Hi Heikki,

Was wrestling with how exactly to do this.  The other approach I was
thinking was to not even do GET_PDOs at all if operating as a source,
but that would also mean we'd need to add similar checking to the
VOLTAGE/CURRENT property getters in psy.c so that they would not
return incorrect/stale data.  Since the ONLINE property will already
be 0 anyway it may make more sense to invalidate the rest of the props?

The patch below is concise though...so that's what I went with ;)

Jack

 drivers/usb/typec/ucsi/ucsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 6aa28384f77f..406d757266ae 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -582,9 +582,13 @@ static int ucsi_get_pdos(struct ucsi_connector *con, int is_partner,
 static int ucsi_get_src_pdos(struct ucsi_connector *con)
 {
 	int ret;
+	int partner;
+
+	/* Get PDOs from whomever is the source */
+	partner = (con->status.flags & UCSI_CONSTAT_PWR_DIR) == TYPEC_SINK;
 
 	/* UCSI max payload means only getting at most 4 PDOs at a time */
-	ret = ucsi_get_pdos(con, 1, con->src_pdos, 0, UCSI_MAX_PDOS);
+	ret = ucsi_get_pdos(con, partner, con->src_pdos, 0, UCSI_MAX_PDOS);
 	if (ret < 0)
 		return ret;
 
@@ -593,7 +597,7 @@ static int ucsi_get_src_pdos(struct ucsi_connector *con)
 		return 0;
 
 	/* get the remaining PDOs, if any */
-	ret = ucsi_get_pdos(con, 1, con->src_pdos, UCSI_MAX_PDOS,
+	ret = ucsi_get_pdos(con, partner, con->src_pdos, UCSI_MAX_PDOS,
 			    PDO_MAX_OBJECTS - UCSI_MAX_PDOS);
 	if (ret < 0)
 		return ret;
-- 
2.24.0

