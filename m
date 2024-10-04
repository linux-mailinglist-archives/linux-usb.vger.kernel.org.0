Return-Path: <linux-usb+bounces-15720-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E030990543
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 16:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26E111C22A84
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 14:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887182139DA;
	Fri,  4 Oct 2024 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKvv2y5z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08782141B3
	for <linux-usb@vger.kernel.org>; Fri,  4 Oct 2024 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728050694; cv=none; b=UbwQk/oYQmoF5fsbmzmp2cffzTf/fI1/06OdTlmeQV3zfleEElgmSw4htrydBGDtIOTuZim3yzBy1NRNuQCSakxc+dWlM7/D6wGBNZwusxdehtTGSZWnGikZzHapFX5sFjQzX5OiWnK+dH3iLvXH+QzL5PDETUhvvsf4sWwJLxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728050694; c=relaxed/simple;
	bh=uJ9T2TRPSWMr+R9XPMYuGjQFcyjxUbgKKwIJEBBNeac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E142ajJsrLi+/hQ7tyrVloSi1Nsfb9tn5zz8Ylv7KbvJL1Tl/h6M3zeTB4fQEi9O9HAENxxW5qNA9CVQgnOZLdgunKnRo367dUTe8C6MkThsrG3pOCoT1Dn+hHscUtKH0rJNAdDbOBI5CW4ORwCHC/NcATEdE0Guk1+ke21He80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKvv2y5z; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728050693; x=1759586693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uJ9T2TRPSWMr+R9XPMYuGjQFcyjxUbgKKwIJEBBNeac=;
  b=IKvv2y5zswBGqMUQ19pS3ByrvONGsjGb1wDYX4fHZe/yMA+AbWq9DPaW
   Fe9FNCh+Gr+57/L9JFlQtWdAYrSO9M8Q1Y7dsZjrTFgXhKYDAtD7pTzEk
   /2HLEQ05qOT+cNJpP6DvGssnNWnAQoBKed0E9iW3gliGQ26F+7mJS6hws
   BLxxZIPYbKH5SLIuTMh5VXMnZ29s/tA9eAnkMhE2qdkvFQvWS28FTSAnk
   nhJnNCzJqxPGde8rJwNLP6Q8+aR8gMu+f8QXyOrdDjrXTRNNtLSWXKVon
   EnU7T6vn0/6gz/HFTu4OOddpY/GrGLFvvwa7EUzEbUfGImOX1Oah8Nnae
   w==;
X-CSE-ConnectionGUID: eNFo7J7RRPepfgLKg2M3Yg==
X-CSE-MsgGUID: 2FljdwtYRK6sNY6VV6cVbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="26780817"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="26780817"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 07:04:52 -0700
X-CSE-ConnectionGUID: GKn2xDl5Q8C7GNYTXMNtZA==
X-CSE-MsgGUID: GThclnhoTpWrO+opA5fUdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79144226"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 04 Oct 2024 07:04:50 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 4/4] usb: typec: ucsi: Add support for the partner USB Modes
Date: Fri,  4 Oct 2024 17:04:39 +0300
Message-ID: <20241004140440.1882311-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004140440.1882311-1-heikki.krogerus@linux.intel.com>
References: <20241004140440.1882311-1-heikki.krogerus@linux.intel.com>
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
index 13c739d334c4..b7f0cdc70250 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1037,6 +1037,7 @@ static int ucsi_register_partner(struct ucsi_connector *con)
 		desc.accessory = TYPEC_ACCESSORY_AUDIO;
 		break;
 	default:
+		desc.usb_capability = USB_CAPABILITY_USB2;
 		break;
 	}
 
@@ -1057,6 +1058,14 @@ static int ucsi_register_partner(struct ucsi_connector *con)
 
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
index f6a3287cdc06..189e45f37bae 100644
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


