Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05A7E65BEA1
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jan 2023 12:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236914AbjACLHj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Jan 2023 06:07:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237298AbjACLHg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Jan 2023 06:07:36 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F49D100D
        for <linux-usb@vger.kernel.org>; Tue,  3 Jan 2023 03:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672744055; x=1704280055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Hjdd3lWsNunIHfOqIrD5TeeP+MLoQOHttullyGOZllc=;
  b=B7TZfkhHBU+ZuywaWcBJ6BcM2Hbe7EEaHUHGf1dm+juEUkFEfMgyeLKs
   Iy/T2TgWYramPxDtvpzG64Hn28w3Kxs2RhfHcfA/dg+RNkwpdZFpAHILg
   INH9hTR/+cEkBAdPJHedqrvym+Yy9QfCkjm7atJeQtiGwKdc6pA5dBN06
   ZLjqro1jsaZghpH9N2QZAXMptYWZ3aLKGWVU3jE8EybEJ547VTyYdiiW9
   iSywmpe0v/jOlO8rjOnjYkq+tLFgwRBWJ4Mv2UI3Io1zVxqhxe8/xxcKQ
   VE0rgwZ1YKV/LzMgGvcewubocwe3RKVHJVJT+9agH/OQcZDVY9i5DBFkG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="302011918"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; 
   d="scan'208";a="302011918"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 03:07:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="718061019"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; 
   d="scan'208";a="718061019"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 03 Jan 2023 03:07:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id BC72A19E; Tue,  3 Jan 2023 13:08:05 +0200 (EET)
Date:   Tue, 3 Jan 2023 13:08:05 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y7QMlV82mtaApJwJ@black.fi.intel.com>
References: <Y66vWYdLLAOG81+f@black.fi.intel.com>
 <c334eb1f-1130-04d7-e7a6-cce9a90fd2e8@gmx.at>
 <Y67RoYvbRC6OgfOq@black.fi.intel.com>
 <272a5f28-5733-3aa1-ff3e-57febd3b217f@gmx.at>
 <Y67X5JrnRxYN/pns@black.fi.intel.com>
 <00dbeaf9-4d2c-3e3a-fa39-4c232b3a68e6@gmx.at>
 <Y7K7zLoAQVyv0zD5@black.fi.intel.com>
 <011df027-5381-1e10-9c54-e0935ae549f9@gmx.at>
 <Y7ME7EwduIQE38+2@black.fi.intel.com>
 <a324ff2a-d014-83d2-4f30-b865db7c352b@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a324ff2a-d014-83d2-4f30-b865db7c352b@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Jan 03, 2023 at 10:08:16AM +0100, Christian Schaubschläger wrote:
> Good morning,
> 
> > Can you try the below hack? It should tear down all tunnels during
> > reboot so the firmware should see pristine path configuration spaces
> > (assuming it is looking at them and failing because if already configure
> > paths).
> >
> > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > index 1711dc19b1e2..e0544843e242 100644
> > --- a/drivers/thunderbolt/tb.c
> > +++ b/drivers/thunderbolt/tb.c
> > @@ -1982,13 +1982,7 @@ static void tb_stop(struct tb *tb)
> >  	cancel_delayed_work(&tcm->remove_work);
> >  	/* tunnels are only present after everything has been initialized */
> >  	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list) {
> > -		/*
> > -		 * DMA tunnels require the driver to be functional so we
> > -		 * tear them down. Other protocol tunnels can be left
> > -		 * intact.
> > -		 */
> > -		if (tb_tunnel_is_dma(tunnel))
> > -			tb_tunnel_deactivate(tunnel);
> > +		tb_tunnel_deactivate(tunnel);
> >  		tb_tunnel_free(tunnel);
> >  	}
> >  	tb_switch_remove(tb->root_switch);
> That doesn't change the behaviour unfortunately.

Okay then it is not about the paths.

> I did find out two (confusing) things, though. The network interface
> on the dock is an Intel I255-LMvP, in linux it's eth1. When I do this
> before the reboot:
> 
> echo 1 > /sys/class/net/eth1/device/remove
> 
> the device is removed and then added again immedidately:
> 
> [   31.930950] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
> [   77.496059] igc 0000:2c:00.0 eth1: PHC removed
> [   77.670531] pci 0000:2c:00.0: Removing from iommu group 21
> [   78.551553] pci 0000:2c:00.0: [8086:5502] type 00 class 0x020000
> [   78.552412] pci 0000:2c:00.0: reg 0x10: [mem 0x00000000-0x000fffff]
> [   78.553194] pci 0000:2c:00.0: reg 0x1c: [mem 0x00000000-0x00003fff]
> [   78.554128] pci 0000:2c:00.0: PME# supported from D0 D3hot D3cold
> [   78.555110] pci 0000:2c:00.0: Adding to iommu group 21
> [   78.555913] pcieport 0000:04:04.0: ASPM: current common clock configuration is inconsistent, reconfiguring
> [   78.566265] pci_bus 0000:05: Allocating resources
> [   78.566285] pci_bus 0000:2c: Allocating resources
> [   78.566296] pci 0000:2c:00.0: BAR 0: assigned [mem 0x82000000-0x820fffff]
> [   78.567075] pci 0000:2c:00.0: BAR 3: assigned [mem 0x82100000-0x82103fff]
> [   78.567862] igc 0000:2c:00.0: enabling device (0000 -> 0002)
> [   78.568671] igc 0000:2c:00.0: PTM enabled, 4ns granularity
> [   78.626297] pps pps0: new PPS source ptp1
> [   78.627161] igc 0000:2c:00.0 (unnamed net_device) (uninitialized): PHC added
> [   78.653444] igc 0000:2c:00.0: 4.000 Gb/s available PCIe bandwidth (5.0 GT/s PCIe x1 link)
> [   78.654448] igc 0000:2c:00.0 eth1: MAC: 5c:60:ba:71:ea:be
> [   78.655307] pci_bus 0000:05: Allocating resources
> [   78.655327] pci_bus 0000:2c: Allocating resources
> [   81.598703] igc 0000:2c:00.0 eth1: NIC Link is Up 1000 Mbps Full Duplex, Flow Control: RX/TX
> [   81.599729] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
> 
> 
> If I reboot now, I can see the network interface in the firmware!

Does this happens 100% or it happened just once?

> And now for the confusing part: I do exactly the same steps as above,
> but whith an external display connected to the dock. Even if I don't
> touch this display in Linux (the i915 driver isn't loaded, just efi
> framebuffer), then the net interface is gone in the firmware after the
> reboot...

It is enough if there is monitor plugged the DP tunnel is then up even
if there is no i915.

> Also, after the
> 
> echo 1 > /sys/class/net/eth1/device/remove
> 
> 
> the device doesn't show up in linux again:
> 
> [   10.158596] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
> [   42.773958] igc 0000:2c:00.0 eth1: PHC removed
> [   42.962208] pci 0000:2c:00.0: Removing from iommu group 21

You mean with display connected it does not show up again?

I think what is expected is that when you do

 # echo 1 > /sys/class/net/eth1/device/remove

the network interface is removed and it is not expected to come back but
I realized that when you have the DP connected the TCSS (Type-C
SubsSystem) does not enter D3.

So I wonder if you can run another test still?

0. Remove the hack patch if not already.

Steps 1-3 same as before.

4. Disable runtime PM from the PCIe root ports:

  # echo on > /sys/bus/pci/devices/0000:00:07.0/power/control
  # echo on > /sys/bus/pci/devices/0000:00:07.1/power/control
  # echo on > /sys/bus/pci/devices/0000:00:07.2/power/control
  # echo on > /sys/bus/pci/devices/0000:00:07.3/power/control

(or how many Thunderbolt PCIE root ports you have, disable it from all of them).

5. De-authorize the PCIe tunnel

  # echo 0 > /sys/bus/thunderbolt/devices/.../authorized

6. Soft reboot

Does this change anything or the behavior is the same?
