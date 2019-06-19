Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 999084B06D
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 05:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729042AbfFSD2K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 23:28:10 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42320 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfFSD2K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 23:28:10 -0400
Received: by mail-lj1-f193.google.com with SMTP id t28so1676394lje.9
        for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2019 20:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yIGMlxiCCqxjzPg0JJl3lpHo/q8kN5pODnVC0VFbGxA=;
        b=Es7vX3/QZU1VwxbtyugP/vxUrXo2zoFrKoiryzH74qhLrBzclZFqGCl/LlgICYiaTH
         foQB2aOsWbJ/vbVeDtHFXRdbL1bUHd25tOTXDJ9s0MDKhEjZu3zvHn48aPfu58nKTqsz
         GOORHckMPAz08OabpX9fZvPpYBot5Of6/6Ph1uWCFCup10lIGE1YHsk9g6EyCY8BEXjP
         1cdu8SJC88txwgDdtsH6ai6wKwTPyIRgMxOxwgmTXE/x7m9xtIXk55f90iE/n1RQZggE
         oejUcx1+x+2ieFfhg2p4ydxngOYKY7ztLtpErn0O6PhdWc5gr7O901VhuntZV5Yh5yQL
         p3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yIGMlxiCCqxjzPg0JJl3lpHo/q8kN5pODnVC0VFbGxA=;
        b=s3SNDBuA+k4jiWcPtxRBkRPfd8jCIDN0p4XaJvN1a6mt2Z2pFCM8kfeMwlGgUGrJ/f
         fy0U/9G5/QkRVEIZQaA+/PdGNyEpsmclMTk6j1uQskdRUG5zOVthQ9IiPOTLq/MB/Tmy
         vOhS8zLKqvCDEfGVV+zt3NcluDaq3B5PlfHfrQoHZHGu035rahRyL/YuTBX7K/GlCJPO
         JUjAGg+7F56nbFBDMKVv2eofLCQQxdgs9z3lIYw9G4GBIhu1sZGq/fDKffjDk/hq4bhl
         2Z4wZxFumjbXc3gz6NpcPr9rc6yPTelCdD7iolVqQnB2DBcZvjFV0O8WIGGBifjeeiQ2
         GBHQ==
X-Gm-Message-State: APjAAAX/iMdzxeXfYK9v0+mQoJyoJ5iU4Z6HIjI4RIEXoBTBzML4zf6J
        LG1GCDIPjm9mAVd8aRcCAXyrQmKfqyV88abCWHLd5G5IORE=
X-Google-Smtp-Source: APXvYqw9uaLm68z4BcxsxoJOZUB8oMqBMlP4LXl4J3dUHL5WRzdo5OQs4QJtUMly4RqSAq//FMwEpJSbRSQd6LS2tso=
X-Received: by 2002:a2e:898b:: with SMTP id c11mr18822683lji.241.1560914887613;
 Tue, 18 Jun 2019 20:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190614070243.31565-1-lianwei.wang@gmail.com>
 <87tvcogzbv.fsf@linux.intel.com> <CAJFUiJh4zQDvnS7BhUam14LtUrb5ad=hiukQgiYbOiUZs4zVcg@mail.gmail.com>
 <87d0jbgxyq.fsf@linux.intel.com>
In-Reply-To: <87d0jbgxyq.fsf@linux.intel.com>
From:   Lianwei Wang <lianwei.wang@gmail.com>
Date:   Tue, 18 Jun 2019 20:27:56 -0700
Message-ID: <CAJFUiJg1EOS=i8anPr2U_o2+yX6hYikmh97b1ywF5NMe672vyA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: avoid using gadget after freed
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 18, 2019 at 12:21 AM Felipe Balbi <balbi@kernel.org> wrote:
>
>
> Hi,
>
> Lianwei Wang <lianwei.wang@gmail.com> writes:
> > On Mon, Jun 17, 2019 at 5:40 AM Felipe Balbi <balbi@kernel.org> wrote:
> >>
> >> Lianwei Wang <lianwei.wang@gmail.com> writes:
> >>
> >> > The udc and gadget device will be deleted when udc device is
> >> > disconnected and the related function will be unbind with it.
> >> >
> >> > But if the configfs is not deleted, then the function object
> >> > will be kept and the bound status is kept true.
> >> >
> >> > Then after udc device is connected again and a new udc and
> >> > gadget objects will be created and passed to bind interface.
> >> > But because the bound is still true, the new gadget is not
> >> > updated to netdev and a previous freed gadget will be used
> >> > in netdev after bind.
> >> >
> >> > To fix this using after freed issue, always set the gadget
> >> > object to netdev in bind interface.
> >> >
> >> > Signed-off-by: Lianwei Wang <lianwei.wang@gmail.com>
> >>
> >> I can't actually understand what's the problem here. The gadget is not
> >> deleted when we disconnect the cable.
> >>
> >> --
> >> balbi
> >
> > The issue was observed with a dual-role capable USB controller (e.g. Intel
> > XHCI controller), which has the ability to switch role between host and device
> > mode. The gadget is deleted when we switch role to device mode from host
> > mode. See below log:
> > # echo p > /sys/devices/pci0000:00/0000:00:15.1/intel-cht-otg.0/mux_state #(4.4)
>
> oh, so you're using a modified tree :-) Then we can't really help.
>
> > [   41.170891] intel-cht-otg intel-cht-otg.0: p: set PERIPHERAL mode
> > [   41.171895] dwc3 dwc3.0.auto: DWC3 OTG Notify USB_EVENT_VBUS
> > [   41.187420] dwc3 dwc3.0.auto: dwc3_resume_common
> > [   41.191192] usb 1-1: USB disconnect, device number 3
> > [   41.191284] usb 1-1.1: USB disconnect, device number 4
> > [   41.218958] usb 1-1.5: USB disconnect, device number 5
> > [   41.238117] android_work: sent uevent USB_STATE=CONFIGURED
> > [   41.240572] android_work: sent uevent USB_STATE=DISCONNECTED
>
> What is this android_work. That doesn't exist upstream.
>
> > [   41.263285] platform dabr_udc.0: unregister gadget driver 'configfs-gadget'
> > [   41.263413] configfs-gadget gadget: unbind function 'Function FS
> > Gadget'/ffff8801db049e38
> > [   41.263969] configfs-gadget gadget: unbind function
> > 'cdc_network'/ffff8801d8897400
> > [   41.325943] dabridge 1-1.5:1.0: Port 3 VBUS OFF
> > [   41.720957] dabr_udc deleted
> > [   41.721097] dabridge 1-5 deleted
> >
> > The UDC and gadget will be deleted after switch role to device mode.
> > And they will be
> > created as new object when switching back to host mode. At this time
> > the bind in function
> > driver (e.g. f_ncm) will not set the new gadget.
> >
> > For kernel 4.19+, the role switch command will be:
> >   echo "device" > /sys/class/usb_role/intel_xhci_usb_sw-role-switch/role
> >
> > The latest Intel role switch kernel driver can be found here:
> >   https://elixir.bootlin.com/linux/v5.2-rc5/source/drivers/usb/roles/intel-xhci-usb-role-switch.c
>
> Right, please test against v5.2-rc5 and show me the problem on that
> kernel. I can't apply patches for problems that may not even exist in
> upstream, sorry.
>
> --
> balbi

The issue exist in main line kernel, but I can not test it with
v5.2-rc5 kernel. I tested it with 4.19 kernel,
which, for the usb gadget part, has almost the same code as v5.2. It
is 100% reproducible with dual role
USB controller or by removing UDC hardware. Take f_ncm for example,
the use case as follows:

1. USB controller is in host mode, f_ncm and UDC is configured in configfs.
   - The ncm is instanced and alloced when "functions/ncm.usb0" is
created and it will be freed
      when those files are delted from configfs.

2. enable the gadget and bind it to this ncm function.
    - For the first time running, ncm_opts->bound is 0 and
gether_set_gadget is called to set the
      gadget. The bound is set to 1 then.

3. If the UDC is disconnected from bus, then the UDC and its gadget is
deleted. But because the
    ncm.usb0 is still there, ncm object is not freed and
ncm_opts->bound is still set.
    There are two ways to disconnect the UDC hardware. One is for dual
role host controller by switch
    host controller role to device mode. Another way is by removing
the UDC hardware from bus, both
    will generate an usb device disconnect event to UDC driver to
delete udc and gadget.

4. Now the bound of ncm is still set and gadget is deleted due to udc
disconnected. And if we connect
    the udc device again, then it will create new udc and gadget and
bind to ncm again. But because
    bound is already set, the new gadget is not set to gether
(gether_register_netdev not called).

Not sure if this is clear to you. Please review the scenario and the patch.

Thanks,
Lianwei
