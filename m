Return-Path: <linux-usb+bounces-23183-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2542BA9173E
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 11:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0C237ADBA9
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 09:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B474229B1F;
	Thu, 17 Apr 2025 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJx91+i4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A70622839A
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 09:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880674; cv=none; b=k8OSS4HpbW7AfRmZhlYbHc8MGVZ4K7QTsqwPKl1EaataKYotVRzxO+MyE1hbvVJv+nHR6EcmODx1pH2IvFwYxJ6LBn0DNuB16w3Vf9bBur9NDkFN7W/uWxAv89DYnpEA7bA3yyHTtCJNsd8bsdAtHfAu9ATj2e0uQUcCTft2bhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880674; c=relaxed/simple;
	bh=2RjpNy06yXPrE3hSRzUl9kgDDVd40NjZgyFWjNKOeZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bSHpe4IRLyMipenagvkiuluH+4gSelHT1JE8fst4PDReaP8M/37ps3xyxdlKN9I1TBYS0wqf/cnhb1WTk9pQbtxt/ADAZzGiU/NP/KDpvmiWKFyRtAUl9haNhHSR4IJl13+iebJiw+zR0lc8j/PI5+Kjf5vpLeFYahamUBNPwJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJx91+i4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744880673; x=1776416673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2RjpNy06yXPrE3hSRzUl9kgDDVd40NjZgyFWjNKOeZA=;
  b=iJx91+i47706Ci0gRcHDP5IlaW+lch31EVCv+GkJ7b2h7kzvxSRNqWpI
   1VP6wWuG3+bPAnESNyQoljJhBIIYkBxWYbYJba52YRVs5tqvS8Iuej7AB
   2/k8en6NXdRTBKaPBmkkyQY+9T2oc0DRlAyA3oqvbpZ1JzuzwMvobyAq0
   YxUYuSScwb37RVkUiRQn4omZ3bvLHMe3iYeWkkvGsPQ2hVK/jvzF5fh54
   Rdamd8PsBw5LGFmgNgyFLQ1IUSOSvEOuw3YWjoN03Cq6qe0Ia/GIPsHsm
   654Uti28aZIHvyDYWoeJbObF+ov27nrc0I37GrNbiWxVqC5cXWPZACFmt
   Q==;
X-CSE-ConnectionGUID: RnFJZfUWQeStWA/MfLNA0g==
X-CSE-MsgGUID: ge8vKT9TQ9GlBY4Q1Tq6Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50281229"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="50281229"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 02:04:30 -0700
X-CSE-ConnectionGUID: dzTIh8j6Sced7M7BbrySAw==
X-CSE-MsgGUID: U0lcJcAcTNi+a6D2+zJktA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131066818"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 17 Apr 2025 02:04:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 14269C0B; Thu, 17 Apr 2025 12:04:27 +0300 (EEST)
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
Subject: [PATCH v2 4/4] Documentation/admin-guide: Document Thunderbolt/USB4 tunneling events
Date: Thu, 17 Apr 2025 12:04:26 +0300
Message-ID: <20250417090426.221773-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250417090426.221773-1-mika.westerberg@linux.intel.com>
References: <20250417090426.221773-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Add documentation about the Thunderbolt/USB4 tunneling events to the
user’s and administrator’s guide.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 Documentation/admin-guide/thunderbolt.rst | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
index d0502691dfa1..f0368ab6bd1f 100644
--- a/Documentation/admin-guide/thunderbolt.rst
+++ b/Documentation/admin-guide/thunderbolt.rst
@@ -296,6 +296,39 @@ information is missing.
 To recover from this mode, one needs to flash a valid NVM image to the
 host controller in the same way it is done in the previous chapter.
 
+Tunneling events
+----------------
+The driver sends ``KOBJ_CHANGE`` events to userspace when there is a
+tunneling change in the ``thunderbolt_domain``. The notification carries
+following environment variables::
+
+  TUNNEL_EVENT=<EVENT>
+  TUNNEL_DETAILS=0:12 <-> 1:20 (USB3)
+
+Possible values for ``<EVENT>`` are:
+
+  activated
+    The tunnel was activated (created).
+
+  changed
+    There is a change in this tunnel. For example bandwidth allocation was
+    changed.
+
+  deactivated
+    The tunnel was torn down.
+
+  low bandwidth
+    The tunnel is not getting optimal bandwidth.
+
+  insufficient bandwidth
+    There is not enough bandwidth for the current tunnel requirements.
+
+The ``TUNNEL_DETAILS`` is only provided if the tunnel is known. For
+example, in case of Firmware Connection Manager this is missing or does
+not provide full tunnel information. In case of Software Connection Manager
+this includes full tunnel details. The format matches what the driver uses
+when logging.
+
 Networking over Thunderbolt cable
 ---------------------------------
 Thunderbolt technology allows software communication between two hosts
-- 
2.47.2


