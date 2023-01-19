Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFD1A673520
	for <lists+linux-usb@lfdr.de>; Thu, 19 Jan 2023 11:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjASKKF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Jan 2023 05:10:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbjASKJ5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Jan 2023 05:09:57 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FE5683E5
        for <linux-usb@vger.kernel.org>; Thu, 19 Jan 2023 02:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674122995; x=1705658995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8V4RXH3rQPJbuQiAmUptV7AVZ/8rOePHaHHaccPH28A=;
  b=EbhGWdo1KDL7Xm+FPEc0PI3yPokhCiWsBg8Jr67ujYbSkBZcFCg7HBFL
   KrPqh67HXPjGY23VuETMr/FMD9CNgSGgs6UyH/ok+CrkgLe8FEl+DvwHU
   k8AAV091tsXxD07gjetMSPhP47jObsLqs/qTNPRBTDyC25YQzp+a1Gebx
   mwRagEFYYqkYJm5fPHpafuyYi7oGRGdBCNt4Yk8kr9+yTMy3QN4YzZ0h8
   KTWOR72AAXtRJJdz0a5v/4C3GLmNFuHz23pfUzfBwuRx5oyDnltNyIQiR
   yMLMeYuU0d4vL8aDvlPkJ8yIcMXOMYLPaX2f85GGtp9ts+zymVrCdD2O5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="389744359"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="389744359"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 02:09:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="637638774"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="637638774"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 19 Jan 2023 02:09:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B46FF368; Thu, 19 Jan 2023 12:10:28 +0200 (EET)
Date:   Thu, 19 Jan 2023 12:10:28 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y8kXFFrue7l7DKf3@black.fi.intel.com>
References: <Y7RSrLYfG1r8b+Zj@black.fi.intel.com>
 <86a6b7ca-4302-00fe-97f6-d48ebb5e6171@gmx.at>
 <Y7UzCY6ujQ2qtoq5@black.fi.intel.com>
 <057da4af-9507-fdc6-9588-160a88210674@gmx.at>
 <Y7wNnrlEWMOV4Cj/@black.fi.intel.com>
 <0f862f75-9805-f5d0-ef89-0b77d0ae8778@gmx.at>
 <Y72AbwKFd9snjZrJ@black.fi.intel.com>
 <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
 <Y76TS54PJpmseZs3@black.fi.intel.com>
 <8c2da730-ba9b-6ec7-d493-1a6a2ce54622@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c2da730-ba9b-6ec7-d493-1a6a2ce54622@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Jan 19, 2023 at 10:41:26AM +0100, Christian Schaubschläger wrote:
> Hi Mika,
> 
> >> What I _did_ find out is this: if I disable ACPI on the kernel command
> >> line (acpi=off), things work fine. I can even boot with the dock
> >> unplugged, then plug it when linux is up, and it works in linux, and
> >> also after the reboot in the firmware!
> >>
> >> Of course switching off ACPI is not a real option... but maybe this
> >> brings some light into the dark...
> > It pretty much disables a lot of functionality so I don't think it helps
> > here, unfortunately.
> 
> I may have some more information on this issue, though I'm not sure if this will help... the thing is this:
> 
> this week I got a brandnew Lenovo Thinkpad Yoga X1 along with a Lenovo Thunderbolt 4 Workstation Dock, all thunderbolt 4. And at first it seemed to behave exactly like the HP combo; namely after booting Ubuntu 22.04 (which ships with a  5.15 kernel) the dock is gone in the firmware after the reboot, and subsequently later in Windows. Same behaviour with 5.18.9. And to my big surprise, with 5.18.11 the issue is gone! I've bisected it down to this commit:
> 
> 8beb71759cc8fddd937cadf9ec482e524d4f0f1c is the first fixed commit
> commit 8beb71759cc8fddd937cadf9ec482e524d4f0f1c
> Author: Pierre Gondois <pierre.gondois@arm.com>
> Date:   Wed May 18 11:08:58 2022 +0200
> 
>     ACPI: bus: Set CPPC _OSC bits for all and when CPPC_LIB is supported
>     
>     [ Upstream commit 72f2ecb7ece7c1d89758d4929d98e95d95fe7199 ]
>     
>     The _OSC method allows the OS and firmware to communicate about
>     supported features/capabitlities. It also allows the OS to take
>     control of some features.
>     
>     In ACPI 6.4, s6.2.11.2 Platform-Wide OSPM Capabilities, the CPPC
>     (resp. v2) bit should be set by the OS if it 'supports controlling
>     processor performance via the interfaces described in the _CPC
>     object'.
>     
>     The OS supports CPPC and parses the _CPC object only if
>     CONFIG_ACPI_CPPC_LIB is set. Replace the x86 specific
>     boot_cpu_has(X86_FEATURE_HWP) dynamic check with an arch
>     generic CONFIG_ACPI_CPPC_LIB build-time check.
>     
>     Note:
>     CONFIG_X86_INTEL_PSTATE selects CONFIG_ACPI_CPPC_LIB.
>     
>     Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
>     Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>     Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>     Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
>  drivers/acpi/bus.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> I've no idea why this solves the issue on the Lenovo, and obviously it doesn't solve it on the HP, but maybe this rings a bell somewhere? (Note: in my woking kernel config (on the Lenovo) I have neither CONFIG_X86_INTEL_PSTATE nor CONFIG_ACPI_CPPC_LIB set...)

Can you check if with this commit reverted does Thunderbolt use software
or firmware connection manager? (You can see this in the logs when
thunderbolt.dyndbg=+p is in the command line).

> Previously you said you'd talk with your Windows folks about this; any
> news from there?

I've talked to them and still in talks with the UEFI folks but the
current undestanding is that Windows does not do anything special when
the system is rebooted (so equal to what Linux does). There is one
"development" system in Israel lab that should be pretty similar to what
the HP system of yours is but the person who was going to try to
reproduce is in sick leave now.
