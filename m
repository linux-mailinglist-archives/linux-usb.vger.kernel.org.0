Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36FE0675226
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jan 2023 11:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjATKNx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 05:13:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjATKNw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 05:13:52 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB4C9F3AA
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 02:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674209630; x=1705745630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IT6x0RsIv+yVzaDlREB9ZNGbQCkFODj7pZqeMdqlBcQ=;
  b=hKK7p/LIivGtUWdZvBNjQ+CDozuBhWUsu2imtBdBv8ThJGk+88XjPFip
   FZev2cP6LEYEoPQIZRWsWn3S2J8NJZ/p6ZMWMW2ICXSKqle/cWUMHJI9e
   5l1iAqu8oSBXmOAi6yYw7drDVgo4WPfrc9z8cqy7+UrHhrML5YfeqbT6Q
   msWusVRQ5u1LOVNoQu+F3uOMYIy2YJfSzokc6ywnou1e6cnxLYcLmi38j
   ejkSaklt/o3GZLx1hHSe9PYgRKpziTnmKtLJYAZKOHDST1qDgXnb2JFsa
   LBuZm+jCU/IHyh7P8Gq9nrtWieQ7oxa9G2zW/X9m1/9jHKti1iMaedhxm
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="411780157"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="411780157"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 02:13:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="638114038"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="638114038"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 20 Jan 2023 02:13:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 89162368; Fri, 20 Jan 2023 12:14:23 +0200 (EET)
Date:   Fri, 20 Jan 2023 12:14:23 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y8ppf5HHTOaDfGLq@black.fi.intel.com>
References: <Y7UzCY6ujQ2qtoq5@black.fi.intel.com>
 <057da4af-9507-fdc6-9588-160a88210674@gmx.at>
 <Y7wNnrlEWMOV4Cj/@black.fi.intel.com>
 <0f862f75-9805-f5d0-ef89-0b77d0ae8778@gmx.at>
 <Y72AbwKFd9snjZrJ@black.fi.intel.com>
 <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
 <Y76TS54PJpmseZs3@black.fi.intel.com>
 <8c2da730-ba9b-6ec7-d493-1a6a2ce54622@gmx.at>
 <Y8kXFFrue7l7DKf3@black.fi.intel.com>
 <78c5218a-67ef-d61d-09fe-2c2cf7fdc87f@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78c5218a-67ef-d61d-09fe-2c2cf7fdc87f@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 19, 2023 at 03:37:52PM +0100, Christian Schaubschläger wrote:
> Hi,
> >> 8beb71759cc8fddd937cadf9ec482e524d4f0f1c is the first fixed commit
> >> commit 8beb71759cc8fddd937cadf9ec482e524d4f0f1c
> >> Author: Pierre Gondois <pierre.gondois@arm.com>
> >> Date:   Wed May 18 11:08:58 2022 +0200
> >>
> >>     ACPI: bus: Set CPPC _OSC bits for all and when CPPC_LIB is supported
> >>     
> >>     [ Upstream commit 72f2ecb7ece7c1d89758d4929d98e95d95fe7199 ]
> >>     
> >>     The _OSC method allows the OS and firmware to communicate about
> >>     supported features/capabitlities. It also allows the OS to take
> >>     control of some features.
> >>     
> >>     In ACPI 6.4, s6.2.11.2 Platform-Wide OSPM Capabilities, the CPPC
> >>     (resp. v2) bit should be set by the OS if it 'supports controlling
> >>     processor performance via the interfaces described in the _CPC
> >>     object'.
> >>     
> >>     The OS supports CPPC and parses the _CPC object only if
> >>     CONFIG_ACPI_CPPC_LIB is set. Replace the x86 specific
> >>     boot_cpu_has(X86_FEATURE_HWP) dynamic check with an arch
> >>     generic CONFIG_ACPI_CPPC_LIB build-time check.
> >>     
> >>     Note:
> >>     CONFIG_X86_INTEL_PSTATE selects CONFIG_ACPI_CPPC_LIB.
> >>     
> >>     Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> >>     Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> >>     Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >>     Signed-off-by: Sasha Levin <sashal@kernel.org>
> >>
> >>  drivers/acpi/bus.c | 16 ++++++++--------
> >>  1 file changed, 8 insertions(+), 8 deletions(-)
> >>
> >> I've no idea why this solves the issue on the Lenovo, and obviously it doesn't solve it on the HP, but maybe this rings a bell somewhere? (Note: in my woking kernel config (on the Lenovo) I have neither CONFIG_X86_INTEL_PSTATE nor CONFIG_ACPI_CPPC_LIB set...)
> > Can you check if with this commit reverted does Thunderbolt use software
> > or firmware connection manager? (You can see this in the logs when
> > thunderbolt.dyndbg=+p is in the command line).
> >
> You're right! With this commit reverted it uses the software connection manager, with the commit applied it uses the firmware connection manager.

Hmm, so reverting this commit enables software connection manager and
makes the Lenovo system work? Are you sure? that's completely opposite
how the HP system behaves ;-)
