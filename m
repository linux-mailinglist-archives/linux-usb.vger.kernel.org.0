Return-Path: <linux-usb+bounces-2481-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3577DFEEC
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 06:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBD3A281DEB
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 05:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D3517EC;
	Fri,  3 Nov 2023 05:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6Wdqjph"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E7917C5
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 05:48:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCD61B3;
	Thu,  2 Nov 2023 22:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698990492; x=1730526492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VhVOyEkw81ZXmzUGM0tPtiT0KqT8vYg0EKll81rp9JI=;
  b=P6WdqjphDwszzs2shDkGzU488JejphywLb7Nci9gEdHuBgdIdzUy3bDR
   N0SLNmLX+Q8S3ObRzEdL7XZlUUp5YPsxZjBkT5P0TKRxTAkM9sh8VuNaH
   ePJFHupWT6TOZGddrZ1fKUqw9IR7aaYV3JComBZbkZLmBqaaGfC6VALNH
   JiQX0IV3dl2pCPswL4o3FuO2zaL4NVjHn/ZoAHqLHWe3MZzcrXpATwHMQ
   HouPb8d/guin8LYUrQ//vch71A0/wyPybmQmSQ0JuH8MXGeb7+ZZ/PL2h
   RftI+K7KPmH2Pkc4iTnxo8yoyww5oGR67aCh2SeFrIlHH9Ml+p+OdX5oB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="455373393"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="455373393"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 22:48:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="878526916"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="878526916"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 02 Nov 2023 22:48:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 9E8172A6; Fri,  3 Nov 2023 07:48:07 +0200 (EET)
Date: Fri, 3 Nov 2023 07:48:07 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>,
	bhelgaas@google.com, andreas.noever@gmail.com,
	michael.jamet@intel.com, YehezkelShB@gmail.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Alexander.Deucher@amd.com
Subject: Re: [PATCH 2/2] PCI: Ignore PCIe ports used for tunneling in
 pcie_bandwidth_available()
Message-ID: <20231103054807.GN17433@black.fi.intel.com>
References: <20231101225259.GA101390@bhelgaas>
 <928df647-5b20-406b-8da5-3199f5cfbb48@amd.com>
 <20231102152154.GA22270@wunner.de>
 <bb4d8fad-dced-4fed-9582-2db50643e868@amd.com>
 <20231102153345.GA30347@wunner.de>
 <67e7d200-52aa-44b9-8e87-e416e3d53a6c@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67e7d200-52aa-44b9-8e87-e416e3d53a6c@amd.com>

On Thu, Nov 02, 2023 at 11:22:05AM -0500, Mario Limonciello wrote:
> On 11/2/2023 10:33, Lukas Wunner wrote:
> > On Thu, Nov 02, 2023 at 10:26:31AM -0500, Mario Limonciello wrote:
> > > On 11/2/2023 10:21, Lukas Wunner wrote:
> > > > On Wed, Nov 01, 2023 at 08:14:31PM -0500, Mario Limonciello wrote:
> > > > > Considering this I think it's a good idea to move that creation of the
> > > > > device link into drivers/pci/pci-acpi.c and store a bit in struct
> > > > > pci_device to indicate it's a tunneled port.
> > > > > 
> > > > > Then 'thunderbolt' can look for this directly instead of walking all
> > > > > the FW nodes.
> > > > > 
> > > > > pcie_bandwidth_available() can just look at the tunneled port bit
> > > > > instead of the existence of the device link.
> > > > 
> > > > pci_is_thunderbolt_attached() should already be doing exactly what
> > > > you want to achieve with the new bit.  It tells you whether a PCI
> > > > device is behind a Thunderbolt tunnel.  So I don't think a new bit
> > > > is actually needed.
> > > 
> > > It's only for a device connected to an Intel TBT3 controller though; it
> > > won't apply to USB4.
> > 
> > Time to resurrect this patch here...? :)
> > 
> > https://lore.kernel.org/all/20220204182820.130339-3-mario.limonciello@amd.com/
> 
> That thought crossed my mind, but I don't think it's actually correct.
> That's the major reason I didn't resurrect that series.
> 
> The PCIe topology looks like this:
> 
> ├─PCIe tunneled root port
> |  └─PCIe bridge/switch (TBT3 or USB4 hub)
> |    └─PCIe device
> └─PCIe root port
>   └─USB 4 Router
> 
> In this topology the USB4 PCIe class device is going to be the USB4 router.
> This *isn't* a tunneled device.
> 
> The two problematic devices are going to be that PCIe bridge (TBT or USB4
> hub) and PCIe tunneled root port.
> Looking for the class is going to mark the wrong device for the "USB 4
> Router".
> 
> I looked through the USB4 spec again and I don't see any way that such a
> port can be distinguished.
> 
> I feel the correct way to identify it is via the relationship specified in
> ACPI.

Just to add here, for discrete (eg. add in USB4 host controllers) the
USB4 spec defines DVSEC capability that can be used to figure out the
same information as the ACPI above so at least we should make the code
work so that adding the DVSEC support later on is still possible with
minimal effort :)

> FWIW I also think that that all the kernel users of
> pci_is_thunderbolt_attached() *should* be using dev_is_removable().

I tend to agree with this. There can be other "mediums" than
USB4/Thunderbolt that can carry PCIe packets.

