Return-Path: <linux-usb+bounces-2461-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC6C7DF674
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 16:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08E3F281B85
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 15:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5F91CABF;
	Thu,  2 Nov 2023 15:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27921CAA7
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 15:33:53 +0000 (UTC)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601D213E;
	Thu,  2 Nov 2023 08:33:50 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 6196028046BF6;
	Thu,  2 Nov 2023 16:33:45 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 553B157544; Thu,  2 Nov 2023 16:33:45 +0100 (CET)
Date: Thu, 2 Nov 2023 16:33:45 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, bhelgaas@google.com,
	mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
	michael.jamet@intel.com, YehezkelShB@gmail.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Alexander.Deucher@amd.com
Subject: Re: [PATCH 2/2] PCI: Ignore PCIe ports used for tunneling in
 pcie_bandwidth_available()
Message-ID: <20231102153345.GA30347@wunner.de>
References: <20231101225259.GA101390@bhelgaas>
 <928df647-5b20-406b-8da5-3199f5cfbb48@amd.com>
 <20231102152154.GA22270@wunner.de>
 <bb4d8fad-dced-4fed-9582-2db50643e868@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb4d8fad-dced-4fed-9582-2db50643e868@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Nov 02, 2023 at 10:26:31AM -0500, Mario Limonciello wrote:
> On 11/2/2023 10:21, Lukas Wunner wrote:
> > On Wed, Nov 01, 2023 at 08:14:31PM -0500, Mario Limonciello wrote:
> > > Considering this I think it's a good idea to move that creation of the
> > > device link into drivers/pci/pci-acpi.c and store a bit in struct
> > > pci_device to indicate it's a tunneled port.
> > > 
> > > Then 'thunderbolt' can look for this directly instead of walking all
> > > the FW nodes.
> > > 
> > > pcie_bandwidth_available() can just look at the tunneled port bit
> > > instead of the existence of the device link.
> > 
> > pci_is_thunderbolt_attached() should already be doing exactly what
> > you want to achieve with the new bit.  It tells you whether a PCI
> > device is behind a Thunderbolt tunnel.  So I don't think a new bit
> > is actually needed.
> 
> It's only for a device connected to an Intel TBT3 controller though; it
> won't apply to USB4.

Time to resurrect this patch here...? :)

https://lore.kernel.org/all/20220204182820.130339-3-mario.limonciello@amd.com/

