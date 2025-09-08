Return-Path: <linux-usb+bounces-27723-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A55B4958D
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C7781C209AF
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B780030FC21;
	Mon,  8 Sep 2025 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdkjgcoO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA29830F94F
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349157; cv=none; b=nw02+Ao/IXCEfyb5I0BeNKY2V2ur38yR3I1XxWAQ2TXCqGnWuIwr7IjKFIJRdJXL3MHEgw3X20JImcCRKvI/lphUJs7tbCDD6ofBO5rwP43WDccifuC1WR9lNPMvJYj1fsJmwXUbcN41840b8yPcp866bZgMIwX31zANEGv073A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349157; c=relaxed/simple;
	bh=exwjebDi6DfkgVM/7Sl1dNi1W8E5IeORyo8K6bq74FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qzbe2Q6zq/r55AjHCseRMr8O3T3iciGJV4eTaZaeC0AXKU6YvWj+yg8xN1b4POiXHhodioLo+rtC7BxVNHEoCNFhd2TqzJVKNB9twB5RCmrNH0jR/1E6M0eV084H+vHOhdzv/piK44D3N0tpMd9VIfDZMx1d28/EGBCLlZd4GUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdkjgcoO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349156; x=1788885156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=exwjebDi6DfkgVM/7Sl1dNi1W8E5IeORyo8K6bq74FY=;
  b=cdkjgcoOGWYPoEJudAgYSD8Fp/C3nr9uluiIqmjU4ftJuf/G/5qFDQ+q
   AeVI73ErpxMV/mTMaSLX5YUxwnrCZ0eRSPqyUAHNVwip8CkzFDnMv1CAN
   Ab+BkSBzj9DiFJOACZh++UBbo1tJzK3bnVt0SGDfF4lZCw65pOEjWRqg+
   ILT/YjSAkhDxrcYwcPyIltI8nMlzfTkWwf43Tf33CcwIYOC0T7idHZjH7
   482TBaxqdJx0m7uC3kxwqAHOnM2LgNXJbspUSG/PO95tWWQTfuy+ncNIa
   I0nZm+hd2LUewVq1Ox5mWnTCRyc/F4D/WawhPyKgOzeY6vfzxgjgxwnRz
   A==;
X-CSE-ConnectionGUID: H7yPcsrjR7yDVU+tooZcMA==
X-CSE-MsgGUID: lpY9IXN+SgOgReenmu2J0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63252089"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="63252089"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:34 -0700
X-CSE-ConnectionGUID: x3wIWIGRShODOE31eZqNbA==
X-CSE-MsgGUID: owgZHFXoT4S8s6V5ybfRIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203622633"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2025 09:32:31 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C769A92; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 01/26] thunderbolt: Update acpi.c function documentation
Date: Mon,  8 Sep 2025 18:32:05 +0200
Message-ID: <20250908163230.2614397-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
References: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Make acpi.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/acpi.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/thunderbolt/acpi.c b/drivers/thunderbolt/acpi.c
index d2a0054217da..45d1415871b4 100644
--- a/drivers/thunderbolt/acpi.c
+++ b/drivers/thunderbolt/acpi.c
@@ -86,7 +86,7 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
  * @nhi ACPI node. For each reference a device link is added. The link
  * is automatically removed by the driver core.
  *
- * Returns %true if at least one link was created.
+ * Returns %true if at least one link was created, %false otherwise.
  */
 bool tb_acpi_add_links(struct tb_nhi *nhi)
 {
@@ -113,8 +113,10 @@ bool tb_acpi_add_links(struct tb_nhi *nhi)
 /**
  * tb_acpi_is_native() - Did the platform grant native TBT/USB4 control
  *
- * Returns %true if the platform granted OS native control over
- * TBT/USB4. In this case software based connection manager can be used,
+ * Return: %true if the platform granted OS native control over
+ * TBT/USB4, %false otherwise.
+ *
+ * When returned %true, software based connection manager can be used,
  * otherwise there is firmware based connection manager running.
  */
 bool tb_acpi_is_native(void)
@@ -126,8 +128,8 @@ bool tb_acpi_is_native(void)
 /**
  * tb_acpi_may_tunnel_usb3() - Is USB3 tunneling allowed by the platform
  *
- * When software based connection manager is used, this function
- * returns %true if platform allows native USB3 tunneling.
+ * Return: %true if software based connection manager is used and
+ * platform allows native USB 3.x tunneling, %false otherwise.
  */
 bool tb_acpi_may_tunnel_usb3(void)
 {
@@ -139,8 +141,8 @@ bool tb_acpi_may_tunnel_usb3(void)
 /**
  * tb_acpi_may_tunnel_dp() - Is DisplayPort tunneling allowed by the platform
  *
- * When software based connection manager is used, this function
- * returns %true if platform allows native DP tunneling.
+ * Return: %true if software based connection manager is used and
+ * platform allows native DP tunneling, %false otherwise.
  */
 bool tb_acpi_may_tunnel_dp(void)
 {
@@ -152,8 +154,8 @@ bool tb_acpi_may_tunnel_dp(void)
 /**
  * tb_acpi_may_tunnel_pcie() - Is PCIe tunneling allowed by the platform
  *
- * When software based connection manager is used, this function
- * returns %true if platform allows native PCIe tunneling.
+ * Return: %true if software based connection manager is used and
+ * platform allows native PCIe tunneling, %false otherwise.
  */
 bool tb_acpi_may_tunnel_pcie(void)
 {
@@ -165,8 +167,8 @@ bool tb_acpi_may_tunnel_pcie(void)
 /**
  * tb_acpi_is_xdomain_allowed() - Are XDomain connections allowed
  *
- * When software based connection manager is used, this function
- * returns %true if platform allows XDomain connections.
+ * Return: %true if software based connection manager is used and
+ * platform allows XDomain tunneling, %false otherwise.
  */
 bool tb_acpi_is_xdomain_allowed(void)
 {
@@ -256,7 +258,7 @@ static int tb_acpi_retimer_set_power(struct tb_port *port, bool power)
  *
  * This should only be called if the USB4/TBT link is not up.
  *
- * Returns %0 on success.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_acpi_power_on_retimers(struct tb_port *port)
 {
@@ -270,7 +272,7 @@ int tb_acpi_power_on_retimers(struct tb_port *port)
  * This is the opposite of tb_acpi_power_on_retimers(). After returning
  * successfully the normal operations with the @port can continue.
  *
- * Returns %0 on success.
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_acpi_power_off_retimers(struct tb_port *port)
 {
-- 
2.50.1


