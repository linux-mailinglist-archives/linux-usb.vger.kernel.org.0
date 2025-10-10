Return-Path: <linux-usb+bounces-29107-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D974BCBBED
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 07:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 968FF19E65E7
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 05:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E9E23D7D2;
	Fri, 10 Oct 2025 05:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c23bEtBR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EF51DFE26
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 05:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760075791; cv=none; b=b6SZRoKjzZef8lUUfYdOltg/XpU0pvB897JcS88MWd7kfa5x9ftP/9xIf2vzMEgodTGHi8apZzw3UXTZ4lnYMcUl4gM8B17kDcCygCmZPkl4Ek4R2RFfSsKwYaFnZ7f7WLuUMyh8ylj8zCb1tSX/9KsEEOE0DMUzkUoEq0RLsyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760075791; c=relaxed/simple;
	bh=a5SM+pn0217/UqDDjuAzKPiuUA+nufZcWrrpTY5Asw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rIH09q/8QAWy5ktNOOlHRTgfaBAMRfdC+cGYQv3jrJP7E6trcjrcV8GmBNosZxF5GiOYNwpLKvGzx8Au3rDoiD48SXinBJYpZ6/p50P6uvoUorUJiI5P8vRiA7qpUSEa9fZ6JK9py0b1wBTFOZlZfrjx3QhF98v536WEgNXGpwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c23bEtBR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760075789; x=1791611789;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a5SM+pn0217/UqDDjuAzKPiuUA+nufZcWrrpTY5Asw4=;
  b=c23bEtBR9Xn3Ui3jzqoPE49usQW1mriVJMHRNiARqZhYiklBZTuJI1x5
   HwScr+/HUNbQm6TO1TI3HuO7HphZ+rqWOOO0XkCrPjMGBN5d3880frf0w
   nH9g6PuQ8nQExDxbK7lywAOZf9doxz7hufYW7hh47H5cqJsdyJBXLYBEy
   qV7qInNYFwVVERS+FaCc6HwojNv+L48YMjLPTS/mQO70Ki9O9EWHS69/f
   /oa4ftnyGeWO/jLZg2IMktOghMBoDUr6gIYkqUbA7gG6+Hn6RHlDrGigJ
   aPbxSiwJh4zHo/NplI/sul0Q4sazUtYbDye0llU+whPkTSJHUWrtNT/lB
   g==;
X-CSE-ConnectionGUID: NIsqoVBHQZSUGNo6hGNpMQ==
X-CSE-MsgGUID: PkoUFvHaRLGDMjLR8NCxNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="84912361"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="84912361"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 22:56:29 -0700
X-CSE-ConnectionGUID: PA6BGF87QDOlEWX+rRWZPQ==
X-CSE-MsgGUID: U2FEjGM4R8yg7SWotoSqqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="180584669"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.98])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 22:56:27 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 41019121EAC;
	Fri, 10 Oct 2025 08:56:25 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1v7677-0000000HP2w-3Mpy;
	Fri, 10 Oct 2025 08:56:25 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH 1/2] usb: ljca: Order ACPI hardware IDs alphabetically
Date: Fri, 10 Oct 2025 08:56:24 +0300
Message-ID: <20251010055625.4147844-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver has three lists of ACPI hardware IDs, for GPIO, I²C and SPI.
Order them alphabetically.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/usb/misc/usb-ljca.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index c562630d862c..cf01cc727685 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -165,26 +165,26 @@ struct ljca_match_ids_walk_data {
 };
 
 static const struct acpi_device_id ljca_gpio_hids[] = {
+	{ "INTC100B" },
 	{ "INTC1074" },
 	{ "INTC1096" },
-	{ "INTC100B" },
-	{ "INTC10D1" },
 	{ "INTC10B5" },
+	{ "INTC10D1" },
 	{},
 };
 
 static const struct acpi_device_id ljca_i2c_hids[] = {
+	{ "INTC100C" },
 	{ "INTC1075" },
 	{ "INTC1097" },
-	{ "INTC100C" },
 	{ "INTC10D2" },
 	{},
 };
 
 static const struct acpi_device_id ljca_spi_hids[] = {
+	{ "INTC100D" },
 	{ "INTC1091" },
 	{ "INTC1098" },
-	{ "INTC100D" },
 	{ "INTC10D3" },
 	{},
 };
-- 
2.47.3


