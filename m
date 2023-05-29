Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D75871483E
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjE2K6Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjE2K6O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:58:14 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B12B2
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685357892; x=1716893892;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=tT8QiTPzze6+NZXZTp5C8npME2cVeHo4l2V/z+s/u6o=;
  b=oKcMqtjgWIng1FxFf40rRGuhUaYMqiZBsu+ZjRIhBEHc/xB8xmeogbwd
   cl4JsUYeCQrXIaoP/Zgq0Ev2uLCzsjazBP0pn3cZvWlW5p+VHhEApJB0F
   Kqrxt6ufx1QXWY7EUVKvjUbCp+nbBBegesxdjhYh/gJhcRUSU5mcrVbOw
   TIT3DElZIw3lAq3cahwbs9exqupnCGaHhiU8KExGtbgOFTu4qkHjmp91e
   VrRki3Jkx+Pwou90KXwcOBrmkr2hsX50V8H9Tw+1uyLYhDzNyY98roHgw
   BV4OolSDIssMfg6oDPrXH0jIRbZXYslast3AvGbeqeQRHsGlUF+1FuMLu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="357930558"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="357930558"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:58:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="771128205"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="771128205"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 29 May 2023 03:58:11 -0700
Message-ID: <0bbb844d-3348-dc28-311a-d4111f8a7f81@linux.intel.com>
Date:   Mon, 29 May 2023 13:59:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org
References: <a45b9989-c9da-bf4e-94c8-3e1341777b4d@gmx.at>
 <20230526123655.GW45886@black.fi.intel.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: USB issue on a TB4 controller?
In-Reply-To: <20230526123655.GW45886@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 26.5.2023 15.36, Mika Westerberg wrote:
> Hi,
> 
> On Tue, May 23, 2023 at 01:15:30PM +0200, Christian Schaubschläger wrote:
>> Hi Mika,
>>
>> attached you find two dmesg logs (with tunderbolt.dyndbg=+p), one from power off state were everything is ok (dmesg_ok.txt.xz).
>> The second one (dmesg_nok.txt.xz) is after a reboot when the network interface is in faulty state.
>>
>> Hardware is:
>> Dell Inc. Latitude 7440/0XDRJY, BIOS 1.3.1 04/25/2023
>> CPU0: 13th Gen Intel(R) Core(TM) i5-1345U (family: 0x6, model: 0xba, stepping: 0x3)
>> thunderbolt 0-1: Dell WD19TB Thunderbolt Dock
> 
> Sorry for the delay. I've been busy with some other issues.
> 
> I guess we are talking about this xHCI:
> 
> [   15.449690] xhci_hcd 0000:04:00.0: xHCI Host Controller
> [   15.450477] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 3
> [   15.452337] xhci_hcd 0000:04:00.0: hcc params 0x200077c1 hci version 0x110 quirks 0x00
> 00000200009810
> [   15.453734] xhci_hcd 0000:04:00.0: xHCI Host Controller
> [   15.454437] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 4
> [   15.455092] xhci_hcd 0000:04:00.0: Host supports USB 3.1 Enhanced SuperSpeed
> 
> In both cases the the SuperSpeed HUB is found:
> 
> [    5.589178] usb 4-2.3: new SuperSpeed USB device number 3 using xhci_hcd
> [    5.622113] input: HDA Intel PCH Headphone Mic as /devices/pci0000:00/0000:00:1f.3/soun
> d/card0/input27
> [    5.635536] hub 4-2.3:1.0: USB hub found
> [    5.637176] hub 4-2.3:1.0: 4 ports detected
> 
> However, the connected NIC is only found in dmesg_ok.txt.xz:
> 
> [    5.904363] usb 4-2.4: new SuperSpeed USB device number 4 using xhci_hcd
> ...
> [    6.192613] r8152-cfgselector 4-2.4: reset SuperSpeed USB device number 4 using xhci_hcd
> [    6.217838] r8152 4-2.4:1.0 (unnamed net_device) (uninitialized): Using pass-thru MAC addr ac:91:a1:95:63:bf
> [    6.258478] r8152 4-2.4:1.0: load rtl8153b-2 v1 10/23/19 successfully
> [    6.318568] r8152 4-2.4:1.0 eth0: v1.12.13
> 
> To me it looks like the PCIe tunnel to the xHCI (0000:04:00.0) on the
> dock works fine, otherwise it would not show up at all. I'm not an xHCI
> expert so adding Mathias in case he has ideas how to debug this further.
> 
> I think it makes sense to enable xHCI debugging and traces and provide
> them to Mathias. The following commands should do so:
> 
>   # echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
>   # echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
>   # echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
>   # echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
> 
> Trace buffer is /sys/kernel/debug/tracing/trace.

Also worth testing if rebinding/resetting the 4 port USB 3.1 hub built into the dock with
the NIC connected to it helps.

# echo "4-2:1.0" > /sys/bus/usb/drivers/hub/unbind
# echo "4-2:1.0" > /sys/bus/usb/drivers/hub/bind

Thanks
-Mathias



