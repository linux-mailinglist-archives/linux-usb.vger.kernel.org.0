Return-Path: <linux-usb+bounces-37736-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAeVFF6vDGrdkwUAu9opvQ
	(envelope-from <linux-usb+bounces-37736-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:43:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 103CA583D1F
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1ED0301BA56
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE23369236;
	Tue, 19 May 2026 18:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RcZFmlJT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB29E36C0CF
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 18:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779216218; cv=none; b=jrM9PcnSug7g314bZn5EYp+wbXtkyBQOCUzjukmYYtpYD1i4iFpwLnX/iQwNIV9R1HMzdxRHxEBOqkFIVBtEcIL2qFsEcT1Lgh8s6J6OVO4ux4gsxVvLFEwqGeUMSG9puHzL4F4f5uT+rxoqQvRnzu4F/i7+O9iFSjn4sDTUGsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779216218; c=relaxed/simple;
	bh=OYD+G3JKh9xKEFU/1ziTQUOPFP8sCJAUzZ3VpPzzbqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mp4R1oQcfWvLJsa9GJwcl01/3sOSZ488R971nFCdQ29mDTeOOKmMnkG8T5t2Ys2gdrgkykuf1JbJSGd2elQ/isiYLF0meDkjRDDrhFoLFXJGwEJ7sz8JX+wco8qxWRDdKf80nZspYhjNCuxmnpWhhY55EfiOu+29muoln7LmqMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RcZFmlJT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779216217; x=1810752217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OYD+G3JKh9xKEFU/1ziTQUOPFP8sCJAUzZ3VpPzzbqQ=;
  b=RcZFmlJT4l293lHX5BO91RBg++0wZHssDaAPIrBDk6j4qw7QNFZvLE9E
   Q7Ej6lIlimr2KQNqWinTAkC70PX9T492su+50BDOUqSaYnh0pnyOe8jvR
   6b9tQpu3JJS3bsb5AguXfaEN/b6MZ8Oy8u9kDnGbx4pSFbr0+DMW4uVe0
   U9s6Hcmb3M7DhH6i+CYq7ziN3HLZCQuWlYOrz6zZLHOjzJzMJAyx7Zn+/
   8oz5jgjVRNGNnUZtIT4O9nBrOSc4nPA7nqLqvOFnULyihf4usl22ipWEi
   aIHINlG6huoULQlX1WfCbtDfTOQA22GoY1iHfaY4Mp+01jjuwXBdSHhG7
   w==;
X-CSE-ConnectionGUID: A9k1u4fdTT+3djAUswUX/A==
X-CSE-MsgGUID: Z1rIu6/SSiuYww/AvN9Rdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102783848"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="102783848"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 11:43:36 -0700
X-CSE-ConnectionGUID: hOpqcVe9QkWS8l8Vq2gmkQ==
X-CSE-MsgGUID: E1BsEOkkTeyd4cWbyh3CmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263633807"
Received: from pooja-nuc9i7qnx.fm.intel.com ([10.80.169.153])
  by fmviesa001.fm.intel.com with ESMTP; 19 May 2026 11:43:36 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	dmitry.baryshkov@oss.qualcomm.com,
	johan@kernel.org,
	asutosh.pathak@intel.com,
	heikki.krogerus@linux.intel.com,
	Pooja Katiyar <pooja.katiyar@intel.com>
Subject: [PATCH v8 3/3] usb: typec: ucsi: Add support for SET_PDOS command
Date: Tue, 19 May 2026 11:45:14 -0700
Message-ID: <e3e127122c0a6910c4840a13d5c74ab5fc4eb868.1778798352.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778798352.git.pooja.katiyar@intel.com>
References: <cover.1778798352.git.pooja.katiyar@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37736-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pooja.katiyar@intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 103CA583D1F
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
index 0558b4c39631..0e97bd060a63 100644
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


