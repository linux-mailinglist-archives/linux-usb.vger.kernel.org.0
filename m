Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6F6C69212F
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 15:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbjBJO4J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 09:56:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232369AbjBJO4I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 09:56:08 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C39A70724
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 06:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676040965; x=1707576965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XjlQNkm+d13Sl8rhSRtjFwL3fWoRrTrsV3Li6p8AflQ=;
  b=M8QEs7OhbtjMxb0PRA60ALsnzY6iTO+Ts9JLZNw6DEBA7sfY7hxvyg9a
   dDT4tAkWVQB8ZIH3K+O7wgJmFB/TnDPzDzADyBL3IUvtotghCIUn8ZDdH
   vgCpnh+BaXD8WoHFLsKp1DN3Rrn0g31SXXzxSaS/374sgbNBDhgdYyNhs
   tivpvwWq5T9SGWQLDTS62PDpEjSHx9UN7+6q+ia6GxR91GXPnaQGNqDo0
   FOwQsnYTKU36PEYtY25XQwKvWOomuaURpck8ZaODonVI8yXYz0vE/Dz02
   dlEpOhtvQcIgnoZraR9SOu69NgbJ7a6WC43slF02GMWmPtyPZMMP51wsB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="395041537"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="395041537"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 06:56:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="776953037"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="776953037"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2023 06:56:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B2A381C5; Fri, 10 Feb 2023 16:56:41 +0200 (EET)
Date:   Fri, 10 Feb 2023 16:56:41 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <sanmehta@amd.com>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        Basavaraj.Natikar@amd.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Disable CLx state for AMD Yellow Carp and
 Pink Sardine
Message-ID: <Y+ZbKdYWvp6z5reQ@black.fi.intel.com>
References: <1676035943-115840-1-git-send-email-Sanju.Mehta@amd.com>
 <Y+ZM6qWBRCsjSxdH@black.fi.intel.com>
 <a52cd0cf-e72e-d324-98bd-f5a38d7b775f@amd.com>
 <Y+ZSDqjl9Am+a9dz@black.fi.intel.com>
 <077f39f2-9fac-c743-1c97-eecf4512b1dc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <077f39f2-9fac-c743-1c97-eecf4512b1dc@amd.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 10, 2023 at 08:16:48PM +0530, Sanjay R Mehta wrote:
> 
> 
> On 2/10/2023 7:47 PM, Mika Westerberg wrote:
> > On Fri, Feb 10, 2023 at 07:32:13PM +0530, Sanjay R Mehta wrote:
> >>
> >>
> >> On 2/10/2023 7:25 PM, Mika Westerberg wrote:
> >>> Hi,
> >>>
> >>> On Fri, Feb 10, 2023 at 07:32:23AM -0600, Sanjay R Mehta wrote:
> >>>> From: Sanjay R Mehta <sanju.mehta@amd.com>
> >>>>
> >>>> AMD Yellow Carp and Pink Sardine don't support CLx state,
> >>>> hence disabling it.
> >>>
> >>> The lane adapters are supposed to announce whether CL-states are
> >>> supported or not. Is that not the case with the AMD hardware?
> >>
> >> Yes Mika. it doesn't work for AMD hardware.
> > 
> > :-(
> > 
> > Okay can you then add a quirk for this to quirks.c?
> 
> Did you meant like below, is this fine?

I mean add the affected routers to quirks.c that then sets:

	sw->quirks |= QUIRK_NO_CLX;

and check this in tb_switch_clx_is_supported(), if set return false or
something like that.

I know we have bunch of Intel specific quirks littered around the
driver but let's not add more. We should move these too into quirks.c at
some point.
