Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 896D3295314
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 21:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394722AbgJUTps (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 15:45:48 -0400
Received: from static.214.254.202.116.clients.your-server.de ([116.202.254.214]:42068
        "EHLO ciao.gmane.io" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgJUTps (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Oct 2020 15:45:48 -0400
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glug-linux-usb@m.gmane-mx.org>)
        id 1kVK3N-0007u2-Kk
        for linux-usb@vger.kernel.org; Wed, 21 Oct 2020 21:45:45 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     linux-usb@vger.kernel.org
From:   Ferry Toth <fntoth@gmail.com>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
Date:   Wed, 21 Oct 2020 21:45:36 +0200
Message-ID: <2b6586e6-528c-86e8-9d92-0061bc44866d@gmail.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org> <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
 <874kmpf583.fsf@kernel.org> <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
 <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com>
 <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Cc:     "felipe.balbi-VuQAYsv1563Yd54FQh9/CA-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org" 
        <felipe.balbi-VuQAYsv1563Yd54FQh9/CA-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Op 21-10-2020 om 00:58 schreef Thinh Nguyen:
> Thinh Nguyen wrote:
>> Hi,
>>
>> Ferry Toth wrote:
>>> Op 20-10-2020 om 14:32 schreef Felipe Balbi:
>>>> Hi,
>>>>
>>>> Ferry Toth <fntoth@gmail.com> writes:
>>>>
>>>> 8< snip
>>>>
>>>>>>> [   12.657416] CR2: 0000000100000000
>>>>>>> [   12.660729] ---[ end trace 9b92dea6da33c71e ]---
>>>>>> It this something you can reproduce on your end? Ferry, can you get
>>>>>> dwc3
>>>>>> trace logs when this happens? ftrace_dump_on_oops may help here.
>>>>> I will do that tonight. Is flipping on ftrace_dump_on_oops
>>>>> sufficient or
>>>>> do I need to do more?
>>>> you'd have to enable dwc3 trace events first ;-)
>>>>
>>>>> BTW after posting this I found in host mode dwc3 is not working
>>>>> properly
>>>>> either. No oops, but no driver get loaded on device plug in.
>>>> okay
>>>>
>>> Ehem, you maybe only me to enable /dwc3/dwc3_ep_dequeue/enable:
>>>
>>> root@edison:/boot# uname -a
>>> Linux edison 5.9.0-edison-acpi-standard #1 SMP Mon Oct 19 20:17:04 UTC
>>> 2020 x86_64 x86_64 x86_64 GNU/Linux
>>> root@edison:/boot# echo 1 >
>>> /sys/kernel/debug/tracing/events/dwc3/dwc3_ep_dequeue/enable
>>> root@edison:/boot# echo 1 > /proc/sys/kernel/ftrace_dump_on_oops
>>> root@edison:/boot#
>>> root@edison:/boot# [ 2608.585323] BUG: kernel NULL pointer
>>> dereference, address: 0000000000000000
>>> [ 2608.592288] #PF: supervisor read access in kernel mode
>>> [ 2608.597419] #PF: error_code(0x0000) - not-present page
>>> [ 2608.602549] PGD 0 P4D 0
>>> [ 2608.605090] Oops: 0000 [#1] SMP PTI
>>> [ 2608.608580] CPU: 1 PID: 733 Comm: irq/15-dwc3 Not tainted
>>> 5.9.0-edison-acpi-standard #1
>>> [ 2608.616571] Hardware name: Intel Corporation Merrifield/BODEGA BAY,
>>> BIOS 542 2015.01.21:18.19.48
>>> [ 2608.625356] RIP: 0010:dwc3_gadget_ep_dequeue+0x41/0x1c0
>>> [ 2608.630580] Code: e9 51 01 00 00 4c 8d a3 30 01 00 00 4c 89 e7 e8
>>> 15 e6 42 00 49 8b 4e 48 49 89 c5 49 8d 46 48 48 8d 51 a0 48 39 c8 75
>>> 0f eb 2e <48> 8b 4a 60 48 8d 51 a0 48 39 c8 74 21 48 39 d5 75 ee 45 31
>>> f6 4c
>>> [ 2608.649320] RSP: 0018:ffffa838002a7c40 EFLAGS: 00010087
>>> [ 2608.654543] RAX: ffff9a5f4609c048 RBX: ffff9a5f46f48028 RCX:
>>> 0000000000000000
>>> [ 2608.661666] RDX: ffffffffffffffa0 RSI: 0000000000000008 RDI:
>>> ffff9a5f46f48158
>>> [ 2608.668790] RBP: ffff9a5f7bd09b40 R08: 00000000000002d8 R09:
>>> ffff9a5f7dd6a000
>>> [ 2608.675913] R10: ffffa838002a7d90 R11: ffff9a5f46f48300 R12:
>>> ffff9a5f46f48158
>>> [ 2608.683039] R13: 0000000000000046 R14: ffff9a5f4609c000 R15:
>>> ffff9a5f7ad77e00
>>> [ 2608.690165] FS:  0000000000000000(0000) GS:ffff9a5f7e300000(0000)
>>> knlGS:0000000000000000
>>> [ 2608.698244] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [ 2608.703980] CR2: 0000000000000000 CR3: 000000003780a000 CR4:
>>> 00000000001006e0
>>> [ 2608.711102] Call Trace:
>>> [ 2608.713561]  usb_ep_dequeue+0x19/0x80
>>> [ 2608.717234]  u_audio_stop_capture+0x54/0x9a [u_audio]
>>> [ 2608.722289]  afunc_set_alt+0x73/0x80 [usb_f_uac2]
>> I took a look at how the audio function is handling switching alternate
>> setting and dequeuing endpoints, and I think I found the issue.
>>
>> Here's a snippet of the free_ep() code in u_audio.c:
>>
>> static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
>> {
>>      .....
>>          for (i = 0; i < params->req_number; i++) {
>>                  if (prm->ureq[i].req) {
>>                          usb_ep_dequeue(ep, prm->ureq[i].req);
>>                          usb_ep_free_request(ep, prm->ureq[i].req);
>>                          prm->ureq[i].req = NULL;
>>                  }
>>          }
>>    ....
>>
>>
>> usb_ep_dequeue() can be asynchronous. The dwc3 still has ownership of
>> the request until it gives back the request. Freeing the request
>> immediately here will cause a problem.
> 
> To confirm my suspicion, can you try this and see if you still get oops?
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index eec8e9a9e3ed..b66eb24ec070 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2031,6 +2031,7 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
>                          list_for_each_entry_safe(r, t,
> &dep->started_list, list)
>                                  dwc3_gadget_move_cancelled_request(r);
>   
> +                       dwc3_gadget_ep_cleanup_cancelled_requests(dep);
>                          goto out;
>                  }
>          }
> 
> 
> This will make usb_ep_dequeue() synchronous. (Note that this is not tested).

Unfortunately, it doesn't work. The trace changes to:
root@edison:~# [  104.418264] BUG: kernel NULL pointer dereference, 
address: 0000000000000000
[  104.425227] #PF: supervisor instruction fetch in kernel mode
[  104.430877] #PF: error_code(0x0010) - not-present page
[  104.436007] PGD 0 P4D 0
[  104.438547] Oops: 0010 [#1] SMP PTI
[  104.442039] CPU: 1 PID: 605 Comm: irq/15-dwc3 Not tainted 
5.9.0-edison-acpi-standard #1
[  104.450027] Hardware name: Intel Corporation Merrifield/BODEGA BAY, 
BIOS 542 2015.01.21:18.19.48
[  104.458802] RIP: 0010:0x0
[  104.461425] Code: Bad RIP value.
[  104.464649] RSP: 0018:ffffae584034fbf8 EFLAGS: 00010046
[  104.469870] RAX: 0000000000000000 RBX: ffff8c198608a028 RCX: 
ffff8c19bb87fa00
[  104.476993] RDX: 00000000ffffff94 RSI: ffff8c19bafa54e0 RDI: 
ffff8c198609ee00
[  104.484118] RBP: ffff8c19bafa54e0 R08: 0000000000000046 R09: 
0000000000000238
[  104.491241] R10: 000000000000002c R11: ffff8c19bcf62490 R12: 
ffff8c198609ee00
[  104.498366] R13: ffff8c198608a028 R14: 0000000000000002 R15: 
ffff8c19bb8ff000
[  104.505493] FS:  0000000000000000(0000) GS:ffff8c19be300000(0000) 
knlGS:0000000000000000
[  104.513572] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  104.519309] CR2: ffffffffffffffd6 CR3: 000000002e80a000 CR4: 
00000000001006e0
[  104.526432] Call Trace:
[  104.528892]  dwc3_gadget_giveback+0xbf/0x120
[  104.533169]  __dwc3_gadget_ep_disable+0xc5/0x250
[  104.537789]  dwc3_gadget_ep_disable+0x3d/0xd0
[  104.542149]  usb_ep_disable+0x1d/0x80
[  104.545823]  u_audio_stop_capture+0x87/0x9a [u_audio]
[  104.550880]  afunc_set_alt+0x73/0x80 [usb_f_uac2]
[  104.555594]  composite_setup+0x20f/0x1b20 [libcomposite]
[  104.560912]  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
[  104.566921]  configfs_composite_setup+0x6b/0x90 [libcomposite]
[  104.572752]  dwc3_ep0_delegate_req+0x24/0x40
[  104.577022]  dwc3_ep0_interrupt+0x40a/0x9d8
[  104.581205]  dwc3_thread_interrupt+0x880/0xf70

> BR,
> Thinh
> 


