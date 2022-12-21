Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87638652F13
	for <lists+linux-usb@lfdr.de>; Wed, 21 Dec 2022 11:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234570AbiLUKAk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Dec 2022 05:00:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234588AbiLUKAA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Dec 2022 05:00:00 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F188164F8
        for <linux-usb@vger.kernel.org>; Wed, 21 Dec 2022 01:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671616642; x=1703152642;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=noHHOAmAUrzzpoaJ5OeRYc8m5HjZzaues+Y0cZo/JGk=;
  b=EWhFB3Moi3m4aQ8PPnEfKtA2QbBGx1rgpufw30kpnyV8TkwX/vuUDryv
   gpmzsRllnE3PBjh8zsttBvrL7tbRD3nBauGvo0rMUy7idPmx7Apo9ZvMY
   hYL2rXZXeQJUH1O+8TlEprWY1ahfAQthbIbWYVj80ep/qB1x06S5QpNe2
   7LDW/FGUUPTQeKXuAVk4HszR3wJ70Yt7zhYk+TX1KoXOOduIGJgG8PHdT
   HMB4r4HWI1vrEYHkkImNG8a18aF1VvNknI2/pBSoi2ckrRfSsSs6H2OLk
   r62U8FnizhcDFwbV4IjaUHshJRqu/YmTTooT+MHEaju9bnMRxDkVWWPWn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="319886376"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; 
   d="scan'208";a="319886376"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 01:57:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="681976154"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; 
   d="scan'208";a="681976154"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga008.jf.intel.com with ESMTP; 21 Dec 2022 01:57:20 -0800
Message-ID: <6ac1cee8-b58a-b53f-2d0f-94336ac039b1@linux.intel.com>
Date:   Wed, 21 Dec 2022 11:58:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Content-Language: en-US
To:     Ladislav Michl <oss-lists@triops.cz>
Cc:     linux-usb@vger.kernel.org, Sneeker Yeh <sneeker.yeh@gmail.com>
References: <Y45iXb6VCNiz7ZVd@lenoch> <Y49A1Pv6dUScQ9x/@lenoch>
 <Y5tHWwHctY6wr+CJ@lenoch>
 <abfec817-0b32-ece3-4965-7503aa5a77fa@linux.intel.com>
 <Y5zkCxQqBWR+/b4F@lenoch>
 <983a1eb1-4599-517b-6c88-63a0051ae261@linux.intel.com>
 <Y6Ct5s5fIoA9FsAt@lenoch> <Y6Dbh1xJucfNvwXq@lenoch> <Y6KyWqnHi1TFN0pa@lenoch>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: xHCI host dies on device unplug
In-Reply-To: <Y6KyWqnHi1TFN0pa@lenoch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21.12.2022 9.14, Ladislav Michl wrote:
> +Cc: Sneeker Yeh
> 
> On Mon, Dec 19, 2022 at 10:45:43PM +0100, Ladislav Michl wrote:
>> On Mon, Dec 19, 2022 at 07:31:02PM +0100, Ladislav Michl wrote:
>>> On Mon, Dec 19, 2022 at 02:25:46PM +0200, Mathias Nyman wrote:
>>>> On 16.12.2022 23.32, Ladislav Michl wrote:
>>>>> On Fri, Dec 16, 2022 at 12:13:23PM +0200, Mathias Nyman wrote:
>>>>>> On 15.12.2022 18.12, Ladislav Michl wrote:
>>>>>>> +Cc Mathias as he last touched this code path and may know more :)
>>>>>>>
>>>>>>> On Tue, Dec 06, 2022 at 02:17:08PM +0100, Ladislav Michl wrote:
>>>>>>>> On Mon, Dec 05, 2022 at 10:27:57PM +0100, Ladislav Michl wrote:
>>>>>>>>> I'm running current linux.git on custom Marvell OCTEON III CN7020
>>>>>>>>> based board. USB devices like FTDI (idVendor=0403, idProduct=6001,
>>>>>>>>> bcdDevice= 6.00) Realtek WiFi dongle (idVendor=0bda, idProduct=8179,
>>>>>>>>> bcdDevice= 0.00) works without issues, while Ralink WiFi dongle
>>>>>>>>> (idVendor=148f, idProduct=5370, bcdDevice= 1.01) kills the host on
>>>>>>>>> disconnect:
>>>>>>>>> xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command
>>>>>>>>> xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
>>>>>>>>> xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
>>>>>>>>>
>>>>>>>>> Unfortunately I do not have a datasheet for CN7020 SoC, so it is hard
>>>>>>>>> to tell if there is any errata :/ In case anyone see a clue in debug
>>>>>>>>> logs bellow, I'll happily give it a try.
>>>>>>>>
>>>>>>>> So I do have datasheet now. As a wild guess I tried to use dlmc_ref_clk0
>>>>>>>> instead of dlmc_ref_clk1 as a refclk-type-ss and it fixed unplug death.
>>>>>>>> I have no clue why, but anyway - sorry for the noise :) Perhaps Octeon's
>>>>>>>> clock init is worth to be verified...
>>>>>>>
>>>>>>> After all whenever xhci dies with "xHCI host not responding to stop endpoint
>>>>>>> command" depends also on temperature, so there seems to be race somewhere.
>>>>>>>
>>>>>>> As a quick and dirty verification, whenever xhci really died, following patch
>>>>>>> was tested and it fixed issue. It just treats ep as if stop endpoint command
>>>>>>> succeeded. Any clues? I'll happily provide more traces.
>>>>>>
>>>>>> It's possible the controller did complete the stop endpoint command but driver
>>>>>> didn't get the interrupt for the event for some reason.
>>>>>>
>>>>
>>>> Looks like controller didn't complete the stop endpoint command.
>>>>
>>>> Event for last completed command (before cycle bit change "c" -> "C") was:
>>>>    0x00000000028f55a0: TRB 00000000035e81a0 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c,
>>>>
>>>> This was for command at 35e81a0, which in the command ring was:
>>>>    0x00000000035e81a0: Reset Endpoint Command: ctx 0000000000000000 slot 1 ep 3 flags T:c
>>>>
>>>> The stop endpoint command was the next command queued, at 35e81b0:
>>>>    0x00000000035e81b0: Stop Ring Command: slot 1 sp 0 ep 3 flags c
>>>>
>>>> There were a lot of URBs queued for this device, and they are cancelled one by one after disconnect.
>>>>
>>>> Was this the only device connected? If so does connecting another usb device to another root port help?
>>>> Just to test if the host for some reason partially stops a while after last device disconnect?
>>>
>>> Device is connected directly into SoC. Once connected into HUB, host doesn't die
>>> (as noted in other email, sorry for not replying to my own message, so it got lost)
>>> It seems as intentional (power management?) optimization. If another device is
>>> plugged in before 5 sec timeout expires, host completes stop endpoint command.
>>>
>>> Unfortunately I cannot find anything describing this behavior in
>>> documentation, so I'll ask manufacturer support.
>>
>> As support is usually slow I asked search engine first and this sounds
>> familiar:
>> "Synopsis Designware USB3 IP earlier than v3.00a which is configured in silicon
>> with DWC_USB3_SUSPEND_ON_DISCONNECT_EN=1, would need a specific quirk to prevent
>> xhci host controller from dying when device is disconnected."
>>
>> usb: dwc3: Add quirk for Synopsis device disconnection errata
>> https://patchwork.kernel.org/project/linux-omap/patch/1424151697-2084-5-git-send-email-Sneeker.Yeh@tw.fujitsu.com/
>>
>> Any clue what happened with that? I haven't found any meaningfull traces...
> 
> Lets step back a bit. All test so far was done with mainline 6.1.0 kernel.
> I also tested Marvell's vendor tree, one based on 4.9.79, second on 5.4.30,
> both heavily patched. The last version of above patch I found is v5:
> https://lkml.org/lkml/2015/2/21/260
> 

Looked at that same series and turned patch 1/5 into a standalone quick hack that applies on 6.1

Untested, does it work for you?

Can be found in a delay_csc_clear branch in my tree:

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git delay_csc_clear
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=delay_csc_clear

looks like this: (copypasted, might mess up tabs)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 4619d5e89d5b..5bc1f78b41da 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -603,6 +603,10 @@ static void xhci_clear_port_change_bit(struct xhci_hcd *xhci, u16 wValue,
                 port_change_bit = "warm(BH) reset";
                 break;
         case USB_PORT_FEAT_C_CONNECTION:
+               if (1 && !(readl(addr) & PORT_CONNECT)) { /* add proper quirk */
+                       xhci_warn(xhci, "Delay clearing port-%d CSC\n", wIndex + 1);
+                       return;
+               }
                 status = PORT_CSC;
                 port_change_bit = "connect";
                 break;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 79d7931c048a..133ec4b8930f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4000,6 +4000,28 @@ static void xhci_free_dev(struct usb_hcd *hcd, struct usb_device *udev)
                 virt_dev->eps[i].ep_state &= ~EP_STOP_CMD_PENDING;
         virt_dev->udev = NULL;
         xhci_disable_slot(xhci, udev->slot_id);
+
+       if (1 && udev->parent && !udev->parent->parent) { /*fixme, real quirk */
+               struct xhci_hub *rhub;
+               u32 portsc;
+
+               rhub = xhci_get_rhub(hcd);
+
+               if (udev->portnum > rhub->num_ports) {
+                       xhci_warn(xhci, "Invalid portnum %d for late clearing CSC\n", udev->portnum);
+                       goto out;
+               }
+
+               portsc = readl(rhub->ports[udev->portnum - 1]->addr);
+
+               if (!(portsc & PORT_CONNECT) && (portsc & PORT_CSC)) {
+                       xhci_warn(xhci, "Late clearing port-%d CSC, portsc 0x%x\n",
+                                 udev->portnum, portsc);
+                       portsc = xhci_port_state_to_neutral(portsc);
+                       writel(portsc | PORT_CSC, rhub->ports[udev->portnum - 1]->addr);
+               }
+       }
+out:
         xhci_free_virt_device(xhci, udev->slot_id);
  }


Thanks
-Mathias
