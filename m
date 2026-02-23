Return-Path: <linux-usb+bounces-33542-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCc1LFfsm2km9gMAu9opvQ
	(envelope-from <linux-usb+bounces-33542-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 06:57:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 154A8171FE7
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 06:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02D4330234F0
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 05:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE053451C8;
	Mon, 23 Feb 2026 05:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DyU9dHGr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AEFEADC;
	Mon, 23 Feb 2026 05:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771826160; cv=none; b=qt9cTHOQmHNmJkdoj6kDUkDQgM+539LBVrzCizjHG+gNG3hpMruWrmiax93+RWooSAeH2W5yYxj8Ma5bAGjj8LQNkb4pnb2P+q8cdSHeQTOayj2rVHDngeGs79MPHlhOwa8RHPVcsyUbTZI879x3IjEGGWjbnZCLWsNmaiQVruM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771826160; c=relaxed/simple;
	bh=cgqYk0D+owyjpUoM+y/GTAwTRl5Ej9sIXTmU9HaZirs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZS0GM/XuOkUviUHO3e/TrwUHOxCPBRwXswwi3H1kh2ekLuDiNpa/C9uTwFAYFFMH5UqtV31IV7+DOjOLE23R6ncBHkP457hxm/Pq95gAAGCQ4lmR+AsMwafvC/PdrOq+Hrqwql101MoWNBH0WwjhMIFXfVRahk7h/BmncX4THU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DyU9dHGr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771826158; x=1803362158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cgqYk0D+owyjpUoM+y/GTAwTRl5Ej9sIXTmU9HaZirs=;
  b=DyU9dHGrIcafuKTPxIOjbvGuxFpG3wXN4Pu0FJ86KDbyYOLVTgZDVzKh
   Xbo7MaixopHWumbij+Dg9gKUE0Y6vTTjOsJUy/q4I6/R03Ak41h2CEULs
   bTPVYNKAGbPkncVNxoRcLDtFqNRcR924lq/DluWHhE5SR3Qfe2vhnYhsx
   y1CLo2XYQ0KxzraEr9unefHw+M+2F+KFeV287Ip13I5oV9qGtQ51VjV7V
   vKCCuc9ncN4kWet0loEvLdCjuhfZOMQlLYebAhfo3eolRIrcPtJxyvaTo
   SQ/ISEaJleCg6WLws3RcKmLO2ZpwWjrnhd/FnaVsOHv51/r5+749CupX4
   Q==;
X-CSE-ConnectionGUID: knMtWeiFT4K1wBKzvkuxzQ==
X-CSE-MsgGUID: qmnsqrNnSQqXxkY6unx8IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76677338"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="76677338"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 21:55:57 -0800
X-CSE-ConnectionGUID: 8O40J/CgQNSE3ZzkI0cTzA==
X-CSE-MsgGUID: r9R5lUl8RRuuUGd/LqNMog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="214544330"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 22 Feb 2026 21:55:55 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B344C95; Mon, 23 Feb 2026 06:55:53 +0100 (CET)
Date: Mon, 23 Feb 2026 06:55:53 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: AceLan Kao <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>,
	Sanath.S@amd.com, "Kovacs, Alexander" <Alexander.Kovacs@amd.com>
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <20260223055553.GL2275908@black.igk.intel.com>
References: <20260127084513.GC2275908@black.igk.intel.com>
 <20260127101701.GI2275908@black.igk.intel.com>
 <aXrZK-WigVeqxBTT@acelan-Precision-5480>
 <20260129065003.GS2275908@black.igk.intel.com>
 <CAFv23QkN1ypnMq0VwmUbfrxcyqihM1G8Ga3sgiTOWT5rtRnSmA@mail.gmail.com>
 <20260212070754.GF2275908@black.igk.intel.com>
 <20260212073419.GG2275908@black.igk.intel.com>
 <651677b6-bdc7-42a0-a568-6a81761ceb65@amd.com>
 <49393a7d-5b7d-4a80-af62-11856196fed0@amd.com>
 <62c64b3b-2582-4c00-b122-3a448057a495@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62c64b3b-2582-4c00-b122-3a448057a495@amd.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[canonical.com,gmail.com,kernel.org,vger.kernel.org,linux.intel.com,amd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-33542-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 154A8171FE7
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 03:35:36PM -0600, Mario Limonciello wrote:
> On 2/18/26 1:21 PM, Mario Limonciello wrote:
> > On 2/12/26 6:34 PM, Mario Limonciello wrote:
> > > ++
> > > 
> > > On 2/12/2026 1:34 AM, Mika Westerberg wrote:
> > > > [+Cc AMD folks]
> > > > 
> > > > On Thu, Feb 12, 2026 at 08:07:54AM +0100, Mika Westerberg wrote:
> > > > > On Thu, Feb 12, 2026 at 12:16:03PM +0800, AceLan Kao wrote:
> > > > > > > > Disable runpm on 62:02.0, then we have 83:00.0
> > > > > > > > and its downstream port
> > > > > > > > 84:01.0 and 85:00.0, and then the tbt storage is recognized.
> > > > > > Got troubles with mutt, my reply got rejected :(
> > > > > > 
> > > > > > Using gmail and copy/paste the content below again.
> > > > > 
> > > > > Okay.
> > > > > 
> > > > > > > Okay that means there is nothing wrong with the PCIe
> > > > > > > tunnel itself it's
> > > > > > > just that the PCIe side either does not get the PME
> > > > > > > or does not see that
> > > > > > > the PCIe link becomes active (e.g the PCIe
> > > > > > > Downstream Port runtime suspends
> > > > > > > itself before the link status changes).
> > > > > > > 
> > > > > > > PME work so that there is wake first on Intel it's
> > > > > > > GPE that wakes up the
> > > > > > > root port and then PCIe stack wakes up devices and
> > > > > > > then the PME message is
> > > > > > > sent to the root complex.
> > > > > > > 
> > > > > > > If you do this on Intel host do you see the same?
> > > > > > Intel host exhibits another symptom, I think the root
> > > > > > cause is different.
> > > > > > 
> > > > > > Plug in the dock, and then plug in the tbt storage to the dock one by
> > > > > > one, both storage can be detected.
> > > > > > 
> > > > > > Plug both tbt storage to the dock, and then plug in the dock to the
> > > > > > machine, only one tbt storage appears. In rare chance, both tbt
> > > > > > storages show up, but most of the time, only one tbt
> > > > > > storage is detected.
> > > > > > In this case, none of disable runpm, rescan, or lspci work. So, it's
> > > > > > most likely another issue.
> > > > > 
> > > > > By "detected" you mean the TB device is not detected on TB
> > > > > bus? Or it is
> > > > > detected on TB bus but creating PCIe tunnel does not make the content
> > > > > visible on PCIe bus?
> > > > > 
> > > > > You can check this from dmesg, the driver logs if it sees
> > > > > the plug event.
> > > > > Or run tblist (from tbtools) and see if the device is listed.
> > > > > 
> > > > > I suspect former and in that case it is likely a PD/retimer
> > > > > related issue
> > > > > rather than software. I see these once in a while especially with new
> > > > > hardware where the PD firmare is not yet stabilized. If
> > > > > there is TB/ USB4
> > > > > link then all is working from TB/USB4 perspective.
> > > > > 
> > > > > > > Right at that point the PCIe Downstream Port probably is already back
> > > > > > > runtime suspended.
> > > > > > > 
> > > > > > > Here you could try this:
> > > > > > > 
> > > > > > > # echo 250 >
> > > > > > > /sys/bus/pci/devices/0000:62:02.0/power/
> > > > > > > autosuspend_delay
> > > > > > No luck, I enlarged the number to 1000, but still can't recognize the
> > > > > > second tbt storage.
> > > > > 
> > > > > What about -1?
> > > > > 
> > > > > That's effectively same as blocking runtime PM completely so
> > > > > should work.
> > > > > 
> > > > > > I tried to wake up the PCIe ports in the beginning of
> > > > > > tb_tunnel_pci() and
> > > > > > it works.
> > > > > > 
> > > > > > +       pdev = pci_get_domain_bus_and_slot(0, 0x62,
> > > > > > PCI_DEVFN(0x02, 0));
> > > > > > +       if (pdev) {
> > > > > > +               if (pdev->dev.power.runtime_status == RPM_SUSPENDED)
> > > > > > +                       pm_runtime_get_sync(&pdev->dev);
> > > > > > +               pci_dev_put(pdev);
> > > > > > +       }
> > > > > > 
> > > > > > But I can't find a generic way to get the bus and slot number, and
> > > > > > would you consider this a feasible approach?
> > > > > 
> > > > > No I don't want any (more) PCI related hacks in the driver.
> > > > > 
> > > > > This is not a TB issue, it's a PCIe issue. I suspect it has
> > > > > something to do
> > > > > with handling PME/GPE on AMD side. Essentially when runtime
> > > > > PM is blocked
> > > > > the PCIe hotplug driver notices the tunnel just fine. When
> > > > > it is runtime
> > > > > suspended (e.g D3) it should send PME to the root complex
> > > > > that the brings
> > > > > the topology up so that the hotplug driver can detect the
> > > > > presence but this
> > > > > does not seem to happen.
> > > > > 
> > > > > If you enable dynamic debugging of pciehp, do you see
> > > > > anything happening
> > > > > when you create the second PCIe tunnel? I suspect not.
> > > 
> > >  From what I see above I agree this does seem like a PME delivery
> > > issue of some sort.  Any chance you can put this on a PCIe analyzer
> > > and confirm whether the PME was ever sent?
> > 
> > We could reproduce the behavior on our side using a USB4 hub and two
> > NVME disks.  Keeping the root port for tunneling at D0 (turning off
> > runtime PM) avoided it.
> > 
> > In cross referencing an Intel system (Intel Core Ultra 200V) we saw that
> > it couldn't reproduce.  But looking at differences we noticed the root
> > port for tunneling on this system stayed at D0 the entire time.  Is that
> > expected?
> > 
> > 
> 
> Actually in further re-testing that was an incorrect observation.  Our
> internal team will keep digging into what's going on with the PME in the AMD
> case.

Okay thanks for the update!

