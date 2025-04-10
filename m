Return-Path: <linux-usb+bounces-22903-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D447A843C6
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 14:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 054F817ABC9
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 12:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCC4285404;
	Thu, 10 Apr 2025 12:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ULJia8F1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82206269D0C
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744289766; cv=none; b=iQ9M1OMpFBZJFf64tfhvQJnyvHB/QKQuBy2A/Y4UCNwiWPH1fqC5AQ0sFScyhFtg6YWGF27gvqvVGdvgQ33IUwbdbGEimsGGw+52WWT0hvtVkcdnKL29NuTqZLC2CXr0bph2T9TtAzgWMyu+OxAVVZt7qYTTmCIownLnoOIKcy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744289766; c=relaxed/simple;
	bh=6KrJ7W2cRxSJR2K+OvRI3JtZW+2jWadpO5qaoyPi6TI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W0pI0gd2HklEgGPALRVdxUWQBxXmb8LD2Z11914slY7uFGwaV+D3CTgl7o7RsWarwN3tFb4FcjmzvhzysyCx4pxCGHR47Pe+4F+og/GW15OTsl/vj12aYWbEQEe0NuIEORXBX2ZRdlpfw8KVsFzfe0eXWd/B4CytRe0PTupu9gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ULJia8F1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744289765; x=1775825765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6KrJ7W2cRxSJR2K+OvRI3JtZW+2jWadpO5qaoyPi6TI=;
  b=ULJia8F1V8Z8c7DS1f23ej4hT5q1CrzdzLLZRRMlJR4zudJK4bIz+Kfv
   IHbIoEOF5jRHVkXmxY/xvjcVjPZtRHwl7pAa8eI8d5lOf/+qAB4ZidxLj
   0R+/krMLrL1TfJZYt8lRivQesyVIlw70VrY5ZyhlyNngx7y+kZgAh2GL4
   vYQ9XslQUtA1Z3hViDtLvcT/uNrGUOGOJBJ+tBjhS+igxaTqrWJ3dWOqt
   eLJNWTyAcIRM73ZvZZIhA+5owvMyJJ/oOJBdZk1SXkdbgokQ26DhJf/Gn
   qphTmZm7wGDBVaoTrChDFCpE1pp629ECC41TZrUQ3c9bxQ8TIa8vm7nw7
   w==;
X-CSE-ConnectionGUID: xaU/BgAaQRq1hM8pNfFY+A==
X-CSE-MsgGUID: Yw6jV+9+RfSGkOaRd6fShw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="48512296"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="48512296"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 05:56:04 -0700
X-CSE-ConnectionGUID: L3Ceb6cmSDaEtIhRgE/7CA==
X-CSE-MsgGUID: vMU0b1S0T0a+bP/VFQlT3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="159861908"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2025 05:56:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A5DBC162; Thu, 10 Apr 2025 15:56:00 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/3] thunderbolt: Introduce domain event message handler
Date: Thu, 10 Apr 2025 15:55:58 +0300
Message-ID: <20250410125600.3074417-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250410125600.3074417-1-mika.westerberg@linux.intel.com>
References: <20250410125600.3074417-1-mika.westerberg@linux.intel.com>
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


