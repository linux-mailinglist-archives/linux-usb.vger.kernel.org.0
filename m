Return-Path: <linux-usb+bounces-15947-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC7A997094
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 18:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 058D4281FB5
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 16:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BB51E2855;
	Wed,  9 Oct 2024 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XD741ooZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959451E2840
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 15:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728488772; cv=none; b=D9E9W+WN7A+EPYpGX+SwkeZo8Qtp5Rnqc39EHx4cQYl11JkFEvIJjike//qaCuMcf97QO5Z44fKjsRbN2EzYlASZRi2sxXaCDSEwAyO4EZnFrSb5D8vZubnkkChwEBYjOZy9Y/XVZgLeuUxRecro+AjB4DYz8LRHYtwN/qCr150=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728488772; c=relaxed/simple;
	bh=+oqTaLNbD0nIAK3DWOlcr9M1G8NAByjPH9PR2kehoSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ay2o/jsAdK+aDli5oBSDLOXkibxU2xB4ycLXlRinj/T3AiW7xkePijeFiBAusjcMl2PG5csELlYozjGbzD+uqFcqUnnzhQc5rTSUtZebh0VwURG51Cb6lq8etkyPyNZqknZpXeskBC+aSWU0M2fFXNif8SMmJ10C/VHUwIQ3cuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XD741ooZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728488771; x=1760024771;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+oqTaLNbD0nIAK3DWOlcr9M1G8NAByjPH9PR2kehoSA=;
  b=XD741ooZZsxHUXC2YZ5gygZpGWiic2ZZEqhILA8te6KmlnE7CtTOtTS6
   linajm8jNAojdoZS5KrgszOWy144CGAS2moKjbMXepZvL0I0I0gEuuHO0
   MesoI8GKJP8ypqq4cRh80mu4GcWg7LhW6Bf2ETOIm6davpvSogTUl/5DC
   vQVwOyqfIC+PhQNXPTY3EEDUgFEf2bElag3i84uX5evICBVc6itRYUrcA
   /cYG799tXIFODtJpA3Y5n7UUk4NiUFNziyLYCNxyiqVCE9QaqKC4npLMP
   ibptfC3loeIu4x8TtXj/F2kg6njYY3ObuMqFVf1BpflsyDCm3idU7UBAW
   Q==;
X-CSE-ConnectionGUID: z6uLn/9/Q9mSVIslDoR0dw==
X-CSE-MsgGUID: KWj5tPB5Tgyrk92rH/te4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="50334657"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="50334657"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 08:46:10 -0700
X-CSE-ConnectionGUID: siLQbbm/TNKYjkxHMyULWw==
X-CSE-MsgGUID: +sFmfeI/S9KSy6wMKOp5og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="81102529"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 09 Oct 2024 08:46:08 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 4/4] usb: typec: ucsi: Add support for the partner USB Modes
Date: Wed,  9 Oct 2024 18:45:57 +0300
Message-ID: <20241009154557.2836656-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009154557.2836656-1-heikki.krogerus@linux.intel.com>
References: <20241009154557.2836656-1-heikki.krogerus@linux.intel.com>
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
 drivers/usb/typec/ucsi/ucsi.c | 8 ++++++++
 drivers/usb/typec/ucsi/ucsi.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 13c739d334c4..804f7f9b35ea 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1057,6 +1057,14 @@ static int ucsi_register_partner(struct ucsi_connector *con)
 
 	con->partner = partner;
 
+	if (con->ucsi->version >= UCSI_VERSION_3_0)
+		if (UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
+		    UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN4)
+			typec_partner_set_usb_mode(partner, USB_MODE_USB4);
+	if (con->ucsi->version >= UCSI_VERSION_2_0)
+		if (UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
+		    UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN3)
+			typec_partner_set_usb_mode(partner, USB_MODE_USB4);
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


