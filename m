Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0363349124
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 22:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbfFQUP4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jun 2019 16:15:56 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42739 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfFQUP4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jun 2019 16:15:56 -0400
Received: by mail-lf1-f67.google.com with SMTP id y13so7494975lfh.9
        for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2019 13:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5ogfo+2EDLoHRj2CLqGpDy4s5JVo0xO3PbZXCZ0AtfE=;
        b=TlzLS1Zn1RjS5oH/4cyFxpn0vtISE6orwOMxJcy9aqVvdypf4utqGFrdKU8xE900FD
         RRZkJKTSO5IG8gxYGMdnhmgD1jMTDMeDGREWlDJRBVWmWBCEQqdAjqPPdo1BlLJncZtB
         2qkbePozlZPPeLVWqqtvD4dQR3oyhSDgrRJ8mOoPZVUp1iW1Mhxkew1SaOhvg6feIXvJ
         OIGZHQlgjnQRSi1tPt+1Aimwml3Q/npgYjEJxlaHiGIFjX0A/Y2TiRdk7q2NQB7NGacQ
         xbapmyOJYWS74wfVuZjlTE/spNDsrlYQKfsqbS1lMaGVp9Cd7Ccxo1bV7/4mWbVeiRdp
         ddSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ogfo+2EDLoHRj2CLqGpDy4s5JVo0xO3PbZXCZ0AtfE=;
        b=uOdrBtzLN58xSgcQNQ87Nj5/me5g63UvUKvxgFX3/uI+t1D6loZPBqmd/cyxwxhJCf
         iSy9AvQkaSBiaVD+r42YVZVut1W1beeQEJnHTf741QoKaYzAfaBurAgsUEAU9FDoQGlf
         mJlgqD5a/TVOsoUCYHWIXlIJyupzjdvr4Bk5J/6UnsPbeytBSPPDDEz+8NOEyciiFmgp
         VECBMsE6HcCkmd2abiRig2j6su550TQlCPTZPfUJmftVlcoZQdpj9zWLbaSrUEYkfdWL
         TsDoHhrh3TmNqEWxWQhTgq8FZWlFL6H5m+vACayKwj8rwjkX7dB7/9KSGmOPExcy0Twx
         uT+Q==
X-Gm-Message-State: APjAAAUV6kHnZ2+blK/Rx+7+Xp5FbAO4x6ItL1geo5NjWd5XW583cGxI
        u5tWqBTL6/uRe3Q5X2hEsKyHjagObGkKXmQuoYA=
X-Google-Smtp-Source: APXvYqwC5LRqhgk5WYytUPo60Vx7LGGHUOue5UeqOD8acnJEKZRkIL3CnJUBLaGxw3Y+t4SzfDBwQX0vSXbEMiHUXnY=
X-Received: by 2002:ac2:47fa:: with SMTP id b26mr21804798lfp.82.1560802553947;
 Mon, 17 Jun 2019 13:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190614070243.31565-1-lianwei.wang@gmail.com> <87tvcogzbv.fsf@linux.intel.com>
In-Reply-To: <87tvcogzbv.fsf@linux.intel.com>
From:   Lianwei Wang <lianwei.wang@gmail.com>
Date:   Mon, 17 Jun 2019 13:15:42 -0700
Message-ID: <CAJFUiJh4zQDvnS7BhUam14LtUrb5ad=hiukQgiYbOiUZs4zVcg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: avoid using gadget after freed
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 17, 2019 at 5:40 AM Felipe Balbi <balbi@kernel.org> wrote:
>
> Lianwei Wang <lianwei.wang@gmail.com> writes:
>
> > The udc and gadget device will be deleted when udc device is
> > disconnected and the related function will be unbind with it.
> >
> > But if the configfs is not deleted, then the function object
> > will be kept and the bound status is kept true.
> >
> > Then after udc device is connected again and a new udc and
> > gadget objects will be created and passed to bind interface.
> > But because the bound is still true, the new gadget is not
> > updated to netdev and a previous freed gadget will be used
> > in netdev after bind.
> >
> > To fix this using after freed issue, always set the gadget
> > object to netdev in bind interface.
> >
> > Signed-off-by: Lianwei Wang <lianwei.wang@gmail.com>
>
> I can't actually understand what's the problem here. The gadget is not
> deleted when we disconnect the cable.
>
> --
> balbi

The issue was observed with a dual-role capable USB controller (e.g. Intel
XHCI controller), which has the ability to switch role between host and device
mode. The gadget is deleted when we switch role to device mode from host
mode. See below log:
# echo p > /sys/devices/pci0000:00/0000:00:15.1/intel-cht-otg.0/mux_state #(4.4)
[   41.170891] intel-cht-otg intel-cht-otg.0: p: set PERIPHERAL mode
[   41.171895] dwc3 dwc3.0.auto: DWC3 OTG Notify USB_EVENT_VBUS
[   41.187420] dwc3 dwc3.0.auto: dwc3_resume_common
[   41.191192] usb 1-1: USB disconnect, device number 3
[   41.191284] usb 1-1.1: USB disconnect, device number 4
[   41.218958] usb 1-1.5: USB disconnect, device number 5
[   41.238117] android_work: sent uevent USB_STATE=CONFIGURED
[   41.240572] android_work: sent uevent USB_STATE=DISCONNECTED
[   41.263285] platform dabr_udc.0: unregister gadget driver 'configfs-gadget'
[   41.263413] configfs-gadget gadget: unbind function 'Function FS
Gadget'/ffff8801db049e38
[   41.263969] configfs-gadget gadget: unbind function
'cdc_network'/ffff8801d8897400
[   41.325943] dabridge 1-1.5:1.0: Port 3 VBUS OFF
[   41.720957] dabr_udc deleted
[   41.721097] dabridge 1-5 deleted

The UDC and gadget will be deleted after switch role to device mode.
And they will be
created as new object when switching back to host mode. At this time
the bind in function
driver (e.g. f_ncm) will not set the new gadget.

For kernel 4.19+, the role switch command will be:
  echo "device" > /sys/class/usb_role/intel_xhci_usb_sw-role-switch/role

The latest Intel role switch kernel driver can be found here:
  https://elixir.bootlin.com/linux/v5.2-rc5/source/drivers/usb/roles/intel-xhci-usb-role-switch.c

Thanks,
Lianwei
