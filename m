Return-Path: <linux-usb+bounces-13551-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDD1954B8D
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 15:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68EBF1F23868
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 13:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2473D1BC090;
	Fri, 16 Aug 2024 13:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlmYYLR9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CE41B8E92
	for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2024 13:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723816750; cv=none; b=MPjstymH+bTbshpWYWDFXPPPq+63Sj8iIHNi8TPZxQTPxWjdvm4IiGV2fYzbNYBkNpv61CpMqn0dV8FEV7Wm+COlp/E/yT+EailbNGCK8dGH8LWrfZKBZOx/GCGJh9qtDVq2j9XAGUGQgWrc8dnFvb+zJ5Hd1vW1gpnGz23PMl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723816750; c=relaxed/simple;
	bh=9HP4kFHNBYXFjEvVrW2ypfLb5RsuJXENwWBXAo1/6m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uM0I1FbAnDRf5c+S+YWmD24NdDic6ySHF4IcoWlriUWHijSsumC//lHDS5CyCcuu4YMAizDpHjygMVAxGAhyZEVC8U3yAzddxu+hmqMLhXayUs4oKwES06IMnBlGkntnlR29YN/k9F9y9wHwOTPO7VdCg9vYJldExnlAWK8exFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlmYYLR9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723816749; x=1755352749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9HP4kFHNBYXFjEvVrW2ypfLb5RsuJXENwWBXAo1/6m8=;
  b=WlmYYLR9ffY1NtUKa65mhrYMsA9oGW1VJb+JjizcDiLRgYWR8/FkBql1
   CUX5saj705sl0YmLF555b2+BPVhVtxz5RNJZZvYgYtwmMcOnwOtoEfVrd
   DWegpHqiyk2jEB7HsN81V7tyZ5NbF7b7PeXFJKV2RDUTqnT9YTPUZOmRv
   NXuPs0IqD8wfyx0dU8czQuWnX+hLlOsxollLWp3YszNxL7+I33mvpNDx5
   LPFoku1nn3kubJvviG6cfmTarq4CEkxY1/005DnjyV9EbZQxHrgf3ZFP9
   u7JkjAOfbf3g9ijtU9f6BZ1ZDy2gsouHp8Wtp+o3ynWfIyWDuBsH8q4S2
   w==;
X-CSE-ConnectionGUID: 7nb35vBATmu7Pdg0qtK6AA==
X-CSE-MsgGUID: 9JIJ4wXzRUuISe+gQf+3cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21660075"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="21660075"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 06:59:09 -0700
X-CSE-ConnectionGUID: 6NUvuKhBSAC8O8NCwa9K1Q==
X-CSE-MsgGUID: bLxQW1FsSnu6XbUj2Dkyzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="97192397"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 16 Aug 2024 06:59:06 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org,
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@google.com>,
	Bartosz Szpila <bszpila@google.com>
Subject: [PATCH v2 2/6] usb: typec: ucsi: Don't truncate the reads
Date: Fri, 16 Aug 2024 16:58:55 +0300
Message-ID: <20240816135859.3499351-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816135859.3499351-1-heikki.krogerus@linux.intel.com>
References: <20240816135859.3499351-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

That may silently corrupt the data. Instead, failing attempts
to read more than the interface can handle.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 8 ++------
 drivers/usb/typec/ucsi/ucsi.h | 2 ++
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 4039851551c1..96ef099a6f84 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -99,12 +99,8 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 
 	*cci = 0;
 
-	/*
-	 * Below UCSI 2.0, MESSAGE_IN was limited to 16 bytes. Truncate the
-	 * reads here.
-	 */
-	if (ucsi->version <= UCSI_VERSION_1_2)
-		size = clamp(size, 0, 16);
+	if (size > UCSI_MAX_DATA_LENGTH(ucsi))
+		return -EINVAL;
 
 	ret = ucsi->ops->sync_control(ucsi, command);
 	if (ret)
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 7bc132b59027..5e3c6cb822c8 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -412,6 +412,8 @@ struct ucsi {
 #define UCSI_DELAY_DEVICE_PDOS	BIT(1)	/* Reading PDOs fails until the parter is in PD mode */
 };
 
+#define UCSI_MAX_DATA_LENGTH(u) (((u)->version < UCSI_VERSION_2_0) ? 0x10 : 0xff)
+
 #define UCSI_MAX_SVID		5
 #define UCSI_MAX_ALTMODES	(UCSI_MAX_SVID * 6)
 
-- 
2.43.0


