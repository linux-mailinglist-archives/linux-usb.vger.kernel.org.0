Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F58537854
	for <lists+linux-usb@lfdr.de>; Mon, 30 May 2022 12:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234964AbiE3JyZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 May 2022 05:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234966AbiE3JyY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 May 2022 05:54:24 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B4D7090E
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 02:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653904464; x=1685440464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mjQI1ILLkD9O9INRQaMPN3XvJLDS56jiGLSE3WFK+y4=;
  b=I0b/0RYngvHPK39AMCCsY0iIRespWmKuf7vTwQZscvmP75thnToG8uCc
   QWr+WkcAhhXW3oQM5VFvUeE012WiueU0Y/RzhXPrsrP2a1Z07Nlx1q8Zn
   j1Zcnryu6DmRfg+F+YEDcX3CXWHCDbsDXZ8PXIZYcS/3/bJRczh9UjwFL
   1cpQ1ms2oyeHTsoaSgTqQ6ZGsmN1I9yf/iyAswwuVXm5P7/7Bo23Ij3CE
   p3a7HJZUZ06SW3zj+PFgdbavJKRZrdkr0Ns6tT5QHqxPEwY1W4PuputiH
   S4sNueKIdMLjLOURERLT1+n957cke7ORWjJQthbqWOP/qMnuj+fGVCNkt
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274957423"
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; 
   d="scan'208";a="274957423"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 02:54:23 -0700
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; 
   d="scan'208";a="666451853"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 02:54:21 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 30 May 2022 12:54:18 +0300
Date:   Mon, 30 May 2022 12:54:18 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Tomasz =?utf-8?Q?Mo=C5=84?= <desowin@gmail.com>
Cc:     Stefan Hoffmeister <stefan.hoffmeister@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: Thunderbolt: One missing DisplayPort?
Message-ID: <YpSUSk9u5z3ueufa@lahna>
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
 <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com>
 <Yoy7oXpMugFFmfBP@lahna>
 <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com>
 <YpCVc6eYkpmjP9AF@lahna>
 <CALhB_QP8SPqubq-eBNa1BTMuy3kCA65OuajOeJGt5DB9jDRKKg@mail.gmail.com>
 <ce969e3b4a6ed04584fdecd3234578bd87d52594.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce969e3b4a6ed04584fdecd3234578bd87d52594.camel@gmail.com>
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

On Mon, May 30, 2022 at 10:33:06AM +0200, Tomasz Moń wrote:
> On Sun, 2022-05-29 at 21:51 +0200, Stefan Hoffmeister wrote:
> > I have managed to wedge the system into a state where it does not
> > know about Thunderbolt, and now, on what I presume to be USB-C only
> > ("usb_typec_revision" == 1.2? Seems ... low?), both DisplayPort
> > outputs on the docking station are now active, and I do get
> > meaningful entries from the DRM subsystem (and hence X). I am half-
> > way happy: I want exactly that over Thunderbolt for the bandwidth ;)
> 
> Could you please tell how did you wedge the system into a state where
> it does not know about Thunderbolt?
> 
> > Now, when I unwedge the system to enable Thunderbolt again
> 
> I am curious about the wedge/unwedge procedure.

Probably just connecting the dock using non-Thunderbolt Type-C cable.
That will enter USB (+DP altmode) or so instead of Thunderbolt altmode.

@Stefan,

Can you paste contents of
/sys/kernel/debug/thunderbolt/0-0/port5/regs and port6/regs here?
Once you have conneted the dock with Thunderbolt cable. That should show
if the both DP IN adapters are connected and hence if both DP tunnels
are up. I'm guessing they are but better to check.
