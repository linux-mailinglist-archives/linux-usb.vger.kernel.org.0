Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A74D70D7F0
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 10:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235540AbjEWIzX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 May 2023 04:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbjEWIzW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 May 2023 04:55:22 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7B7FF
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 01:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684832121; x=1716368121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xHJW2cSZyHx5lom9xMNlc5fKE50FU43JTCZfn3TbAHU=;
  b=i8f/F9syqOTsO8t0sejzi4osq0/VgmTnXTNUA3sco49+Uj68gkt2MHve
   81la3//vMIND0cEQ+Ba0oTME/pmAoWlGW7AEGbLprh3YjUK63PNv/1Pu0
   lc894b+IIQQXtR5gyqOvr7kqzTtDcrf+b/PVVJ5slcF5DV/uW5o8oz41r
   pWB7XA4nNvPqgqYkU43IY6a7JZYG7xWiGpMMLiukIc8ATeNOAnBBYp6e5
   DjpXlck9v9FH9KQBQSXGmXHFOZWcejuNkrNqDSPFHKg1eKT7/yjtZBQwl
   eyCGGcpmUZHU3/03HJPea5UlSRhX3yzXeL1grVxsz2tC1MAtvcaNhikc7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="337768024"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="337768024"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 01:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="848186753"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="848186753"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 May 2023 01:55:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id A416723E; Tue, 23 May 2023 11:55:23 +0300 (EEST)
Date:   Tue, 23 May 2023 11:55:23 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <20230523085523.GN45886@black.fi.intel.com>
References: <8c2da730-ba9b-6ec7-d493-1a6a2ce54622@gmx.at>
 <Y8kXFFrue7l7DKf3@black.fi.intel.com>
 <78c5218a-67ef-d61d-09fe-2c2cf7fdc87f@gmx.at>
 <0c9e644e-a07d-e9bb-f8d6-692d2412fd30@gmx.at>
 <Y9PDRYHHYNSJWwGe@black.fi.intel.com>
 <47af73e9-0d3f-0ac2-52e6-b89a87bc602b@gmx.at>
 <Y9fPxIKIOrkHmjHS@black.fi.intel.com>
 <20230306115236.GE62143@black.fi.intel.com>
 <5cb1771f-47e2-c83f-1081-6e975ed650e0@gmx.at>
 <c5193a7f-53c4-34da-f3b4-128356f9a6a0@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5193a7f-53c4-34da-f3b4-128356f9a6a0@gmx.at>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, May 23, 2023 at 10:22:28AM +0200, Christian Schaubschläger wrote:
> Hi Mika,
> 
> it seems that I have an issue here which seems similar to the one on the HP earlier this year.
> 
> This time the hardware is a Dell Latitude 7440 with a rather new Intel i5-1345U (13th Gen.) and TB4. I have three Docks, one older Dell WD19TB, a newer Dell WD22TB4, and a ThinkPad Universal USB-C Dock.
> With the TB4 dock everything works fine (meaning all hardware is functioning in the UEFI firmware as well as in Windows after booting Linux first).
> 
> With the older TB dock, as well as with the USB-C dock the network interface on the dock is dead after Linux. But in contrast to the HP case from earlier this year, this time the network interface remains dead when I boot Linux again. After replugging the dock it becomes alive again.
> 
> This can easilsy be reproduced by booting Ubuntu 22.04 from an USB device. Using a newer kernel with the UNSET_INBOUND_SBTX fix does not solve the issue.
> 
> I'm not sure if this is a USB or Thunderbolt issue, could be an issue with the network device, too (all three docks have the same Realtek 8153). But I don't see this problem with these docks on other Laptops I have access to, so probably it's not the network device...
> 
> Can I provide some logs, etc. to dive deeper into this?

Sure, I suggest also start a new email thread or file a kernel.org
bugzilla ticket.

Can you add "thunderbolt.dyndbg=+p" in the kernel command line and
reproduce the issue and share the full dmesg?
