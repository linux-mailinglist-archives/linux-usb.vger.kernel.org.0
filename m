Return-Path: <linux-usb+bounces-29674-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F727C0B824
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 00:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 19EF1349A15
	for <lists+linux-usb@lfdr.de>; Sun, 26 Oct 2025 23:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BEEE302143;
	Sun, 26 Oct 2025 23:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDoGoRlb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754662D97B7
	for <linux-usb@vger.kernel.org>; Sun, 26 Oct 2025 23:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761523164; cv=none; b=XIFJ7dscw0eYU09PkB/PzovwUQvF1KoP/4bCL/Wg/NwzNV1fjmCRS3A4EMvRl22tt1rAckHNbm0oQ4dKrh5wULFXi5x6Ef/wT3MvsnR0H5RBEvj008coQiHY9vt58+Tk6AP+JzPH6Yj/tXxP9yTwzs5Jy1FSF5VeRV/O03Wt0SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761523164; c=relaxed/simple;
	bh=agmwgX+MzuQ1iuIyZ0+VSn7RsRQdYRFDt598498CH18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c5Hh0Y7V70H+OpIMmUSyLzmnEt2GIr8aLwFR1OtU0XikS4jqN2eLBTVijkobsw8eMZeqoHqR6naRnGCq0yR5KFp33SVqawQXEnEXqNouhR5PClh+uBmoblLWopei1X0eBaSttKvHz3oPjVJ6zMC3ffgvK/gF/XriShXrgCyYjPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDoGoRlb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761523163; x=1793059163;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=agmwgX+MzuQ1iuIyZ0+VSn7RsRQdYRFDt598498CH18=;
  b=HDoGoRlbBIJK8JrqNAvi5kpEO1dwm0MNkyo/g9434a0pD+QyoMBE+Vz9
   81bptzG2RKymAjelXm3ijAMMv99RPwxLzphIjZmjql2nW8I3DMHoAXqbp
   PbRZgyIrWAMvfAFPvZB0OyMIPHSycM+GMTNAEz81gu2hyvw/gSjFr0Wx7
   U6D7Vh8CXPtouF9Ir1cSbh7jF1fY80hRNwX15eStC1LqqIbifY7PWa6Y5
   nLanKZrgxsKaAd+2/qTn7XJuAmnS9ZlykcD9z/QIADcduzYzPFGcQB5q3
   0oC1MO7cLy2XU2yWwkJEKhkI6PeMC5CN+QGWaVZBQ66P5Lvqk227vU8IL
   g==;
X-CSE-ConnectionGUID: rLpeDeSFR+ySynmp3KLLjA==
X-CSE-MsgGUID: ZyT3gPWBR4y3zIfxnPvl7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63495456"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="63495456"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 16:59:23 -0700
X-CSE-ConnectionGUID: UcHwXZFkTc6nGmnz0j4NvQ==
X-CSE-MsgGUID: 7lsJd/kfRh6v0lnL6+i9xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="215550909"
Received: from clke15vm100.fm.intel.com (HELO clke15vm100.amr.corp.intel.com) ([10.80.46.91])
  by orviesa002.jf.intel.com with ESMTP; 26 Oct 2025 16:59:22 -0700
From: Venkat Jayaraman <venkat.jayaraman@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	pse.type-c.linux@intel.com,
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Subject: [PATCH] usb: typec: ucsi: Add SET_POWER_LEVEL UCSI command to debugfs
Date: Sun, 26 Oct 2025 16:58:30 -0700
Message-ID: <20251026235830.936477-1-venkat.jayaraman@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SET_POWER_LEVEL to list of commands supported by UCSI debugfs.

Signed-off-by: Venkat Jayaraman <venkat.jayaraman@intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/debugfs.c | 1 +
 drivers/usb/typec/ucsi/ucsi.h    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index f73f2b54554e..f3684ab787fe 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -35,6 +35,7 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_SET_SINK_PATH:
 	case UCSI_SET_NEW_CAM:
 	case UCSI_SET_USB:
+	case UCSI_SET_POWER_LEVEL:
 	case UCSI_READ_POWER_LEVEL:
 		ret = ucsi_send_command(ucsi, val, NULL, 0);
 		break;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index e301d9012936..66c4d4122ef5 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -127,6 +127,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_GET_CONNECTOR_STATUS		0x12
 #define UCSI_GET_CONNECTOR_STATUS_SIZE		152
 #define UCSI_GET_ERROR_STATUS			0x13
+#define UCSI_SET_POWER_LEVEL			0x14
 #define UCSI_GET_ATTENTION_VDO			0x16
 #define UCSI_GET_PD_MESSAGE			0x15
 #define UCSI_GET_CAM_CS			0x18
-- 
2.43.0


