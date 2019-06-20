Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 102F74C6EF
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 07:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfFTFzJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 01:55:09 -0400
Received: from mga11.intel.com ([192.55.52.93]:29315 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbfFTFzI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Jun 2019 01:55:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Jun 2019 22:55:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,395,1557212400"; 
   d="scan'208";a="243529119"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga001.jf.intel.com with ESMTP; 19 Jun 2019 22:55:06 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Lianwei Wang <lianwei.wang@gmail.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] usb: gadget: avoid using gadget after freed
In-Reply-To: <CAJFUiJi7ZJr466nuwt0tjNWkiArFYD46sFVRFT1efnsfqgmqeA@mail.gmail.com>
References: <20190614070243.31565-1-lianwei.wang@gmail.com> <87tvcogzbv.fsf@linux.intel.com> <CAJFUiJh4zQDvnS7BhUam14LtUrb5ad=hiukQgiYbOiUZs4zVcg@mail.gmail.com> <87d0jbgxyq.fsf@linux.intel.com> <CAJFUiJg1EOS=i8anPr2U_o2+yX6hYikmh97b1ywF5NMe672vyA@mail.gmail.com> <87fto6f62z.fsf@linux.intel.com> <CAJFUiJi7ZJr466nuwt0tjNWkiArFYD46sFVRFT1efnsfqgmqeA@mail.gmail.com>
Date:   Thu, 20 Jun 2019 08:55:05 +0300
Message-ID: <874l4khkcm.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Lianwei Wang <lianwei.wang@gmail.com> writes:

> On Tue, Jun 18, 2019 at 11:21 PM Felipe Balbi <balbi@kernel.org> wrote:
>>
>>
>> Hi,
>>
>> Lianwei Wang <lianwei.wang@gmail.com> writes:
>> >> Lianwei Wang <lianwei.wang@gmail.com> writes:
>> >> > On Mon, Jun 17, 2019 at 5:40 AM Felipe Balbi <balbi@kernel.org> wrote:
>> >> >>
>> >> >> Lianwei Wang <lianwei.wang@gmail.com> writes:
>> >> >>
>> >> >> > The udc and gadget device will be deleted when udc device is
>> >> >> > disconnected and the related function will be unbind with it.
>> >> >> >
>> >> >> > But if the configfs is not deleted, then the function object
>> >> >> > will be kept and the bound status is kept true.
>> >> >> >
>> >> >> > Then after udc device is connected again and a new udc and
>> >> >> > gadget objects will be created and passed to bind interface.
>> >> >> > But because the bound is still true, the new gadget is not
>> >> >> > updated to netdev and a previous freed gadget will be used
>> >> >> > in netdev after bind.
>> >> >> >
>> >> >> > To fix this using after freed issue, always set the gadget
>> >> >> > object to netdev in bind interface.
>> >> >> >
>> >> >> > Signed-off-by: Lianwei Wang <lianwei.wang@gmail.com>
>> >> >>
>> >> >> I can't actually understand what's the problem here. The gadget is not
>> >> >> deleted when we disconnect the cable.
>> >> >>
>> >> >> --
>> >> >> balbi
>> >> >
>> >> > The issue was observed with a dual-role capable USB controller (e.g. Intel
>> >> > XHCI controller), which has the ability to switch role between host and device
>> >> > mode. The gadget is deleted when we switch role to device mode from host
>> >> > mode. See below log:
>> >> > # echo p > /sys/devices/pci0000:00/0000:00:15.1/intel-cht-otg.0/mux_state #(4.4)
>> >>
>> >> oh, so you're using a modified tree :-) Then we can't really help.
>> >>
>> >> > [   41.170891] intel-cht-otg intel-cht-otg.0: p: set PERIPHERAL mode
>> >> > [   41.171895] dwc3 dwc3.0.auto: DWC3 OTG Notify USB_EVENT_VBUS
>> >> > [   41.187420] dwc3 dwc3.0.auto: dwc3_resume_common
>> >> > [   41.191192] usb 1-1: USB disconnect, device number 3
>> >> > [   41.191284] usb 1-1.1: USB disconnect, device number 4
>> >> > [   41.218958] usb 1-1.5: USB disconnect, device number 5
>> >> > [   41.238117] android_work: sent uevent USB_STATE=CONFIGURED
>> >> > [   41.240572] android_work: sent uevent USB_STATE=DISCONNECTED
>> >>
>> >> What is this android_work. That doesn't exist upstream.
>> >>
>> >> > [   41.263285] platform dabr_udc.0: unregister gadget driver 'configfs-gadget'
>> >> > [   41.263413] configfs-gadget gadget: unbind function 'Function FS
>> >> > Gadget'/ffff8801db049e38
>> >> > [   41.263969] configfs-gadget gadget: unbind function
>> >> > 'cdc_network'/ffff8801d8897400
>> >> > [   41.325943] dabridge 1-1.5:1.0: Port 3 VBUS OFF
>> >> > [   41.720957] dabr_udc deleted
>> >> > [   41.721097] dabridge 1-5 deleted
>> >> >
>> >> > The UDC and gadget will be deleted after switch role to device mode.
>> >> > And they will be
>> >> > created as new object when switching back to host mode. At this time
>> >> > the bind in function
>> >> > driver (e.g. f_ncm) will not set the new gadget.
>> >> >
>> >> > For kernel 4.19+, the role switch command will be:
>> >> >   echo "device" > /sys/class/usb_role/intel_xhci_usb_sw-role-switch/role
>> >> >
>> >> > The latest Intel role switch kernel driver can be found here:
>> >> >   https://elixir.bootlin.com/linux/v5.2-rc5/source/drivers/usb/roles/intel-xhci-usb-role-switch.c
>> >>
>> >> Right, please test against v5.2-rc5 and show me the problem on that
>> >> kernel. I can't apply patches for problems that may not even exist in
>> >> upstream, sorry.
>> >>
>> >> --
>> >> balbi
>> >
>> > The issue exist in main line kernel, but I can not test it with
>> > v5.2-rc5 kernel. I tested it with 4.19 kernel,
>>
>> which of the v4.19?
>>
>> > which, for the usb gadget part, has almost the same code as v5.2. It
>> > is 100% reproducible with dual role
>> > USB controller or by removing UDC hardware. Take f_ncm for example,
>> > the use case as follows:
>>
>> Keep in mind that the way android handles dual-role is completely
>> different from what we have upstream.
>>
> Right, Our xchi controller support dual role and normally it works in host mode
> and the other device, e.g. phone can connect to our system as a gadget device.
> It works in the same way as PC.
>
>> > 1. USB controller is in host mode, f_ncm and UDC is configured in configfs.
>> >    - The ncm is instanced and alloced when "functions/ncm.usb0" is
>> > created and it will be freed
>> >       when those files are delted from configfs.
>> >
>> > 2. enable the gadget and bind it to this ncm function.
>> >     - For the first time running, ncm_opts->bound is 0 and
>> > gether_set_gadget is called to set the
>> >       gadget. The bound is set to 1 then.
>> >
>> > 3. If the UDC is disconnected from bus, then the UDC and its gadget is
>>
>> what do you mean by "disconnected from the bus"? Removing the cable
>> (aka, disconnect) will only cause the ->disconnect() callback to be
>> called. It will not result in the UDC being freed. Is this, perhaps,
>> something specific to android?
>>
> Our UDC is removable so we can remove the UDC from our system and the
> udc and gadget will be deleted after that.
>
> And our xhci support dual role mode and we can switch role between host and
> device mode. In host mode, the UDC will be connected to xhci host controller
> and the other device can connect to UDC. In device mode, it will work
> as a device
> and can connect to other host computer.
>
>> > deleted. But because the
>> >     ncm.usb0 is still there, ncm object is not freed and
>> > ncm_opts->bound is still set.
>> >     There are two ways to disconnect the UDC hardware. One is for dual
>> > role host controller by switch
>> >     host controller role to device mode. Another way is by removing
>> > the UDC hardware from bus, both
>> >     will generate an usb device disconnect event to UDC driver to
>> > delete udc and gadget.
>>
>> not true, unless I misunderstand what you mean. Disconnect will generate
>> a disconnect interrupt in most UDCs (except for dummy) and the
>> ->disconnect() callback will be called. Nothing will be freed.
>>
> As I mentioned above, the disconnect means the UDC is disconnected.
>
>> > 4. Now the bound of ncm is still set and gadget is deleted due to udc
>> > disconnected. And if we connect
>> >     the udc device again, then it will create new udc and gadget and
>> > bind to ncm again. But because
>> >     bound is already set, the new gadget is not set to gether
>> > (gether_register_netdev not called).
>> >
>> > Not sure if this is clear to you. Please review the scenario and the patch.
>>
>> This sounds a little like it's android-specific. Is your platform using
>> dwc3? Can you capture tracepoints of the failure? ftrace_dump_on_oops
>> will help getting the actual tracepoints in this case.
>>
>> cheers
>>
> It is not android specific. For the dual role controller, in device
> mode the dwc3 will
> work as gadget device and can connect to PC as device. In host mode, the dwc3
> does not work, instead the removable UDC will be connected to our system as
> gadget device.
>
>> --
>> balbi
>
> And the key point is that if the UDC can be disconnected as deleted?
> The answer is
> yes for below two cases:
>   - The UDC is removable
>   - It is a dual role controller and can switch between host mode and
> device mode. In host
> mode it will work as a xhci host controller. And in device mode it
> works as dwc3 gadget
> device.
>
> In both way we see that the udc is disconnected and deleted in our system.
>
> config USB_ROLES_INTEL_XHCI
>         tristate "Intel XHCI USB Role Switch"
>         depends on ACPI && X86
>         help
>           Driver for the internal USB role switch for switching the USB data
>           lines between the xHCI host controller and the dwc3 gadget controller
>           found on various Intel SoCs.
>
>           To compile the driver as a module, choose M here: the module will
>           be called intel-xhci-usb-role-switch.
>
> The issue should be 100% reproducible with that support Intel XHCI USB
> role switch, or
> the udc can be removabled.

what's specific to your case is *how* you implemented dual-role. None of
that is upstream and I have no means of verifying that what you claim is
true.

Sorry

-- 
balbi
