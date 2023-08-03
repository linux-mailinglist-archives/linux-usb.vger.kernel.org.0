Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E55E76E512
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 11:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234000AbjHCJ4O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 05:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233311AbjHCJ4N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 05:56:13 -0400
Received: from mgamail.intel.com (unknown [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 626982D73
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 02:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691056571; x=1722592571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5GA3buoxYMUoy8vA9+UN0BiCJgej3+ooRgnHWIAKwXE=;
  b=OLwvhNjTUcMkRIwGyMz7Uv4ZjlOTfW1RzFm7Cje6l7KN6mWaDGL5yu9a
   sUGvZ8QzCqTWtdh+NdNDKJ8P+jgsXk7qxV8o6bVSsIYVEwemGDOEvePml
   ivNntcOdzxiF0sPPXXPklZJoVbRC+G2137V+6leMH0KKayDMoK788pZhv
   f+is+0K+ncQJFAxxr6g9FyyDuZMft7HWuFqwG+djN8MpRasyQVYqp1Yyf
   ZjiWNGoIEo0pcsL8IJrgpruq3tKL/JjKk0KNP3//0i4ul4sDhFX0tAOGg
   2iJc5oHCN1RAvXiWr2ZpXoEKfEhPlSvYkGvYY5019iWOMkPxs0eSU0+Or
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="400767719"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="400767719"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 02:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="764536630"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="764536630"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 03 Aug 2023 02:56:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 967322AB; Thu,  3 Aug 2023 12:56:18 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] Documentation/ABI: thunderbolt: Replace 01.org in contact
Date:   Thu,  3 Aug 2023 12:56:18 +0300
Message-Id: <20230803095618.56001-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230803095618.56001-1-mika.westerberg@linux.intel.com>
References: <20230803095618.56001-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The mailing list on 01.org does not work anymore and the whole site
redirects to intel.com Open Source page so replace the 01.org address
with my email address.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-thunderbolt         | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-thunderbolt b/Documentation/ABI/testing/sysfs-bus-thunderbolt
index 76ab3e1fe374..221b6c75ed93 100644
--- a/Documentation/ABI/testing/sysfs-bus-thunderbolt
+++ b/Documentation/ABI/testing/sysfs-bus-thunderbolt
@@ -1,7 +1,7 @@
 What:		/sys/bus/thunderbolt/devices/.../domainX/boot_acl
 Date:		Jun 2018
 KernelVersion:	4.17
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	Holds a comma separated list of device unique_ids that
 		are allowed to be connected automatically during system
 		startup (e.g boot devices). The list always contains
@@ -33,7 +33,7 @@ Description:	This attribute tells whether the system supports
 What:		/sys/bus/thunderbolt/devices/.../domainX/iommu_dma_protection
 Date:		Mar 2019
 KernelVersion:	4.21
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	This attribute tells whether the system uses IOMMU
 		for DMA protection. Value of 1 means IOMMU is used 0 means
 		it is not (DMA protection is solely based on Thunderbolt
@@ -42,7 +42,7 @@ Description:	This attribute tells whether the system uses IOMMU
 What:		/sys/bus/thunderbolt/devices/.../domainX/security
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	This attribute holds current Thunderbolt security level
 		set by the system BIOS. Possible values are:
 
@@ -64,7 +64,7 @@ Description:	This attribute holds current Thunderbolt security level
 What:		/sys/bus/thunderbolt/devices/.../authorized
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	This attribute is used to authorize Thunderbolt devices
 		after they have been connected. If the device is not
 		authorized, no PCIe devices are available to the system.
@@ -98,7 +98,7 @@ Description:	This attribute is used to authorize Thunderbolt devices
 What:		/sys/bus/thunderbolt/devices/.../boot
 Date:		Jun 2018
 KernelVersion:	4.17
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	This attribute contains 1 if Thunderbolt device was already
 		authorized on boot and 0 otherwise.
 
@@ -113,7 +113,7 @@ Description:	This attribute contains the generation of the Thunderbolt
 What:		/sys/bus/thunderbolt/devices/.../key
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	When a devices supports Thunderbolt secure connect it will
 		have this attribute. Writing 32 byte hex string changes
 		authorization to use the secure connection method instead.
@@ -123,14 +123,14 @@ Description:	When a devices supports Thunderbolt secure connect it will
 What:		/sys/bus/thunderbolt/devices/.../device
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	This attribute contains id of this device extracted from
 		the device DROM.
 
 What:		/sys/bus/thunderbolt/devices/.../device_name
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	This attribute contains name of this device extracted from
 		the device DROM.
 
@@ -172,21 +172,21 @@ Description:	This attribute reports number of TX lanes the device is
 What:		/sys/bus/thunderbolt/devices/.../vendor
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	This attribute contains vendor id of this device extracted
 		from the device DROM.
 
 What:		/sys/bus/thunderbolt/devices/.../vendor_name
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	This attribute contains vendor name of this device extracted
 		from the device DROM.
 
 What:		/sys/bus/thunderbolt/devices/.../unique_id
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	This attribute contains unique_id string of this device.
 		This is either read from hardware registers (UUID on
 		newer hardware) or based on UID from the device DROM.
@@ -195,7 +195,7 @@ Description:	This attribute contains unique_id string of this device.
 What:		/sys/bus/thunderbolt/devices/.../nvm_version
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	If the device has upgradeable firmware the version
 		number is available here. Format: %x.%x, major.minor.
 		If the device is in safe mode reading the file returns
@@ -204,7 +204,7 @@ Description:	If the device has upgradeable firmware the version
 What:		/sys/bus/thunderbolt/devices/.../nvm_authenticate
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	When new NVM image is written to the non-active NVM
 		area (through non_activeX NVMem device), the
 		authentication procedure is started by writing to
@@ -246,7 +246,7 @@ Description:	For supported devices, automatically authenticate the new Thunderbo
 What:		/sys/bus/thunderbolt/devices/<xdomain>.<service>/key
 Date:		Jan 2018
 KernelVersion:	4.15
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	This contains name of the property directory the XDomain
 		service exposes. This entry describes the protocol in
 		question. Following directories are already reserved by
@@ -261,35 +261,35 @@ Description:	This contains name of the property directory the XDomain
 What:		/sys/bus/thunderbolt/devices/<xdomain>.<service>/modalias
 Date:		Jan 2018
 KernelVersion:	4.15
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	Stores the same MODALIAS value emitted by uevent for
 		the XDomain service. Format: tbtsvc:kSpNvNrN
 
 What:		/sys/bus/thunderbolt/devices/<xdomain>.<service>/prtcid
 Date:		Jan 2018
 KernelVersion:	4.15
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	This contains XDomain protocol identifier the XDomain
 		service supports.
 
 What:		/sys/bus/thunderbolt/devices/<xdomain>.<service>/prtcvers
 Date:		Jan 2018
 KernelVersion:	4.15
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	This contains XDomain protocol version the XDomain
 		service supports.
 
 What:		/sys/bus/thunderbolt/devices/<xdomain>.<service>/prtcrevs
 Date:		Jan 2018
 KernelVersion:	4.15
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	This contains XDomain software version the XDomain
 		service supports.
 
 What:		/sys/bus/thunderbolt/devices/<xdomain>.<service>/prtcstns
 Date:		Jan 2018
 KernelVersion:	4.15
-Contact:	thunderbolt-software@lists.01.org
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
 Description:	This contains XDomain service specific settings as
 		bitmask. Format: %x
 
-- 
2.40.1

