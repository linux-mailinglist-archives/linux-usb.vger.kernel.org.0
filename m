Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04D854FF777
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 15:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235734AbiDMNPD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 09:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbiDMNPC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 09:15:02 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F3C5EBC1
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 06:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649855561; x=1681391561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QvBqjWSXu4sFhABUwiNgPfxbDcLQVfYtfR5BSnIcFhY=;
  b=mRqMVCKzTnTNbRNpMMmRppBB5inkClIjZupabXsuh7glCfG5s/4TftHx
   kjRrw7wfUaE77HCYchEtYw2jVB4ic+xBB+J3XtW2ZBuz4HRaCFO3KBLYG
   V0qsnIQnkpu/g0u/C/2ZQnXnqEKF9MkObg6+OWFE9JXZZrgZY7RvYPYBW
   ZwTlNF5RuE/N/WR0WrwYq01k2arkdO8myS2XkHDt/DKiMsydIeQS74gs8
   7OpVocrcNehtyTElNJWfyicVNcamFJOE5vIHghiRDhOcpCghwphPs/Z8i
   hPOod/FcDW78UdH37xD7kRV0WERgaAHa+u8AaMphOrkGrqxikvpb/Um45
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="244544097"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="244544097"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 06:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="700238623"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 13 Apr 2022 06:12:38 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 13 Apr 2022 16:12:37 +0300
Date:   Wed, 13 Apr 2022 16:12:37 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Jun Li <lijun.kernel@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        USB list <linux-usb@vger.kernel.org>, Li Jun <jun.li@nxp.com>,
        xu.yang_2@nxp.com
Subject: Re: Using PTN5110 w/ USB Hub
Message-ID: <YlbMReXMgRKmi8LJ@kuha.fi.intel.com>
References: <CAHCN7xK9sZGXruaLzbam+t2REqvKiTrWbZ-GdA3gXux=9B-2Lw@mail.gmail.com>
 <CAKgpwJXD-fju1=zHZY2vOxcKMY6gLOfCi+Cp543NoC9sa_3=oA@mail.gmail.com>
 <CAHCN7x+Ru9Prvc2YW13gqWCSp7S7GBd0XqnghrxSoqnb4jZ6Cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7x+Ru9Prvc2YW13gqWCSp7S7GBd0XqnghrxSoqnb4jZ6Cw@mail.gmail.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Adam,

On Tue, Apr 12, 2022 at 10:58:03AM -0500, Adam Ford wrote:
> On Tue, Apr 12, 2022 at 10:37 AM Jun Li <lijun.kernel@gmail.com> wrote:
> >
> > Adam Ford <aford173@gmail.com> 于2022年4月12日周二 08:24写道：
> > >
> > > I have a board with a dual role USB conttroller connected to a dual
> > > role hub
> >
> > Could you please explain more about what's "a dual role hub"?
> Thanks for responding.
> 
> 
> The datasheet is listed here:
> https://ww1.microchip.com/downloads/en/DeviceDoc/00002238D.pdf
> 
> I worded that poorly, sorry.  It supports DCP, CDP, SDP.
> 
> >From the datasheet:
> • USB Hub Feature Controller IC Hub with:- 1 USB 3.1 Gen 1 USB
> Type-CTM downstream port- 4 USB 3.1 Gen 1 legacy downstream ports- 1
> USB 2.0 downstream port- Legacy upstream port
> • USB-IF Battery Charger revision 1.2 support on up & downstream ports
> (DCP, CDP, SDP)
> 
> The hope was to have the PTN enable the SRC_EN when the USB-C cable is
> connected to the hub.
> 
> >
> > > connected to a PTN5110 for enabing power to the USB-C.
> > >
> > > SoC -> Hub -> PTN-> USB-C
> >
> > What signals of Hub chip connect to PTN5110 chip?
> 
> Technically, only the CC pins are connected between the USB-C
> connector and the PTN5110.  There isn't really a connection to the hub
> itself, but the output on the PTN enables a regulator which powers the
> USB-C which does connect to the hub.
> 
> >
> > >
> > > The hope was the PTN5110 would enable/disable the src_en pin when I
> > > connect a device that needs power.  Unfortunately, most of the
> > > examples I can see for the device trees on a PTN5110 show some sort of
> > > connection to a USB controller, but  I am going through a hub, not a
> > > controller.
> > >
> > > Is it possible to configure the PTN5110 to either not require
> > > connection to a USB controller or plumb it to a USB hub?
> >
> > My understanding PTN5110(TCPCI controller with PD PHY) is independent
> > with USB data path, for USB data path, I think it should be:
> > SoC -> Hub -> USB-C
> > PTN5110 should not care or know if there is a Hub between type-C connector
> > and USB controller.
> > If the type-C connector connects to a Hub, then it's a DFP only on data,
> > and from power point view, you also only power source role, right?
> 
> Yes.  We're basically trying to source power when a device is
> connected and power down the regulator when the USB-C device is
> disconnected. Unfortunately, the PTN5110 never enables power even when
> I specify it's source only with no sink.  The driver acts like it
> needs some sort of USB node, and when it doesn't find one, and the
> example device tree in the YAML file shows a refernce to the USB
> controller.  I assumed I needed to plumb it to the hub somehow.  If I
> am reading your response correctly, I should just add the node for the
> USB controller and forget the hub exists, is that correct?

Which driver are you talking about?

thanks,

-- 
heikki
