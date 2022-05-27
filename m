Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22268535D46
	for <lists+linux-usb@lfdr.de>; Fri, 27 May 2022 11:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350558AbiE0JMf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 May 2022 05:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350555AbiE0JMT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 May 2022 05:12:19 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BE264F8
        for <linux-usb@vger.kernel.org>; Fri, 27 May 2022 02:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653642617; x=1685178617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H1r4MvbypCFUiGqJIkEqwMWo7reehqMexPKvcKB+iz4=;
  b=FX3sNbgk7TOeR+wdVx0QWuTV9ciYb54PJFHpUW58CpLJUIHXCzHHHLAe
   z1rP15u6l43CgLiufM/gpVbtzf2O1VurPx4RYidsDQLOGoPbyUPcu0SsE
   fsBaiiEWvy95PmnvJzo5VuFSQUlcSTTr8T03+h3Hy96pM8VDlecBaN5N8
   Y5aNjceCQlquQnpuJXp55DlStrzmSX1dNeJdQQax/1uHq17O1AxRoOK8P
   wuIR7xHarnDwobZQCK0NKJpkFonUnRGo16AHgqPfnC+eaRTFRQXu4VMKm
   WD8FwcaIrrl4mJxSLReoD2ava189KdTdsYTFrFoQWCV0LkVWiMO18yvEJ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="254922796"
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; 
   d="scan'208";a="254922796"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 02:10:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; 
   d="scan'208";a="746833929"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 02:10:15 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 27 May 2022 12:10:11 +0300
Date:   Fri, 27 May 2022 12:10:11 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Stefan Hoffmeister <stefan.hoffmeister@gmail.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: Thunderbolt: One missing DisplayPort?
Message-ID: <YpCVc6eYkpmjP9AF@lahna>
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
 <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com>
 <Yoy7oXpMugFFmfBP@lahna>
 <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_PDS_PRO_TLD,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, May 27, 2022 at 08:24:31AM +0200, Stefan Hoffmeister wrote:
> Hi,
> 
> On Tue, May 24, 2022 at 1:04 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > Hi,
> >
> > On Tue, May 24, 2022 at 01:55:23PM +0300, Heikki Krogerus wrote:
> > > +Mika
> > >
> > > On Fri, May 20, 2022 at 12:22:50PM +0200, Stefan Hoffmeister wrote:
> > > > I am trying to diagnose a problem where I get video output on
> > > > Thunderbolt on one DisplayPort, but no output on the second
> > > > DisplayPort.
> > > >
> > > > I would love to turn on all the (kernel-level) logging output that
> > > > there is, but do not know how to do that.
> > > >
> > > > Basically, on a Dell Inspiron 16 Plus (7610) laptop with Thunderbolt
> > > > 4, I am running Fedora Linux 36 with kernel 5.17+.
> > > >
> > > > Connecting that laptop to a Thunderbolt docking station (Intel
> > > > Thunderbolt 3 chip inside),
> > > > with two screens attached via DisplayPort, I get only one screen up and running.
> > > >
> > > > I'd like to discover more about this apparent error mode, because
> > > > attaching a different TB3
> > > > setup works fine. I am looking for some means to enable logging or to
> > > > get debugging insight.
> > > >
> > > > Generally speaking, I suspect that this specific Dell laptop
> > > > (configuration) has some challenges
> > > > in the BIOS, and with Thunderbolt in general, but am totally blind to
> > > > what is going on.
> > > >
> > > > This system offers potential for fun, this being a hybrid PRIME
> > > > configuration, with an Intel iGPU passing through to an Nvidia dGPU
> > > > which seems to be the only wired-up way to get DisplayPort output.
> >
> > In that system all the tunneling is done by the firmware so there is
> > really not much you can debug on the kernel side. You can add
> > "thunderbolt.dyndbg" in the command line to get more verbose logging but
> > I doubt it reveals anything useful.
> >
> > How do you connect the monitors to the dock and what dock it is?
> 
> The dock is an i-tec Thunderbolt3/USB-C Dual DisplayPort 4K Docking
> Station + Power Delivery 85W
> (https://i-tec.pro/en/produkt/tb3cdualdpdockpd-2/). This dock exposes
> two DisplayPort outs, to which I have connected one 2.5K screen and
> one 4K screen "natively", for running at 60 Hz. According to lspci
> from the "broken" Dell 7610 (BIOS version 1.7.0) the dock looks like
> this:
> 
> [stefan@fedora ~]$ lspci -vt
> -[0000:00]-+-00.0  Intel Corporation 11th Gen Core Processor Host
> Bridge/DRAM Registers
>           +-01.0-[01]--+-00.0  NVIDIA Corporation GA106M [GeForce RTX
> 3060 Mobile / Max-Q]
>           |            \-00.1  NVIDIA Corporation Device 228e
>           +-02.0  Intel Corporation TigerLake-H GT1 [UHD Graphics]
>           +-04.0  Intel Corporation TigerLake-LP Dynamic Tuning
> Processor Participant
>           +-06.0-[02]----00.0  KIOXIA Corporation Device 0001
>           +-07.0-[03-3a]----00.0-[04-05]----02.0-[05]----00.0  Intel
> Corporation JHL7540 Thunderbolt 3 USB Controller [Titan Ridge DD 2018]
>           +-08.0  Intel Corporation GNA Scoring Accelerator module
> ...
> 
> For reference, when I attach a Dell XPS 9360 (also on Fedora 36),
> which works perfectly (both screens at expected resolution and refresh
> rate), I get this output
> 
> [stefan@xps13 ~]# lspci -vt
> -[0000:00]-+-00.0  Intel Corporation Xeon E3-1200 v6/7th Gen Core
> Processor Host Bridge/DRAM Registers
>           +-02.0  Intel Corporation HD Graphics 620
>           +-04.0  Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen
> Core Processor Thermal Subsystem
>           +-14.0  Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller
>           +-14.2  Intel Corporation Sunrise Point-LP Thermal subsystem
>           +-15.0  Intel Corporation Sunrise Point-LP Serial IO I2C
> Controller #0
>           +-15.1  Intel Corporation Sunrise Point-LP Serial IO I2C
> Controller #1
>           +-16.0  Intel Corporation Sunrise Point-LP CSME HECI #1
>           +-1c.0-[01-39]----00.0-[02-39]--+-00.0-[03]----00.0  Intel
> Corporation DSL6340 Thunderbolt 3 NHI [Alpine Ridge 2C 2015]
>           |
> +-01.0-[04-38]----00.0-[05-38]----02.0-[06]----00.0  Intel Corporation
> JHL7540 Thunderbolt 3 USB Controller [Titan Ridge DD 2018]
>           |                               \-02.0-[39]--
>           +-1c.4-[3a]----00.0  Intel Corporation Wi-Fi 6 AX200
>  ...
> 
> On the broken Dell 7610 (BIOS version 1.7.0), everything else on the
> dock works fine - the NIC, USB ports (forwarding to the next hub,
> too), power delivery.
> 
> Even any single one of the screens alone works fine, in isolation and
> solitude, on any of the dock DisplayPort outs (turning dock on/off in
> between). Only with both screens attached, only the "first" screen
> seems to be detected (and "first" really seems to translate to the
> physical DisplayPort out next to the power input socket on the dock).

OK, I think this is not a Thunderbolt issue but rather related to
graphics so I would try to ask from the graphics folks if they have any
ideas what might be the issue or how to debug further. There is not much
the Linux Thunderbolt driver does here because it is the firmware that
creates these tunnels, and I think it works here as expected.

Probably dri-devel@lists.freedesktop.org is a good mailing list to ask
graphics related help.
