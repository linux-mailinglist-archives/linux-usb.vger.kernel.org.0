Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDD04749DD3
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jul 2023 15:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbjGFNeW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jul 2023 09:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbjGFNeU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jul 2023 09:34:20 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FAF1BF2
        for <linux-usb@vger.kernel.org>; Thu,  6 Jul 2023 06:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688650455; x=1720186455;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=Dz/QKbDIX6Z8PZHHtd6ZkXD88qD/q9Qa1sfZcK9W/4U=;
  b=j2lkDrRREvyfAz35fsNYANz4M6pusGrpb39dBeO7XQjyJbxom7Tcvv5O
   xosIVstY4aWqJuHwNazBYBY97zI4PXYCzeYuYkOnrCBcN6Jkp44ZNjEax
   Jj4pJxNa03f/+a8b77Tx2GfukhhA5kqbGsjmutLRaXh6AWx1ASQtb3EBG
   D5b+uSNdshABMyj8aPbfmAapjxxU/t1cy6OK0PU0rF5rNw4XF9/dna6w/
   okwVDY1dLig+DGwO3iwONMgqzsZe/BwtJ7wlxB8ure/pr2yeyypiMvmFG
   yrpivr/uMC3eyfy8/v1cvEAYAuLTYHN4OPskjviZhv1fFY+wsIsubdz+c
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="348391907"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="348391907"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 06:34:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="832946451"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="832946451"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2023 06:34:12 -0700
Message-ID: <8b96cd69-324a-8f9e-fcd2-4681a43c2020@linux.intel.com>
Date:   Thu, 6 Jul 2023 16:35:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To:     =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <a45b9989-c9da-bf4e-94c8-3e1341777b4d@gmx.at>
 <20230526123655.GW45886@black.fi.intel.com>
 <0bbb844d-3348-dc28-311a-d4111f8a7f81@linux.intel.com>
 <2d12af30-4a7c-5fb3-fab8-5759296c68ac@gmx.at>
 <20230530105039.GF45886@black.fi.intel.com>
 <d6e7e0d5-0b30-d66c-2ee8-4f0c0caef0b9@gmx.at>
 <20230530121756.GG45886@black.fi.intel.com>
 <a22f8874-c2b3-92a5-e858-b877872e5284@gmx.at>
 <894ba559-9233-4428-69e7-7c0bf5c7556e@gmx.at>
 <b45b5e8a-756e-fd76-64af-d3e376997a31@linux.intel.com>
 <618d9789-fc5a-10b3-6dc9-27be5bbff666@gmx.at>
 <dd62787f-a04c-01ce-6a16-6a116f0f9c3b@linux.intel.com>
 <36d37597-c0fb-cbaa-dd7c-0f3d6b4050c1@gmx.at>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: USB issue on a TB4 controller?
In-Reply-To: <36d37597-c0fb-cbaa-dd7c-0f3d6b4050c1@gmx.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 4.7.2023 16.38, Christian Schaubschläger wrote:
> Hi Mathias,
> 
> today I got access to another Dell Latitude model, which shows the exact same issue as the Latitude from before. This time it's a slightly older model with a 12th gen Intel CPU:
> 
>    [    0.000000] DMI: Dell Inc. Latitude 5430/0260KT, BIOS 1.12.0 03/20/2023
>    [    0.092576] smpboot: CPU0: 12th Gen Intel(R) Core(TM) i5-1245U (family: 0x6, model: 0x9a, stepping: 0x4)
> 
> The issue is very easy to reproduce: just boot a recent Ubuntu 23.04 from an USB device, reboot, and the network interface on the dock is gone. Only re-plugging the dock's USB cable (or shutting down and restarting the system) helps to recover the net interface on the dock. I have three docks here (Dell WD19TB, Dell WD22TB4, Lenovo USB-C), all three show the same behaviour. Running the most recent linux kernel does not help.
> 
> If I can provide any useful logs I'd be happy to help, just let me know.
> 

I have to check if we have similar machines and docks laying around.
I'm away until August so there will be some delay on my side

Thanks
Mathias


> Thanks and best regards,
> Christian
> 
> 
> Am 01.06.23 um 15:54 schrieb Mathias Nyman:
>> On 31.5.2023 14.56, Christian Schaubschläger wrote:
>>> Hi,
>>>
>>>> Attached is a patch that adds more debugging, adds a minimum
>>>> "power on to power good" delay, (as hub reports 0ms), and checks port link
>>>> states during hub initialization.
>>>>
>>>> Does it help? Could you take logs with that patch applied.
>>>>
>>>> Only dmesg with xhci and usbcore dynamic debug are needed.
>>>> xhci traces won't help as issue seems to be between the hub inthe dock and the NIC
>>> patch applied, see logs in the attachment. The behaviour is unchanged.
>>>
>>> Thanks,
>>> Christian
>> Thanks,
>>
>> In the failed case the hub in the dock doesn't show any activity
>> on port4 where the NIC is connected. No changes, link isn't in any
>> error state. It looks just like any empty port.
>>
>> I don't have any idea what's going on.
>>
>> I guess it's not possible to connect a protocol analyzer between the
>> hub in the dock and the NIC?
>>
>> ok success case:
>>
>> [    1.712754] usb 6-2-port1: status 02a0 change 0000
>> [    1.713070] usb 6-2-port2: status 02a0 change 0000
>> [    1.713567] usb 6-2-port3: status 0203 change 0010  <- another hub
>> [    1.714184] usb 6-2-port4: status 0203 change 0010  <- NIC
>>
>> nok failed case:
>>
>> [    1.716756] usb 6-2-port1: status 02a0 change 0000
>> [    1.717036] usb 6-2-port2: status 02a0 change 0000
>> [    1.717395] usb 6-2-port3: status 0203 change 0010  <- another hub
>> [    1.717976] usb 6-2-port4: status 02a0 change 0000
>>
>> Thanks
>> Mathias
> 

