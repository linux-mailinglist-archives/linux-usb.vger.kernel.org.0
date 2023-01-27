Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBA4367E525
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jan 2023 13:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233317AbjA0M2N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Jan 2023 07:28:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231945AbjA0M1q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Jan 2023 07:27:46 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3B73C15
        for <linux-usb@vger.kernel.org>; Fri, 27 Jan 2023 04:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674822434; x=1706358434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=c9TnFmcvkj3GpSPv1RtyqYRP6siRp+zFEx1vQtlh39A=;
  b=R9CV+AKNn9qxnVXsTebM3JzI6PeD7a+ZGfVJHzgfE3obD2SWIhutAsUi
   TxlyQWBfh/1jxzXlO8k+FyaYHqJBrsTRqzBlCelHuYPyWUKHJBLZw9Lcu
   bMcREG/bg5r3t91undK196fL5Hedu0qtz/dM8bU9E+9JhfHj4CNrZg7Jf
   /5yCMz3yy7K5EwMniHjKZpKxP66KP+YhyGbR8ySkqve39N3d+56N2V6Jd
   8FjkZEVL8xeaw3pd9KXOi8/TmnSZIQgWCOKlxtFbXh6ptpVf4c/Zxb8h+
   CHpzzd+YWW7qWNW+TZsIPC90RA/0x/rBQvsnnu2xWJgLxi0HXRhU3IfPZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="328363160"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; 
   d="scan'208";a="328363160"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 04:27:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="771565837"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; 
   d="scan'208";a="771565837"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2023 04:27:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 43797152; Fri, 27 Jan 2023 14:27:49 +0200 (EET)
Date:   Fri, 27 Jan 2023 14:27:49 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y9PDRYHHYNSJWwGe@black.fi.intel.com>
References: <057da4af-9507-fdc6-9588-160a88210674@gmx.at>
 <Y7wNnrlEWMOV4Cj/@black.fi.intel.com>
 <0f862f75-9805-f5d0-ef89-0b77d0ae8778@gmx.at>
 <Y72AbwKFd9snjZrJ@black.fi.intel.com>
 <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
 <Y76TS54PJpmseZs3@black.fi.intel.com>
 <8c2da730-ba9b-6ec7-d493-1a6a2ce54622@gmx.at>
 <Y8kXFFrue7l7DKf3@black.fi.intel.com>
 <78c5218a-67ef-d61d-09fe-2c2cf7fdc87f@gmx.at>
 <0c9e644e-a07d-e9bb-f8d6-692d2412fd30@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c9e644e-a07d-e9bb-f8d6-692d2412fd30@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, Jan 27, 2023 at 01:07:43PM +0100, Christian Schaubschläger wrote:
> Hi Mika,
> 
> >>> Previously you said you'd talk with your Windows folks about this; any
> >>> news from there?
> >> I've talked to them and still in talks with the UEFI folks but the
> >> current undestanding is that Windows does not do anything special when
> >> the system is rebooted (so equal to what Linux does). There is one
> >> "development" system in Israel lab that should be pretty similar to what
> >> the HP system of yours is but the person who was going to try to
> >> reproduce is in sick leave now.
> > Ok...
> I was just wondering if there are already any news from your lab in
> Israel with the similar HP system. And if the issue can be reproduced
> there...

Yeah, I just got report from the folks and unfortunately we were not
able to reproduce the issue in the lab. The PCIe tunnel stays up (or
gets re-created) after reboot from Linux and is visible in the UEFI
shell (so in the BIOS).

So at the moment I'm out of ideas why this happens since Windows flows
should be the same. And we have no means to repro it locally to
investigate further :/

> Another thought of mine was, if it wouldn't it be useful to have a kernel commandline switch (or thunderbolt module option) that allows the user to select whether the software connection manager should be used, or the firmware connection manager (if avialable)? I understand that in general using the sw connection manager is favorable because the OS then has control over the connection, but maybe there are use cases where letting the firmware doing the job is just fine (like in my case ;-)

Right, we may add one but I think it should be part of the USB4 _OSC
negotiation like the below patch (acpi.native_usb4_disable=1 in the
command line should switch to FW CM). We could also make it "automatic"
by adding a DMI quirks table that then sets this.

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 0c05ccde1f7a..7da4d56fb936 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -296,6 +296,9 @@ EXPORT_SYMBOL_GPL(osc_cpc_flexible_adr_space_confirmed);
 /*
  * ACPI 6.4 Operating System Capabilities for USB.
  */
+bool native_usb4_disable;
+module_param(native_usb4_disable, bool, 0644);
+
 bool osc_sb_native_usb4_support_confirmed;
 EXPORT_SYMBOL_GPL(osc_sb_native_usb4_support_confirmed);
 
@@ -344,7 +347,7 @@ static void acpi_bus_osc_negotiate_platform_control(void)
 	if (IS_ENABLED(CONFIG_SCHED_MC_PRIO))
 		capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_CPC_DIVERSE_HIGH_SUPPORT;
 
-	if (IS_ENABLED(CONFIG_USB4))
+	if (IS_ENABLED(CONFIG_USB4) && !native_usb4_disable)
 		capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_NATIVE_USB4_SUPPORT;
 
 	if (!ghes_disable)
