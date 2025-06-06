Return-Path: <linux-usb+bounces-24533-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE65AACFACD
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jun 2025 03:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97BAA1788A2
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jun 2025 01:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D679A3B1A4;
	Fri,  6 Jun 2025 01:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuWOF7E8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB622BD1B
	for <linux-usb@vger.kernel.org>; Fri,  6 Jun 2025 01:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749173958; cv=none; b=PJJkSgbNxCW2AdWmGoeOod9TWZFku6qZwodLHQI52JoEQpYKoK5U4FIuGe6zaB5aEU5kZ/4Rh5vZlSEb+G7jdonUUXLolPdbIVK8HngPz6duc4GlPQnigYONShH6uFFL98yIOolg1CmpQag8YW+DXha+y3AwFZtUhYEm1dL3Ipg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749173958; c=relaxed/simple;
	bh=X7eTIIydb8GU+M8IQVbHYIpZuhQ8/Bh8hcb3Y6Z7HHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=diUyq3Cps60Suzm5ORfcqDV7bpg+azfUriFkVfW6tREKEeQqYOu2e2otSzslmsLuglY5rberAxlVdM/FpxnN8mDHOWLNGx6e3CXn8QaVztSg0zWlSJQwxpJuCV9lfYzejXYmXcWowl24NFmDZLgevUcLnXPXgzB1NtGrU0/05N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuWOF7E8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749173956; x=1780709956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X7eTIIydb8GU+M8IQVbHYIpZuhQ8/Bh8hcb3Y6Z7HHE=;
  b=GuWOF7E8VDXizxIBgVnCXBbfQxlRtvjmW2ApSnCiWx9GeaKoJX6xNxnd
   ZzUpfRTulhycmMvvAWki0jEMZH/eKNUncMbz7DxCJMGkh8cW7HK3rBf3Y
   DNuWIq5u4NUsQCeRFQU45qVhkIY+yw/kbS+bCKol9ABByoDyZnueekHdr
   udnmRS2Ms21vJe3gcIBtwLMPfFRUphuTJkMYw0STIWKwzjJnTk92y5r0c
   in/ImpnemAwA9rTtn7WWDrBwxjhbLeFfPnXKQbqrtpabWwmCEPHQhiURh
   78yk3etd3pfAVqTfunBOhRCacXSBz6lx21nyyhOuRUmZPoN4XSqdZtEPh
   g==;
X-CSE-ConnectionGUID: sk5G1bSiSwqq8S8YVZ5hfQ==
X-CSE-MsgGUID: OXncKAIsSUmyUtOk6Zfsxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38947594"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="38947594"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 18:39:16 -0700
X-CSE-ConnectionGUID: TYsWD+VUQVuumY0x9gQqSg==
X-CSE-MsgGUID: 8/iC2/DkRmypiCuFJrpE3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="146276896"
Received: from pooja-lin-vm.fm.intel.com ([10.80.128.159])
  by orviesa007.jf.intel.com with ESMTP; 05 Jun 2025 18:39:15 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH 3/3] usb: typec: ucsi: Add support for SET_PDOS command
Date: Thu,  5 Jun 2025 18:38:15 -0700
Message-Id: <72f048b49e5b9375a57ff69e47151ae19a05169f.1749142912.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1749142912.git.pooja.katiyar@intel.com>
References: <cover.1749142912.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for UCSI SET_PDOS command as per UCSI specification v2.1 and
above to debugfs.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
 drivers/usb/typec/ucsi/debugfs.c | 6 ++++++
 drivers/usb/typec/ucsi/ucsi.h    | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 004587ce3427..1c8003121d6e 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -36,6 +36,12 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_SET_NEW_CAM:
 		ret = ucsi_send_command(ucsi, val, NULL, 0);
 		break;
+	case UCSI_SET_PDOS:
+		ret = ucsi_send_message_out(ucsi, ucsi->debugfs->message_out,
+					    UCSI_COMMAND_DATA_LEN(val));
+		if (!ret)
+			ret = ucsi_send_command(ucsi, val, NULL, 0);
+		break;
 	case UCSI_GET_CAPABILITY:
 	case UCSI_GET_CONNECTOR_CAPABILITY:
 	case UCSI_GET_ALTERNATE_MODES:
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index e7453b055ff7..50341c40d80a 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -130,6 +130,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_GET_CAM_CS			0x18
 #define UCSI_SET_SINK_PATH			0x1c
 #define UCSI_GET_LPM_PPM_INFO			0x22
+#define UCSI_SET_PDOS				0x1d
 
 #define UCSI_CONNECTOR_NUMBER(_num_)		((u64)(_num_) << 16)
 #define UCSI_COMMAND(_cmd_)			((_cmd_) & 0xff)
@@ -204,6 +205,9 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define   UCSI_GET_PD_MESSAGE_TYPE_IDENTITY	4
 #define   UCSI_GET_PD_MESSAGE_TYPE_REVISION	5
 
+/* Data length bits */
+#define UCSI_COMMAND_DATA_LEN(_cmd_)		(((_cmd_) >> 8) & GENMASK(7, 0))
+
 /* -------------------------------------------------------------------------- */
 
 /* Error information returned by PPM in response to GET_ERROR_STATUS command. */
-- 
2.34.1


