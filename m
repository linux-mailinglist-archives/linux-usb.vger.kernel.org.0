Return-Path: <linux-usb+bounces-19422-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8EEA13E01
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 16:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA9243A5074
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 15:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849BA22CBF6;
	Thu, 16 Jan 2025 15:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HP3n5swv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9606D22C9E6;
	Thu, 16 Jan 2025 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737042089; cv=none; b=atohgMHDZ6fzoogjkXXqJp04okn8098336HbP972TcArSJnIJte5xgz4ib2VGFCbeI+OkwczJTz+eCl284jQdVYvr8+bO/t8p9iohioJxQjq4jB+aVwLRplBVf64TekzTsNrJ1z8xB/RKZVCFUAvgdWIugeqWX8OkEmrGFtg+ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737042089; c=relaxed/simple;
	bh=osHQYzjua21+AIKSk/AqrMNF9wYfNXjjR7TwFnQGk+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQwUNZlCoftRM527F07jVCat28EGFHjwnvZjFapkQ8aNiRpEo5XZWOL+otUl8vmj2zmZoFGtZMDLovIbCjgJK82lWLLH/oinL8xhb1SBrvMILggInPqD/utGxVjEYpL+rHZ66wdqAvfIbmjFD64SxKOaQ8Q11oG3oMFsXh//3f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HP3n5swv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737042088; x=1768578088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=osHQYzjua21+AIKSk/AqrMNF9wYfNXjjR7TwFnQGk+0=;
  b=HP3n5swv3iIQvHoZCV98cvLo9v42FkNtmYithYW61N4FzTEkD5s64+YZ
   B/AlPEHDlcXnUslK2YjBl+/FLmpbXrzPqfNTFb4+6w4lAgc4kFnRBqPH3
   OgUVeFan4wRUd+T92+YANzOr7leK2YuyopfPVRNOlRc7Z7ciLo9iJSETb
   SFo7kcfszsrWtpcciwaDTZ9MPjNvsXmNbsH9xW+zCy44p3ahywes1G4xB
   XrA5ZXLi9jBZw5hkmZJrdagBxRhT0ZKZReME0znLWwKt29t6JWVVPNnfo
   ugGHLFYg/g/Zk/KxiavzcQlLPfNxIVzM+QAwtJ4nl2rrxrcg7//Z4jNZ1
   Q==;
X-CSE-ConnectionGUID: EHHacd79SOuSHQGPUC0s5Q==
X-CSE-MsgGUID: 6azbyccmRC6jXW94O9Xicg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37554162"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37554162"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 07:41:24 -0800
X-CSE-ConnectionGUID: Ru4B9G88S3KvW5cjTn/B9Q==
X-CSE-MsgGUID: JvMqXoMcQnekibOvwI5RIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="110512093"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2025 07:41:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 289CE26D; Thu, 16 Jan 2025 17:41:19 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ferry Toth <fntoth@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] dt-bindings: usb: dwc3: Add a property to reserve endpoints
Date: Thu, 16 Jan 2025 17:40:46 +0200
Message-ID: <20250116154117.148915-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the endpoints may be reserved by hardware for different purposes,
e.g., tracing control and output. This is the case, for instance, on
Intel Merrifield and Moorefield platforms that reserve a few and USB driver
may not use them for the regular transfers. Add the respective bindings.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 1cd0ca90127d..2ae8e5e85f78 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -109,6 +109,16 @@ properties:
   resets:
     minItems: 1
 
+  snps,reserved-endpoints:
+    description:
+      Reserve endpoints for other needs, e.g, for tracing control and output.
+      When set, the driver will avoid using them for the regular USB transfers.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 30
+    items:
+      minimum: 2
+      maximum: 31
+
   snps,usb2-lpm-disable:
     description: Indicate if we don't want to enable USB2 HW LPM for host
       mode.
-- 
2.43.0.rc1.1336.g36b5255a03ac


