Return-Path: <linux-usb+bounces-11442-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6EE90EFB5
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 16:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A329F1F21072
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 14:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87FD14EC43;
	Wed, 19 Jun 2024 14:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bU0qv79V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855391482EE
	for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718806091; cv=none; b=S21fH7klktMPPIVJcvN36DRKn4x7FGKJ/UdD9k/usuKZuRw0x6E2Ln8x19qjVDBxRpIQypjZq/H90dcAqn/RPtvJ70dH5ZXsRONLMyBNRt1NKQXPM37BbNfT4e9NroLVO2f3SgPsd7Ljb/CJaZ6bgfm7QN4oSvIqN4knGuTbkqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718806091; c=relaxed/simple;
	bh=hWmlK5DLf3eECx3Z7lcEsfnrXYP0+w8umazm1KZciP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=btIFJt+2Xy0+gHaLBWgEVpT3zLIfnz4YwEZqx71E/hmMgrU1d+kMJey1Rg+MqGaM4iqkTawjkSb7MHi94il7Ls6hvo/ZRTctaqk2sKfi9RNXPl906dhyF5wQA/3FZoYWb0KRPyqvrE9TK0RjBafRaIWBw8vRYYrvlvCQUEN9czE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bU0qv79V; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718806090; x=1750342090;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hWmlK5DLf3eECx3Z7lcEsfnrXYP0+w8umazm1KZciP8=;
  b=bU0qv79Vspsieag5fukxEfNDhYQwt7YnpuvVwn2PSaGo+kqmu/m8/m/b
   DkMd9Syos8eO5kpH03xa0wWQfpiEBEwBZ+tI/yhCn2wu9h/N8WjLBXs/r
   AYX7Nk+3UHz+Ebu48bGV1QPkDuLsluqKaimI8PW0p5lvbZPan8FJxFyWD
   c1dbYkXnOhnbPLQE16QopGCfZdAsGbaev8/OoJbYuOcQN4/CuHdgxL0VX
   nK9qMDjAsEHjDngiGmIlHX6kriLbpTeWYlJyREkiz990HpV8mRdl3J0Xk
   ZBXbGcVbTX821VkidgCC+JSCVMuBUnNpenT3Het+UsPk6IhKrkU/Pnw5R
   g==;
X-CSE-ConnectionGUID: SPlSY1QvRzi6KsZ0yAahJQ==
X-CSE-MsgGUID: vrKT7MuERieT97X7ltay+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15584831"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="15584831"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 07:08:09 -0700
X-CSE-ConnectionGUID: Rib+4HBpQcuZTkR0iVNjQQ==
X-CSE-MsgGUID: OUgUd62vRoq2dTbMuo1y7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="46840319"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 19 Jun 2024 07:08:07 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v3] usb: typec: ucsi: psy: Add support for the charge type property
Date: Wed, 19 Jun 2024 17:08:06 +0300
Message-ID: <20240619140806.3502590-1-heikki.krogerus@linux.intel.com>
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
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes in v3:
- Setting the charge type to unknown unless in sink role like Mario suggested.

Changes in v2:
- The commit message is completely rewritten. The subject line was also changed.

The original patch:
https://lore.kernel.org/linux-usb/20240617105554.1677285-1-heikki.krogerus@linux.intel.com/

---
 drivers/usb/typec/ucsi/psy.c  | 32 ++++++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
index b35c6e07911e..e623d80e177c 100644
--- a/drivers/usb/typec/ucsi/psy.c
+++ b/drivers/usb/typec/ucsi/psy.c
@@ -20,6 +20,7 @@ enum ucsi_psy_online_states {
 };
 
 static enum power_supply_property ucsi_psy_props[] = {
+	POWER_SUPPLY_PROP_CHARGE_TYPE,
 	POWER_SUPPLY_PROP_USB_TYPE,
 	POWER_SUPPLY_PROP_ONLINE,
 	POWER_SUPPLY_PROP_VOLTAGE_MIN,
@@ -194,6 +195,35 @@ static int ucsi_psy_get_usb_type(struct ucsi_connector *con,
 	return 0;
 }
 
+static int ucsi_psy_get_charge_type(struct ucsi_connector *con, union power_supply_propval *val)
+{
+	if (!(con->status.flags & UCSI_CONSTAT_CONNECTED)) {
+		val->intval = POWER_SUPPLY_CHARGE_TYPE_NONE;
+		return 0;
+	}
+
+	/* The Battery Charging Cabability Status field is only valid in sink role. */
+	if ((con->status.flags & UCSI_CONSTAT_PWR_DIR) != TYPEC_SINK) {
+		val->intval = POWER_SUPPLY_CHARGE_TYPE_UNKNOWN;
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
@@ -201,6 +231,8 @@ static int ucsi_psy_get_prop(struct power_supply *psy,
 	struct ucsi_connector *con = power_supply_get_drvdata(psy);
 
 	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_TYPE:
+		return ucsi_psy_get_charge_type(con, val);
 	case POWER_SUPPLY_PROP_USB_TYPE:
 		return ucsi_psy_get_usb_type(con, val);
 	case POWER_SUPPLY_PROP_ONLINE:
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 134ef4e17d85..ef3ab5c340b4 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1262,6 +1262,9 @@ static void ucsi_handle_connector_change(struct work_struct *work)
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


