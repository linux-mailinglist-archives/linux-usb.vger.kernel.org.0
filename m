Return-Path: <linux-usb+bounces-35080-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIr6MYImu2kcfwIAu9opvQ
	(envelope-from <linux-usb+bounces-35080-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 23:26:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB692C35B3
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 23:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEA253031B27
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 22:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE853372ED7;
	Wed, 18 Mar 2026 22:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/uZAkJi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC37372664
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 22:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773872766; cv=none; b=blsIF/IytDTf6EGjvRx69gbq+6qmL4N4VSHLf1Y5tSoaQIAtgCzAIU4g+3Wc34qZi2/pdFLBNsuoeyfJWIiWPjPI2alx4ZOteQzL4PYGcrGkJNExmGpw9Fd7w8tsVDS2FXTnvRynekUQ7njkhdktpWnMtWcnSH8lsNG1L96/yfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773872766; c=relaxed/simple;
	bh=nn1C/vkwRATUTXPf9w+9qzyhg42U0CLlVCzclYeWbog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ip+KZ/Uq8Uc2FkWPm6m5M+gH61N/TpIFsL3QBwA7SnCZcETfzBZl+evm0q5BU2uHy8INd+EoGEqTtFeV9zLwBPwTQWIR2fHzQi1uhIvKpq14DPjMWXs1TPevEaf1/5I0R4+d9SOt2pQzRMokKwNdRD6MGLnmPxgBaNVNfhvHiKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/uZAkJi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773872765; x=1805408765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nn1C/vkwRATUTXPf9w+9qzyhg42U0CLlVCzclYeWbog=;
  b=X/uZAkJiOiRVV2hwY6SxGXv0RYlD75jwFYqPkLnbTxwet5pSUpnPCif2
   aRzZbvZEkuuTb54nyEMVrZsZln8CILMGLwlu2rnYatqipa924dn0Mt5n0
   aoQu4ASmYE3dlwqk88XJpbiJr6jTNQw3qDTNV9MXT+Ep2xcTDgSHWrs/k
   E11jxhfmzcDYTFghMfPNrFQ6e0rYaTw70GrMERGgdEdE6/FnrcS1GCOYK
   AmUplKejgmqjROJeOnCB7ebZLBPtcqs3UxBqLE2QWb5QU0Gf5i3snVTs7
   F3AXIJI8fENT5uwMMV2J6xeY0sMOSb6IqYpWFFFErPPNylvrmiL66C/uD
   w==;
X-CSE-ConnectionGUID: qgD+TDE1QJC9c0L87njMJA==
X-CSE-MsgGUID: PjryXpM9T5i6bc8gna4hYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74637590"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="74637590"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 15:26:05 -0700
X-CSE-ConnectionGUID: X/Mh8cOzQkmmSCRxGzej8A==
X-CSE-MsgGUID: brNUwE5KSl6kvLOpvuSpig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="227467471"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2026 15:26:04 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	dmitry.baryshkov@oss.qualcomm.com,
	johan@kernel.org,
	asutosh.pathak@intel.com,
	Pooja Katiyar <pooja.katiyar@intel.com>
Subject: [PATCH 3/3] usb: typec: ucsi: Add support for SET_PDOS command
Date: Wed, 18 Mar 2026 15:25:31 -0700
Message-ID: <094d91e68592804d4851c6fec1aecc86df785587.1773090896.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773090896.git.pooja.katiyar@intel.com>
References: <cover.1773090896.git.pooja.katiyar@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35080-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pooja.katiyar@intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.986];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8BB692C35B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for UCSI SET_PDOS command as per UCSI specification v2.1 and
above to debugfs.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
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


