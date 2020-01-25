Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B02A5149689
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jan 2020 17:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgAYQOJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jan 2020 11:14:09 -0500
Received: from netrider.rowland.org ([192.131.102.5]:45749 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725843AbgAYQOJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jan 2020 11:14:09 -0500
Received: (qmail 20487 invoked by uid 500); 25 Jan 2020 11:14:08 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Jan 2020 11:14:08 -0500
Date:   Sat, 25 Jan 2020 11:14:08 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     JH <jupiter.hce@gmail.com>
cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: qmi_wwan error
In-Reply-To: <CAA=hcWSKXboOcvySVksL3eceRuWnPt=c7nv1gPPX3AQKgPGhCw@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2001251111060.20113-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 25 Jan 2020, JH wrote:

> Hi Alan,
> 
> On 1/25/20, Alan Stern <stern@rowland.harvard.edu> wrote:
> > On Fri, 24 Jan 2020, JH wrote:
> >
> >> Hi,
> >>
> >> I am running kernel 4.19.75 on iMX6 with a uBlox SARA-R4 LTE modem,
> >> the modem manager is oFono, connect manager is connman. It could
> >> connect to LTE between half hours to hours, then it dropped LTE
> >> connection randomly, here are error messages, what could cause the
> >> qmi_wwan status received: -71 and qmi_wwan usb_submit_urb failed with
> >> result -19 errors?
> >
> > The most likely cause is that the modem's firmware crashed, or it
> > disconnected itself electronically from the USB bus.  Or else somebody
> > unplugged the USB cable.
> 
> There is no physical USB cable to connect to the device, the device
> USB power supply is from its internal DC source which converted and
> connected from external normal AC power. If it is a USB electronic
> fault, the firmware is using Linux kernel USB, oFono and connman,
> which one could be the source to cause the crash, Linux kernel USB
> driver, oFono or connman?

I have no idea.  In fact, I know nothing at all about qmi_wwan, oFono,
or connman.

Have you tried looking at the kernel log on the device to see if it 
gives any clues?

> I am diagnosing the issue, I try to narrow down the source to cause
> the problem, is it fair to say that the higher layer software package
> including oFono, connman or our software applications is unlikely the
> source to cause the problem?

No, it isn't fair to say that.  The problem could lie anywhere.

Alan Stern

> Appreciate if you could advise which components could be the issue,
> what could be a solution to fix it.
> 
> Thank you.
> 
> Kind regards,
> 
> - jh
> 
> > Alan Stern
> >
> >>
> >> [ 1018.944840] usb 1-1: USB disconnect, device number 2
> >> [ 1019.072845] option1 ttyUSB0: GSM modem (1-port) converter now
> >> disconnected from ttyUSB0
> >> [ 1019.130834] option 1-1:1.0: device disconnected
> >> [ 1019.142012] qmi_wwan 1-1:1.3: nonzero urb status received: -71
> >> [ 1019.147909] qmi_wwan 1-1:1.3: wdm_int_callback - 0 bytes
> >> [ 1019.153254] qmi_wwan 1-1:1.3: wdm_int_callback - usb_submit_urb
> >> failed with result -19
> >> [ 1019.228197] option1 ttyUSB1: GSM modem (1-port) converter now
> >> disconnected from ttyUSB1
> >> [ 1019.274475] option 1-1:1.2: device disconnected
> >> [ 1019.340442] qmi_wwan 1-1:1.3 wwan0: unregister 'qmi_wwan'
> >> usb-ci_hdrc.1-1, WWAN/QMI device
> >> [ 1022.827992] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> >> [ 1023.057165] option 1-1:1.0: GSM modem (1-port) converter detected
> >> [ 1023.097815] usb 1-1: GSM modem (1-port) converter now attached to
> >> ttyUSB0
> >> [ 1023.157293] option 1-1:1.2: GSM modem (1-port) converter detected
> >> [ 1023.178163] usb 1-1: GSM modem (1-port) converter now attached to
> >> ttyUSB1
> >> [ 1023.201251] qmi_wwan 1-1:1.3: cdc-wdm0: USB WDM device
> >> [ 1023.243783] qmi_wwan 1-1:1.3 wwan0: register 'qmi_wwan' at
> >> usb-ci_hdrc.1-1, WWAN/QMI device, 16:ed:38:aa:c5:90
> >>
> >> Thank you.
> >>
> >> Kind regards,
> >>
> >> - jh
> >
> >
> 

