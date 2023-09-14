Return-Path: <linux-usb+bounces-57-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF03E7A03F5
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 14:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D22241C20FC5
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 12:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004C1241F7;
	Thu, 14 Sep 2023 12:32:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750312A2B9
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 12:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E30C433C8;
	Thu, 14 Sep 2023 12:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694694722;
	bh=CTjVxEOmb9/avVAmKzfes/nYuDn39qximLrhdUqj2Cw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ifQstyEOJn6D8AC7SkOULZ/nSJw25eKBJnxTAfVvMyWXPxrqr8KVucPrKV3qE3koW
	 54ML4xqdXKhcTJRz5wdJgHPaSorxCyxI0CPvWdwVvbOnYiW/nNl/e09OqZFpoAyFy2
	 1HO3Q01RSZgnSdEEcIn0Byf3V1UH3q312Mi0nHzCyYGuuzUcTYEskYHi4YcrOAbGVK
	 LHddJZQJzI+omi7DBv6GEugcGXKkOMDr09b+mLPUptMwoXGtdVfqIz8AD+3IUvCS2Z
	 Ih1XcY+vLUBWPohgNfRn4+kB1Dt88SzuqEHlJ4VeTtJEXou6xOLn7UZwOUItgxn/QV
	 I7lnoBhfeSxBw==
Date: Thu, 14 Sep 2023 07:32:00 -0500
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
Message-ID: <20230914123200.GA25154@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75e5175e-406e-41dd-90c7-3dc30741897e@amd.com>

On Wed, Sep 13, 2023 at 11:59:00PM -0500, Mario Limonciello wrote:
> On 9/13/2023 16:16, Mario Limonciello wrote:
> > On 9/13/2023 16:05, Bjorn Helgaas wrote:
> > [cut]
> > > > > I expect it to be an ongoing issue.  I also expect unless we use
> > > > > constraints or convince the firmware team to add a _S0W object with a
> > > > > value of "0" for the sake of Linux that we will be adding
> > > > > IDs every year
> > > > > to wherever this lands as we reproduce it on newer SoCs.
> > > > 
> > > > So maybe the way to go is to make the AMD PMC driver set a flag for
> > > > Root Ports on suspend or similar.
> > > 
> > > I like the quirk approach.  When PMC is involved, the device behavior
> > > doesn't conform to what it advertised via PME_Support.
> > > 
> > > The v18 quirk isn't connected to PMC at all, so IIUC it avoids
> > > D3hot/D3cold unnecessarily when amd/pmc is not loaded.
> > 
> > Technically someone could; but realistically no one will be using these
> > machines without amd-pmc.
> > 
> > The battery life over suspend would be abhorrent.
> > 
> > > I don't object to avoiding D3hot/D3cold unconditionally.  Presumably
> > > we *could* save a little power by using them when amd/pci isn't
> > > loaded, but amd/pci would have to iterate through all PCI devices when
> > > it loads, save previous state, do the quirk, and then restore the
> > > previous state on module unload.  And it would have to use notifiers
> > > or assume no Root Port hotplug.  All sounds kind of complicated.
> > 
> > Yeah this does sound needlessly complicated.
> > 
> > > Maybe it would even be enough to just clear dev->pme_support so we
> > > know wakeups don't work.  It would be a pretty big benefit if we
> > > didn't have to add another bit and complicate pci_prepare_to_sleep()
> > > or pci_target_state().
> > 
> > I don't think clearing PME support entirely is going to help.  The
> > reason is that pci_target_state() will fall back to PCI_D3hot when
> > dev->pme_support is fully cleared.
> > 
> > I think that clearing *just the bits* for D3hot and D3cold in PME
> > support should work though.  I'll test this.
> 
> I did confirm this works properly.
> 
> > Assuming it works how about if we put the quirk to clear the
> > D3hot/D3cold PME support bit in
> > drivers/platform/x86/amd/pmc/pmc-quirks.c?
> > 
> > It's still a quirk file and it makes it very clear that this behavior is
> > caused by what amd-pmc does.
> 
> I've got it coded up like this and working, so please let me know if this
> approach is amenable and I'll drop an updated version.
> 
> If you would prefer it to be in pci/quirks.c I believe I can do either.

If the quirk is in a loadable module, as opposed to being built-in,
does it get applied to the relevant Root Ports when the module is
loaded?  I didn't look exhaustively, but I don't see a reference to
pci_fixup_device() in the module load path.

Bjorn

