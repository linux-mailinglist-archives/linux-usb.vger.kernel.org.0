Return-Path: <linux-usb+bounces-4358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A795818F32
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 19:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B98271F2B1ED
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 18:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022F737D0C;
	Tue, 19 Dec 2023 18:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhdC02qJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F6138F82;
	Tue, 19 Dec 2023 18:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703009069; x=1734545069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=a5L3cw558Pr9UcZ23qtu27HdeQRQybEl0yEgbX77iTA=;
  b=IhdC02qJbnj1GZjp/g5uydruRtew6oKJNgO88dx3YLuREPjV8wATp2Hw
   2zebbBNUqZbPwJJJBAHeDLO9P8CODtQHoI5e+vAWNv6EV2nvHJLYb8fCy
   pB0MnhSZoUVb2WW4qXsozo+zZVBjBysEhuLIk4Rg/yi/5ebuN53FCXktz
   ab8FoKHihywoK5g6+q7V3f2hokZRrNrvxzxtN/Uo+u3rsqqVooybGUc5r
   67534oY4w3aqyucXeh4T26EgcQPpGa763gymd1WiPhwGUOY8r+3MjGaow
   Sxz7rrAH3N0YfMEyHL5KFyIN0CxtSs/yCgUKQgs9wjAZkf51pNcifPTjI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2522056"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="2522056"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 10:04:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="866716615"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="866716615"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Dec 2023 10:04:25 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C0BBE23A; Tue, 19 Dec 2023 20:04:24 +0200 (EET)
Date: Tue, 19 Dec 2023 20:04:24 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sanath S <sanaths2@amd.com>
Cc: Sanath S <Sanath.S@amd.com>, mario.limonciello@amd.com,
	andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Patch v2 2/2] thunderbolt: Teardown tunnels and reset
 downstream ports created by boot firmware
Message-ID: <20231219180424.GL1074920@black.fi.intel.com>
References: <866cb714-b9a8-a7d4-4c59-6ba771ef325f@amd.com>
 <20231218104234.GB1074920@black.fi.intel.com>
 <c433f29b-597c-b6d6-aa48-2b84a26dc623@amd.com>
 <20231218113151.GC1074920@black.fi.intel.com>
 <20231218122312.GE1074920@black.fi.intel.com>
 <997f2a94-66d9-fb95-8f75-46d61937f7e8@amd.com>
 <20231218131840.GH1074920@black.fi.intel.com>
 <0fd5c09f-1cf2-8813-a8f9-1bd856e3a298@amd.com>
 <20231219122634.GJ1074920@black.fi.intel.com>
 <0816caa4-81b5-d0f9-2305-80c7fec6abb9@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0816caa4-81b5-d0f9-2305-80c7fec6abb9@amd.com>

On Tue, Dec 19, 2023 at 08:05:15PM +0530, Sanath S wrote:
> 
> On 12/19/2023 5:56 PM, Mika Westerberg wrote:
> > On Tue, Dec 19, 2023 at 02:41:08PM +0530, Sanath S wrote:
> > > On 12/18/2023 6:48 PM, Mika Westerberg wrote:
> > > > On Mon, Dec 18, 2023 at 06:35:13PM +0530, Sanath S wrote:
> > > > > On 12/18/2023 5:53 PM, Mika Westerberg wrote:
> > > > > > On Mon, Dec 18, 2023 at 01:31:51PM +0200, Mika Westerberg wrote:
> > > > > > > On Mon, Dec 18, 2023 at 04:49:13PM +0530, Sanath S wrote:
> > > > > > > > > The discover part should not do anything (like write the hardware) so
> > > > > > > > > perhaps it is just some timing thing (but that's weird too).
> > > > > > > > > 
> > > > > > > > > I think we should do something like this:
> > > > > > > > > 
> > > > > > > > > 1. Disable all enabled protocol adapters (reset them to defaults).
> > > > > > > > > 2. Clear all protocol adapter paths.
> > > > > > > > > 3. Issue DPR over all enabled USB4 ports.
> > > > > > > > > 
> > > > > > > > > BTW, what you mean "didn't work"?
> > > > > > > > Path activation would go fine after DPR like below:
> > > > > > > > 
> > > > > > > > [   15.090905] thunderbolt 0000:c4:00.5: 0:5 <-> 2:9 (PCI): activating
> > > > > > > > [   15.090932] thunderbolt 0000:c4:00.5: activating PCIe Down path from 0:5
> > > > > > > > to 2:9
> > > > > > > > [   15.091602] thunderbolt 0000:c4:00.5: activating PCIe Up path from 2:9 to
> > > > > > > > 0:5
> > > > > > > > 
> > > > > > > > But, PCIE enumeration doesn't happen (pcie link up will not happen, will not
> > > > > > > > see below logs)
> > > > > > > > [   15.134223] pcieport 0000:00:03.1: pciehp: Slot(0-1): Card present
> > > > > > > > [   15.134243] pcieport 0000:00:03.1: pciehp: Slot(0-1): Link Up
> > > > > > > Okay, what if you like reset the PCIe adapter config spaces back to the
> > > > > > > defaults? Just as an experiment.
> > > > > > If this turns out to be really complex then I guess it is better to do
> > > > > > it like you did originally using discovery but at least it would be nice
> > > > > > to see what the end result of this experiment looks like :)
> > > I feel it's better to go with discover and then reset for now (as v3).
> > > I'll keep this experiment as "to do" and will send out when I crack it down.
> > Fair enough.
> > 
> > > > > Yes, I'll give a try.
> > > > > As an experiment, I tried to compare the path deactivation that occurs at
> > > > > two place.
> > > > > 1. In tb_switch_reset where we are calling tb_path_deactivate_hop(port, i).
> > > > > 2. While we get a unplug event after doing DPR.
> > > > > 
> > > > > I observed both have different hop_index and port numbers.
> > > > > So, are we calling tb_path_deactivate_hop with wrong hop ids ?
> > > > Wrong adapters possibly.
> > > > 
> > > > >   From deactivate tunnel (called while unplug) :
> > > > > [    3.408268] thunderbolt 0000:c4:00.5: deactivating PCIe Down path from
> > > > > 2:9 to 0:5
> > > > > [    3.408282] deactivate hop port = 9 hop_index=8
> > > > > [    3.408328] deactivate hop port = 2 hop_index=10
> > > > Definitely should be port = 5 (that's PCIe down in your log) and
> > > > hop_index = 8 (that's the one used with PCIe).
> > > > 
> > > > > Deactivate from tb_switch_reset() :
> > > > > deactivate hop port = 5 hop_index=8
> > > > Can you add some more logging and provide me the dmesg or
> > > > alternativively investigate it yourself. You can use tb_port_dbg() to
> > > > get the port numbers to the log.
> > > I've sent you complete dmesg.
> > Got it, thanks!
> > 
> > > Here is the log w.r.t port numbers and path clean up.
> > > 
> > > [    3.389038] thunderbolt 0000:c4:00.5: 0:3: Downstream port, setting DPR
> > > [    3.389065] Calling usb4_port_reset
> > > [    3.389068] thunderbolt 0000:c4:00.5: 0:4: Found USB3 DOWN
> > > [    3.389193] thunderbolt 0000:c4:00.5: 0:4: In reset, cleaning up path,
> > > port->port = 4 hopid = 8
> > > [    3.389203] thunderbolt 0000:c4:00.5: 0:4: deactivating_hop port = 4
> > > hop_index=8
> > > [    3.389682] thunderbolt 0000:c4:00.5: 0:5: Found PCI Down
> > > [    3.389811] thunderbolt 0000:c4:00.5: 0:5: In reset, cleaning up path,
> > > port->port = 5 hopid = 8
> > > [    3.389817] thunderbolt 0000:c4:00.5: 0:5: deactivating_hop port = 5
> > > hop_index=8
> > > [    3.390296] thunderbolt 0000:c4:00.5: 0:6: Found DP IN
> > > [    3.390555] thunderbolt 0000:c4:00.5: 0:6: In reset, cleaning up path,
> > > port->port = 6 hopid = 8
> > > [    3.390558] thunderbolt 0000:c4:00.5: 0:6: deactivating_hop port = 6
> > > hop_index=8
> > > [    3.390686] thunderbolt 0000:c4:00.5: 0:6: In reset, cleaning up path,
> > > port->port = 6 hopid = 9
> > > [    3.390689] thunderbolt 0000:c4:00.5: 0:6: deactivating_hop port = 6
> > > hop_index=9
> > > [    3.390816] thunderbolt 0000:c4:00.5: 0:7: Found DP IN
> > > [    3.391077] thunderbolt 0000:c4:00.5: 0:7: In reset, cleaning up path,
> > > port->port = 7 hopid = 8
> > > [    3.391080] thunderbolt 0000:c4:00.5: 0:7: deactivating_hop port = 7
> > > hop_index=8
> > > [    3.391213] thunderbolt 0000:c4:00.5: 0:7: In reset, cleaning up path,
> > > port->port = 7 hopid = 9
> > > [    3.391217] thunderbolt 0000:c4:00.5: 0:7: deactivating_hop port = 7
> > > hop_index=9
> > > [    3.391342] Reset success
> > > [    3.391391] thunderbolt 0000:c4:00.5: 0:2: switch unplugged
> > > [    3.391434] thunderbolt 0000:c4:00.5: 0:4 <-> 2:16 (USB3): deactivating
> > > [    3.391471] thunderbolt 0000:c4:00.5: deactivating USB3 Down path from
> > > 0:4 to 2:16
> > > [    3.391477] thunderbolt 0000:c4:00.5: 0:4: deactivating_hop port = 4
> > > hop_index=8
> > > [    3.391641] thunderbolt 0000:c4:00.5: 2:1: deactivating_hop port = 1
> > > hop_index=9
> > > [    3.391651] thunderbolt 0000:c4:00.5: deactivating USB3 Up path from 2:16
> > > to 0:4
> > > [    3.391659] thunderbolt 0000:c4:00.5: 2:16: deactivating_hop port = 16
> > > hop_index=8
> > > [    3.391664] thunderbolt 0000:c4:00.5: 0:2: deactivating_hop port = 2
> > > hop_index=9
> > > [    3.391701] thunderbolt 0000:c4:00.6: total paths: 3
> > > [    3.391720] thunderbolt 0000:c4:00.6: IOMMU DMA protection is disabled
> > > [    3.392027] thunderbolt 0000:c4:00.5: 0:5 <-> 2:9 (PCI): deactivating
> > > [    3.392154] thunderbolt 0000:c4:00.5: deactivating PCIe Down path from
> > > 2:9 to 0:5
> > > [    3.392163] thunderbolt 0000:c4:00.5: 2:9: deactivating_hop port = 9
> > > hop_index=8
> > > [    3.392170] thunderbolt 0000:c4:00.5: 0:2: deactivating_hop port = 2
> > > hop_index=10
> > > [    3.392534] thunderbolt 0000:c4:00.5: deactivating PCIe Up path from 0:5
> > > to 2:9
> > > [    3.392539] thunderbolt 0000:c4:00.5: 0:5: deactivating_hop port = 5
> > > hop_index=8
> > > [    3.392637] thunderbolt 0000:c4:00.5: 2:1: deactivating_hop port = 1
> > > hop_index=10
> > > [    3.392799] thunderbolt 0-2: device disconnected
> > > 
> > > But it seems like we are not cleaning up all the paths ?
> > To me this looks correct and even your dmesg the PCIe tunnel that gets
> > established after the "reset" seems to be working just fine. I also see
> > that in your log you are doing the discovery before reset even though
> > the original idea was to avoid it.
> I did this as an experiment to collect logs and check if we are resetting
> the same
> path config. Just to get a comparison view.

Okay.

> > In any case this was a good experiment. I will see if I can get this
> > working on my side if I have some spare time during holidays.
> Sure. I'll keep trying too.
> > I guess we can to with the discovery but taking into account the
> > "host_reset".
> Yes, along with changes in lc.c for <= TBT3

Right.

> > One additional question though, say we have PCIe tunnel established by
> > the BIOS CM and we do the "reset", that means there will be hot-remove
> > on the PCIe side and then hotplug again, does this slow down the boot
> > considerably? We have some delays there in the PCIe code that might hit
> > us here although I agree that we definitely prefer working system rather
> > than fast-booting non-working system but perhaps the delays are not
> > noticeable by the end-user?
> I've not observed any delay which is noticeable. As soon as I get the login
> screen
> and check dmesg, it would already be enumerated.

Okay, I need to try it on my side too.

> And moreover, this scenario is applicable only when dock stays connected
> during reboot or S5.

Which is pretty common case. Laptop with a docking station.

