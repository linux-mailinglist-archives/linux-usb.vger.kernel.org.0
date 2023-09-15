Return-Path: <linux-usb+bounces-101-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F16BF7A12E6
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 03:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B212280D38
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 01:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE95D7F4;
	Fri, 15 Sep 2023 01:24:32 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C63436A
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 01:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49779C433C7;
	Fri, 15 Sep 2023 01:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694741070;
	bh=vS3iu08Cwn5zp58ICQbFGVM/ExFnYRepOJGvP5mCAm8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OGrLN7oEYwE+06uYD2I3VrYYBqPNuK7Y2vZsZ7zWOBxzMbgRLd3Yy646Jf5mAgIDc
	 jWIR05G2vvRqUJ668iYVw0mF4mndxyjsHw9k74MCWMc6UcezRXZsd3dmjQ/Dyji/I1
	 xKYguQQOXlyVrnG0zS+Edbkw3V2M2nukT/dru00Ea5qPxEuD955hIMfzKk0VRTTQpr
	 D2hQaBAttssfX575Wr7dlcVsrtVnCtarmJuj2JY49pZa0gvim8gUwQK31OVddiGOqT
	 hJuICLCzKmSUO6H7WXOFf8nFKX397Z5fzLMRHA7GbmzLuGBhDrUuhFJqom/6yvLUzt
	 ZNg98N5TABXmQ==
Date: Thu, 14 Sep 2023 20:24:27 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J . Wysocki" <rjw@rjwysocki.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	"open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
	"open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
	linux-pm@vger.kernel.org,
	"open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
	iain@orangesquash.org.uk
Subject: Re: [PATCH v18 2/2] PCI: Add a quirk for AMD PCIe root ports w/ USB4
 controllers
Message-ID: <20230915012427.GA87601@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67fe444c-e3e4-4063-a7ad-e0c3c835bc68@amd.com>

On Thu, Sep 14, 2023 at 07:55:46PM -0500, Mario Limonciello wrote:
> On 9/13/2023 23:59, Mario Limonciello wrote:
> > On 9/13/2023 16:16, Mario Limonciello wrote:
> > > On 9/13/2023 16:05, Bjorn Helgaas wrote:
> > > [cut]
> > > > > > I expect it to be an ongoing issue.  I also expect unless we use
> > > > > > constraints or convince the firmware team to add a _S0W object with a
> > > > > > value of "0" for the sake of Linux that we will be
> > > > > > adding IDs every year
> > > > > > to wherever this lands as we reproduce it on newer SoCs.
> > > > > 
> > > > > So maybe the way to go is to make the AMD PMC driver set a flag for
> > > > > Root Ports on suspend or similar.
> > > > 
> > > > I like the quirk approach.  When PMC is involved, the device behavior
> > > > doesn't conform to what it advertised via PME_Support.
> > > > 
> > > > The v18 quirk isn't connected to PMC at all, so IIUC it avoids
> > > > D3hot/D3cold unnecessarily when amd/pmc is not loaded.
> > > > 
> > > 
> > > Technically someone could; but realistically no one will be using
> > > these machines without amd-pmc.
> > > 
> > > The battery life over suspend would be abhorrent.
> > > 
> > > > I don't object to avoiding D3hot/D3cold unconditionally.  Presumably
> > > > we *could* save a little power by using them when amd/pci isn't
> > > > loaded, but amd/pci would have to iterate through all PCI devices when
> > > > it loads, save previous state, do the quirk, and then restore the
> > > > previous state on module unload.  And it would have to use notifiers
> > > > or assume no Root Port hotplug.  All sounds kind of complicated.
> > > > 
> > > 
> > > Yeah this does sound needlessly complicated.
> > > 
> > > > Maybe it would even be enough to just clear dev->pme_support so we
> > > > know wakeups don't work.  It would be a pretty big benefit if we
> > > > didn't have to add another bit and complicate pci_prepare_to_sleep()
> > > > or pci_target_state().
> > > > 
> > > 
> > > I don't think clearing PME support entirely is going to help.  The
> > > reason is that pci_target_state() will fall back to PCI_D3hot when
> > > dev->pme_support is fully cleared.
> > > 
> > > I think that clearing *just the bits* for D3hot and D3cold in PME
> > > support should work though.  I'll test this.
> > 
> > I did confirm this works properly.
> > 
> > > 
> > > Assuming it works how about if we put the quirk to clear the
> > > D3hot/D3cold PME support bit in
> > > drivers/platform/x86/amd/pmc/pmc-quirks.c?
> > > 
> > > It's still a quirk file and it makes it very clear that this
> > > behavior is caused by what amd-pmc does.
> > 
> > I've got it coded up like this and working, so please let me know if
> > this approach is amenable and I'll drop an updated version.
> > 
> > If you would prefer it to be in pci/quirks.c I believe I can do either.
> 
> I've also got a variation with pci/quirks.c working too.
> 
> Here's the trade offs:
> 
> pci/quirks.c
> ------------
> * Two lines for every platform affected by this.  IE:
> DECLARE_PCI_FIXUP_SUSPEND(PCI_VENDOR_ID_AMD, 0x14b9,
> quirk_disable_pme_suspend);
> DECLARE_PCI_FIXUP_RESUME(PCI_VENDOR_ID_AMD, 0x14b9, quirk_reenable_pme);
> * D3hot/D3cold works at runtime (since PME works at runtime)
> * Only runs if s2idle is used
> * Runs whether amd-pmc is bound or not.
> 
> drivers/platform/x86/amd/pmc/pmc-quirks.c
> -----------------------------------------
> * 1 line for adding new affected platforms
> * Runs at probe; PME is disabled for D3hot/D3cold at runtime.
> * Only runs if s2idle is used
> * Only runs if amd-pmc is bound.
> 
> Having implemented both ways and given users will effectively always use
> amd-pmc, I have a preference towards pci/quirks.c which only patches
> dev->pme_support to drop D3hot/cold at suspend time and restores it at
> resume.
> 
> Please let me know which way you prefer.

I think the pci/quirks.c one sounds nicer.  I was envisioning a
one-time quirk where it'd be easy to log a note about this issue, but
I see why the suspend/resume quirk has advantages.  I don't really
like opaque magic behavior (like D3hot/D3cold not being used when
dmesg and lspci claim that PME in those states *should* work), but
maybe we can figure out some way to make that visible.

Bjorn

