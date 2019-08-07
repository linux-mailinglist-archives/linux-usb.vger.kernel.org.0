Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECAC84FFF
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 17:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388603AbfHGPfX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 11:35:23 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35774 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387827AbfHGPfW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 11:35:22 -0400
Received: by mail-pl1-f196.google.com with SMTP id w24so41366730plp.2
        for <linux-usb@vger.kernel.org>; Wed, 07 Aug 2019 08:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gnarbox-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Nh/QKkbVOBO4v1ln8lBmY96P6axV6YQy6Nrs8VvHwAo=;
        b=phXf0nwf13VzZ59yOK9s4wTAGTNuDuPFaYs9Pld2bFgRbOwnjAeNIM+vr/aJHB0PA9
         IyPEZ31p0AFRX2INcbdsrsFCBzMfm45JoXqVvR7Ra6gBR26TA1iEt3AV3GI5Dw+4Q6f3
         3l/jDvRJjDrSDoO5Ys/TSH4XaEFLnA/FYtDmoBtE4upazXbIfkrezfY1lsFoEF9rPo0X
         kYGF5zNSuTTxM6G+tfRx1NtbNohRrzppOpPrpdeClJHsnbURr7Pq/DXaPaOlegwj/3Jg
         jIXPUHbRkJgJvbWkLHoEHqSYdDLSMwtlZpaRaj9BLaUqKpY2MdXUmkOF2vqMgr1KuH4Q
         OW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nh/QKkbVOBO4v1ln8lBmY96P6axV6YQy6Nrs8VvHwAo=;
        b=uUqwh/xki5ZCePuGEgDoEn3k3w517dordtyO5yOSA696Dbe7PEKZRd+xH41eFfyjs+
         SVO2GCT8+vYevLZYWZ+xjkQDcfIdWwlPfiE6ZyEqcMbZ8IHtLopWmo07sY/bAlCHpngR
         KOb5uHXp5GAdPeEjKv6zJuqkHmD1xvOvJUoEf9sS1dGy379o5PIL69Y10WL9IK+8ghOD
         LPS9G+rK+IMh80H9Czv5BcKqxnuC/OGhuRdax4xNSLkjvyTTlXy93PAA2NKVbv4/WSaO
         Zf/935Nd+9UjDk3HWRR58Qo/DZqDj4wPZ3AUmOnZqviQVCyVcjj5f1zGEUJNNeMbcmci
         IfTQ==
X-Gm-Message-State: APjAAAWMlJPZMPhNgKUA9D9bWVrRF58by+gUwwG3HKNcHpuOCC8cs17V
        QZlzRLzF2zavD0+vZv3YCU7fn2nkrcMzGA==
X-Google-Smtp-Source: APXvYqwcIW3gYqe5+dbsHoZUCjwtauKtvmkj71zKXbdjOzO9Yx/BnDpYAcfMmFmimGBX5yU2J0VOHg==
X-Received: by 2002:a63:1918:: with SMTP id z24mr7889717pgl.94.1565192121669;
        Wed, 07 Aug 2019 08:35:21 -0700 (PDT)
Received: from coops (cpe-104-173-199-40.socal.res.rr.com. [104.173.199.40])
        by smtp.gmail.com with ESMTPSA id a128sm104532072pfb.185.2019.08.07.08.35.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 08:35:20 -0700 (PDT)
Date:   Wed, 7 Aug 2019 08:35:18 -0700
From:   Rob Weber <rob@gnarbox.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Peter Chen <hzpeterchen@gmail.com>, Evan Gates <evan@gnarbox.com>,
        linux-usb@vger.kernel.org
Subject: Re: EHSET USB testing
Message-ID: <20190807153518.GA14395@coops>
References: <20190802200325.22897-1-evan@gnarbox.com>
 <CAL411-q1Hxkh+i3WRcAPM7QZ_yC-96jBfAx-t4PRJH7Cs1fvjA@mail.gmail.com>
 <20190807042500.GA10249@coops>
 <e0b29b09-e4d7-80c9-dc27-6088a8e92bc0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0b29b09-e4d7-80c9-dc27-6088a8e92bc0@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On Wed, Aug 07, 2019 at 02:11:03PM +0300, Mathias Nyman wrote:
> On 7.8.2019 7.25, Rob Weber wrote:
> > Hi Everyone,
> > 
> > (Pinging Mathias regarding xHCI support of the USB 2.0 test modes)
> > 
> > On Mon, Aug 05, 2019 at 02:07:23PM +0800, Peter Chen wrote:
> > > On Sun, Aug 4, 2019 at 10:45 AM Evan Gates <evan@gnarbox.com> wrote:
> > > > 
> > > > I'm trying to get my device to pass the EHSET tests.  I found the thread
> > > > "Using EHSET module" from March.  I'm having similar issues.
> > > > 
> > > > I don't have access to the PID VID board that the lab uses.  Instead I'm
> > > > using another computer setup as a mass storage gadget but set the VID:PID
> > > > to 1a0a:0102 (TEST_J).  If that sounds like a problem or there is another,
> > > > better way to do this please let me know.
> > > > 
> > > > > The usb-storage driver bound to your device first.  Try building a
> > > > > kernel without that driver and then it shoudl bind to the other driver.
> > > > > 
> > > > > Or manually bind the ehset driver to your device through sysfs.  Read up
> > > > > on the documentation for the "new_id" and "bind" and "unbind" sysfs
> > > > > files for how to do that.
> > > > 
> > > > I did this.  I was able to unbind from usb-storage but binding to
> > > > usb_ehset_test failed with error -32 (AFAICT EPIPE).  I tried both the
> > > > usb_ehset_test/bind and usb_ehset_test/new_id methods.  In both cases
> > > > I got the same error.
> > > > 
> > > > I did another build without usb-storage.  Now I don't have to go through
> > > > the unbind step but I still get the same error while probing.
> > > > 
> > > >          [  296.089877] usb 1-1: new high-speed USB device number 2 using xhci_hcd
> > > >          [  296.271081] usb_ehset_test: probe of 1-1:1.0 failed with error -32
> > > > 
> > > > I notice that it says "using xhci_hcd."  Is that a problem?  Does it
> > > > need to be ehci?  I tried a build without xhci but that caused other
> > > > problems for me.
> > > > 
> > > > 1) Can I use a computer in device mode to present a VID:PID to get into
> > > > EHSET mode?  If so how should I do that?
> > > > 
> > > 
> > > Afaik, you can't. No Host computer will act as USB device. You may try
> > > to configure your box as USB device mode, for gadget driver, you could
> > > using legacy g_zero module, or source_sink function using configfs.
> > > 
> > > > 2) What else do I need to do in order to get my box into EHSET mode?
> > > Only thing is your box need to be at host mode. For testing USB2 for xHCI,
> > > the mainline code should not support TEST_SINGLE_STEP_SET_FEATURE
> > > at my last access.
> > 
> > Today I was able to get access to a PID/VID test fixture that is used in
> > USB 2.0 EHSET testing. Some of the major findings include:
> > 
> > 1. The only test mode that works properly is
> >     TEST_HS_HOST_PORT_SUSPEND_RESUME. All other probes of the ehset module
> >     fail with errno -32 as shown above. This test mode is likely the only
> >     one to work because it does not set the PORT_FEAT_TEST feature for the
> >     appropriate port, but rather sets and clears the PORT_FEAT_SUSPEND feature.
> > 
> > 2. The same issue was observed on not only our custom hardware, but also
> >     a Dell XPS 13 running Ubuntu 18.04 with kernel version 4.15. I've
> >     attached the dmesg logs with xhci_hcd dynamic debug enabled for both
> >     hosts. The logs were captured while testing the TEST_PACKET test
> >     mode, but the logs looked similar for every other rest mode besides
> >     HS_HOST_PORT_SUSPEND_RESUME.
> > 
> > 
> > Mathias, I would appreciate your feedback on the attached dmesg logs
> > with xhci_hcd dynamic debug enabled. If you have a moment, could you
> > please take a look at the logs and let me know if there are any clues as
> > to why the test mode is not working with xhci_hcd? I've also attached
> > the lsusb output for this particular EHSET test fixture made by Allion.
> > 
> > I've been digging into the xHCI specification to see what details it
> > might contain about the USB 2.0 test modes we are trying to use.
> > Section 4.19.6 describes the proper sequence for enabling the USB 2.0
> > port test modes. This requires setting the appropriate bits in the USB
> > 2.0 PORTPMSC register, which is described in full detail in section
> > 5.4.9.2. It's clear that xHCI should support the EHSET test modes,
> > but we're not able to set the appropriate port features for some reason.
> > 
> > My next thought is to double-check the logic of the ehset driver as it
> > relates to xhci_hcd. I would like to make sure that we are enabling the
> > USB 2.0 test modes according to the xHCI spec. I'm concerned that we
> > might be experiencing an error because we aren't setting the test mode
> > acording to section 4.19.6 of the xHCI specification.
> > 
> > Thanks in advance for reviewing the logs, Mathias! I appreciate any time
> > and feedback you may be able to provide. Let me know if you have any
> > further questions or need more information from me. I look forward to
> > hearing from you soon!
> > 
> 
> In the XPS case there might be a hub between the roothub and your device,
> It's possible the SetPortFeature(PORT_TEST) request is sent to ep0 of that
> hub instead of the xhci roothub, causing a stall and return -EPIPE:  (-32)
> 
> Log shows device is usb 1-1.1, and endpoint0 is stalling:
> 
> [110706.362119] usb 1-1.1: Product: USB-VPID
> ...
> [110706.363205] xhci_hcd 0000:00:14.0: Stalled endpoint for slot 2 ep 0
> [110706.363214] xhci_hcd 0000:00:14.0: Cleaning up stalled endpoint ring
> [110706.363264] xhci_hcd 0000:00:14.0: Giveback URB 00000000c9facae3, len = 0, expected = 0, status = -32
> [110706.363282] xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd, deq = @268c83930
> [110706.363306] usb_ehset_test: probe of 1-1.1:1.0 failed with error -32
> 
> For the other case the SetPortFeature(PORT_TEST) request should be handled in xhci-hub.c
> xhci_hub_control()
> ...
>     case USB_PORT_FEAT_TEST:
>         /* 4.19.6 Port Test Modes (USB2 Test Mode) */
>         if (hcd->speed != HCD_USB2)
>             goto error;
>         if (test_mode > TEST_FORCE_EN || test_mode < TEST_J)
>             goto error;
>         retval = xhci_enter_test_mode(xhci, test_mode, wIndex, &flags);
>             break;
> ...
> error:
>     retval = -EPIPE;
> 
> The first thing xhci_enter_test_mode() does is print a
> "Disable all slots" debug message, it's missing from your logs, so I think
> we never got that far.
> 
> You could add a quick hack to show if xhci roothub gets the SetPortFeat(PORT_TEST) request:
> 
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index 3abe70f..b3f8392 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -1357,6 +1357,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>                         break;
>                 case USB_PORT_FEAT_TEST:
>                         /* 4.19.6 Port Test Modes (USB2 Test Mode) */
> +                       xhci_err(xhci, "SetPortFeat(PORT_TEST) wIndex %d, test_mode %d, hcd->speed 0x%x\n",
> +                                wIndex, test_mode, hcd->speed);
>                         if (hcd->speed != HCD_USB2)
>                                 goto error;
>                         if (test_mode > TEST_FORCE_EN || test_mode < TEST_J)
> 

Thank you for the suggestion! I started stepping through the code to
find the USB_PORT_FEAT_TEST case inside xhci_hub_control, but that patch
seems to have been added after kernel version 4.9.115. This is likely
the cause of the -EPIPE error inside xhci_hub_control. I think the patch
"usb: xhci: Add port test modes support for usb2" [1] is what I need.

I'll apply this patch soon and re-test. Thanks for the help!

Cheers,
Rob Weber

[1] https://www.spinics.net/lists/linux-usb/msg155901.html
