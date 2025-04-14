Return-Path: <linux-usb+bounces-23041-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8ABA88A76
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 19:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA5F67A774D
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 17:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6793728A1CB;
	Mon, 14 Apr 2025 17:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X22AGKrF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6506C288CAC
	for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 17:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744653369; cv=none; b=hFSaEMU7MFN7NM6P5PxBDoEi9pFbBoiYGkZCEtP3Xr3Zz2fdBAdZX/ml4pAt4+4QwBm6mzDaJefo6KLQQYFmadfUbS804VE8fR16qAvApkAtufSd7uZNKGKaA050fzP3DEQ5JlGayNmk7DKIQgFhx/7jyXB8bHoeij1xFJTS3yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744653369; c=relaxed/simple;
	bh=s0y/fzyO2778mrje7yMsEqDcxxLMDt78aQhAjNmkw10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A9roC5IgCh8ll2Sjk3WTq8+FYw6HbokOwQsmwUx70Q4JSMFJAe7y6JQhkSYNWSKspbKHVbig8TkNPZY9BME871S2as/hqE9HXf/TO2jgAclZqxVusLF22qPML91D2SUIGO7b6h2uWwE40plIr7i5C1mZQRzlY2mA7TVVS+kNMNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X22AGKrF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744653367; x=1776189367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s0y/fzyO2778mrje7yMsEqDcxxLMDt78aQhAjNmkw10=;
  b=X22AGKrF0lwLi/PGapmiMAczY5q5FS1/jvjhZrwXfeDoCGftFGQG9GEK
   xOncLL8XUx7+89j5JmywojioYwPESyQEMZH8gfA5XnX7YhH4BWi88vkV4
   dvre0s5l0YCFuJXsXZgSQin42n4lg5ab7WTImErgR36jRX8LIxJXFlDyr
   ZGiIhUVCtPUzsNeSLeucxw7xTSDRfjLNHSEn5/PwA9pSzZlcd7FHSoRzw
   ZF/bNVPPfAhQNFspNTPfcjXKL1A4YvFv+XEZHfD0R7JBiCoU2vFxtoNWf
   KISgEz350gmOElHsUmIU1tw8FzotXTNhJMJdHfE6A/zalQ1ip6YkVlwCE
   w==;
X-CSE-ConnectionGUID: 0/liZGOYQWGM+IY+x8YdjQ==
X-CSE-MsgGUID: QkZPM/TbS+yJE1QIpBnUlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56779866"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56779866"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:56:06 -0700
X-CSE-ConnectionGUID: UWH6B30eSWyyfb0zeM3LfA==
X-CSE-MsgGUID: FzuR8VCUS5+yLUowqqO+Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134866389"
Received: from vpanait-mobl.ger.corp.intel.com (HELO aborzesz-desk.lan) ([10.245.246.215])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:56:03 -0700
From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: mika.westerberg@linux.intel.com,
	andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Subject: [PATCH 3/3] usb: typec: Connect Type-C port with associated USB4 port
Date: Mon, 14 Apr 2025 19:55:54 +0200
Message-ID: <20250414175554.107228-4-alan.borzeszkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>
References: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If USB3.x device references USB4 host interface, USB4 port can be
connected with appropriate Type-C port. By using component framework,
and in turn by creating symlinks, userspace can benefit from having
Thunderbolt/USB4 connection to Type-C ports.

Note: This change introduces dependency on Thunderbolt driver as it's
required to properly map USB4 port to Type-C port.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/port-mapper.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/port-mapper.c b/drivers/usb/typec/port-mapper.c
index d42da5720a25..cdbb7c11d714 100644
--- a/drivers/usb/typec/port-mapper.c
+++ b/drivers/usb/typec/port-mapper.c
@@ -8,6 +8,7 @@
 
 #include <linux/acpi.h>
 #include <linux/component.h>
+#include <linux/thunderbolt.h>
 #include <linux/usb.h>
 
 #include "class.h"
@@ -36,6 +37,11 @@ struct each_port_arg {
 	struct component_match *match;
 };
 
+static int usb4_port_compare(struct device *dev, void *fwnode)
+{
+	return usb4_usb3_port_match(dev, fwnode);
+}
+
 static int typec_port_compare(struct device *dev, void *fwnode)
 {
 	return device_match_fwnode(dev, fwnode);
@@ -51,9 +57,22 @@ static int typec_port_match(struct device *dev, void *data)
 	if (con_adev == adev)
 		return 0;
 
-	if (con_adev->pld_crc == adev->pld_crc)
+	if (con_adev->pld_crc == adev->pld_crc)	{
+		struct fwnode_handle *adev_fwnode = acpi_fwnode_handle(adev);
+
 		component_match_add(&arg->port->dev, &arg->match, typec_port_compare,
-				    acpi_fwnode_handle(adev));
+				    adev_fwnode);
+
+		/*
+		 * If dev is USB 3.x port, it may have reference to the
+		 * USB4 host interface in which case we can also link the
+		 * Type-C port with the USB4 port.
+		 */
+		if (fwnode_property_present(adev_fwnode, "usb4-host-interface"))
+			component_match_add(&arg->port->dev, &arg->match,
+					    usb4_port_compare, adev_fwnode);
+	}
+
 	return 0;
 }
 
-- 
2.43.0


