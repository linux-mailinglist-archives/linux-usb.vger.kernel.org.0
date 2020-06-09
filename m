Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD6431F37B3
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jun 2020 12:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbgFIKPh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 9 Jun 2020 06:15:37 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37224 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727831AbgFIKPg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Jun 2020 06:15:36 -0400
Received: from mail-pg1-f198.google.com ([209.85.215.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jibI5-0001A0-JP
        for linux-usb@vger.kernel.org; Tue, 09 Jun 2020 10:15:33 +0000
Received: by mail-pg1-f198.google.com with SMTP id o7so6532477pgb.1
        for <linux-usb@vger.kernel.org>; Tue, 09 Jun 2020 03:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=QP60xocmOwC5IAaiglv4xTRRaQB+4Ty9qPp45ts3sEo=;
        b=HxpRYVblSOsOWcFIytK836GLmnSphCJdM1Pn29uWSfX1nUmSyEmDJlI3xQmC4VSIX6
         SX3phdCCT76uucvV2MS6Wju1l/EMskCSvMixbcXDTKmjh8BUZkV/fUBxp2hDzkXgHWqr
         xBGfxfBtyWhcnD/aBJM8RIdERfQdQ5fE9Htw5n3GreagYKpkpn9Cd1SFmn2KtIV23edT
         Y5qGFvZW5u11dvbfLQcigDEz2WHez2Kc9taXfu6GjMCFcFfGujZ6Aqo7pqtb2oVLxdDY
         K2nAkFJQyCyrGN6H0X4YoDb2AAC6NWvRR7RbmIKbt3f17cfXea2omp06XRMkZy37Isa8
         w4dw==
X-Gm-Message-State: AOAM533pii0zVokyDplEGXM3LlB2O4yLeCu1I1jq/b3Tg4Ey4Tjdo32R
        6s/ZsAsdgoXB3pktsI1xkaqjXPii/yaKa/M1fp4hmEQ8HrXulQegXbhp11GUrnmFCxM6yQplshA
        bBm5ONYnvzqAV6Xv76SVHaDwWOfe7U6Hcdezh/Q==
X-Received: by 2002:a63:565b:: with SMTP id g27mr23932062pgm.166.1591697731814;
        Tue, 09 Jun 2020 03:15:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+/b+8Tto0RYWElC0VZLuZQwAJZOeuyJFOli1+TJe6rzxJ71wQl1iYvjjeSfuVZ1nKQI1ejw==
X-Received: by 2002:a63:565b:: with SMTP id g27mr23932037pgm.166.1591697731426;
        Tue, 09 Jun 2020 03:15:31 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id o1sm2260671pjf.17.2020.06.09.03.15.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 03:15:30 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 2/2] xhci: Poll for U0 after disabling USB2 LPM
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <6c3ac2e5-73e9-6e4f-2940-63403821631f@linux.intel.com>
Date:   Tue, 9 Jun 2020 18:15:28 +0800
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <8327233C-5DE8-43F8-9208-5FF888629047@canonical.com>
References: <20200520101811.2623-1-kai.heng.feng@canonical.com>
 <20200520101811.2623-2-kai.heng.feng@canonical.com>
 <6c3ac2e5-73e9-6e4f-2940-63403821631f@linux.intel.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Jun 8, 2020, at 19:21, Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
> 
> On 20.5.2020 13.18, Kai-Heng Feng wrote:
>> USB2 devices with LPM enabled may interrupt the system suspend:
>> [  932.510475] usb 1-7: usb suspend, wakeup 0
>> [  932.510549] hub 1-0:1.0: hub_suspend
>> [  932.510581] usb usb1: bus suspend, wakeup 0
>> [  932.510590] xhci_hcd 0000:00:14.0: port 9 not suspended
>> [  932.510593] xhci_hcd 0000:00:14.0: port 8 not suspended
>> ..
>> [  932.520323] xhci_hcd 0000:00:14.0: Port change event, 1-7, id 7, portsc: 0x400e03
> 
> 400e03 = Connected, Enabled, U0 with port ink state change flag (PLC) set.
> 
>> ..
>> [  932.591405] PM: pci_pm_suspend(): hcd_pci_suspend+0x0/0x30 returns -16
>> [  932.591414] PM: dpm_run_callback(): pci_pm_suspend+0x0/0x160 returns -16
>> [  932.591418] PM: Device 0000:00:14.0 failed to suspend async: error -16
>> 
>> During system suspend, USB core will let HC suspends the device if it
>> doesn't have remote wakeup enabled and doesn't have any children.
>> However, from the log above we can see that the usb 1-7 doesn't get bus
>> suspended due to not in U0. After a while the port finished U2 -> U0
>> transition, interrupts the suspend process.
> 
> In USB2 HW link PM the PLC flag should not be set in U2Exit -> U0 transitions.
> Only case we should see a port change event is U2Entry -> U0 due to STALL or
> error/timeout. (see xhci 4.23.5.1.1.1)
> 
>> 
>> The observation is that after disabling LPM, port doesn't transit to U0
>> immediately and can linger in U2. xHCI spec 4.23.5.2 states that the
>> maximum exit latency for USB2 LPM should be BESL + 10us. The BESL for
>> the affected device is advertised as 400us, which is still not enough
>> based on my testing result.
>> 
>> So let's use the maximum permitted latency, 10000, to poll for U0
>> status to solve the issue.
> 
> I don't recall all details, but it could be that disabling LPM before suspend
> is unnecessary. 
> At least xhci should be able to set a port to U3 from U1 and U2 (see xhci 4.15.1)
> so that is one change that could be done to xhci_bus_suspend()

Yes, put the device to U3 directly does the trick.

> 
> Also just noticed that we are not really checking L1S field in PORTPMSC register, 
> this should tell if there was an issue with USB2 lpm state transitions, and
> perhaps we should disable lpm for that device. 
> 
> Does the L1S field show anything unuaual in your case?
> That could explain the port event with the PLC bit set.

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 2c255d0620b0..a2099d42e490 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1592,7 +1592,7 @@ static void handle_port_status(struct xhci_hcd *xhci,
 {
        struct usb_hcd *hcd;
        u32 port_id;
-       u32 portsc, cmd_reg;
+       u32 portsc, portpmsc, cmd_reg;
        int max_ports;
        int slot_id;
        unsigned int hcd_portnum;
@@ -1634,9 +1634,10 @@ static void handle_port_status(struct xhci_hcd *xhci,
        bus_state = &port->rhub->bus_state;
        hcd_portnum = port->hcd_portnum;
        portsc = readl(port->addr);
+       portpmsc = readl(port->addr + PORTPMSC);
 
-       xhci_dbg(xhci, "Port change event, %d-%d, id %d, portsc: 0x%x\n",
-                hcd->self.busnum, hcd_portnum + 1, port_id, portsc);
+       xhci_dbg(xhci, "Port change event, %d-%d, id %d, portsc: 0x%x, portpmsc 0x%0x\n",
+                hcd->self.busnum, hcd_portnum + 1, port_id, portsc, portpmsc);
 
        trace_xhci_handle_port_status(hcd_portnum, portsc);

[  685.460054] xhci_hcd 0000:00:14.0: Port change event, 1-7, id 7, portsc: 0x400e03, portpmsc 0x1
[  685.460062] xhci_hcd 0000:00:14.0: resume root hub
[  685.460079] xhci_hcd 0000:00:14.0: handle_port_status: starting port polling.
[  685.460094] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping port polling.
[  685.521685] PM: pci_pm_suspend(): hcd_pci_suspend+0x0/0x30 returns -16
[  685.521695] PM: dpm_run_callback(): pci_pm_suspend+0x0/0x160 returns -16
[  685.521699] PM: Device 0000:00:14.0 failed to suspend async: error -16

So after disabling LPM, it takes a long time to complete L1 transition, before transitioning to L0.

Kai-Heng

> 
> I think we can avoid a readl_poll_timeout() solution in this case.
> 
> -Mathias

