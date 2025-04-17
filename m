Return-Path: <linux-usb+bounces-23181-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B470A9173D
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 11:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8059178ED7
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 09:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B51D228CB5;
	Thu, 17 Apr 2025 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4glTUPf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F29C199E9A
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880673; cv=none; b=nMxYo1kPYvlH1zPgyzzFVYDYdfLqwVxaLLS+Yig+eScT1LmdqRnaukkzZCjBcMr2/jPpfwijHZ93GvO6PubO50VEosMfNn/7yMKXuD03nqxAYI7ZUuZpOOpudD0shMZIL8xh6JSUmmDnvP5pGB8uBImy03NULz1RGR2HvifVEG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880673; c=relaxed/simple;
	bh=6KrJ7W2cRxSJR2K+OvRI3JtZW+2jWadpO5qaoyPi6TI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SUW9fG/Cj8oBiUHSwru/lPTd6MCQSMwVKYAmZy+dWOkEiAyhDuh4BIc9BPAXBp8CQXiHs8cHX4RFcb8vUa1jaehCrD0XFpIZxZFznYaM6RhmKoVT74NMR9HhEyEiNAnQgmkJHDvpEI2xuZMLCmRTeJ+pC0TQzKPrQ/CHHAQkRhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4glTUPf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744880672; x=1776416672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6KrJ7W2cRxSJR2K+OvRI3JtZW+2jWadpO5qaoyPi6TI=;
  b=e4glTUPfk99FyiyYpMmD7HVMhuYP9q0y8z3HH699kLNuiHvd34GD+UUQ
   cMuJctjCmF3BzeFEO8+ogs6L2gfOCScjLr8hGC+dEb0D5eu46zNkdRlpM
   2lQHxuX24AAWixcRoVFpt7DrH9zuOwtmfM4VTqbg0na3hKQqG0b1q1OLP
   zYe8s2DwINFAFxG+UhNtTSwKvHAWMUAJqzqXPQqdGJRH7mXNywvwzA0Ub
   1SpgaP90C/nQFhcM/OKV4LRXsEuJSB9ZSFDcAOSRZXluCsOWM9imLYW2s
   Hnh40Qw17RiAs/XKEheFp6MsxmzsWZ4MTXjQln0jIFwOEPmzhyObhmmzW
   Q==;
X-CSE-ConnectionGUID: 9+YB56FyTRC1PuPIpca4MA==
X-CSE-MsgGUID: knME+Vp4QAq+PMAyjqZvOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45692739"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="45692739"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 02:04:30 -0700
X-CSE-ConnectionGUID: JbayzdDZTraDW3wJHGiO4Q==
X-CSE-MsgGUID: FpxGsblJTK+biy9ZtcgDfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131287404"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 17 Apr 2025 02:04:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id F405A74E; Thu, 17 Apr 2025 12:04:26 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 1/4] thunderbolt: Introduce domain event message handler
Date: Thu, 17 Apr 2025 12:04:23 +0300
Message-ID: <20250417090426.221773-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250417090426.221773-1-mika.westerberg@linux.intel.com>
References: <20250417090426.221773-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

This patch introduces a function that can be used to send uevent
notifications in the domain to userspace. For instance, it can indicate
that a DisplayPort tunnel could not be established due to insufficient
bandwidth. Userspace can then forward to user via dialog or similar.

Convert boot_acl_store() to call this instead of open-coding.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/domain.c |  2 +-
 drivers/thunderbolt/tb.h     | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 144d0232a70c..a3a7c8059eee 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -217,7 +217,7 @@ static ssize_t boot_acl_store(struct device *dev, struct device_attribute *attr,
 	ret = tb->cm_ops->set_boot_acl(tb, acl, tb->nboot_acl);
 	if (!ret) {
 		/* Notify userspace about the change */
-		kobject_uevent(&tb->dev.kobj, KOBJ_CHANGE);
+		tb_domain_event(tb, NULL);
 	}
 	mutex_unlock(&tb->lock);
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index b54147a1ba87..5869b379e4f7 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -804,6 +804,19 @@ static inline void tb_domain_put(struct tb *tb)
 	put_device(&tb->dev);
 }
 
+/**
+ * tb_domain_event() - Notify userspace about an event in domain
+ * @tb: Domain where event occurred
+ * @envp: Array of uevent environment strings (can be %NULL)
+ *
+ * This function provides a way to notify userspace about any events
+ * that take place in the domain.
+ */
+static inline void tb_domain_event(struct tb *tb, char *envp[])
+{
+	kobject_uevent_env(&tb->dev.kobj, KOBJ_CHANGE, envp);
+}
+
 struct tb_nvm *tb_nvm_alloc(struct device *dev);
 int tb_nvm_read_version(struct tb_nvm *nvm);
 int tb_nvm_validate(struct tb_nvm *nvm);
-- 
2.47.2


