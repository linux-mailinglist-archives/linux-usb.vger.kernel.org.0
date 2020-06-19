Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1651A200B37
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 16:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733060AbgFSOT5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 19 Jun 2020 10:19:57 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37771 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgFSOTz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jun 2020 10:19:55 -0400
Received: from mail-pj1-f70.google.com ([209.85.216.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jmHs0-0003eE-KW
        for linux-usb@vger.kernel.org; Fri, 19 Jun 2020 14:19:52 +0000
Received: by mail-pj1-f70.google.com with SMTP id ge4so6576197pjb.7
        for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2020 07:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=WMDBGknWyjd+4i+sbe8PAvtkOzhlh+B/m5/HQqBhznQ=;
        b=uKj19p+vmM7t3BXEi1Sj1Cvl1Qg26Aei9jciT+41GDscJ1TNOP7OoVzCBWyPkZ2Bwx
         d0KFSB11Y4+yLUJdha4GIovrdQPhR6sqtoODG5ZFDnhWNAR05g40gye6Xy0cKDrlejw9
         8HaqfujOvOJJQ1MlZ7ovUGCGDxEuoDG0H7wIftbAfOXkozCCqEaRPfRLl/FG0V3U5m3s
         oAswLD8AROqcDoobtPKzKYajJaELYeTvHYJO85yf5wTbT7+J8xAspixcH7rqNBO8Kfwy
         t87LA1wA2wtjwQnU05Hb3YKaoCOwj62AEhID9dEgfmlKntN1gmdE4sk3E6WlY4uz0V5G
         OP+g==
X-Gm-Message-State: AOAM531n/3kQJVQ76dfw717gT8gmNHP/yrLePWiRb2YTFIEan/Vwx2fX
        UFkYvPCl0KHmd3OxESwkBS8oiTvPtqtoC/9NvHepbBrCfWd+49dtdIANWd2+Fkj8Tu0LDfFqo2a
        ZWomMld4TsRvbDgQekPsn6yYRlgW2a/XFpCOv6g==
X-Received: by 2002:a17:902:c40c:: with SMTP id k12mr8573186plk.105.1592576391159;
        Fri, 19 Jun 2020 07:19:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKVtVcUI8/eYnIatX58zJs4lUv4lpkykPxuyMHs1wJ7nDK1P95gS3lxcsqSMOrbP5cKCcA1g==
X-Received: by 2002:a17:902:c40c:: with SMTP id k12mr8573153plk.105.1592576390653;
        Fri, 19 Jun 2020 07:19:50 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id gg10sm5333211pjb.38.2020.06.19.07.19.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jun 2020 07:19:49 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 2/2] xhci: Poll for U0 after disabling USB2 LPM
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <8327233C-5DE8-43F8-9208-5FF888629047@canonical.com>
Date:   Fri, 19 Jun 2020 22:19:46 +0800
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <9FC0BA5C-4D00-4D33-B040-AA5584A8E9A6@canonical.com>
References: <20200520101811.2623-1-kai.heng.feng@canonical.com>
 <20200520101811.2623-2-kai.heng.feng@canonical.com>
 <6c3ac2e5-73e9-6e4f-2940-63403821631f@linux.intel.com>
 <8327233C-5DE8-43F8-9208-5FF888629047@canonical.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

> On Jun 9, 2020, at 18:15, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> 
> 
> 
>> On Jun 8, 2020, at 19:21, Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
>> 
>> On 20.5.2020 13.18, Kai-Heng Feng wrote:
>>> USB2 devices with LPM enabled may interrupt the system suspend:
>>> [  932.510475] usb 1-7: usb suspend, wakeup 0
>>> [  932.510549] hub 1-0:1.0: hub_suspend
>>> [  932.510581] usb usb1: bus suspend, wakeup 0
>>> [  932.510590] xhci_hcd 0000:00:14.0: port 9 not suspended
>>> [  932.510593] xhci_hcd 0000:00:14.0: port 8 not suspended
>>> ..
>>> [  932.520323] xhci_hcd 0000:00:14.0: Port change event, 1-7, id 7, portsc: 0x400e03
>> 
>> 400e03 = Connected, Enabled, U0 with port ink state change flag (PLC) set.
>> 
>>> ..
>>> [  932.591405] PM: pci_pm_suspend(): hcd_pci_suspend+0x0/0x30 returns -16
>>> [  932.591414] PM: dpm_run_callback(): pci_pm_suspend+0x0/0x160 returns -16
>>> [  932.591418] PM: Device 0000:00:14.0 failed to suspend async: error -16
>>> 
>>> During system suspend, USB core will let HC suspends the device if it
>>> doesn't have remote wakeup enabled and doesn't have any children.
>>> However, from the log above we can see that the usb 1-7 doesn't get bus
>>> suspended due to not in U0. After a while the port finished U2 -> U0
>>> transition, interrupts the suspend process.
>> 
>> In USB2 HW link PM the PLC flag should not be set in U2Exit -> U0 transitions.
>> Only case we should see a port change event is U2Entry -> U0 due to STALL or
>> error/timeout. (see xhci 4.23.5.1.1.1)
>> 
>>> 
>>> The observation is that after disabling LPM, port doesn't transit to U0
>>> immediately and can linger in U2. xHCI spec 4.23.5.2 states that the
>>> maximum exit latency for USB2 LPM should be BESL + 10us. The BESL for
>>> the affected device is advertised as 400us, which is still not enough
>>> based on my testing result.
>>> 
>>> So let's use the maximum permitted latency, 10000, to poll for U0
>>> status to solve the issue.
>> 
>> I don't recall all details, but it could be that disabling LPM before suspend
>> is unnecessary. 
>> At least xhci should be able to set a port to U3 from U1 and U2 (see xhci 4.15.1)
>> so that is one change that could be done to xhci_bus_suspend()
> 
> Yes, put the device to U3 directly does the trick.

As discussed, will you pick this series over the v2?
Or is there anything I should improve for this one?

Kai-Heng

> 
>> 
>> Also just noticed that we are not really checking L1S field in PORTPMSC register, 
>> this should tell if there was an issue with USB2 lpm state transitions, and
>> perhaps we should disable lpm for that device. 
>> 
>> Does the L1S field show anything unuaual in your case?
>> That could explain the port event with the PLC bit set.
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 2c255d0620b0..a2099d42e490 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -1592,7 +1592,7 @@ static void handle_port_status(struct xhci_hcd *xhci,
> {
>        struct usb_hcd *hcd;
>        u32 port_id;
> -       u32 portsc, cmd_reg;
> +       u32 portsc, portpmsc, cmd_reg;
>        int max_ports;
>        int slot_id;
>        unsigned int hcd_portnum;
> @@ -1634,9 +1634,10 @@ static void handle_port_status(struct xhci_hcd *xhci,
>        bus_state = &port->rhub->bus_state;
>        hcd_portnum = port->hcd_portnum;
>        portsc = readl(port->addr);
> +       portpmsc = readl(port->addr + PORTPMSC);
> 
> -       xhci_dbg(xhci, "Port change event, %d-%d, id %d, portsc: 0x%x\n",
> -                hcd->self.busnum, hcd_portnum + 1, port_id, portsc);
> +       xhci_dbg(xhci, "Port change event, %d-%d, id %d, portsc: 0x%x, portpmsc 0x%0x\n",
> +                hcd->self.busnum, hcd_portnum + 1, port_id, portsc, portpmsc);
> 
>        trace_xhci_handle_port_status(hcd_portnum, portsc);
> 
> [  685.460054] xhci_hcd 0000:00:14.0: Port change event, 1-7, id 7, portsc: 0x400e03, portpmsc 0x1
> [  685.460062] xhci_hcd 0000:00:14.0: resume root hub
> [  685.460079] xhci_hcd 0000:00:14.0: handle_port_status: starting port polling.
> [  685.460094] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping port polling.
> [  685.521685] PM: pci_pm_suspend(): hcd_pci_suspend+0x0/0x30 returns -16
> [  685.521695] PM: dpm_run_callback(): pci_pm_suspend+0x0/0x160 returns -16
> [  685.521699] PM: Device 0000:00:14.0 failed to suspend async: error -16
> 
> So after disabling LPM, it takes a long time to complete L1 transition, before transitioning to L0.
> 
> Kai-Heng
> 
>> 
>> I think we can avoid a readl_poll_timeout() solution in this case.
>> 
>> -Mathias

