Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B062253C3F0
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jun 2022 07:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239592AbiFCFEq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jun 2022 01:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236793AbiFCFEp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jun 2022 01:04:45 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B023917E
        for <linux-usb@vger.kernel.org>; Thu,  2 Jun 2022 22:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654232684; x=1685768684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Cg8o5IKXv6hSIkSXYYrjFoj7ECf4r1ZqUTOTIniwFZY=;
  b=ls+66wbUxOSp0TRfwaqgTDmDFFLRyIKK3fjMa30vKP7zT6AdidvRFOGR
   nV/HosmRQAguawHtll2Gzoq3Jhvk81j8IPECjPXVXEQ6FHX3puXqnKiAP
   9sOZymSsls1Q4RuqkJiBm/rxFM55Q9MAr7c4i/VWLtat5hh6Cd34Cq9Pf
   FFAAw5vPt44LtZzb2bpnQ8kBOP+3PNTA65tluWjtH/iRuhsclfusC6n6Q
   2eBxjrMjNVqXBT39uolEUwH4kqU5BRJiq2K7wFLTEte9x6KpFWCCCLjH7
   bwm1Pm4cBLhPALZ37Q90tuGrC+53c/fFGFI8LBzIq42zof/fNuwTrsx6d
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="274971540"
X-IronPort-AV: E=Sophos;i="5.91,273,1647327600"; 
   d="scan'208";a="274971540"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 22:04:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,273,1647327600"; 
   d="scan'208";a="607218197"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 22:04:33 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 03 Jun 2022 08:04:31 +0300
Date:   Fri, 3 Jun 2022 08:04:30 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Tomasz =?utf-8?Q?Mo=C5=84?= <desowin@gmail.com>
Cc:     Stefan Hoffmeister <stefan.hoffmeister@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: Thunderbolt: One missing DisplayPort?
Message-ID: <YpmWXl5Y/VToYFvJ@lahna>
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
 <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com>
 <Yoy7oXpMugFFmfBP@lahna>
 <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com>
 <YpCVc6eYkpmjP9AF@lahna>
 <CALhB_QP8SPqubq-eBNa1BTMuy3kCA65OuajOeJGt5DB9jDRKKg@mail.gmail.com>
 <ce969e3b4a6ed04584fdecd3234578bd87d52594.camel@gmail.com>
 <YpSUSk9u5z3ueufa@lahna>
 <92ab08fe65c12d6159966bdd7d2c4215044a00ff.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92ab08fe65c12d6159966bdd7d2c4215044a00ff.camel@gmail.com>
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

On Thu, Jun 02, 2022 at 09:34:27PM +0200, Tomasz Moń wrote:
> On Mon, 2022-05-30 at 12:54 +0300, Mika Westerberg wrote:
> > On Mon, May 30, 2022 at 10:33:06AM +0200, Tomasz Moń wrote:
> > > On Sun, 2022-05-29 at 21:51 +0200, Stefan Hoffmeister wrote:
> > > > I have managed to wedge the system into a state where it does not
> > > > know about Thunderbolt, and now, on what I presume to be USB-C only
> > > > ("usb_typec_revision" == 1.2? Seems ... low?), both DisplayPort
> > > > outputs on the docking station are now active, and I do get
> > > > meaningful entries from the DRM subsystem (and hence X). I am half-
> > > > way happy: I want exactly that over Thunderbolt for the bandwidth ;)
> > > 
> > > Could you please tell how did you wedge the system into a state where
> > > it does not know about Thunderbolt?
> > > 
> > > > Now, when I unwedge the system to enable Thunderbolt again
> > > 
> > > I am curious about the wedge/unwedge procedure.
> > 
> > Probably just connecting the dock using non-Thunderbolt Type-C cable.
> > That will enter USB (+DP altmode) or so instead of Thunderbolt altmode.
> 
> How do I determine that the cable is non-Thunderbolt Type-C?

It does not have that "lightning" logo on the connector.

> I have tried with two different brands 1m USB Type-C cables that are
> not advertised as Thunderbolt. Both cables are electronically marked
> and 5A capable. When the docking station is connected using these
> cables, it operates in Thunderbolt mode.

Oh, yeah it is possible actually that with a passive type-C cable that
it still enters TBT/USB4 mode (20G). I think.

> If the device was operating in USB (+DP altmode), I assume that boltctl
> would show that the docking station status as disconnected?

Correct.

> Can I read the cable EMCA details in Linux?

This I don't know.
