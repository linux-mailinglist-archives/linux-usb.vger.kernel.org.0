Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADFF739679
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jun 2023 06:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbjFVEo7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jun 2023 00:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjFVEo5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jun 2023 00:44:57 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C01831721
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 21:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687409096; x=1718945096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rfTBdPTcMLzo6fgto9m6qhDVZzQtZAHOeg2L/bZ1L/U=;
  b=XhGvpFJgwMX/FXRFHSk91QWSkL6iu/S8qCmQd339AHm4hbMMzPJlcp8J
   kRSaD71A1A03M1cOvL44CzQn1lN1mrnZb4lPSVdb4sRZSQLZdCQRlfIq2
   LF5eBTfUR+YuTC/N50IyeWy+ceDGoVW8Vdq1+mF34jCxZZJT4eJWjrdcH
   WgVBupmgWJZjhW3OLT4BgAFxN/LhNj+eZ1+9sowC7TSVYjHJLI/lTC4uk
   6Oo/wvqwPOSyzvbwzRKu2g8lYalNziRyHM4i1QdmdO9HXSUZpcq7RbNfQ
   Uj29BZOPnGgUpJXDQMDKagwKnXifJeL0lOboQQywmGEMvTki649QKMPZ5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="345123592"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="345123592"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 21:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="838890179"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="838890179"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 21 Jun 2023 21:44:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 72CDF24F; Thu, 22 Jun 2023 07:45:04 +0300 (EEST)
Date:   Thu, 22 Jun 2023 07:45:04 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <sanmehta@amd.com>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH Internal] thunderbolt: Remove enabling/disabling TMU
 based on CLx
Message-ID: <20230622044504.GN45886@black.fi.intel.com>
References: <1687343842-17881-1-git-send-email-Sanju.Mehta@amd.com>
 <20230621111525.GL45886@black.fi.intel.com>
 <5fe10a65-4538-cdbd-a0a6-827f9445cee4@amd.com>
 <20230621125406.GM45886@black.fi.intel.com>
 <a1959444-9f9d-5a3e-65cf-abb681d8bc74@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a1959444-9f9d-5a3e-65cf-abb681d8bc74@amd.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 21, 2023 at 09:37:32PM +0530, Sanjay R Mehta wrote:
> 
> 
> On 6/21/2023 6:24 PM, Mika Westerberg wrote:
> > On Wed, Jun 21, 2023 at 05:48:21PM +0530, Sanjay R Mehta wrote:
> >>
> >>
> >> On 6/21/2023 4:45 PM, Mika Westerberg wrote:
> >>> On Wed, Jun 21, 2023 at 05:37:22AM -0500, Sanjay R Mehta wrote:
> >>>> From: Sanath S <Sanath.S@amd.com>
> >>>>
> >>>> Since TMU is enabled by default on Intel SOCs for USB4 before Alpine
> >>>> Ridge, explicit enabling or disabling of TMU is not required.
> >>>>
> >>>> However, the current implementation of enabling or disabling TMU based
> >>>> on CLx state is inadequate as not all SOCs with CLx disabled have TMU
> >>>> enabled by default, such as AMD Yellow Carp and Pink Sardine.
> >>>>
> >>>> To address this, a quirk named "QUIRK_TMU_DEFAULT_ENABLED" is
> >>>> implemented to skip the enabling or disabling of TMU for SOCs where it
> >>>> is already enabled by default, such as Intel SOCs prior to Alpine Ridge.
> >>>
> >>> If it is enabled by default "enabling" it again should not be a problem.
> >>> Can you elaborate this more?
> >>
> >> Although that is correct, Mika, we are facing an issue of display
> >> flickering on Alpine Ridge and older device routers, from the second
> >> hotplug onwards. This issue arises as the TMU is enabled and disabled
> >> for each plug and unplug.
> > 
> > Okay thanks for clarifying.
> > 
> >> Upon reviewing the old code, it appears that this issue was already
> >> addressed with the following code block:
> >>
> >> /*
> >>  * No need to enable TMU on devices that don't support CLx since on
> >>  * these devices e.g. Alpine Ridge and earlier, the TMU mode HiFi
> >>  * bi-directional is enabled by default.
> >>  */
> >> if (!tb_switch_is_clx_supported(sw))
> >>         return 0;
> >>
> >>
> >> However, it seems that this code has been removed in recent changes, as
> >> the CLX-related code has been moved to a different file.
> > 
> > Yes, I removed it because TMU code should not really be calling CLx
> > functions.
> > 
> > However, we have in tb_enable_tmu() this:
> > 
> > 	/* If it is already enabled in correct mode, don't touch it */
> > 	if (tb_switch_tmu_is_enabled(sw))
> > 		return 0;
> > 
> > and tb_switch_tmu_init() reads the hardware state so this code should
> > basically leave TMU enabling untouched on Alpine Ridge for instance. I
> > wonder if you can try with the latest "next" branch and see if it works
> > there or you are already doing so?
> > 
> Yes Mika, we have already verified with the latest thunderbolt/next
> branch. This patch is built on top of next branch.

Okay.

> >> Canonical has also reported this issue and has tested this patch that
> >> appears to resolve the issue..
> > 
> > Right, however let's figure out if the problem is already solved with
> > the recent code as above or if not why it does not work as expected. I
> > don't really think we want to add any quirks for this because even in
> > the USB4 spec the TMU of TBT3 devices is expected to be enabled already
> > so this is expected functionality and the driver should be doing the
> > right thing here.
> 
> Agree. we will have to see what is going wrong in this case.

You should be able to see in the dmesg (once thunderbolt.dyndbg=+p is
passed in command line) what the initial state of TMU is and how the
driver programs it or does it skip the enabling as expected.
