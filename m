Return-Path: <linux-usb+bounces-11380-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DCC90C6EB
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 12:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C830AB2286B
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 10:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AB91A0B0F;
	Tue, 18 Jun 2024 08:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1A+hic4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655421A0AE0
	for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2024 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718698523; cv=none; b=P4064nqwkZVHVhcfGMfWUSJi+FINGH+6PpXkP2by73kEMWezxfUtIrYEjfpql3Mp/Z7OTmy0nt7SUmQT2A/QdLtVd9i3x9/UVAeosoMUh/PLXDa3h7HV1Yn8B6S4X8J7SIfIxMogOWrcNfaZa7cOncXq7QZvQ+kAeM7XakOU5Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718698523; c=relaxed/simple;
	bh=mCyLmK6T6XtEU4IjrmpNRuUhvm44x3Q2JDG2A7DtnCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JON38eX4TRZdE1wRHOfCbM+J/Qth3dB9lAZMJhbv7uMMJpdl6l0d7w5fiYMEBZG158DuTB3STbv6OEPEfWiLGa0gq/vvYptQ2jrS2lrlII94cTDmz5ToWgWkzulUV0Xrjc6NwyXlN7Pl0+F/XA20W+A5zjQ8k2Xb7b9fBBy5egU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1A+hic4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718698521; x=1750234521;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mCyLmK6T6XtEU4IjrmpNRuUhvm44x3Q2JDG2A7DtnCs=;
  b=M1A+hic4d5tb/nzHPytYlWoxPlL2AV3yNbU07GggILzEtvOWNVSX8yea
   KBxZQOb+QdgxFizYIGJ+TQgu/1oRcJLe9SrJWYG3ft4qlUtxj51ap4xok
   lBqKccabm3GAsW7pss4AOblxQN54JV+YEnUZ8lU8Vih4rXMYm+1WtY3jG
   fouenow/9fX6pbQE0VR0kfdozpYvgwvnRqWfjZDiaAnMZxSmcD9hjEQKJ
   NQwMm2YzBG5bWLmBM3QP7CjTp0K4MbVEhe5kzOxuBKG3hxyTRH78nW9es
   4viav2zPO4NSO8ernsVcpFrpk6sTZjxm+ia6tceB5jQfandsoNy7Oub0x
   Q==;
X-CSE-ConnectionGUID: j8JLalpgRm6vp9KxSlWKOg==
X-CSE-MsgGUID: EyqCBvO2T9uCeaeHdGnL/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26959364"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="26959364"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 01:15:12 -0700
X-CSE-ConnectionGUID: Gl35EoRERB2MrUmXiYg33w==
X-CSE-MsgGUID: MJy+RgeFRRGij9RDJlM0hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="41334071"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 18 Jun 2024 01:15:11 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v2] usb: typec: ucsi: psy: Add support for the charge type property
Date: Tue, 18 Jun 2024 11:15:10 +0300
Message-ID: <20240618081510.2764297-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding support for the charge type Linux power supply class
property (POWER_SUPPLY_PROP_CHARGE_TYPE) to the UCSI driver.
That will make the charge type visible in the charge_type
power supply class sysfs attribute file.

UCSI has the charge type specified in the Battery Charging
Status field of the response to the GET_CONNECTOR_STATUS
command.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changed since the last version:
The commit message is completely rewritten. The subject line was also changed.

The original patch:
https://lore.kernel.org/linux-usb/20240617105554.1677285-1-heikki.krogerus@linux.intel.com/

---
 drivers/usb/typec/ucsi/psy.c  | 27 +++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
index b35c6e07911e..b3910f37e171 100644
--- a/drivers/usb/typec/ucsi/psy.c
+++ b/drivers/usb/typec/ucsi/psy.c
@@ -20,6 +20,7 @@ enum ucsi_psy_online_states {
 };
 
 static enum power_supply_property ucsi_psy_props[] = {
+	POWER_SUPPLY_PROP_CHARGE_TYPE,
 	POWER_SUPPLY_PROP_USB_TYPE,
 	POWER_SUPPLY_PROP_ONLINE,
 	POWER_SUPPLY_PROP_VOLTAGE_MIN,
@@ -194,6 +195,30 @@ static int ucsi_psy_get_usb_type(struct ucsi_connector *con,
 	return 0;
 }
 
+static int ucsi_psy_get_charge_type(struct ucsi_connector *con, union power_supply_propval *val)
+{
+	if (!(con->status.flags & UCSI_CONSTAT_CONNECTED) ||
+	    (con->status.flags & UCSI_CONSTAT_PWR_DIR) != TYPEC_SINK) {
+		val->intval = POWER_SUPPLY_CHARGE_TYPE_NONE;
+		return 0;
+	}
+
+	switch (UCSI_CONSTAT_BC_STATUS(con->status.pwr_status)) {
+	case UCSI_CONSTAT_BC_NOMINAL_CHARGING:
+		val->intval = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
+		break;
+	case UCSI_CONSTAT_BC_SLOW_CHARGING:
+	case UCSI_CONSTAT_BC_TRICKLE_CHARGING:
+		val->intval = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
+		break;
+	default:
+		val->intval = POWER_SUPPLY_CHARGE_TYPE_NONE;
+		break;
+	}
+
+	return 0;
+}
+
 static int ucsi_psy_get_prop(struct power_supply *psy,
 			     enum power_supply_property psp,
 			     union power_supply_propval *val)
@@ -201,6 +226,8 @@ static int ucsi_psy_get_prop(struct power_supply *psy,
 	struct ucsi_connector *con = power_supply_get_drvdata(psy);
 
 	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_TYPE:
+		return ucsi_psy_get_charge_type(con, val);
 	case POWER_SUPPLY_PROP_USB_TYPE:
 		return ucsi_psy_get_usb_type(con, val);
 	case POWER_SUPPLY_PROP_ONLINE:
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 6bbaad4b89a5..51135e3502cf 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1257,6 +1257,9 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	if (con->status.change & UCSI_CONSTAT_CAM_CHANGE)
 		ucsi_partner_task(con, ucsi_check_altmodes, 1, HZ);
 
+	if (con->status.change & UCSI_CONSTAT_BC_CHANGE)
+		ucsi_port_psy_changed(con);
+
 out_unlock:
 	mutex_unlock(&con->lock);
 }
-- 
2.43.0


