Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C80376597E6
	for <lists+linux-usb@lfdr.de>; Fri, 30 Dec 2022 12:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234859AbiL3Lyp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Dec 2022 06:54:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiL3Lyo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Dec 2022 06:54:44 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C023A62F9
        for <linux-usb@vger.kernel.org>; Fri, 30 Dec 2022 03:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672401283; x=1703937283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pk09DT4LBV2+P4GS3To8QDzTKwLs5bV75eKCUbnNuOw=;
  b=HdFqDbfCX9GL5tk1qPqfP5QZ4YMLvp0CHjXnLBTMsFxISZs9av3CZvZE
   +gXeWdj6wPXal5yqXX2SOfegWXu3O7XprI0yasE3S7o4FCT3divjIF6kj
   Vy64KdHN9vbYw1HQHDhQjpEtoLSaLOHaHz3Lly/FjZ9EXUXlk3dTG6JM7
   nK61fyGEt69GEj/0mRDRwhD2bHVaInVL/n25zUhI0rK3RjGi466da0fng
   pSn310SDrXyN+ETb3Ln5ZLS1E9zU602acHBIg7Zm48zi5SJWaJvWQfa3X
   eJoUupG5zim9v7z1xi3YSSZwAssnQoGjcMp3BHgMGNgGgXPUCogyo5N5C
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="300888884"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; 
   d="scan'208";a="300888884"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2022 03:54:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="777944501"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; 
   d="scan'208";a="777944501"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 30 Dec 2022 03:54:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id A88EAF8; Fri, 30 Dec 2022 13:55:13 +0200 (EET)
Date:   Fri, 30 Dec 2022 13:55:13 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y67RoYvbRC6OgfOq@black.fi.intel.com>
References: <b556f5ed-5ee8-9990-9910-afd60db93310@gmx.at>
 <Y6sBI+xrkQaWtQxo@black.fi.intel.com>
 <588ed5c7-864f-46b5-d7d7-af6c32ca2c52@gmx.at>
 <Y66vWYdLLAOG81+f@black.fi.intel.com>
 <c334eb1f-1130-04d7-e7a6-cce9a90fd2e8@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c334eb1f-1130-04d7-e7a6-cce9a90fd2e8@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 30, 2022 at 12:38:27PM +0100, Christian Schaubschläger wrote:
> Ok, setting CONFIG_USB4=n makes everything work as expected! Even
> hotplugging the dock works fine.

Yes but things like power management does not.

> Now I've tried this: CONFIG_USB4=m and blacklist the thunderbolt
> module (because disabling CONFIG_USB4 in general is not an option for
> me (I guess?) There's probably hardware out there where the firmware
> doesn't set up the PCIe tunnels. Then I need the linux thunderbolt
> driver to do this I suppose).

You must have CONFIG_USB4=n because that makes the Linux ACPI core not
to negotiate software connection manager support. Blaclisting the
Thunderbolt driver does not do that as that code is always built-in.

> So with CONFIG_USB=m and blacklisting the thunderbolt module this
> happens: the tunnel is there before and after linux (PXE works), but
> in linux none of the devices that sit behind the PCIe tunnel (network,
> external display) are there... that's strange, because I would have
> expected that CONFIG_USB4=m + blacklist thunderbolt would be the same
> as CONFIG_USB4=n. Which obviously isn't the case. I've attached lspci
> output from either case.

See above.

> Is there any other option to decide at boottime whether or not to use
> the USB4 driver (besides using two different kernels)?

No but this is not the "final" solution - just an experiment.

Okay so we have this:

- When both Linux and Windows uses the same firmware connection manager
  all work.

- If you install Windows 11 (or whatever the fresh one is that actually
  supports USB4 and software connection manager) you end up in the
  exact same situation.

Can you try following:

1. Go back to CONFIG_USB4=m
2. Boot the system up
3. Check that the PCIe tunneling is up and things work as expected
4. Unplug the dock
5. Unload the Thunderbolt driver

  # rmmod thunderbolt

6. Plug the dock back
7. Soft reboot the system

Does this make the PXE boot see the connected device?
