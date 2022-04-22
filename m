Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE2450B0A2
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 08:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444400AbiDVGd3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 02:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444398AbiDVGdZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 02:33:25 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A52506E3
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 23:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650609033; x=1682145033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XmfasLLb4rEkUc0HxUCmQk8+IHhloTrpe9pBXF+LFzI=;
  b=Yowsr0ldanvKDKn4j9/LYseHNXLRYN0HyriLg6m9SF6e+Z5ltMpe3ufw
   iMOUcJzqZdWiwjJGI46bttWCaYdPjs+l6qboQNn8gVN0GGAabbifd95qV
   uc8UetvC35M/qSBhnOJA/UChoe7LSCTJe47cI2BR8MYYQfjePGc8h04FB
   Zu27Zc+0kVkceTLf0aQMTUSgvS8xqdwAUHxqfMGiu5xCZ5zAPUwz4bXA6
   u0vAnnqud06iiweoWcQXFAu0wEMjLb2Uxjjd8kVd4LG5dwgvD2jwAjQPM
   D8EqV+GQEIzKOGFipVHryYrr7GTgMddEF1IfmUpQBxg9pd46p36Ws3DoK
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="244516766"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; 
   d="scan'208";a="244516766"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 23:30:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; 
   d="scan'208";a="577702444"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 23:30:29 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 22 Apr 2022 09:30:27 +0300
Date:   Fri, 22 Apr 2022 09:30:27 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Tomasz =?utf-8?Q?Mo=C5=84?= <desowin@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: Wake from Thunderbolt dock doesn't work
Message-ID: <YmJLg3maiAY6cwDp@lahna>
References: <6580ca29cd8e245627c4a742189e27acf79f6b39.camel@gmail.com>
 <YmI8g2Jaye8Kk+hA@lahna>
 <CAOHtt38-+tnyrUX5u0McHyutofEwZLeLF7siZab7XgLYXVdm9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOHtt38-+tnyrUX5u0McHyutofEwZLeLF7siZab7XgLYXVdm9Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 22, 2022 at 08:09:23AM +0200, Tomasz Moń wrote:
> On Fri, Apr 22, 2022 at 7:27 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Thu, Apr 21, 2022 at 09:52:18PM +0200, Tomasz Moń wrote:
> > > I have observed that when I suspend to RAM, I cannot wakeup the host
> > > (MacBook Pro 2019) with my low-speed USB keyboard (Microsoft Comfort
> > > Curve Keyboard 2000) connected to Thunderbolt 3 dock (CalDigit USB-C
> > > Pro Dock).
> > >
> > > The host runs on Intel Core i9-9980HK and lspci shows Intel Corporation
> > > JHL7540 Thunderbolt 3 NHI [Titan Ridge 4C 2018] and Intel Corporation
> > > DSL6540 Thunderbolt 3 Bridge [Alpine Ridge 4C 2015].
> > >
> > > On Windows and Mac OS the system can be successfully woken up by
> > > pressing key on keyboard connected via the dock.
> >
> > Is the system that has the problem an Apple system or a regular PC?
> 
> It is an Apple system (MacBook Pro 2019) as noted in in first
> paragraph. All tests were performed on the same host with the same
> equipment.

OK, I see. I was bit confused because you mention that it works in
Windows. I guess you run the Windows on boot camp or so? If that's the
case then you should be getting same kind of "support" by passing
"thunderbolt.start_icm=1" in the kernel command line. That should do the
same than what the boot camp does and start the TBT firmware connection
manager.

Apple systems by default have the firmware connection manager disabled
so the OS does all the tunneling and in Linux we do not support
Thunderbolt 3 hosts fully in the software connection manager side (we do
support devices, though).  Mostly it's the power management that is
missing and I don't see it being fully supported in the future either
because the Apple systems are not like the most standardized systems in
the market so there are lots of "magic" things happening that are
completely undocumented :(
