Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6D1A78ECFE
	for <lists+linux-usb@lfdr.de>; Thu, 31 Aug 2023 14:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346227AbjHaMZJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Aug 2023 08:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346228AbjHaMZI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Aug 2023 08:25:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C28ACFE
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693484705; x=1725020705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NBoEAovz5lw3OUvumLoyUwVmTk8uu+0JDdrFPV+LTfs=;
  b=R/3Ng3p6D9B+OXaGyeQ7DPragXbBPEOHuZ97LQSNnJUyoNCBaEfY5VYt
   RGcHpiOiDUbpob/8aTSH+7xM472BZfDXhdleJlSxkO9SP+hSKQVOVCW3S
   kFgvdGAxwQcbTc1DQhmRLJht62P76iYfU/hkz8o3QGisgUlJi+7YyMvxx
   d0fVOVS6l08Ub79cm5gIqjSMc95D/3HzO8zSwCbBQENOsUBhsk8HVxMnF
   B6bH0kdJcW+HTZ9L3LXsS5PWD6OHfP+ILTfz3/fgTPvc5ivfET6ULMbTT
   F60Oa320JVRPgoXp/6nLYHwx+HGBbwH/9b9vyDq9oBq2eqCEtaXkHWY/d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="439871384"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="439871384"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 05:25:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="809582423"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="809582423"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga004.fm.intel.com with SMTP; 31 Aug 2023 05:25:01 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 31 Aug 2023 15:25:00 +0300
Date:   Thu, 31 Aug 2023 15:25:00 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Douglas Gilbert <dgilbert@interlog.com>
Cc:     Benson Leung <bleung@google.com>,
        Jameson Thies <jthies@google.com>,
        Prashant Malani <pmalani@google.com>,
        Won Chung <wonchung@google.com>, linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] usb: Link USB devices with their USB Type-C
 partner counterparts
Message-ID: <ZPCGnL4zgAKh1mGA@kuha.fi.intel.com>
References: <20230822133205.2063210-1-heikki.krogerus@linux.intel.com>
 <860a352c-12da-25ce-5b9e-697382a93899@interlog.com>
 <ZOXJ2cs5dUBsSNjX@kuha.fi.intel.com>
 <58409169-dc24-accc-46e8-13402cd93f79@interlog.com>
 <ZOxnJxELyjZ7I5f5@kuha.fi.intel.com>
 <c12b1eb4-a437-38fe-6abe-fdbe753739ea@interlog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c12b1eb4-a437-38fe-6abe-fdbe753739ea@interlog.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 29, 2023 at 02:42:29PM -0400, Douglas Gilbert wrote:
> On 2023-08-28 05:21, Heikki Krogerus wrote:
> > On Thu, Aug 24, 2023 at 12:51:04PM -0400, Douglas Gilbert wrote:
> > > On 2023-08-23 04:56, Heikki Krogerus wrote:
> > > > Hi Douglas,
> > > > 
> > > > On Tue, Aug 22, 2023 at 10:52:12AM -0400, Douglas Gilbert wrote:
> > > > > On 2023-08-22 09:32, Heikki Krogerus wrote:
> > > > > On a related matter, I wonder why there aren't symlinks between typec ports
> > > > > (under /sys/class/typec ) and/or the corresponding pd objects (under
> > > > > /sys/class/usb_power_delivery ) to the related power_supply objects under
> > > > > /sys/class/power_supply . For example under the latter directory I see:
> > > > >       $ ls | more
> > > > >       AC
> > > > >       BAT0
> > > > >       hidpp_battery_1
> > > > >       ucsi-source-psy-USBC000:001
> > > > >       ucsi-source-psy-USBC000:002
> > > > > 
> > > > > Those last two power supplies are obviously connected to typec port0 and port1
> > > > > (but offset by 1). Those power_supply objects hold inaccurate data which I hope
> > > > > will improve in time. Significantly power_supply objects don't seem to report
> > > > > the direction of the power. Here is a little utility I have been working on
> > > > > to report the USB Type-C port/pd disposition on my machine:
> > > > >       $ lsucpd
> > > > >       port0 [pd0]  > {5V, 0.9A}
> > > > >       port1 [pd1]  <<===  partner: [pd8]
> > > > > 
> > > > > My laptop (Thinkpad X13 G3) has two type-C ports and port1 is a sink with a
> > > > > PD contract. I would like that second line to have 20V, 3.25A appended to it
> > > > > but there are several issues:
> > > > >     - no typec or pd symlink to ucsi-source-psy-USBC000:002
> > > > >     - that power supply_object says it is online (correct) with a voltage_now:
> > > > >       5000000 uV (incorrect) and current_now: 3000000 uA (incorrect). See below.
> > > > > 
> > > > >     ucsi-source-psy-USBC000:002 $ ls_name_value
> > > > >       current_max : 3250000
> > > > >       current_now : 3000000
> > > > >       online : 1
> > > > >       scope : Unknown
> > > > >       type : USB
> > > > >       uevent : <removed>
> > > > >       usb_type : C [PD] PD_PPS
> > > > >       voltage_max : 20000000
> > > > >       voltage_min : 5000000
> > > > >       voltage_now : 5000000
> > > > 
> > > > I'm glad you brought that up. The major problem with the Type-C power
> > > > supplies is that the Type-C connector class does not actually take
> > > > care of them. They are all registered by the device drivers, and all
> > > > of them seem to expose different kind of information. In your case the
> > > > power supplies are registered by the UCSI driver, and the above may
> > > > indicate a bug in that driver.
> > > 
> > > Hi,
> > > Thanks for the background.
> > > 
> > > My X13 Gen 3 (i5-1240P) uses the typec_ucsi and ucsi_acpi modules. Some time
> > > back in a post you explained how to use debugfs with ucsi. Following that
> > > procedure, just after a 20 Volt PD contract is negotiated on port 0 I see:
> > > 
> > >      # cat /sys/kernel/debug/tracing/trace
> > >      ....
> > >       kworker/0:1-18718   [000] ..... 137813.407189: ucsi_connector_change:
> > >          port0 status: change=0000, opmode=5, connected=1, sourcing=0,
> > >          partner_flags=1, partner_type=1,
> > >          request_data_obj=1304b12c, BC status=1
> > > 
> > > That RDO is incorrect, the top nibble (1) is the index of the default Vsafe5v
> > > PDO. The correct PDO index would be 4 in this case. The source is an Apple 140W
> > > USB-C power adapter so I doubt that it is breaking any PD 3.0/3.1 protocol
> > > rules.
> > 
> > The driver reads the RDO from the UCSI interface, so if it's wrong,
> > there is possibly a problem in the Embedded Controller firmware :-(.
> > 
> > > According the a PD analyzer (km002c) only one Request is sent by the sink:
> > > 82 10 d6 59 87 43 which it decodes as "Pos: 4 Fixed: 20V, 4.7A" which is
> > > Accepted and 200 ms later a PS RDY is sent by the source and Vbus
> > > transitions from from 5.17 Volts to 20.4 Volts. So I can see no Request for
> > > PDO index 1 being sent.
> > > 
> > > With acpi_listen the following traffic occurs just after the power adapter
> > > is plugged into port 0:
> > >    battery PNP0C0A:00 00000080 00000001
> > >    battery PNP0C0A:00 00000080 00000001
> > >    ibm/hotkey LEN0268:00 00000080 00006032
> > >    ac_adapter ACPI0003:00 00000080 00000001
> > >    ac_adapter ACPI0003:00 00000080 00000001
> > >    ibm/hotkey LEN0268:00 00000080 00006030
> > >    thermal_zone LNXTHERM:00 00000081 00000000
> > >    ibm/hotkey LEN0268:00 00000080 00006030
> > >    thermal_zone LNXTHERM:00 00000081 00000000
> > > 
> > > Hope this helps if you find time to look at this.
> > 
> > Thank you. I'll try to reproduce the issue this week, but I don't have
> > that exact model of Thinkpad available I'm afraid (UCSI tends to
> > behave a little bit differently on every single platform).
> 
> Could it be a CPU generation thing? My CPU is 12th generation (2022) and
> there is another report of a Lenovo P15gen2 (11th generation 2021 I assume)
> not reporting PDOs at all. I have an older Dell XPS 9380 which has an 8th
> generation CPU (3 USB-C port and no Type A ports) that has no UCSI support.
> So do PDOs and the active RDO get properly reported on 13th generation
> CPUs?

Probable not. It really depends on the embedded controller or PD
controller firmware, so ultimately the platform and product.

It could be that the reference embedded controller firmware from Intel
is only patched ones for every CPU generation (I don't know), but for
example Dell does not use Intel's reference embedded controller
firmware, or they at least patch it heavily for every product, so the
CPU gen should not play a huge role there.

Now some (most?) USB PD controllers also support UCSI natively, so the
EC firmware may be just a proxy between the OS and the PD controller.
The PD controller can be anything regardless of the CPU generation,
and theare are several vendors, and on top of that, the PD controller
firmwares may be customised for every single product line.

thanks,

-- 
heikki
