Return-Path: <linux-usb+bounces-86-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D73A7A0DF6
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 21:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A9871F242F1
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 19:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD76D266AD;
	Thu, 14 Sep 2023 19:16:00 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D1310A0C
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 19:15:58 +0000 (UTC)
X-Greylist: delayed 356 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 14 Sep 2023 12:15:57 PDT
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC68226AB;
	Thu, 14 Sep 2023 12:15:57 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 9DD80100DE9D8;
	Thu, 14 Sep 2023 21:09:59 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 68CF24C6AB5; Thu, 14 Sep 2023 21:09:59 +0200 (CEST)
Date: Thu, 14 Sep 2023 21:09:59 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J . Wysocki" <rjw@rjwysocki.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	iain@orangesquash.org.uk
Subject: Re: [PATCH v18 2/2] PCI: Add a quirk for AMD PCIe root ports w/ USB4
 controllers
Message-ID: <20230914190959.GB15568@wunner.de>
References: <20230914145332.GA5261@wunner.de>
 <20230914153303.GA30424@bhelgaas>
 <20230914190429.GA15568@wunner.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914190429.GA15568@wunner.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Sep 14, 2023 at 09:04:29PM +0200, Lukas Wunner wrote:
> On Thu, Sep 14, 2023 at 10:33:03AM -0500, Bjorn Helgaas wrote:
> > dev->no_d3cold appears to be mainly an administrative policy knob
> > twidded via sysfs.
> 
> Actually the user space choice to disable D3cold is stored in a
> different flag called pdev->d3cold_allowed.
> 
> The fact that d3cold_allowed_store() indirectly modifies the
> no_d3cold flag as well looks like a bug that went unnoticed
> for a couple of years.  From a quick look, d3cold_allowed_store()
> should probably call pci_bridge_d3_update() instead of
> pci_d3cold_enable() / pci_d3cold_disable().  This was introduced by
> commit 9d26d3a8f1b0 ("PCI: Put PCIe ports into D3 during suspend").
> Perhaps Mika can chime in whether this is indeed wrong.

Note that pci_dev_check_d3cold() checks both the no_d3cold flag
(which tells whether the *driver* disabled D3cold) and the d3cold_allowed
flag (which tells whether *user space* disabled D3cold).

Basically right now we allow user space to override the driver setting,
which feels unsafe.  (Does user space always know better than the driver
whether D3cold can safely be entered?  I don't think so.)

Thanks,

Lukas

