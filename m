Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36D4F50BB31
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 17:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1449150AbiDVPJC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 11:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449222AbiDVPIg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 11:08:36 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C095D66D
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 08:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650639939; x=1682175939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IcJ1WdY/UPym2FvdokJWT9jtTGAEhd1sZ1in5+B1N/4=;
  b=Zt3D3x20h2PthaaWzMEMm11oU03RpWyaSoNXS/ZNaa10kKIod9wpTB83
   fyk0dAt06Bsp7HC+iPlnnVUZnUcJhP+dO+fEDcWRKzeKQoyuBEcqRxiVh
   8psqTR5SCIjtq6kRzpj87AqCZC1swSff/FDjERd8c2A9dX7ZkO3zzojdf
   dFLkyFIUAWx6b+zREXU+52+2RUJuMbymQFmzodRN09O+U5xVQnS8lkAD1
   XXhq07BgrPZNVFynawRhpC9zEhXevpsHxUSlaFKrIhCWpnMyv22hK+K8B
   PAQxVHFjNXd1P1LzJSuuez+KT9TeMaO2nTJxAOFyn/niAUrsCyCwjpUnR
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="351131617"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="351131617"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 08:05:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="577936528"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 08:05:35 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 22 Apr 2022 18:05:33 +0300
Date:   Fri, 22 Apr 2022 18:05:33 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Tomasz =?utf-8?Q?Mo=C5=84?= <desowin@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: Wake from Thunderbolt dock doesn't work
Message-ID: <YmLEPWxolnOyCgnP@lahna>
References: <6580ca29cd8e245627c4a742189e27acf79f6b39.camel@gmail.com>
 <YmI8g2Jaye8Kk+hA@lahna>
 <CAOHtt38-+tnyrUX5u0McHyutofEwZLeLF7siZab7XgLYXVdm9Q@mail.gmail.com>
 <YmJLg3maiAY6cwDp@lahna>
 <ef495f23d541face3d8495602c2896bf62afbf97.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef495f23d541face3d8495602c2896bf62afbf97.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 22, 2022 at 03:54:16PM +0200, Tomasz Moń wrote:
> On Fri, 2022-04-22 at 09:30 +0300, Mika Westerberg wrote:
> > On Fri, Apr 22, 2022 at 08:09:23AM +0200, Tomasz Moń wrote:
> > > On Fri, Apr 22, 2022 at 7:27 AM Mika Westerberg
> > > <mika.westerberg@linux.intel.com> wrote:
> > > > On Thu, Apr 21, 2022 at 09:52:18PM +0200, Tomasz Moń wrote:
> > > > > I have observed that when I suspend to RAM, I cannot wakeup the
> > > > > host
> > > > > (MacBook Pro 2019) with my low-speed USB keyboard (Microsoft
> > > > > Comfort
> > > > > Curve Keyboard 2000) connected to Thunderbolt 3 dock (CalDigit
> > > > > USB-C
> > > > > Pro Dock).
> > > > > 
> > > > > The host runs on Intel Core i9-9980HK and lspci shows Intel
> > > > > Corporation
> > > > > JHL7540 Thunderbolt 3 NHI [Titan Ridge 4C 2018] and Intel
> > > > > Corporation
> > > > > DSL6540 Thunderbolt 3 Bridge [Alpine Ridge 4C 2015].
> > > > > 
> > > > > On Windows and Mac OS the system can be successfully woken up
> > > > > by
> > > > > pressing key on keyboard connected via the dock.
> > > > 
> > > > Is the system that has the problem an Apple system or a regular
> > > > PC?
> > > 
> > > It is an Apple system (MacBook Pro 2019) as noted in in first
> > > paragraph. All tests were performed on the same host with the same
> > > equipment.
> > 
> > OK, I see. I was bit confused because you mention that it works in
> > Windows. I guess you run the Windows on boot camp or so?
> 
> Yes, Windows was installed using Boot Camp Assistant.

OK.

> > If that's the case then you should be getting same kind of "support"
> > by passing "thunderbolt.start_icm=1" in the kernel command line.
> 
> Passing "thunderbolt.start_icm=1" in the kernel command line made
> things worse. The system does not wake from suspend at all. It does not
> wake from USB keyboard connected directly to the host. And it does not
> wake after opening the lid nor after pressing power button (Touch ID).
> 
> The only way to get system back running seemed to be pressing and
> holding power button long enough until the Apple bootloader starts.

OK. The start_icm=1 starts the connection manager firmware which is one
thing that Windows relies too. However, all the PM stuff is still not
there unfortunately.

> > That should do the same than what the boot camp does and start the
> > TBT firmware connection manager.
> 
> I have no idea what boot camp does on the low level, but atleast
> Windows can wakeup successfully.

please try the same in Linux if that's possible. Running Linux natively
will likely have issues because all the non-standard stuff in those
systems.

> > Apple systems by default have the firmware connection manager
> > disabled so the OS does all the tunneling and in Linux we do not
> > supportThunderbolt 3 hosts fully in the software connection manager
> > side (we do support devices, though).  Mostly it's the power
> > management that is missing and I don't see it being fully supported
> > in the future either because the Apple systems are not like the most
> > standardized systems in the market so there are lots of "magic"
> > things happening that are completely undocumented :(
> 
> Apple "magic" is just one thing, but for someone outside Intel it is
> even worse, as basically the whole JHL7540 is just a black box. Or is
> there a way for casual programmer to get hold on the Intel Thunderbolt
> 3 datasheet/specification?

It is not about the TBT spec. It is how Apple wired and implemented the
power management of it. In PC world it's all standard ACPI methods that
are used to turn off/on power to the chip and implement the PCIe L2/3
handshake etc. All that is most likely different in Apple systems.

If you are interested the USB4 spec [1], which is public, describes the
TBT3 power management but again this is host and it is pretty much
implementation specific.

[1] https://usb.org/sites/default/files/USB4%20Specification%2020220331.zip
