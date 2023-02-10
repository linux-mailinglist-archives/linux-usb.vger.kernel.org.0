Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F16756920A0
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 15:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbjBJORP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 09:17:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjBJORO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 09:17:14 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241F130B27
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 06:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676038634; x=1707574634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6bP9pms/XAu8OWPsYbL5OybgrmdNCsWTCeyU8w1dknA=;
  b=GXxmiGHujuthYH8kRsu+3NTe6TfxVsVPT3+6j2XHnKzfQ2Va79oIDrdS
   xa5+2p+PpglkkJVgwrZKzqbjibrV8odd0SF0hLJ9EZqRs+YmcMOAvwk0o
   jrOP9iJZivsqf3CclaFdTZ/cmzR9HcWOBiZoFc0jIILSEbIecpX119ph4
   wDTtlHAtD+jwdrywm8TOsTfYjBdjirK/75dv0FRtoEop8FFgjsHhV8cAV
   F/7t1tNU00/rRZeXxwaoOm3XyLdrLZXpY9It+rQjl+p/UTJwlb4UtMqEJ
   p9pW4X+F34/U7ZeCSjCaj0GOCLFTksWXqazhOYfSTiOXZcFhH7BGyxWKO
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="416655488"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="416655488"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 06:17:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="756795099"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="756795099"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2023 06:17:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id DA8D71C5; Fri, 10 Feb 2023 16:17:50 +0200 (EET)
Date:   Fri, 10 Feb 2023 16:17:50 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <sanmehta@amd.com>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        Basavaraj.Natikar@amd.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Disable CLx state for AMD Yellow Carp and
 Pink Sardine
Message-ID: <Y+ZSDqjl9Am+a9dz@black.fi.intel.com>
References: <1676035943-115840-1-git-send-email-Sanju.Mehta@amd.com>
 <Y+ZM6qWBRCsjSxdH@black.fi.intel.com>
 <a52cd0cf-e72e-d324-98bd-f5a38d7b775f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a52cd0cf-e72e-d324-98bd-f5a38d7b775f@amd.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 10, 2023 at 07:32:13PM +0530, Sanjay R Mehta wrote:
> 
> 
> On 2/10/2023 7:25 PM, Mika Westerberg wrote:
> > Hi,
> > 
> > On Fri, Feb 10, 2023 at 07:32:23AM -0600, Sanjay R Mehta wrote:
> >> From: Sanjay R Mehta <sanju.mehta@amd.com>
> >>
> >> AMD Yellow Carp and Pink Sardine don't support CLx state,
> >> hence disabling it.
> > 
> > The lane adapters are supposed to announce whether CL-states are
> > supported or not. Is that not the case with the AMD hardware?
> 
> Yes Mika. it doesn't work for AMD hardware.

:-(

Okay can you then add a quirk for this to quirks.c?
