Return-Path: <linux-usb+bounces-16320-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFB99A0B43
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 15:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 893071C22F5F
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 13:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E80209F41;
	Wed, 16 Oct 2024 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1uSC2Em"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63801E531
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729084730; cv=none; b=sqCvo661fCXt7htqNHXUZpH27q+/QUouiT3z/1mbohiZ8jORvJo2RFvFzUoLiUGOcF4OdvQDx+H5olTDimB/QCYC9xEXAAWoCDUuXBbaqFSbf5kx8ZralM8jQ7O9CSYia7kls6tFB1RDfFk8GOaYziQrnAko0OkktKlKMz1JRD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729084730; c=relaxed/simple;
	bh=dO8g9ixPaMF2jgMFKZZ3RTSWwWZrl40eQCsC0/xbLYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M6lIhLJV+9Bp/Bpy5HaFXh8eBIKwsALu2vCd5aLF6bmzOYDKZwY0LRxm74yTi30zC6j6DJhJAVJ5mRXWnW0EIiGbKBu26l021Tw6gWxbMoK1rB/Q4dM8qD/zRFLX1zCFfpHh+/IwnqqDq5A25HhGxN3WhUR4NYVU8MiwEAk9pn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1uSC2Em; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729084729; x=1760620729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dO8g9ixPaMF2jgMFKZZ3RTSWwWZrl40eQCsC0/xbLYs=;
  b=P1uSC2EmjD+euH+WDE55zNZz9+Pzt/gEwnFzFGuaGo3AXzGJrkucHZi+
   YdpsEXCBnDSuj1pbzGtKrv+X17L4LYJL/GbaiWwZTXjVkS0KzjFdefrkD
   Y5SBEN5ys6c/9eQX4trQ4bpJOLyiEW+5wSktp7AMpt3ZhXn14XpoUmiNY
   93uOnNr3YleNxXzTfPCeTyzftOFxEEkJu+SJFoPuARkgqRTnlDSlwHbdM
   juBsLBxc+uqPP065rXdnxHSikvLSOtGH5mCPmvK2c2PuHezUn31yR7Lwh
   9queWMJBBNOiSiNXXmCpFeKa6nVmG7lThXUEzKbmMB8keXvCrXhfFR88e
   g==;
X-CSE-ConnectionGUID: Q/rTAImjS3KHktkoOhJj0w==
X-CSE-MsgGUID: aWEGNZ7wQM+NpuxULN5F4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39077781"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39077781"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:18:49 -0700
X-CSE-ConnectionGUID: aLmgwwCpTQKyds1pgMlLHw==
X-CSE-MsgGUID: W9nPKXGZTXWwAumaiATmTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="83300102"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2024 06:18:47 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 4/4] usb: typec: ucsi: Add support for the partner USB Modes
Date: Wed, 16 Oct 2024 16:18:34 +0300
Message-ID: <20241016131834.898599-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016131834.898599-1-heikki.krogerus@linux.intel.com>
References: <20241016131834.898599-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UCSI does not share the contents of the Enter_USB Message
that was used, so the active mode still has to be always
determined from the enumerated USB device. However, after
UCSI v2.0 it is possible to check separately is USB4 the
active mode.

So with USB2 and USB3 the mode is always determined from the
result of the USB enumeration, and when USB4 USB Mode is
active, UCSI driver can assign the mode directly.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 9 +++++++++
 drivers/usb/typec/ucsi/ucsi.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 13c739d334c4..d03f04556ab7 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1057,6 +1057,15 @@ static int ucsi_register_partner(struct ucsi_connector *con)
 
 	con->partner = partner;
 
+	if ((con->ucsi->version >= UCSI_VERSION_3_0) &&
+	    (UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
+	     UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN4))
+		typec_partner_set_usb_mode(partner, USB_MODE_USB4);
+	else if ((con->ucsi->version >= UCSI_VERSION_2_0) &&
+		 (UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
+		  UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN3))
+		typec_partner_set_usb_mode(partner, USB_MODE_USB4);
+
 	return 0;
 }
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index a1f4b9b568c8..d850073e8d0a 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -346,6 +346,8 @@ struct ucsi_connector_status {
 #define UCSI_CONSTAT_PARTNER_FLAGS(_f_)		(((_f_) & GENMASK(12, 5)) >> 5)
 #define   UCSI_CONSTAT_PARTNER_FLAG_USB		1
 #define   UCSI_CONSTAT_PARTNER_FLAG_ALT_MODE	2
+#define   UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN3	4
+#define   UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN4	8
 #define UCSI_CONSTAT_PARTNER_TYPE(_f_)		(((_f_) & GENMASK(15, 13)) >> 13)
 #define   UCSI_CONSTAT_PARTNER_TYPE_DFP		1
 #define   UCSI_CONSTAT_PARTNER_TYPE_UFP		2
-- 
2.45.2


