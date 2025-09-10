Return-Path: <linux-usb+bounces-27845-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F48B50A88
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 03:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAE593AB89E
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 01:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079D4226D16;
	Wed, 10 Sep 2025 01:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ByELrb3p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1655F2248A3
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 01:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757469117; cv=none; b=Eqt3b9IWb8QARURw+G4pUTcRp9z92+uuyNvQOeIvS7siCi6FDZGixQhCFBXEWYWSLWN59clHFpdeM3zGjgSQnTFyYxFHXnEDfTcp0KZDu+slC0jjc3nfeYCfi/1OmMgVuNB/94FK1BFpgjh/YP4czqbG54kbMBVZovaUb1NYfDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757469117; c=relaxed/simple;
	bh=z9ZSKLkmxWSyzQEJ+4/TjWEiuxCKs2JSGUE7ujNSAuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uu1D3wtTPf3balJVDGBQgRqEB+fyx95icOrcgv3Dkeb4x1RaUAhn2NTkx9RzMsj6kPEH9KoxZZMJ9DepG9+V4JaefGVx8N65lbC3plPQq4NWkZfEbzj0cA3HxMu+wLJvc31RW9j1CgZNWLOc/KlnwPR+Ice9Ok6RUdlf9Y/tPhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ByELrb3p; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757469116; x=1789005116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z9ZSKLkmxWSyzQEJ+4/TjWEiuxCKs2JSGUE7ujNSAuk=;
  b=ByELrb3pTnV+I9ip8H25xnpPQoFPKHfYum3Xmjb0HlqUfNsBL1TMi1Is
   MmygvII8YiAOm2ilOiBP6+VA9s7D8xQNp2BpnXzywH9HhsUJposmRW+Vp
   sdO39uVQ8JpF35d11zc9MqhObbS9wTBq6vmGSBzmsVBZ11To8rMNM5MCY
   VPrZvQaso2t/anWG2pG3PKCLre7QkCsdFK/K8CdieYTqEVoHPWXCXZOyi
   EvLOUZotG38XV4dvJ5kdk/tcPVpVGU9BQaBwoDDSTg21WPXNkc9MSb6xJ
   8S7QYuEO/hS+MjEHHCA2e+tmPaXuNRbbktHNhX4fSJteFuzVhh2NC01xc
   g==;
X-CSE-ConnectionGUID: mNEonl4lQ56ipicDw2/jEg==
X-CSE-MsgGUID: bXC+xzoGRsGtfoPhlGZk5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59692230"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59692230"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 18:51:55 -0700
X-CSE-ConnectionGUID: O/F6Au4MSuiSxxiDCnW/IQ==
X-CSE-MsgGUID: UvcJB0oDTGqKxwJEX2YoRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="174039180"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2025 18:51:54 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	heikki.krogerus@linux.intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH v4 4/4] usb: typec: ucsi: Add support for SET_PDOS command
Date: Tue,  9 Sep 2025 18:52:07 -0700
Message-ID: <0b93319351439e9b4adcd9d3ae28c7bc252b7f03.1757374784.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757374784.git.pooja.katiyar@intel.com>
References: <cover.1757374784.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for UCSI SET_PDOS command as per UCSI specification
v2.1 and above to debugfs.

Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
Changelog v4:
- Fixed build errors reported by kernel test robot.
- Added changelogs.

Changelog v3:
- No changes.

Changelog v2:
- Send message_out data as part of ucsi_send_command.

 drivers/usb/typec/ucsi/debugfs.c | 1 +
 drivers/usb/typec/ucsi/ucsi.h    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 0693acf04c37..63a5fe791a82 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -36,6 +36,7 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_SET_NEW_CAM:
 	case UCSI_SET_USB:
 	case UCSI_READ_POWER_LEVEL:
+	case UCSI_SET_PDOS:
 		ucsi->message_in_size = 0;
 		ret = ucsi_send_command(ucsi, val);
 		break;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index e6ca70f7fa1f..bdbaaeb1d925 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -136,6 +136,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_GET_PD_MESSAGE			0x15
 #define UCSI_GET_CAM_CS			0x18
 #define UCSI_SET_SINK_PATH			0x1c
+#define UCSI_SET_PDOS				0x1d
 #define UCSI_READ_POWER_LEVEL			0x1e
 #define UCSI_SET_USB				0x21
 #define UCSI_GET_LPM_PPM_INFO			0x22
-- 
2.43.0


