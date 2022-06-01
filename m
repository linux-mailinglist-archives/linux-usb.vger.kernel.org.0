Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36FB453A345
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jun 2022 12:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240387AbiFAKvt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jun 2022 06:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348534AbiFAKvo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jun 2022 06:51:44 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EEB8D98
        for <linux-usb@vger.kernel.org>; Wed,  1 Jun 2022 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654080702; x=1685616702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UneFKKJZEQo2/GIxKmYMApTnsdSynfUlQL+Ze2cvPt0=;
  b=Zhigi45n7mlisydEkuDz/i96KU9msmNS08gNau1bXiM4gQt2JJEog5XJ
   REsK87kmF+7AC0VA0FRX328uXE1G2q4F/4jx/PlOr0aenoIzF/vAjGOAR
   f1jw9wkA6YvupEF+KysizN3SNhsEvbXx3mqzyouJ5FzLivMheT1RNTJof
   cpg7jtl+jAafFHMw1I7Zp7W0e98RjnTYzLFPbzz7ZliwM/TJvT+5rLEGH
   6q1YyDgKzi7kDNEf/ZQBclX6/tPy67oM4NHqCCXg49YHPsTOssvub3efA
   CW5T9bjkvJzODHR4QQwwxIpM9WSRPbESObI/daskdqXJcplYbH7BkjoeE
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="275556776"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="275556776"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 03:51:41 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="707005092"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 03:51:39 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 01 Jun 2022 13:51:36 +0300
Date:   Wed, 1 Jun 2022 13:51:36 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Stefan Hoffmeister <stefan.hoffmeister@gmail.com>
Cc:     Tomasz =?utf-8?Q?Mo=C5=84?= <desowin@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: Thunderbolt: One missing DisplayPort?
Message-ID: <YpdEuAIRABoad0eU@lahna>
References: <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com>
 <Yoy7oXpMugFFmfBP@lahna>
 <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com>
 <YpCVc6eYkpmjP9AF@lahna>
 <CALhB_QP8SPqubq-eBNa1BTMuy3kCA65OuajOeJGt5DB9jDRKKg@mail.gmail.com>
 <ce969e3b4a6ed04584fdecd3234578bd87d52594.camel@gmail.com>
 <YpSUSk9u5z3ueufa@lahna>
 <CALhB_QNh3vMn2+6H41MC_O0sKPfjiVrPeqmvpnLk=tuHUPQGdg@mail.gmail.com>
 <YpXhg6wPtotRk6c2@lahna>
 <CALhB_QOCJfxoDpNmRi-YEKozeAh4PMZeVy3avhzR7jVcvWfXYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALhB_QOCJfxoDpNmRi-YEKozeAh4PMZeVy3avhzR7jVcvWfXYg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, May 31, 2022 at 09:45:55PM +0200, Stefan Hoffmeister wrote:
> What could be reasons that the second tunnel is not established on the
> Dell? I read somewhere that Intel hands off the firmware to vendors
> (Dell) who then customize it for their systems? Could the vendor have
> made bad customizations / configurations of that package while
> integrating it?

Probably not a firmware issue.

> I would imagine that plugging in a DisplayPort cable makes the dock
> (firmware) signal something to the notebook (TB firmware) and a
> negotiation will take place. That negotiation fails, otherwise the
> tunnel would be established, and remain established? Is there a means
> to trace the negotiation?

It is all done in firmware but when you plug in DisplayPort cable to the
dock, it generates a hotplug event for that DP OUT adapter and this will
then be handled by the firmware connection manager by establishing a DP
tunnel (if it finds resources).

> FWIW, I have read the phrase "insufficent provision of GPU Interfaces
> to the TB port" (sic, on Reddit), and a lengthy related post at
> https://www.dell.com/community/XPS/Understanding-Thunderbolt-docks-GPU-bandwidth-and-GPU-interfaces/td-p/7678776
> which I will not pretend to understand.
> 
> What I wonder about is whether the "GPU interfaces" situation would be
> reliably discoverable by inspecting ... something ... anything?
> 
> Anyway, my impression, from a layering point of view, is that on the
> stack (my imagination!)
> 
> * notebook hardware
> * firmware (BIOS, Thunderbolt firmware / connection manager, ...)
> * Linux thunderbolt driver
> * Linux graphics drivers: drm / kms (i915 / nvidia / nouveau)
> 
> the graphics drivers are not involved when it comes to building /
> maintaining the Thunderbolt(!) tunnel?

Correct.

> I am also reading "Thunderbolt Alternate Mode encapsulates DisplayPort
> Alternate Mode". To my ears this sounds like "wrap the raw DisplayPort
> Alternate Mode bitstream", just with more bandwidth. Pure "DisplayPort
> Alternate Mode" I can force with success by way of disabling
> Thunderbolt in the BIOS (at the expense of bandwidth -> bad refresh
> rate). And "DisplayPort Alternate Mode" gives me _both_ screens,
> apparently very much scraping along at the max protocol bandwidth,
> with the 4K screen going black (out of sync?) every once in a while.
> 
> Sorry for my rambling, this is an area where I have no expertise.
> 
> Anyway, if those graphics drivers are involved for _Thunderbolt_,
> please do tell me, and I'll venture over to dri-devel.

In case of firmware based connection manager, the Thunderbolt driver
does not do much. Pretty much just the PCIe tunnel authorization and
power management things (and P2P).

IIRC this non-working system had a discrete (NVIDIA?) GPU? It may be
that routing it to the DP IN adapters in the Thunderbolt host router
requires something we don't implement in Linux side yet.

> And given what I see above, is that still "Thunderbolt 4 Certified"
> ("Two 4K displays") in the case of the Dell Inspiron 7610?

This I don't know I would expect Dell testing this, at least with their
own dock.
