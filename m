Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA53D360FF0
	for <lists+linux-usb@lfdr.de>; Thu, 15 Apr 2021 18:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234136AbhDOQOU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Apr 2021 12:14:20 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59554 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbhDOQOT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Apr 2021 12:14:19 -0400
Received: from mail-ot1-f69.google.com ([209.85.210.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chris.chiu@canonical.com>)
        id 1lX4ct-0000wE-KB
        for linux-usb@vger.kernel.org; Thu, 15 Apr 2021 16:13:55 +0000
Received: by mail-ot1-f69.google.com with SMTP id l14-20020a05683004aeb029028919a6fae1so3231125otd.17
        for <linux-usb@vger.kernel.org>; Thu, 15 Apr 2021 09:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PoBRnXr8Cr0X0MRit5d9FD8OWQUaxA4q/o9zqh6RF3M=;
        b=D8wYMDOkUdJFhznqqkfMDFbVgONEhLpbULX/uSknOCilOkDzooKHhBWS4ZI8EF3Hkh
         8WXOL++fI/cxCsHXDXcmdWjpjZ/AX8P/10t3ePavzsb+gu60/8rBadopD8vrkcwZ0uo/
         8bLfABalpULPMyfEgHEzbuOwLxqeFwcQMJg12uRCR/1kp2/atjeTdXIgSS1qOFkVhLcK
         1b/sIaWIxo13InIe9plZNbpUpoLcF5ewg971aKmY3o5JLLeTZgXUFuJ812H7SJP9wGKK
         hPoMB+ynHjpw5R+28j0B0uiQ+yHuwnLTtj8jg3FPrODr4ykiK7J9JKOGwSpStyqXlrK6
         Ndgw==
X-Gm-Message-State: AOAM532ZcAVZSOQ8oh+WgGos9qqSX2U0k43JCdYC+usCH/ZNEgoTR4A0
        IyATEx63+OdQTZoI6UhpXSuKt4HQipYmXFcnI4tbroBo9mDhB/vODBLwVpvtDQZ0DGURmHi1/Rx
        XVTo2OCRsmvFJ8E1Z0RokH0YbXwIFuCBsS6ZaRKATrxSH7jOMhK1rsQ==
X-Received: by 2002:a05:6830:4121:: with SMTP id w33mr26955ott.153.1618503234539;
        Thu, 15 Apr 2021 09:13:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTkN5yPeNIlgujYmM5xJmJgHMEuCM7Dc7p2j6tks6lvmgL3bOASaVyOIYRFOrqnhmcxQM9VvC5z3iamo9B4ok=
X-Received: by 2002:a05:6830:4121:: with SMTP id w33mr26945ott.153.1618503234322;
 Thu, 15 Apr 2021 09:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210415114856.4555-1-chris.chiu@canonical.com> <YHgyP8tGNM1Wi5dJ@kroah.com>
In-Reply-To: <YHgyP8tGNM1Wi5dJ@kroah.com>
From:   Chris Chiu <chris.chiu@canonical.com>
Date:   Fri, 16 Apr 2021 00:13:43 +0800
Message-ID: <CABTNMG0MuaSkWZhiTwtWjPTg5WZ-Vdt9Ju9-RzBke9JjCBJo8Q@mail.gmail.com>
Subject: Re: [PATCH v3] USB: Don't set USB_PORT_FEAT_SUSPEND on WD19's Realtek Hub
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, m.v.b@runbox.com,
        hadess@hadess.net, linux-usb@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 15, 2021 at 8:32 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Apr 15, 2021 at 07:48:56PM +0800, chris.chiu@canonical.com wrote:
> > From: Chris Chiu <chris.chiu@canonical.com>
> >
> > Realtek Hub (0bda:5487) in Dell Dock WD19 sometimes fails to work
> > after the system resumes from suspend with remote wakeup enabled
> > device connected:
> > [ 1947.640907] hub 5-2.3:1.0: hub_ext_port_status failed (err = -71)
> > [ 1947.641208] usb 5-2.3-port5: cannot disable (err = -71)
> > [ 1947.641401] hub 5-2.3:1.0: hub_ext_port_status failed (err = -71)
> > [ 1947.641450] usb 5-2.3-port4: cannot reset (err = -71)
>
> How does other operating systems handle this?  The hardware seems like
> it does not follow the USB spec, how did it get "certified"?
>
I agree. All usb hubs that claim to support Selective Scan should handle
SetPortFeature (PORT_SUSPEND) w/o problems. As I know, the Windows
usb device driver should submit an Idle Request before it's really going to
suspend, and the bus driver will "selectively" suspend the port.

One thing worth mentioning here, I never hit the hub_ext_port_status -71
problem if I resume by waking up from the keyboard connected to the hub.
But the usbcore kernel log shows me wPortStatus: 0503 wPortChane: 0004
of that port while resuming. In normal cases, they are 0507:0000.
 I don't know how to SetPortFeature() with setting the status change bit only.
Or maybe it's just some kind of timing issue of the
idle/suspend/resume signaling.

Chris

> > Information of this hub:
> > T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 10 Spd=480  MxCh= 5
> > D:  Ver= 2.10 Cls=09(hub  ) Sub=00 Prot=02 MxPS=64 #Cfgs=  1
> > P:  Vendor=0bda ProdID=5487 Rev= 1.47
> > S:  Manufacturer=Dell Inc.
> > S:  Product=Dell dock
> > C:* #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=  0mA
> > I:  If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=01 Driver=hub
> > E:  Ad=81(I) Atr=03(Int.) MxPS=   1 Ivl=256ms
> > I:* If#= 0 Alt= 1 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=02 Driver=hub
> > E:  Ad=81(I) Atr=03(Int.) MxPS=   1 Ivl=256ms
> >
> > The failure results from the ETIMEDOUT by chance when turning on
> > the suspend feature for the target port of the hub. The port
> > will be unresponsive and placed in unknown state. The hub_activate
> > invoked during resume will fail to get the port stautus with -EPROTO.
> > Then all devices connected to the hub will never be found and probed.
> >
> > The USB_PORT_FEAT_SUSPEND is not really necessary due to the
> > "global suspend" in USB 2.0 spec. It's only for many hub devices
> > which don't relay wakeup requests from the devices connected to
> > downstream ports. For this realtek hub, there's no problem waking
> > up the system from connected keyboard.
> >
> > This commit bypasses the USB_PORT_FEAT_SUSPEND for the quirky hub.
>
> Can you make this only be allowed for hubs?  But why doesn't the nomal
> "this can not suspend properly" bit work for this?  We have that for
> other USB devices already.
>
> thanks,
>
> greg k-h
