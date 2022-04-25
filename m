Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 743C550D8A5
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 07:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238207AbiDYFMA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 01:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236332AbiDYFL7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 01:11:59 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2EE52612F
        for <linux-usb@vger.kernel.org>; Sun, 24 Apr 2022 22:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650863336; x=1682399336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SLR87paKOScBz9mYncHcTRVp2yKDS+E2EVRO4giEx68=;
  b=jZ861Y9DvwiQAfbnWjaA/mMnmVEDztmQJXOtYY7QrOkFHBAwNidEcaLe
   /k2MQMRFk7PbHcMrskmJSvdG9L3G2dny+9JKOJT9zIJG1af32G9DZkmbG
   B1q+8oAR941PYkKBol5wtp/tLX4+0p4Jq86SpPOp7bqQGR6bDbB9AssN3
   MGD/TYIzTiJdXrCnlKwqRTjy0X/PkXp7jhlE4QuYdgpdxyjpWWAkG/TK8
   D7UfnqtzbfEyJ+tNbtLFoXKsTGHTJCAa48K6eWDjoTvpGilpg4G7hWGxJ
   ZT7djOaunJ7jww86CdHI5zKiOmeztC7K7R/Q4bpejYq4JuU6pLf+MMjFs
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="262739473"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="262739473"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2022 22:08:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="531929563"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2022 22:08:53 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 25 Apr 2022 08:05:20 +0300
Date:   Mon, 25 Apr 2022 08:05:20 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Tomasz =?utf-8?Q?Mo=C5=84?= <desowin@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: Wake from Thunderbolt dock doesn't work
Message-ID: <YmYsEARNTc99uwLt@lahna>
References: <6580ca29cd8e245627c4a742189e27acf79f6b39.camel@gmail.com>
 <YmI8g2Jaye8Kk+hA@lahna>
 <CAOHtt38-+tnyrUX5u0McHyutofEwZLeLF7siZab7XgLYXVdm9Q@mail.gmail.com>
 <YmJLg3maiAY6cwDp@lahna>
 <ef495f23d541face3d8495602c2896bf62afbf97.camel@gmail.com>
 <YmLEPWxolnOyCgnP@lahna>
 <76629b1698c129864b9853348f69520f19bd6b4c.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76629b1698c129864b9853348f69520f19bd6b4c.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 22, 2022 at 10:38:29PM +0200, Tomasz Moń wrote:
> On Fri, 2022-04-22 at 18:05 +0300, Mika Westerberg wrote:
> > On Fri, Apr 22, 2022 at 03:54:16PM +0200, Tomasz Moń wrote:
> > > On Fri, 2022-04-22 at 09:30 +0300, Mika Westerberg wrote:
> > > > If that's the case then you should be getting same kind of "support"
> > > > by passing "thunderbolt.start_icm=1" in the kernel command line.
> > > 
> > > Passing "thunderbolt.start_icm=1" in the kernel command line made
> > > things worse. The system does not wake from suspend at all. It does not
> > > wake from USB keyboard connected directly to the host. And it does not
> > > wake after opening the lid nor after pressing power button (Touch ID).
> > > 
> > > The only way to get system back running seemed to be pressing and
> > > holding power button long enough until the Apple bootloader starts.
> > 
> > OK. The start_icm=1 starts the connection manager firmware which is one
> > thing that Windows relies too. However, all the PM stuff is still not
> > there unfortunately.
> 
> Is the connection manager firmware interface (from Linux perspective)
> implementation specific or is it standarized?

Implementation specific. Apple does not use it on macOS at all and this
is the behaviour you get when you boot Linux there too (on bare metal).
However, with boot camp the firmware is started and the whole
environment (PM stuff) is made more standardized so that Windows can run
on it.

> 
> > > > That should do the same than what the boot camp does and start the TBT firmware connection manager.
> > > 
> > > I have no idea what boot camp does on the low level, but atleast
> > > Windows can wakeup successfully.
> > 
> > please try the same in Linux if that's possible. Running Linux natively
> > will likely have issues because all the non-standard stuff in those
> > systems.
> 
> What do you mean by trying the same in Linux? I would like to, but I
> simply don't know how.

I'm suggesting to boot linux on the boot camp too. I have no idea if
that is even posible but if it is then that would be the closest to get
similar behaviour between Windows on Apple and Linux.
