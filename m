Return-Path: <linux-usb+bounces-32901-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJRnMigDe2kyAgIAu9opvQ
	(envelope-from <linux-usb+bounces-32901-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 07:50:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30899AC546
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 07:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D482300D30C
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 06:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F751378D88;
	Thu, 29 Jan 2026 06:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maXg4OCV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574103783C9;
	Thu, 29 Jan 2026 06:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769669409; cv=none; b=pdqPU0pFZYV0+c231r9xqq8ekbUABqA2oTf0/S6Gz5050De2KKFxniQlUwGxiV/VPVFDCrbFtsemdPEcKKFaYqINzbei+AnzouYreSG/T6zpbE2jEEizG0s+sQ/cfnBYnWmhZlPWGv8nzAyMgTKB45lvcow3Cd7uBNDYzgWNYn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769669409; c=relaxed/simple;
	bh=rIQAVOCz+f97EPxzFk61yTTQonXhO9MxDnandAq8lno=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfNL89MUKjgQ4jctuDcHKcicalPy+lE6rUk3d91dkTS1V7UURlNnNDLNiujVr966yB77gr8Km2s096v1sMcyjPn+TisBNvoNdeTOPMdpPTpKpZGXIKv5EMl+o9+jn7zSTnrAmKNZXeDBa8Jk8elPXAk11eCZkix8KD3gXO6ug7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maXg4OCV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769669407; x=1801205407;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=rIQAVOCz+f97EPxzFk61yTTQonXhO9MxDnandAq8lno=;
  b=maXg4OCVrrwDpaeCR03PletGrZR++b5HKT+tziEJlFDKkHHsSKHZKOiW
   aprOxoBnU/lPONDwZ3+uGaQg048ReZ8naexFY7w6ePu9dOfjcRnR0ffWC
   QQnOaXl5RFF1N4+yAlenh/6HCY9J7wJ3uIuVkaV8RJZqjp/DzKc6XCykZ
   c52F4VlQNh8w3ivzghhCaa7iDhyEiiFPWp9gevqFsi6++nU6IaRdLsMU9
   AWavgzCEfZIOU7BPWBO4aSBc89Gzbvs2cZ53MW7QNkJgDGe4bk6CupnZX
   zt99VvV4ahFaB/yQRB38N9VZgWAOu+HsqUpFGwu5rYvQXHuTz/0atbKzl
   g==;
X-CSE-ConnectionGUID: 2/fNtvqRTGibWJeKfsWjIA==
X-CSE-MsgGUID: DXhdVsLtT+u12elAqfYOgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="96362018"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="96362018"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 22:50:06 -0800
X-CSE-ConnectionGUID: pnTLk1WETsis4vkambqKkA==
X-CSE-MsgGUID: fJ9YBovNRHiOpmyQez8AqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208843955"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jan 2026 22:50:04 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9F04495; Thu, 29 Jan 2026 07:50:03 +0100 (CET)
Date: Thu, 29 Jan 2026 07:50:03 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <20260129065003.GS2275908@black.igk.intel.com>
References: <aXLM5vk0gDNjLPyY@acelan-Precision-5480>
 <20260123120112.GQ2275908@black.igk.intel.com>
 <aXbTfLUJ-lEfNzgX@acelan-Precision-5480>
 <20260126054231.GR2275908@black.igk.intel.com>
 <aXcWNw9Qfo5L9WVi@acelan-Precision-5480>
 <20260126115654.GS2275908@black.igk.intel.com>
 <aXg1eBudRAaCZpmR@acelan-Precision-5480>
 <20260127084513.GC2275908@black.igk.intel.com>
 <20260127101701.GI2275908@black.igk.intel.com>
 <aXrZK-WigVeqxBTT@acelan-Precision-5480>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXrZK-WigVeqxBTT@acelan-Precision-5480>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32901-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[canonical.com,gmail.com,kernel.org,vger.kernel.org,linux.intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 30899AC546
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 01:45:51PM +0800, Chia-Lin Kao (AceLan) wrote:
> On Tue, Jan 27, 2026 at 11:17:01AM +0100, Mika Westerberg wrote:
> > On Tue, Jan 27, 2026 at 09:45:13AM +0100, Mika Westerberg wrote:
> > > On Tue, Jan 27, 2026 at 01:04:20PM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > On Mon, Jan 26, 2026 at 12:56:54PM +0100, Mika Westerberg wrote:
> > > > > On Mon, Jan 26, 2026 at 03:48:48PM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > > > On Mon, Jan 26, 2026 at 06:42:31AM +0100, Mika Westerberg wrote:
> > > > > > > On Mon, Jan 26, 2026 at 11:30:47AM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > > > > > Hi,
> > > > > > > > On Fri, Jan 23, 2026 at 01:01:12PM +0100, Mika Westerberg wrote:
> > > > > > > > > Hi,
> > > > > > > > >
> > > > > > > > > On Fri, Jan 23, 2026 at 10:04:11AM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > > > > > > > > Can you comment out call to tb_switch_xhci_connect() and see if that
> > > > > > > > > > > changes anything?
> > > > > > > > > >
> > > > > > > > > > Here is what I modified, and the problem becomes a little bit complicated.
> > > > > > > > >
> > > > > > > > > Okay I see it did not change anything (well this is kind of what I
> > > > > > > > > expected). Thanks for trying.
> > > > > > > > >
> > > > > > > > > I see in your log that the PCIe tunnel is established just fine. It's just
> > > > > > > > > that there is no PCIe hotplug happening or it is happening but the PCIe
> > > > > > > > > Downstream Port is not waking up.
> > > > > > > > >
> > > > > > > > > I figured you have following USB4/TB topology, right?
> > > > > > > > >
> > > > > > > > >   AMD Host <-> GR Hub <-> TB3 Hub
> > > > > > > > >                   ^
> > > > > > > > >                   |
> > > > > > > > >                 TB3 Hub
> > > > > > > > Should be more like this
> > > > > > > >   AMD Host <-> Dell TB4 Dock <-> OWC Envoy Express (1-502)
> > > > > > > >                              \
> > > > > > > >                               <-> OWC Envoy Express (1-702)
> > > > > > > > or
> > > > > > > >   AMD Host (1-0, domain1)
> > > > > > > >       |
> > > > > > > >       └─ Port 2 ──→ Dell Thunderbolt 4 Dock (1-2)
> > > > > > > >                       ├─ Port 5 ──→ OWC Envoy Express (1-502)
> > > > > > > >                       └─ Port 7 ──→ OWC Envoy Express (1-702)
> > > > > > >
> > > > > > > Okay so the same ;-)
> > > > > > >
> > > > > > > > > What if you run 'lspci' after the issue reproduces? Does that bring the
> > > > > > > > > missing PCIe devices? I suspect that this is due to older TB3 devices that
> > > > > > > > > they may need bit more time to get the PCIe link (going over the tunnel) up
> > > > > > > > > and running.
> > > > > > > > lspci doesn't bring back the missing tbt storage.
> > > > > > >
> > > > > > > Forgot to mention that let it (the whole topology) enter runtime suspend
> > > > > > > before you run lspci.
> > > > > >
> > > > > > https://people.canonical.com/~acelan/bugs/tbt_storage/dmesg_lspci.log
> > > > > >
> > > > > > The behavior is strange, the following 3 devices keep entering D3cold and then comes back
> > > > > > to D0 quickly. So, I'm not sure if the lspci do the actions you want.
> > > > >
> > > > > Yes. I should have mentioned so the lspci is there exactly to trigger
> > > > > runtime resume of the topology. I was hoping the PCIe links get
> > > > > re-established properly then.
> > > > >
> > > > > Can you do so that you:
> > > > >
> > > > > 1. Plug in the dock.
> > > > > 2. Plug in the other storage to the dock.
> > > > > 3. Block runtime PM from the PCIe Downstream Port that should lead to the
> > > > >    second storage device PCIe Upstream Port
> > > > >
> > > > >  # echo on > /sys/bus/pci/devices/DEVICE/power/control
> > > > >
> > > > > 4. Connect the second storage device and enable PCIe tunnel.
> > > > >
> > > > > Does that make it work each time?
> > > > Yes, follow the steps makes it work.
> > > >
> > > >    echo on | sudo tee /sys/bus/pci/devices/*/*/power/control
> > > >
> > > > Re-plug the dock, need to disable the runpm again.
> > >
> > > But can you just block it from the PCIe Downstream Port that leads to the
> > > "non-working" storage before you enable PCIe tunnel? Not for all the
> > > devices.
> > >
> > > (let me know if you want help locating the correct device).
> > >
> > > Does it still work?
> Here's the full PCI device chain graph:
> 
>     0000:00:01.2 - AMD PCI Root Port
>         |
>         └─ 0000:61:00.0 - Intel Thunderbolt 4 Bridge [Goshen Ridge 2020]
>                |
>                └─ 0000:62:02.0 - Intel Thunderbolt 4 Bridge [Goshen Ridge 2020]
>                       |
>                       └─ 0000:83:00.0 - Intel TBT3 Bridge (Upstream Port) [Alpine Ridge LP]
>                              |
>                              └─ 0000:84:01.0 - Intel TBT3 Bridge (Downstream Port) [Alpine Ridge LP]
>                                     |
>                                     └─ 0000:85:00.0 - Sandisk PC SN740 NVMe SSD (nvme2)
> 
> When the tbt storage is not recognized, we don't have 83:00.0 and its
> downstream port 84:01.0.
> 
> $ ls /sys/bus/pci/devices
> 0000:00:00.0  0000:00:02.1  0000:00:08.1  0000:00:18.1  0000:00:18.7  0000:62:04.0  0000:c3:00.0  0000:c5:00.5  0000:c7:00.4
> 0000:00:00.2  0000:00:02.3  0000:00:08.2  0000:00:18.2  0000:61:00.0  0000:a2:00.0  0000:c4:00.0  0000:c5:00.7  0000:c7:00.5
> 0000:00:01.0  0000:00:02.4  0000:00:08.3  0000:00:18.3  0000:62:00.0  0000:a3:01.0  0000:c5:00.0  0000:c6:00.0  0000:c7:00.6
> 0000:00:01.1  0000:00:02.5  0000:00:14.0  0000:00:18.4  0000:62:01.0  0000:a4:00.0  0000:c5:00.1  0000:c6:00.1
> 0000:00:01.2  0000:00:03.0  0000:00:14.3  0000:00:18.5  0000:62:02.0  0000:c1:00.0  0000:c5:00.2  0000:c7:00.0
> 0000:00:02.0  0000:00:08.0  0000:00:18.0  0000:00:18.6  0000:62:03.0  0000:c2:00.0  0000:c5:00.4  0000:c7:00.3
> 
> Disable runpm on 62:02.0, then we have 83:00.0 and its downstream port
> 84:01.0 and 85:00.0, and then the tbt storage is recognized.

Okay that means there is nothing wrong with the PCIe tunnel itself it's
just that the PCIe side either does not get the PME or does not see that
the PCIe link becomes active (e.g the PCIe Downstream Port runtime suspends
itself before the link status changes).

PME work so that there is wake first on Intel it's GPE that wakes up the
root port and then PCIe stack wakes up devices and then the PME message is
sent to the root complex.

If you do this on Intel host do you see the same?

> 
> $ echo on | sudo tee /sys/bus/pci/devices/0000:62:02.0/power/control
> on
> 
> $ ls /sys/bus/pci/devices
> 0000:00:00.0  0000:00:02.1  0000:00:08.1  0000:00:18.1  0000:00:18.7  0000:62:04.0  0000:a4:00.0  0000:c5:00.1  0000:c6:00.1
> 0000:00:00.2  0000:00:02.3  0000:00:08.2  0000:00:18.2  0000:61:00.0  0000:83:00.0  0000:c1:00.0  0000:c5:00.2  0000:c7:00.0
> 0000:00:01.0  0000:00:02.4  0000:00:08.3  0000:00:18.3  0000:62:00.0  0000:84:01.0  0000:c2:00.0  0000:c5:00.4  0000:c7:00.3
> 0000:00:01.1  0000:00:02.5  0000:00:14.0  0000:00:18.4  0000:62:01.0  0000:85:00.0  0000:c3:00.0  0000:c5:00.5  0000:c7:00.4
> 0000:00:01.2  0000:00:03.0  0000:00:14.3  0000:00:18.5  0000:62:02.0  0000:a2:00.0  0000:c4:00.0  0000:c5:00.7  0000:c7:00.5
> 0000:00:02.0  0000:00:08.0  0000:00:18.0  0000:00:18.6  0000:62:03.0  0000:a3:01.0  0000:c5:00.0  0000:c6:00.0  0000:c7:00.6
> 
> BTW, rescan also workaround the issue
> 
> $ echo 1 | sudo tee /sys/bus/pci/devices/0000:62:02.0/rescan
> >
> > (+Gil)
> >
> > There is also one patch that fixes the driver to follow more closely the CM
> > guide and that's related to the PCIe tunneling and may actually explain the
> > issue you see:
> >
> >   https://lore.kernel.org/linux-usb/20260127094953.GF2275908@black.igk.intel.com/
> >
> > Note it only does that for USB4 routers so you may need to tune that so
> > that it skips that check but there is complication because IIRC LTTSM bits
> > do not match the USB4 ones. One thing to try is to just check the USB4 PCIe
> > adapter side that it is in detect.
> I applied this series directly on top of 6.19-rc6, and the issue
> persists.
> 
> Here is the modification I tried, but it doesn't work.
> 
> diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
> index 51fd05b3e341..0672d3e3c24e 100644
> --- a/drivers/thunderbolt/tunnel.c
> +++ b/drivers/thunderbolt/tunnel.c
> @@ -302,14 +302,38 @@ static int tb_pci_pre_activate(struct tb_tunnel *tunnel)
>         struct tb_port *up = tunnel->dst_port;
>         int ret;
> 
> -       if (!tb_switch_is_usb4(down->sw) || !tb_switch_is_usb4(up->sw))
> -               return 0;
> +       /*
> +        * Try checking LTSSM state for both USB4 and TBT3 devices.
> +        * Check at least the USB4 side if only one side is USB4.
> +        */
> +       tb_port_dbg(down, "PCIe downstream port: USB4=%d\n", tb_switch_is_usb4(down->sw));
> +       tb_port_dbg(up, "PCIe upstream port: USB4=%d\n", tb_switch_is_usb4(up->sw));
> 
> -       ret = usb4_pci_port_check_ltssm_state(down, TB_PCIE_LTSSM_DETECT);
> -       if (ret)
> -               return ret;
> +       if (tb_switch_is_usb4(down->sw)) {
> +               tb_port_dbg(down, "Checking PCIe downstream LTSSM state\n");
> +               ret = usb4_pci_port_check_ltssm_state(down, TB_PCIE_LTSSM_DETECT);
> +               if (ret) {
> +                       tb_port_warn(down, "PCIe adapter not in detect state: %d\n", ret);
> +                       return ret;
> +               }
> +               tb_port_dbg(down, "PCIe downstream adapter in detect state\n");
> +       } else {
> +               tb_port_dbg(down, "Skipping LTSSM check (not USB4)\n");
> +       }
> +
> +       if (tb_switch_is_usb4(up->sw)) {
> +               tb_port_dbg(up, "Checking PCIe upstream LTSSM state\n");
> +               ret = usb4_pci_port_check_ltssm_state(up, TB_PCIE_LTSSM_DETECT);
> +               if (ret) {
> +                       tb_port_warn(up, "PCIe adapter not in detect state: %d\n", ret);
> +                       return ret;
> +               }
> +               tb_port_dbg(up, "PCIe upstream adapter in detect state\n");
> +       } else {
> +               tb_port_dbg(up, "Skipping LTSSM check (not USB4)\n");
> +       }
> 
> -       return usb4_pci_port_check_ltssm_state(up, TB_PCIE_LTSSM_DETECT);
> +       return 0;
>  }
> 
>  static int tb_pci_set_ext_encapsulation(struct tb_tunnel *tunnel, bool enable)
> 
> $ sudo dmesg | egrep "PCIe|USB4"
> 
> Plug the first tbt storage,
> 
> [  460.465644] [1668] thunderbolt 0000:c7:00.6:  Port 4: 8086:15c0 (Revision: 1, TB Version: 1, Type: PCIe (0x100102))
> [  460.891208] [3953] thunderbolt 0000:c7:00.6: 2:12: PCIe downstream port: USB4=1
> [  460.891210] [3953] thunderbolt 0000:c7:00.6: 702:4: PCIe upstream port: USB4=0
> [  460.891212] [3953] thunderbolt 0000:c7:00.6: 2:12: Checking PCIe downstream LTSSM state
> [  460.891327] [3953] thunderbolt 0000:c7:00.6: 2:12: PCIe downstream adapter in detect state
> [  460.891328] [3953] thunderbolt 0000:c7:00.6: 702:4: Skipping LTSSM check (not USB4)
> [  460.891329] [3953] thunderbolt 0000:c7:00.6: activating PCIe Down path from 2:12 to 702:4
> [  460.891849] [3953] thunderbolt 0000:c7:00.6: PCIe Down path activation complete
> [  460.891850] [3953] thunderbolt 0000:c7:00.6: activating PCIe Up path from 702:4 to 2:12
> [  460.892375] [3953] thunderbolt 0000:c7:00.6: PCIe Up path activation complete
> [  461.018893] pci 0000:a2:00.0: [8086:15c0] type 01 class 0x060400 PCIe Switch Upstream Port
> [  461.019746] pci 0000:a2:00.0: 2.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x1 link at 0000:00:01.2 (capable of 8.000 Gb/s with 2.5 GT/s PCIe x4 link)
> [  461.020620] pci 0000:a3:01.0: [8086:15c0] type 01 class 0x060400 PCIe Switch Downstream Port
> [  461.021846] pci 0000:a4:00.0: [144d:a809] type 00 class 0x010802 PCIe Endpoint
> [  461.022555] pci 0000:a4:00.0: 2.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x1 link at 0000:00:01.2 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
> 
> And then the second tbt storage,
> 
> [  472.025559] [1668] thunderbolt 0000:c7:00.6:  Port 4: 8086:15c0 (Revision: 1, TB Version: 1, Type: PCIe (0x100102))
> [  472.451726] [3953] thunderbolt 0000:c7:00.6: 2:11: PCIe downstream port: USB4=1
> [  472.451728] [3953] thunderbolt 0000:c7:00.6: 502:4: PCIe upstream port: USB4=0
> [  472.451729] [3953] thunderbolt 0000:c7:00.6: 2:11: Checking PCIe downstream LTSSM state
> [  472.451851] [3953] thunderbolt 0000:c7:00.6: 2:11: PCIe downstream adapter in detect state
> [  472.451852] [3953] thunderbolt 0000:c7:00.6: 502:4: Skipping LTSSM check (not USB4)
> [  472.451853] [3953] thunderbolt 0000:c7:00.6: activating PCIe Down path from 2:11 to 502:4
> [  472.452373] [3953] thunderbolt 0000:c7:00.6: PCIe Down path activation complete
> [  472.452374] [3953] thunderbolt 0000:c7:00.6: activating PCIe Up path from 502:4 to 2:11
> [  472.452893] [3953] thunderbolt 0000:c7:00.6: PCIe Up path activation complete
> 
> My issue should be happening after the PCIe tunnel is activated.

Right at that point the PCIe Downstream Port probably is already back
runtime suspended.

Here you could try this:

# echo 250 > /sys/bus/pci/devices/0000:62:02.0/power/autosuspend_delay

It should keep the port wake little more longer hopefully it can then catch
the link becoming active.

