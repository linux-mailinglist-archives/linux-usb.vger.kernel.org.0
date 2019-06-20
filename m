Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB044C781
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 08:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfFTGaC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 02:30:02 -0400
Received: from mail-lj1-f173.google.com ([209.85.208.173]:42308 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfFTGaC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 02:30:02 -0400
Received: by mail-lj1-f173.google.com with SMTP id t28so1546846lje.9
        for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2019 23:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/G1AKBtiZ5En4KgTan3+XztdN0aBRF1v6hQmMDGq4Lo=;
        b=bfpeumo/mJUCcQVNI8J7/mM5tSg+dTm2l37uTw1Hx3ZG4fnqz0BP5bHX6izkSqpbNx
         WvoZoJXuRrtwVK8QfKZSiIpqfIYOpwHQBHKAclWbFpv7YgLaMsGLL60n+cMPLU9GqwDt
         GMHOUBgWYg6zocHSrDbfDgGpDmvMWKIPzZLoqx4XIrB3s6tWhRvnZz/17XnfEpLPt/NZ
         EvwRuRxp9aykmgV02CBW00RG2i659NaXBnX8Ay1vs5TBDwEp/lXLXDF8pTPb+UDWkQRy
         BIMmLQpf4c2SnxDDkTtmNVjV02sC0w3sAnrkMOtIvg4OsSs2sjHhvrEjFaFVxyj91f4I
         7EQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/G1AKBtiZ5En4KgTan3+XztdN0aBRF1v6hQmMDGq4Lo=;
        b=Nx53gT/3e6TfWkY/IosBCro4DJ/q0TKT4l7EEVDoO5X+9VtpT/qGyLU9Cmqt43Tfc+
         lKPnWoGMesi0gFuEkcQTjUbkIeftoWgligkZSXb+dZ55rB6o4QwNObMXqskf8ZXbGwnF
         hrhmcB5zVLZcOzRum9LsRwx6HHLyiR9fN4FsNDLv3Ltr9rAsRjrd5jpSy6/2qdEAqe14
         hmSNcZS1RDlcU7qnyBNQ40O9n5t6fMo518KRhNGUURO088xJAPnBNi0myt4ATjxBM0Ab
         2IG/IKd6OsHi0w5HVW+210OTxaj7XMTTGhRgbZZuGtBG6Hyvqk5gXb7amAmdoPmHGxbo
         tykA==
X-Gm-Message-State: APjAAAUSr6XbPlUa7FASCahQ5tWIlEXxUyRY+ZaEdXZKA4A2URScmRip
        JTFEgRNZaLkuq0pCVrKjS1qGMcwuzV8Yu5nZGCvB5TZOPGE=
X-Google-Smtp-Source: APXvYqyRBkZHveR+u0UfiYKNjoxs1lhtQlb+pZmBzud+nvIPdfprFFT6HZlEMYzPp6Iius0BvDFTUx236h2S96m4kD0=
X-Received: by 2002:a2e:b0d0:: with SMTP id g16mr56764328ljl.161.1561012198627;
 Wed, 19 Jun 2019 23:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190614070243.31565-1-lianwei.wang@gmail.com>
 <87tvcogzbv.fsf@linux.intel.com> <CAJFUiJh4zQDvnS7BhUam14LtUrb5ad=hiukQgiYbOiUZs4zVcg@mail.gmail.com>
 <87d0jbgxyq.fsf@linux.intel.com> <CAJFUiJg1EOS=i8anPr2U_o2+yX6hYikmh97b1ywF5NMe672vyA@mail.gmail.com>
 <87fto6f62z.fsf@linux.intel.com> <CAJFUiJi7ZJr466nuwt0tjNWkiArFYD46sFVRFT1efnsfqgmqeA@mail.gmail.com>
 <874l4khkcm.fsf@linux.intel.com>
In-Reply-To: <874l4khkcm.fsf@linux.intel.com>
From:   Lianwei Wang <lianwei.wang@gmail.com>
Date:   Wed, 19 Jun 2019 23:29:47 -0700
Message-ID: <CAJFUiJhDtH16pg=5EZue_78gPDG-_8O-DL=M9GXg6L09B=XS6A@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: avoid using gadget after freed
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 19, 2019 at 10:55 PM Felipe Balbi <balbi@kernel.org> wrote:
>
>
> Hi,
>
> Lianwei Wang <lianwei.wang@gmail.com> writes:
>
> > On Tue, Jun 18, 2019 at 11:21 PM Felipe Balbi <balbi@kernel.org> wrote:
> >>
> >>
> >> Hi,
> >>
> >> Lianwei Wang <lianwei.wang@gmail.com> writes:
> >> >> Lianwei Wang <lianwei.wang@gmail.com> writes:
> >> >> > On Mon, Jun 17, 2019 at 5:40 AM Felipe Balbi <balbi@kernel.org> wrote:
> >> >> >>
> >> >> >> Lianwei Wang <lianwei.wang@gmail.com> writes:
> >> >> >>
> >> >> >> > The udc and gadget device will be deleted when udc device is
> >> >> >> > disconnected and the related function will be unbind with it.
> >> >> >> >
> >> >> >> > But if the configfs is not deleted, then the function object
> >> >> >> > will be kept and the bound status is kept true.
> >> >> >> >
> >> >> >> > Then after udc device is connected again and a new udc and
> >> >> >> > gadget objects will be created and passed to bind interface.
> >> >> >> > But because the bound is still true, the new gadget is not
> >> >> >> > updated to netdev and a previous freed gadget will be used
> >> >> >> > in netdev after bind.
> >> >> >> >
> >> >> >> > To fix this using after freed issue, always set the gadget
> >> >> >> > object to netdev in bind interface.
> >> >> >> >
> >> >> >> > Signed-off-by: Lianwei Wang <lianwei.wang@gmail.com>
> >> >> >>
> >> >> >> I can't actually understand what's the problem here. The gadget is not
> >> >> >> deleted when we disconnect the cable.
> >> >> >>
> >> >> >> --
> >> >> >> balbi
> >> >> >
> >> >> > The issue was observed with a dual-role capable USB controller (e.g. Intel
> >> >> > XHCI controller), which has the ability to switch role between host and device
> >> >> > mode. The gadget is deleted when we switch role to device mode from host
> >> >> > mode. See below log:
> >> >> > # echo p > /sys/devices/pci0000:00/0000:00:15.1/intel-cht-otg.0/mux_state #(4.4)
> >> >>
> >> >> oh, so you're using a modified tree :-) Then we can't really help.
> >> >>
> >> >> > [   41.170891] intel-cht-otg intel-cht-otg.0: p: set PERIPHERAL mode
> >> >> > [   41.171895] dwc3 dwc3.0.auto: DWC3 OTG Notify USB_EVENT_VBUS
> >> >> > [   41.187420] dwc3 dwc3.0.auto: dwc3_resume_common
> >> >> > [   41.191192] usb 1-1: USB disconnect, device number 3
> >> >> > [   41.191284] usb 1-1.1: USB disconnect, device number 4
> >> >> > [   41.218958] usb 1-1.5: USB disconnect, device number 5
> >> >> > [   41.238117] android_work: sent uevent USB_STATE=CONFIGURED
> >> >> > [   41.240572] android_work: sent uevent USB_STATE=DISCONNECTED
> >> >>
> >> >> What is this android_work. That doesn't exist upstream.
> >> >>
> >> >> > [   41.263285] platform dabr_udc.0: unregister gadget driver 'configfs-gadget'
> >> >> > [   41.263413] configfs-gadget gadget: unbind function 'Function FS
> >> >> > Gadget'/ffff8801db049e38
> >> >> > [   41.263969] configfs-gadget gadget: unbind function
> >> >> > 'cdc_network'/ffff8801d8897400
> >> >> > [   41.325943] dabridge 1-1.5:1.0: Port 3 VBUS OFF
> >> >> > [   41.720957] dabr_udc deleted
> >> >> > [   41.721097] dabridge 1-5 deleted
> >> >> >
> >> >> > The UDC and gadget will be deleted after switch role to device mode.
> >> >> > And they will be
> >> >> > created as new object when switching back to host mode. At this time
> >> >> > the bind in function
> >> >> > driver (e.g. f_ncm) will not set the new gadget.
> >> >> >
> >> >> > For kernel 4.19+, the role switch command will be:
> >> >> >   echo "device" > /sys/class/usb_role/intel_xhci_usb_sw-role-switch/role
> >> >> >
> >> >> > The latest Intel role switch kernel driver can be found here:
> >> >> >   https://elixir.bootlin.com/linux/v5.2-rc5/source/drivers/usb/roles/intel-xhci-usb-role-switch.c
> >> >>
> >> >> Right, please test against v5.2-rc5 and show me the problem on that
> >> >> kernel. I can't apply patches for problems that may not even exist in
> >> >> upstream, sorry.
> >> >>
> >> >> --
> >> >> balbi
> >> >
> >> > The issue exist in main line kernel, but I can not test it with
> >> > v5.2-rc5 kernel. I tested it with 4.19 kernel,
> >>
> >> which of the v4.19?
> >>
> >> > which, for the usb gadget part, has almost the same code as v5.2. It
> >> > is 100% reproducible with dual role
> >> > USB controller or by removing UDC hardware. Take f_ncm for example,
> >> > the use case as follows:
> >>
> >> Keep in mind that the way android handles dual-role is completely
> >> different from what we have upstream.
> >>
> > Right, Our xchi controller support dual role and normally it works in host mode
> > and the other device, e.g. phone can connect to our system as a gadget device.
> > It works in the same way as PC.
> >
> >> > 1. USB controller is in host mode, f_ncm and UDC is configured in configfs.
> >> >    - The ncm is instanced and alloced when "functions/ncm.usb0" is
> >> > created and it will be freed
> >> >       when those files are delted from configfs.
> >> >
> >> > 2. enable the gadget and bind it to this ncm function.
> >> >     - For the first time running, ncm_opts->bound is 0 and
> >> > gether_set_gadget is called to set the
> >> >       gadget. The bound is set to 1 then.
> >> >
> >> > 3. If the UDC is disconnected from bus, then the UDC and its gadget is
> >>
> >> what do you mean by "disconnected from the bus"? Removing the cable
> >> (aka, disconnect) will only cause the ->disconnect() callback to be
> >> called. It will not result in the UDC being freed. Is this, perhaps,
> >> something specific to android?
> >>
> > Our UDC is removable so we can remove the UDC from our system and the
> > udc and gadget will be deleted after that.
> >
> > And our xhci support dual role mode and we can switch role between host and
> > device mode. In host mode, the UDC will be connected to xhci host controller
> > and the other device can connect to UDC. In device mode, it will work
> > as a device
> > and can connect to other host computer.
> >
> >> > deleted. But because the
> >> >     ncm.usb0 is still there, ncm object is not freed and
> >> > ncm_opts->bound is still set.
> >> >     There are two ways to disconnect the UDC hardware. One is for dual
> >> > role host controller by switch
> >> >     host controller role to device mode. Another way is by removing
> >> > the UDC hardware from bus, both
> >> >     will generate an usb device disconnect event to UDC driver to
> >> > delete udc and gadget.
> >>
> >> not true, unless I misunderstand what you mean. Disconnect will generate
> >> a disconnect interrupt in most UDCs (except for dummy) and the
> >> ->disconnect() callback will be called. Nothing will be freed.
> >>
> > As I mentioned above, the disconnect means the UDC is disconnected.
> >
> >> > 4. Now the bound of ncm is still set and gadget is deleted due to udc
> >> > disconnected. And if we connect
> >> >     the udc device again, then it will create new udc and gadget and
> >> > bind to ncm again. But because
> >> >     bound is already set, the new gadget is not set to gether
> >> > (gether_register_netdev not called).
> >> >
> >> > Not sure if this is clear to you. Please review the scenario and the patch.
> >>
> >> This sounds a little like it's android-specific. Is your platform using
> >> dwc3? Can you capture tracepoints of the failure? ftrace_dump_on_oops
> >> will help getting the actual tracepoints in this case.
> >>
> >> cheers
> >>
> > It is not android specific. For the dual role controller, in device
> > mode the dwc3 will
> > work as gadget device and can connect to PC as device. In host mode, the dwc3
> > does not work, instead the removable UDC will be connected to our system as
> > gadget device.
> >
> >> --
> >> balbi
> >
> > And the key point is that if the UDC can be disconnected as deleted?
> > The answer is
> > yes for below two cases:
> >   - The UDC is removable
> >   - It is a dual role controller and can switch between host mode and
> > device mode. In host
> > mode it will work as a xhci host controller. And in device mode it
> > works as dwc3 gadget
> > device.
> >
> > In both way we see that the udc is disconnected and deleted in our system.
> >
> > config USB_ROLES_INTEL_XHCI
> >         tristate "Intel XHCI USB Role Switch"
> >         depends on ACPI && X86
> >         help
> >           Driver for the internal USB role switch for switching the USB data
> >           lines between the xHCI host controller and the dwc3 gadget controller
> >           found on various Intel SoCs.
> >
> >           To compile the driver as a module, choose M here: the module will
> >           be called intel-xhci-usb-role-switch.
> >
> > The issue should be 100% reproducible with that support Intel XHCI USB
> > role switch, or
> > the udc can be removabled.
>
> what's specific to your case is *how* you implemented dual-role. None of
> that is upstream and I have no means of verifying that what you claim is
> true.
>
> Sorry
>
> --
> balbi

That's Ok, Maybe I'm misunderstanding how upstream kernel works.

The issue is happened on Intel hardware which should be support by
upstream kernel.

I did not implement any dual role, it is from upstream. And the UDC driver
is working as the same mechanism as upstream too. The upstream kernel
support remove/disconnect UDC device.

I try to explain it clearly but unfortunately... my failure. If we
look at the code,
we have remove function defined in udc driver, and which will finally delete UDC
(usb_del_gadget_udc).

Could you tell me how the upstream kernel guarantee that the remove and
usb_del_gadget_udc function is never called?

Thanks,
Lianwei
