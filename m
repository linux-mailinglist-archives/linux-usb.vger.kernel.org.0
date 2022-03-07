Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E77724D01C7
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 15:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243378AbiCGOuY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 09:50:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240377AbiCGOuU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 09:50:20 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702728595F
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 06:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646664565; x=1678200565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YnJc8PJVcXC5ezDzv5t1TmRTEjbIAJ3VsMxrPt65XtQ=;
  b=LSiYfM8RLJya01+JEIGKtvDnjjk0IRFma6OuYatAPlc7WVLp5p/69WCR
   PK3EHzetbjPjufUbXDfL3MeC8fuJgnAa04iguvX7J/tzQ28AcnQCUpMft
   k72LOBp7O00J7+E17qeLlawC38EqZffOOKhURIU2b4UALEr3OzCa3OoZP
   Wq0gCp1AldnP0uTVR4/0YnOrQvV9EZrLV14EQs6955QkFT9c7CK7d3WTM
   oUMJcG+R75YSviVus2f4PWwvgg0G9P6w5bHZr8nsYiZbY94m3V4bFlSd1
   V2nVARGHxmt1gyLPPbqerTyGG+H+5uHx6LJE9oZNXAof9TuorTavaHdCY
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="235014529"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; 
   d="scan'208";a="235014529"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2022 06:49:25 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; 
   d="scan'208";a="495082040"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2022 06:49:21 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 07 Mar 2022 16:46:43 +0200
Date:   Mon, 7 Mar 2022 16:46:43 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <sanmehta@amd.com>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        Basavaraj.Natikar@amd.com, mario.limonciello@amd.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: handle runtime pm for tunnelled pci root
 port
Message-ID: <YiYa0wCfGi39D8t5@lahna>
References: <1646658319-59532-1-git-send-email-Sanju.Mehta@amd.com>
 <YiYKBe7ogL5uacWt@lahna>
 <ade3f693-118b-369d-8dcb-8cc9c78fa39c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ade3f693-118b-369d-8dcb-8cc9c78fa39c@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Mar 07, 2022 at 08:00:46PM +0530, Sanjay R Mehta wrote:
> 
> 
> On 3/7/2022 7:05 PM, Mika Westerberg wrote:
> > Hi Sanjay,
> > 
> > On Mon, Mar 07, 2022 at 07:05:19AM -0600, Sanjay R Mehta wrote:
> >> From: Sanjay R Mehta <sanju.mehta@amd.com>
> >>
> >> Carry out runtime-resume of PCI tunnelled root port to handle
> >> hotplug interrupts synchronously.
> > 
> > What problem does this solve?
> > 
> > Typically the root ports should be able to wake from D3 when the PCIe
> > tunnel gets established. Is it not the case here?
> 
> Yes Mika, its not waking from D3 in this case on our hardware.
> 
> Hence I have kept a check to execute this code only if root port still
> in D3 after PCIe tunnel is setup.

OK, I see.

> Do you think should this patch go as a quirk?

I think in that case we should prevent the port from entering D3.  Does
it have the ACPI "HotPlugSupportInD3" property:

  https://docs.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#identifying-pcie-root-ports-supporting-hot-plug-in-d3

If yes, then simply removing that should work.
