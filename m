Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51163656BBE
	for <lists+linux-usb@lfdr.de>; Tue, 27 Dec 2022 15:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiL0O20 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Dec 2022 09:28:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiL0O2Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Dec 2022 09:28:24 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B6C26DF
        for <linux-usb@vger.kernel.org>; Tue, 27 Dec 2022 06:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672151301; x=1703687301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=s8h1N9I+PVIOwNYieIlB2VY3KZKNz/TtQtJ9FyJ22pE=;
  b=MdqXD7Dd1eLp66LnOkS2d6fYK5BICXPgDmVQGxAt8GtFLqCsi2Ua1bTW
   KPFoN89+ezOnyswDq+cO8McnMyaBLPo/63S354gAtBIvw+nFGtKOq+NyZ
   cY0J6IiZC/twITKejj01K9OiYyoWfpxyckIo3EK3Xg5rEhc0C5+XtG3BG
   JuZ8RTnzw9F0oHtFZPqw7t6UX9YeWvL72Y6AInUOeHxOsEHBxL/0g3dyM
   emycBXFUjiuTNy9M6te1OtJBQahiMO99BgFSAK0lKtidw9OBEEKF3X4bv
   cA5HA+q1a1h6N2zI4piCzWb2o77mn0G5ejt8j9a4ebn2mwSgN9dOdfYbn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="318384521"
X-IronPort-AV: E=Sophos;i="5.96,278,1665471600"; 
   d="scan'208";a="318384521"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2022 06:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="898364934"
X-IronPort-AV: E=Sophos;i="5.96,278,1665471600"; 
   d="scan'208";a="898364934"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 27 Dec 2022 06:28:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 7AF1CF8; Tue, 27 Dec 2022 16:28:51 +0200 (EET)
Date:   Tue, 27 Dec 2022 16:28:51 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y6sBI+xrkQaWtQxo@black.fi.intel.com>
References: <b556f5ed-5ee8-9990-9910-afd60db93310@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b556f5ed-5ee8-9990-9910-afd60db93310@gmx.at>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, Dec 23, 2022 at 12:24:35PM +0100, Christian Schaubschläger wrote:
> Hello list,
> 
> I'm having an issue which I guess might be related to thunderbolt 4.
> 
> I have an HP EliteBook 630 G9 notebook and an HP Thunderbolt Dock G4, both with Thunderbolt 4. I run linux on it and need a working network interface (the one on the dock) in the UEFI firmware for PXE boot.
> 
> When I come from a cold boot, the thunderbolt connection works well both in the UEFI firmware (I can do PXE), and also later in linux. After a reboot from linux, the dock disappears from the PCI bus and is no longer accessible in the UEFI firmware. Hence a PXE boot is not possible. When I then boot into linux again, the dock is there again, working just fine.
> 
> On my machine the thunderbolt controller has the PCI address 0000.00.0d.2, and the PCI bridge to the dock has the address 0000.00.07.0.
> I've attached the PCI config spaces of these two devices as they are seen from the UEFI firmeware from two different states:
> 
>  1. When the machine comes from a cold boot. In that state the UEFI firmware sees the dock and all devices on the dock.
>  2. When the machine comes from a linux reboot. In that state the dock is not visible on the PCI bus.
> 
> The config spaces of the mentioned two devices are different in the two states.
> 
> Note: once the machine is in state 2, it is necessary to remove the power supply from the dock (or physically disconnect and re-connect the thunderbolt cable) in order to get it working in UEFI again. That's what "cold boot" above actually means.
> 
> Also, when the machine is in state 2 and boots into Windows the dock does not not become visible on the PCI bus. Interestingly, after a subsequent reboot from Windows it does become avialable in UEFI again (no need to disconnect the power supply or thunderbolt cable in this case!!)
> 
> So I guess the linux kernel does something on shutdown (or misses to do something) that prevents the dock to wake up again after the reboot in the UEFI firmware.
> 
> I'm observing this on all kernels I've tried (5.18.x, 6.0.x, 6.1.x; also when I run a vanilla Ubuntu 22.04 this happens); the logs below are from a pre-release kernel from today (which will be 6.2-rc1 in a few days). I've also experimented with some powersaving related settings on the kernel command line, unfortunately without success.
> 
> Can anyone confirm this behaviour?

First of all can you check if you are running Intel or Microsoft driver
for the Thunderbolt controller? It can be seen in Device Manager
somehow. It is possible that Windows and Linux use different "connection
manager" so that explains why there is a difference in behaviour.

In case of Linux this is software connection manager so it is Linux that
does all the tunneling. In case of Windows it may be also firmware
connection manager so it is handled in the firmware (and this might
explain why it magically works after rebooting from Windows).

In general this depends on the BIOS setting whether there is PCIe tunnel
or not. Typically there is something like "boot from Thunderbolt" or
similar option that turns it on so I suggest checking if you have
such option.
