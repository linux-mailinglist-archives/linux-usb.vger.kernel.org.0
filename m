Return-Path: <linux-usb+bounces-11713-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 662BF9192C8
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 20:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9646C1C22C27
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 18:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD49190491;
	Wed, 26 Jun 2024 18:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mF1Hk+ZQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D217B14EC59
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 18:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719428326; cv=none; b=tY4u6xtR6NKRAj8gd/yX7sBobZw08te1UW5hQPqXLyb481+unvGFtxxzW/QK/6w4cV8ZqkXShyjsWSR/6t0kaFEFlyQarU1gL/8J2DnKVSDWqtdu2ZAASTijoEkWqgiFH8qDNq0sVgRF2/J5tNS6RKRul+M7jxuYXnGXwx/rh/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719428326; c=relaxed/simple;
	bh=n28KA+HQbVXS/qRWDF5ydPupt93Sok2KiTxf8FNHh4g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WBYBRsCn5jRF7YOpq18ZlKGxLcNexK5WxXasI2xGpj8HJA5MC8CRqjXKAT2fipFf7SPTLwpguIQAm+a0CRmQwqbA0uengCaLfGjpKJQ2TO4pN3tCGM2t7q3FCH0aERPnRdrgJS38eC4jKv0+MsyNCCZ4eglaMysbYJ4LfFRfebs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mF1Hk+ZQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719428325; x=1750964325;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n28KA+HQbVXS/qRWDF5ydPupt93Sok2KiTxf8FNHh4g=;
  b=mF1Hk+ZQZVAqeYnn6goSyWjdVAoC/hRPlNf4GTbIYiP8DoBP4rzZX2aE
   NWF3v04M7IzYMHIICvpjPJmYLscvHX6hBqIR6vxyba/ad8JvI+8dFEgaJ
   llRg0nVaFnEWUDFhYrB6bQxGed0ZtpNLExPeO/j/FLrcYxoPmmY6yf0qB
   rRvvuEnzrKcLJbDo1mdGpYC+D4s+nKwxJdnMWyuVgJq85nR7rTv+hq6Hh
   P7el1iXDdjc5/FYduVUVtKbAqkrhUVD/SdSEv1lLofuqdaZR6Dfp1agZL
   ryDFyybzwaS77x8q4inhST/v/bf+UlwWlGwW07J0qR8yuGW0O3N7aSBY0
   w==;
X-CSE-ConnectionGUID: PQ4cPu+rQDmMK+Tzp0wxsg==
X-CSE-MsgGUID: c8HMr6+qR7u+JpNBGt8WKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16343165"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="16343165"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 11:58:45 -0700
X-CSE-ConnectionGUID: lCTeyPlkRzWQYfFeSUTTfw==
X-CSE-MsgGUID: CEkPLU14SPenbuJE0TcPOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="43992784"
Received: from pooja-lin-vm.fm.intel.com ([10.80.128.159])
  by orviesa010.jf.intel.com with ESMTP; 26 Jun 2024 11:58:45 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH] usb: typec: ucsi: UCSI2.0 Get Error Status data structure changes
Date: Wed, 26 Jun 2024 11:58:53 -0700
Message-Id: <20240626185853.2956700-1-pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for UCSI 2.0 Get Error Status data structure changes
to add more error codes to the data structure.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
 drivers/usb/typec/ucsi/ucsi.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bd6ae92aa39e..35f6eaa0ff5f 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -123,6 +123,12 @@ static int ucsi_read_error(struct ucsi *ucsi)
 	case UCSI_ERROR_SWAP_REJECTED:
 		dev_warn(ucsi->dev, "Swap rejected\n");
 		break;
+	case UCSI_ERROR_REVERSE_CURRENT_PROTECTION:
+		dev_warn(ucsi->dev, "Reverse Current Protection detected\n");
+		break;
+	case UCSI_ERROR_SET_SINK_PATH_REJECTED:
+		dev_warn(ucsi->dev, "Set Sink Path rejected\n");
+		break;
 	case UCSI_ERROR_UNDEFINED:
 	default:
 		dev_err(ucsi->dev, "unknown error %u\n", error);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 0e7c92eb1b22..ff8217b53ca6 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -188,6 +188,8 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_ERROR_HARD_RESET			BIT(10)
 #define UCSI_ERROR_PPM_POLICY_CONFLICT		BIT(11)
 #define UCSI_ERROR_SWAP_REJECTED		BIT(12)
+#define UCSI_ERROR_REVERSE_CURRENT_PROTECTION	BIT(13)
+#define UCSI_ERROR_SET_SINK_PATH_REJECTED	BIT(14)
 
 #define UCSI_SET_NEW_CAM_ENTER(x)		(((x) >> 23) & 0x1)
 #define UCSI_SET_NEW_CAM_GET_AM(x)		(((x) >> 24) & 0xff)
-- 
2.34.1


