Return-Path: <linux-usb+bounces-11365-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 445FA90AC5D
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 12:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDA921F2746B
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 10:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B51D194ADF;
	Mon, 17 Jun 2024 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b73Mai6P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C011190041
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 10:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718621759; cv=none; b=rduGT2g4VOtGNlA0voNS/VVIL3uwcVC6xGr4qkvu0d3arzC86crB+sQ6GIUu4KdkwVBqMq3Mk9eEOPhn3kD3g9+TCwWA9TAzHcVBqn8kMs4n9nvOV4mRRivBfySMi/+MCjNHZ6uH75miHy3SUjsppx3MaAV7Hxlga4lVWgAXvd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718621759; c=relaxed/simple;
	bh=rIIOKxCUjELaC4cXiAmiZBmedK07+gfqIs3c7wGnNtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SeVZNBeNUbsXy+qok+3UXveXuij4Yk0zUghhURUhbBvfycGlf5+4BBYlM+/Qf8MOcd3j/huUAa5aZqwCkV9tsUua5yHy8Yg3Gl1FFijyX+RbjrntA5+bbczwOagherweub8jQmUFgdEcfXP3ilwPQt9hkcIYVV0S0UFCV8MAycc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b73Mai6P; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718621758; x=1750157758;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rIIOKxCUjELaC4cXiAmiZBmedK07+gfqIs3c7wGnNtA=;
  b=b73Mai6PvVlFMI6FxxgPOJwMipwNILWN6r2UpBr/0Og7LKgHe89WDhZz
   tpbBgKvTszCytjSETk7TDPc2M2/uLNTwTSKYg0g4ntYXcYcT8tPXh27ou
   D+Y0Y+6/SkraQp7E9EB0vYYcChcWJJCfuhkVqOMNSC/w+rhpuwoOmkBd/
   uN4z+vPtzcSvVv1vcyR2VoHDUHFQZchdEQ6FAvwlMfMrK+0qKAjBXEi6O
   IB+v4rnUBPdsiDjBg7ymal38cOLHSipWoRbVX1q52Yd6oK9ffX0Wen1fL
   vhQN/9Y7bm8Hhwtq5C2xgXLMoWW9EJnj55ZdECgl1+TEI5HxdVbqoKlCo
   A==;
X-CSE-ConnectionGUID: 9QLvMdnqT5O89+umsRWLAA==
X-CSE-MsgGUID: vZP9CAxWQ1qBGlKxhILwUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15595248"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15595248"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 03:55:57 -0700
X-CSE-ConnectionGUID: c0DWblQnQ1aYB79LqPhw+w==
X-CSE-MsgGUID: P4vew9JqR9aFhFlr1p5D0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="46274409"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2024 03:55:55 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: psy: Expose the charge-type property
Date: Mon, 17 Jun 2024 13:55:54 +0300
Message-ID: <20240617105554.1677285-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UCSI has this information in the Battery Charging Capability
Status, so making it available for the user.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
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


