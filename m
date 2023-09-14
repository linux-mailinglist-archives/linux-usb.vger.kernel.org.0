Return-Path: <linux-usb+bounces-65-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 050077A0712
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 16:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CC751C208BB
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 14:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EE322EE9;
	Thu, 14 Sep 2023 14:17:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CCA8F40
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 14:17:08 +0000 (UTC)
X-Greylist: delayed 121901 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 14 Sep 2023 07:17:07 PDT
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C87DD;
	Thu, 14 Sep 2023 07:17:07 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id EE0382800BC11;
	Thu, 14 Sep 2023 16:17:05 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id E051950E35C; Thu, 14 Sep 2023 16:17:05 +0200 (CEST)
Date: Thu, 14 Sep 2023 16:17:05 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
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
Message-ID: <20230914141705.GA27051@wunner.de>
References: <20230913040832.114610-1-mario.limonciello@amd.com>
 <20230913040832.114610-3-mario.limonciello@amd.com>
 <20230913042522.GB1359@wunner.de>
 <fd981219-d864-4c46-a348-61f73a9df596@amd.com>
 <20230913143128.GA29059@wunner.de>
 <76dfea89-e386-45e9-851c-8e87f9470c4f@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76dfea89-e386-45e9-851c-8e87f9470c4f@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Sep 13, 2023 at 11:36:49AM -0500, Mario Limonciello wrote:
> On 9/13/2023 09:31, Lukas Wunner wrote:
> > If this only affects system sleep, not runtime PM, what you can do is
> > define a DECLARE_PCI_FIXUP_SUSPEND_LATE() which calls pci_d3cold_disable()
> > and also define a DECLARE_PCI_FIXUP_CLASS_RESUME_EARLY() which calls
> > pci_d3cold_enable().
> > 
> > And I think you can make those calls conditional on pm_suspend_no_platform()
> > to constrain to s2idle.
> > 
> > User space should still be able to influence runtime PM via the
> > d3cold_allowed flag (unless I'm missing something).
> 
> The part you're missing is that D3hot is affected by this issue too,
> otherwise it would be a good proposal.

I recall that in an earlier version of the patch, you solved the issue
by amending pci_bridge_d3_possible().

Changing the dev->no_d3cold flag indirectly influences the bridge_d3
flag (through pci_dev_check_d3cold() and pci_bridge_d3_update()).

If dev->no_d3cold is set on a device below a port, that port is
prevented from entring D3hot because it would result in the
device effectively being in D3cold.

So you might want to take a closer look at this approach despite
the flag suggesting that it only influences D3cold.

Thanks,

Lukas

