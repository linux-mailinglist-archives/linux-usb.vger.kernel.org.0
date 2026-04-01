Return-Path: <linux-usb+bounces-35805-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIiiHdlszWnvdQYAu9opvQ
	(envelope-from <linux-usb+bounces-35805-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 21:07:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C93FE37FA31
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 21:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E6DB3034299
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 18:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED8B47DD56;
	Wed,  1 Apr 2026 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edIkuXRN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E744247DD4C
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 18:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775069938; cv=none; b=cBSlikls/Zok0Hi021+V3vYYwQgqOnw4UdC5i5MWvh6RkA58H37b7FmH7zKAVw3M1qmqvaVkl/V6I+Jz9KIkq/yn/NkekxlnzJ8APIclC1A6Qiuj4QG7rp+9Lk+HvTavX8PAYzGjzFsBWSrZgi7tX3rhYEGth9LbAs2RRyzftzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775069938; c=relaxed/simple;
	bh=sKujeDTzJuTCHtB3SVg6AfaM6uX0ZM+uSJZF8PLxqB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X0Yd4YLY9lkN+u93IwO+uQH84ZJrhwyhwJhSBr46G+SKrBzcuXV+AgT4Mpg8nBVEOT/qsHAYkQXLpTqvkzYyDWwJ0PTTr8B55hb8DdhLDKBCaQ8bLlrJStShY+wL74sWXPs3E3StjCZ6fOXCeNtu1FCLX3AM3aR6o6jUb1Cgbxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edIkuXRN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775069937; x=1806605937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sKujeDTzJuTCHtB3SVg6AfaM6uX0ZM+uSJZF8PLxqB8=;
  b=edIkuXRNhmmDLvD70MCCDW4oGyMKVT7CyzirLhjYRwSN7L44OcWMgEKV
   rbJQi4LwBKFtc1e3u3l1csMu70D/Ao5HDNCUQg9ahoUylvhk+AkxeyBHm
   GlV2serN8wiP6+RlHvdm6Tjk5ZsYbO9m2XdWERSrSAmHGSby6wuxBo+9F
   3ftkAqGyXD1Q23NpZzR71SsawDh0dGgJCqS1Ai2D2FEYEPx/XziKO2ROe
   JAUc7JPyWNm1LJHqqztdf2FDMhBlaUZq5moPz57MxuX7WWnvaW2ZCjqnZ
   iw1vxK73fydO2j9zoISRu2s6dtPhqphAd4omfNuxrt4Y73udSO053ILbD
   w==;
X-CSE-ConnectionGUID: oz/ScdqhS2OWFwAy2vDBRg==
X-CSE-MsgGUID: 69BZa+1GR8aNucpFSQIqig==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79975599"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="79975599"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 11:58:57 -0700
X-CSE-ConnectionGUID: 735xRQuPQLaY7RvFdPgHSg==
X-CSE-MsgGUID: 6j1vspbeQ8W9Lo9/cptGow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="226744466"
Received: from pooja-nuc9i7qnx.fm.intel.com ([10.80.169.153])
  by orviesa008.jf.intel.com with ESMTP; 01 Apr 2026 11:58:56 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	dmitry.baryshkov@oss.qualcomm.com,
	johan@kernel.org,
	asutosh.pathak@intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH v7 3/3] usb: typec: ucsi: Add support for SET_PDOS command
Date: Wed,  1 Apr 2026 12:00:44 -0700
Message-ID: <5bc7cbe0b40f1bf404ebd5ca7e8ce34323300bb8.1774994425.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774994425.git.pooja.katiyar@intel.com>
References: <cover.1774994425.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[pooja.katiyar@intel.com,linux-usb@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35805-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: C93FE37FA31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for UCSI SET_PDOS command as per UCSI specification v2.1 and
above to debugfs.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
Changelog v7:
- Added changelogs.

Changelog v6:
- Removed message_out field from UCSI structure and added it back
  to ucsi_debugfs_entry structure. 

Changelog v2:
- Send message_out data as part of ucsi_send_command.

 drivers/usb/typec/ucsi/debugfs.c | 5 +++++
 drivers/usb/typec/ucsi/ucsi.h    | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index be987e53a8bd..ff33a5e7c6b0 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -40,6 +40,11 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_READ_POWER_LEVEL:
 		ret = ucsi_send_command(ucsi, val, NULL, 0);
 		break;
+	case UCSI_SET_PDOS:
+		ret = ucsi_write_message_out_command(ucsi, val, NULL, 0,
+						     ucsi->debugfs->message_out,
+						     UCSI_COMMAND_DATA_LEN(val));
+		break;
 	case UCSI_GET_CAPABILITY:
 	case UCSI_GET_CONNECTOR_CAPABILITY:
 	case UCSI_GET_ALTERNATE_MODES:
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index e51a8472fc27..e1a14f043abf 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -138,6 +138,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_GET_PD_MESSAGE			0x15
 #define UCSI_GET_CAM_CS			0x18
 #define UCSI_SET_SINK_PATH			0x1c
+#define UCSI_SET_PDOS				0x1d
 #define UCSI_READ_POWER_LEVEL			0x1e
 #define UCSI_SET_USB				0x21
 #define UCSI_GET_LPM_PPM_INFO			0x22
@@ -215,6 +216,9 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define   UCSI_GET_PD_MESSAGE_TYPE_IDENTITY	4
 #define   UCSI_GET_PD_MESSAGE_TYPE_REVISION	5
 
+/* Data length bits */
+#define UCSI_COMMAND_DATA_LEN(_cmd_)           (((_cmd_) >> 8) & GENMASK(7, 0))
+
 /* -------------------------------------------------------------------------- */
 
 /* Error information returned by PPM in response to GET_ERROR_STATUS command. */
-- 
2.43.0


