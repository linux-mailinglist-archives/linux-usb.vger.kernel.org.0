Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C65C7AD80
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2019 18:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbfG3Q1D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jul 2019 12:27:03 -0400
Received: from mga17.intel.com ([192.55.52.151]:22071 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727126AbfG3Q1C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 30 Jul 2019 12:27:02 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jul 2019 09:27:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; 
   d="scan'208";a="323253632"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by orsmga004.jf.intel.com with ESMTP; 30 Jul 2019 09:27:00 -0700
Subject: Re: Oops in xhci_endpoint_reset
To:     Enric Balletbo Serra <eballetbo@gmail.com>,
        Bob Gleitsmann <rjgleits@bellsouth.net>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <a24f7305-abcc-c2ff-bba0-a02b23e34434@bellsouth.net>
 <20190727105955.GE458@kroah.com>
 <bd443170-6886-df60-0d05-849fc7229cd7@bellsouth.net>
 <CAFqH_53kZkH_nYpENO1QvEMpR4S3BP6GUncDt2c7yj_faSujrg@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <b257349a-7f2a-8214-4382-acf8005175f2@linux.intel.com>
Date:   Tue, 30 Jul 2019 19:28:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFqH_53kZkH_nYpENO1QvEMpR4S3BP6GUncDt2c7yj_faSujrg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30.7.2019 18.49, Enric Balletbo Serra wrote:
> Hi,
> 
> Missatge de Bob Gleitsmann <rjgleits@bellsouth.net> del dia ds., 27 de
> jul. 2019 a les 23:39:
>>
>> OK, here's the result of the bisection:
>>
>> ef513be0a9057cc6baf5d29566aaaefa214ba344 is the first bad commit
>> commit ef513be0a9057cc6baf5d29566aaaefa214ba344
>> Author: Jim Lin <jilin@nvidia.com>
>> Date:???? Mon Jun 3 18:53:44 2019 +0800
>>
>> ?????? usb: xhci: Add Clear_TT_Buffer
> 
> I want to confirm that I get the same oops on a Samsung Chromebook
> Plus (rk3399) and that reverting the above commit fixes the issue.
> 
> If it helps there is a decoded stacktrace below (I need to gain some
> usb knowledge to deal with this), probably others can have a better
> idea on what is happening.
> 
> [   75.613254] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000030

> [   75.769594] pc : xhci_endpoint_reset
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/host/xhci.c:3096)

Thanks, guessing maybe host_ep->hcpriv used to be cleared after some endpoint was dropped,
which in normal cases would cause xhci_endpoint_reset() to return early.

3074	static void xhci_endpoint_reset(struct usb_hcd *hcd,
3075			struct usb_host_endpoint *host_ep)
3076	{
3077		struct xhci_hcd *xhci;
3078		struct usb_device *udev;
3079		struct xhci_virt_device *vdev;
3080		struct xhci_virt_ep *ep;
3081		struct xhci_input_control_ctx *ctrl_ctx;
3082		struct xhci_command *stop_cmd, *cfg_cmd;
3083		unsigned int ep_index;
3084		unsigned long flags;
3085		u32 ep_flag;
3086	
3087		xhci = hcd_to_xhci(hcd);
3088		if (!host_ep->hcpriv)
3089			return;
3090		udev = (struct usb_device *) host_ep->hcpriv;
3091		vdev = xhci->devs[udev->slot_id];
3092		ep_index = xhci_get_endpoint_index(&host_ep->desc);
3093		ep = &vdev->eps[ep_index];
3094	
3095		/* Bail out if toggle is already being cleared by a endpoint reset */
3096		if (ep->ep_state & EP_HARD_CLEAR_TOGGLE) {

commit ef513be" usb: xhci: Add Clear_TT_Buffer" sets hcpriv again when handling a halted endpoint behind a TT hub.
If the event to handle the stalled endpoint is hadled late its possible we set a stale value to ep->hcpriv
which should just be cleared.

+static void xhci_clear_hub_tt_buffer(struct xhci_hcd *xhci, struct xhci_td *td,
+               struct xhci_virt_ep *ep)
+{
+       /*
+        * As part of low/full-speed endpoint-halt processing
+        * we must clear the TT buffer (USB 2.0 specification 11.17.5).
+        */
+       if (td->urb->dev->tt && !usb_pipeint(td->urb->pipe) &&
+           (td->urb->dev->tt->hub != xhci_to_hcd(xhci)->self.root_hub) &&
+           !(ep->ep_state & EP_CLEARING_TT)) {
+               ep->ep_state |= EP_CLEARING_TT;
+               td->urb->ep->hcpriv = td->urb->dev;
+               if (usb_hub_clear_tt_buffer(td->urb))
+                       ep->ep_state &= ~EP_CLEARING_TT;
+       }
+}

Still just a guess.
Does the below code fix your issue?

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 248cd7a..a0984aa 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3092,6 +3092,10 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
         ep_index = xhci_get_endpoint_index(&host_ep->desc);
         ep = &vdev->eps[ep_index];
  
+       if (!ep) {
+               xhci_err(xhci, "Mathias: No ep for endpoint reset, bail out\n");
+               return;
+       }
         /* Bail out if toggle is already being cleared by a endpoint reset */
         if (ep->ep_state & EP_HARD_CLEAR_TOGGLE) {
                 ep->ep_state &= ~EP_HARD_CLEAR_TOGGLE;


Also logs and traces would better show the root cause:

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
< suspend/resume >
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

-Mathias


> [   75.774741] lr : xhci_endpoint_reset
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/host/xhci.h:1913
> /home/eballetbo/Projects/chromebooks/kernel/drivers/usb/host/xhci.c:3087)
> [   75.779797] sp : ffff000011b6b930
> [   75.783494] x29: ffff000011b6b930 x28: 00000000ffffff95
> [   75.789426] x27: ffff8000ef657e00 x26: 0000000000000000
> [   75.795358] x25: ffff8000efafeb80 x24: 0000000000000000
> [   75.801289] x23: ffff8000efa4a250 x22: 0000000000000001
> [   75.807212] x21: ffff8000efafe800 x20: ffff8000efa4a000
> [   75.813143] x19: ffff8000efafe850 x18: 0000000000000000
> [   75.819074] x17: 0000000000000000 x16: 0000000000000000
> [   75.824997] x15: 0000000000000000 x14: 0000000000000000
> [   75.830920] x13: ffff8000ef5ff180 x12: 0000000034d4d91d
> [   75.836851] x11: 0000000000000000 x10: 0000000000000990
> [   75.842773] x9 : ffff8000efa3d000 x8 : 0000000000000004
> [   75.848695] x7 : ffff8000f55b8340 x6 : ffff8000ef65e700
> [   75.854618] x5 : ffff8000efe844c0 x4 : 0000000000000000
> [   75.860549] x3 : 0000000000000000 x2 : 0000000000000000
> [   75.866471] x1 : 0000000000000000 x0 : 0000000000000000
> [   75.872394] Call trace:
> [   75.875122] xhci_endpoint_reset
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/host/xhci.c:3096)
> [   75.879889] usb_hcd_reset_endpoint
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/hcd.c:2090)
> [   75.884753] usb_enable_endpoint
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/message.c:1294)
> [   75.889324] usb_ep0_reinit
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/hub.c:4423)
> [   75.893402] usb_reset_and_verify_device
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/hub.c:5716)
> [   75.898848] usb_port_resume
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/hub.c:3379
> /home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/hub.c:3579)
> [   75.903217] generic_resume
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/generic.c:277)
> [   75.907304] usb_resume_both
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/driver.c:1182
> /home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/driver.c:1406)
> [   75.911584] usb_resume
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/driver.c:1501)
> [   75.915281] usb_dev_resume
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/usb.c:471)
> [   75.919361] dpm_run_callback.isra.6
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/base/power/main.c:458)
> [   75.924322] device_resume
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/base/power/main.c:999)
> [   75.928408] dpm_resume
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/base/power/main.c:1055)
> [   75.932203] dpm_resume_end
> (/home/eballetbo/Projects/chromebooks/kernel/drivers/base/power/main.c:1171)
> 
> Thanks,
> ~ Enric
> 
>> ??????
>> ?????? USB 2.0 specification chapter 11.17.5 says "as part of endpoint halt
>> ?????? processing for full-/low-speed endpoints connected via a TT, the host
>> ?????? software must use the Clear_TT_Buffer request to the TT to ensure
>> ?????? that the buffer is not in the busy state".
>> ??????
>> ?????? In our case, a full-speed speaker (ConferenceCam) is behind a high-
>> ?????? speed hub (ConferenceCam Connect), sometimes once we get STALL on a
>> ?????? request we may continue to get STALL with the folllowing requests,
>> ?????? like Set_Interface.
>> ??????
>> ?????? Here we invoke usb_hub_clear_tt_buffer() to send Clear_TT_Buffer
>> ?????? request to the hub of the device for the following Set_Interface
>> ?????? requests to the device to get ACK successfully.
>> ??????
>> ?????? Signed-off-by: Jim Lin <jilin@nvidia.com>
>> ?????? Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ?????? Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>> ??drivers/usb/host/xhci-ring.c | 27 ++++++++++++++++++++++++++-
>> ??drivers/usb/host/xhci.c?????????? | 21 +++++++++++++++++++++
>> ??drivers/usb/host/xhci.h?????????? |?? 5 +++++
>> ??3 files changed, 52 insertions(+), 1 deletion(-)
>>
>>
>> On 7/27/19 6:59 AM, Greg KH wrote:
>>> On Fri, Jul 26, 2019 at 11:15:46PM -0400, Bob Gleitsmann wrote:
>>>> Hello,
>>>>
>>>>
>>>> I have seen kernel oopses on waking from suspend to memory. I got this
>>>> twice, one dmesg with backtrace attached. The other one had the failure
>>>> in the same place in the code.
>>>>
>>>>
>>>> This is kernel 5.3.0-rc1, patched for another problem in ethernet PHY
>>>> driver. Have not had the problem with earlier kernels. Using Gentoo
>>>> linux, amd64, but git kernel.
>>> Any chance you can run 'git bisect' to track down the offending commit?
>>>
>>> thanks,
>>>
>>> greg k-h
>>>

