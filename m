Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75407292FF4
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 22:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729942AbgJSUqe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 16:46:34 -0400
Received: from static.214.254.202.116.clients.your-server.de ([116.202.254.214]:39944
        "EHLO ciao.gmane.io" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730881AbgJSUqc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Oct 2020 16:46:32 -0400
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glug-linux-usb@m.gmane-mx.org>)
        id 1kUc33-0007DQ-RG
        for linux-usb@vger.kernel.org; Mon, 19 Oct 2020 22:46:29 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     linux-usb@vger.kernel.org
From:   Ferry Toth <fntoth@gmail.com>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
Date:   Mon, 19 Oct 2020 22:46:16 +0200
Message-ID: <246d5c2b-016b-1d4c-cad8-4e59a259b698@gmail.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org> <20201019194639.GU4077@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Cc:     Ferry Toth <fntoth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
        linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
        felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
In-Reply-To: <20201019194639.GU4077@smile.fi.intel.com>
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Op 19-10-2020 om 21:46 schreef Andy Shevchenko:
> On Mon, Oct 19, 2020 at 08:45:10AM +0300, Felipe Balbi wrote:
>> Ferry Toth <fntoth@gmail.com> writes:
>>> This occurs with edison-arduino board, that has a nifty switch allowing
>>> to switch between gadget/host mode. In host mode it boot fine, then
>>> crashes when I flip the switch to gadget.
>>>
>>> The below trace if what I get from the console when booting with gadget
>>> mode selected.
>>>
>>> The last kernel is used where everything is obviously working fine is 5.6.0.
>>>
>>> The kernel is built specifically for the platform, nothing suspcious
>>> going on the the dwc3 area, see
>>> https://github.com/edison-fw/linux/commits/eds-acpi-5.9.0
> 
>> It this something you can reproduce on your end? Ferry, can you get dwc3
>> trace logs when this happens? ftrace_dump_on_oops may help here.
> 
> For time being I can confirm that switch stopped working between v5.7 (v5.8)
> and v5.8.16. But I didn't see any crash so far (I don't use any predefined
> gadget, though).
> 
> afb420486016 usb: dwc3: gadget: Handle ZLP for sg requests
> 8301e3aa1c8d usb: dwc3: gadget: Fix handling ZLP
> d884a90cec5a usb: dwc3: gadget: Don't setup more than requested
> 
> Reverting them does not help, so I looked into drivers/usb changes.
> 
> Manual guess work did give any result, so I bisected:
> 
> # good: [9ece50d8a470ca7235ffd6ac0f9c5f0f201fe2c8] Linux 5.8.5
> # good: [96d020ddff6adff267a6900bcfcd46a8993f5152] xhci: Always restore EP_SOFT_CLEAR_TOGGLE even if ep reset failed
> # bad: [ccc9838fed80f04e45a2c317e4a2dacdf2f1e3c2] drm/amd/pm: correct the thermal alert temperature limit settings
> # bad: [bbf423c28efcde2beec2b187806eda0041cb0582] x86/irq: Unbreak interrupt affinity setting
> # good: [9a9cc8c9b1c715317c5fc18ac695751577bdf250] powerpc/perf: Fix crashes with generic_compat_pmu & BHRB
> # bad: [8cb3561d084ef532cd13d4f1f9077a900ff9f740] usbip: Implement a match function to fix usbip
> # bad: [3c491c44194253789d568549fac3b34dccdbcecd] crypto: af_alg - Work around empty control messages without MSG_MORE
> # bad: [1d35dfde2a7d9a0627b1e9465e8e4305478fb945] device property: Fix the secondary firmware node handling in set_primary_fwnode()
> # first bad commit: [1d35dfde2a7d9a0627b1e9465e8e4305478fb945] device property: Fix the secondary firmware node handling in set_primary_fwnode()
> 
> Revert on v5.9 helps.
> 
> Heikki, any idea?
> 
Hi Andy, that was fast.

I can confirm that reverting this patch (which I found as 
c15e1bdda4365a5f17cdadf22bf1c1df13884a9e in 5.9-rc3) makes host mode 
work again on 5.9.0. I can see the usb controller and usb stick with 
`lsusb -t`, and can mount/umount the stick.

Booting with the switch in gadget position I still get an oops.
Same with booting in host mode, then setting the switch to gadget mode.

I noted on 5.9.0 in host mode I get:
root@edison:~# journalctl -b | grep dwc
root@edison:~# journalctl -b | grep dwc
Oct 04 16:49:44 edison kernel: tusb1210 dwc3.0.auto.ulpi: GPIO lookup 
for consumer reset
Oct 04 16:49:44 edison kernel: tusb1210 dwc3.0.auto.ulpi: using ACPI for 
GPIO lookup
Oct 04 16:49:44 edison kernel: tusb1210 dwc3.0.auto.ulpi: using lookup 
tables for GPIO lookup
Oct 04 16:49:44 edison kernel: tusb1210 dwc3.0.auto.ulpi: No GPIO 
consumer reset found
Oct 04 16:49:44 edison kernel: tusb1210 dwc3.0.auto.ulpi: GPIO lookup 
for consumer cs
Oct 04 16:49:44 edison kernel: tusb1210 dwc3.0.auto.ulpi: using ACPI for 
GPIO lookup
Oct 04 16:49:44 edison kernel: tusb1210 dwc3.0.auto.ulpi: using lookup 
tables for GPIO lookup
Oct 04 16:49:44 edison kernel: tusb1210 dwc3.0.auto.ulpi: No GPIO 
consumer cs found
...
<repeats a few times>

This is new on 5.9.0, but is not affected by reverting c15e1bdda, so 
maybe unrelated.


