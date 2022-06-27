Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C387255D66B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 15:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234302AbiF0KvQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 06:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232814AbiF0KvP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 06:51:15 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E416451
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 03:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656327074; x=1687863074;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=CT5dJu0KSqgTBptP+MA5a1ZGPp7Exvf8W/THWySa6gc=;
  b=bR0qugVDBI4Ayz1KHe7Aro1YAwqeXMABs2AtS1cL2FJ6DNfPzsOTSAsu
   K2IC0/90qQE20aJ42fnw9yf3qyjo+LZuzTXzD+z1hcLgRRa3eECT8DvQn
   Cnit8TK5w+X8zsF1Hd97tSp+jjtISgvXWfSGodu2LOx4gT11wq+9K5vVU
   rP9giklDDd1HSQAaQhGSIe8+tdkCPJy029YhAS33EErRciUmvcFvW8mOU
   BSZOcz5G5d/gEktiB22+hy3S4I7vGCvK6JZWg8eI8mrT7mKB1GVfvazs8
   bV30FhogI3MJvrwg+Mo+/kM6u8IEt3b+R6O6jJReoMIeVYn6fOvLL2ZLa
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="343108271"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="343108271"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 03:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="732266842"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2022 03:51:12 -0700
Message-ID: <8917c751-76dc-98d3-83ac-652aa2249b7d@linux.intel.com>
Date:   Mon, 27 Jun 2022 13:52:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Content-Language: en-US
To:     =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-usb@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        Jon Grimm <jon.grimm@amd.com>,
        "Suthikulpanit, Suravee" <suravee.suthikulpanit@amd.com>
References: <YrXMY0Nd0Yn6XDSN@suse.de>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: DMA Faults with XHCI driver
In-Reply-To: <YrXMY0Nd0Yn6XDSN@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 24.6.2022 17.38, Jörg Rödel wrote:
> Hi Mathias,
> 
> here is a report about something strange happening on my system after a
> recent IOMMU change. I am starting to see this message at boot:
> 
> 	xhci_hcd 0000:02:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000f address=0xff00ffffffefe000 flags=0x0000]
> 
> It means that the XHCI device tried a DMA access at address
> 0xff00ffffffefe000, which was not mapped in the IOMMU page table.
> 
> Devices attached to that XHCI controller will not work after that
> message.
> 
> There is a related change in the IOMMU code which uncovered this, the
> change basically lets the IOMMU dma-allocator not allocate below 4GB by
> default, but use the whole space covered by the DMA mask.
> 
> To better track this down I limited the DMA-space to 48 bits, and the
> message still shows up.
> 
> I think this might be a problem in the XHCI driver, e.g. it might mangle
> an allocated DMA address somehow if it is bigger than 32 bit.
> 
> The device behind 0000:02:00.0 is a
> 
> 	02:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] Device 43d0 (rev 01)
> 
> Please let me know what I can do to help tracking this down.

Thanks for reporting this.

Can you boot with xhci dynamic debug and tracing enabled? could help pinpoint
when the controller is trying to access the unmapped DMA address.

Add to kernel cmdline:
xhci_hcd.dyndbg=+p trace_event=xhci-hcd trace_buf_size=80M
<boot>
mount -t debugfs none /sys/kernel/debug
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

Also if you could dump the content of following registers:
cat /sys/kernel/debug/usb/xhci/<pci address>/reg-op
cat /sys/kernel/debug/usb/xhci/<pci address>/reg-runtime

xhci driver writes dma addresses it allocated for the host into
some of those registers

Thanks
Mathias
