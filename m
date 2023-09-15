Return-Path: <linux-usb+bounces-146-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517C07A1FAF
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 15:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1F3D2820F5
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 13:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5715B10964;
	Fri, 15 Sep 2023 13:19:54 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CE08485
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 13:19:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53ED171C
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694783991; x=1726319991;
  h=message-id:date:mime-version:to:references:from:subject:
   in-reply-to:content-transfer-encoding;
  bh=+MC1Zdh0Q3etLfuKz7k5g+vBh0JVSTe/KQZZdLLyG0I=;
  b=OFBNb8oBMTatNoarAmrGs17x9EZ5CoribTRhiD/Q288/d9C3xynRyRn+
   wNpQ3qm70So22LZEoJ0UcMCWXhrtOkd5Joeu81QPFwaT1rNQf47cBxioH
   YVYkvxDGPZw4aUtrbXp9jkinQjg31rpBqkko9bs91uwZs8BpmGmrEWsCB
   NCMUMAabJwgxHbmJ2D/r11h0wBGudd5Ge7x+/tCDb/LZeEWnAZpVgF0PA
   /QCIGCAxhRxayBNL3wxQvr5zF9gtLmFaGdaI948181l/GUWz4fxax1E6S
   h8N7Cq95QVJccJdr84JELk2k32Z5r/C52AmSykGDRbEtbujPjF4K0vku1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="381973883"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="381973883"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 06:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="721677362"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="721677362"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 15 Sep 2023 06:19:27 -0700
Message-ID: <b9a2a2b9-3237-468f-d6e9-aada4188a5b7@linux.intel.com>
Date: Fri, 15 Sep 2023 16:20:49 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
 mario.limonciello@amd.com, linux-usb@vger.kernel.org
References: <20230821065742.2924681-1-Basavaraj.Natikar@amd.com>
 <20230821065742.2924681-2-Basavaraj.Natikar@amd.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 1/2] xhci: Loosen RPM as default policy to cover xHC 1.1
 as well
In-Reply-To: <20230821065742.2924681-2-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 21.8.2023 9.57, Basavaraj Natikar wrote:
> The USB host controller (1022:43f7) isn't going into PCI D3 by default
> without anything connected. This is because the policy that was introduced
> by commit a611bf473d1f ("xhci-pci: Set runtime PM as default policy on all
> xHC 1.2 or later devices") only covered 1.2 or later.
> 
> The 1.1 specification also has the same requirement as the 1.2
> specification for D3 support. So expand the runtime PM as default policy
> to 1.1 devices as well.
> 

I'm a bit hesitant to change the default policy for this many hosts in one go.
This affects all vendors.

I see a regression risk in this.
Many xhci issues have been related to runtime pm.

We do have a list of selected Intel xHCI 1.1 host that have enabled runtime pm
by default. Same could be done for 1022:43f7

Or if you are confident all AMD xHC 1.1 hosts can have this enabled, then that
works as well:

if (pdev->vendor == PCI_VENDOR_ID_AMD && xhci->hci_version >= 0x110)
	xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;

Thanks
Mathias


