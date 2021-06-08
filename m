Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 785BB39F2A3
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 11:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhFHJnL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 05:43:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:40104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229507AbhFHJnL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Jun 2021 05:43:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88EF561246;
        Tue,  8 Jun 2021 09:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623145278;
        bh=uCglrdbTxsLXxZlXrrGiuhLV25PRLZj1rq8mwJ6aKkk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BBzW61CcE5KXEaxZAFNcYvF8Z7wa7VhhEGZdFc3xo+G+nN8EnD9JY2VhuuobRyqod
         jyupFmizGAZ8yUOwpnAJCTH/0lWk8PHzZv9KdmdYaEw/Ynz8yhS0DKXxkLEKJdcIgP
         ZSydNRTfepS5Jhuu2VtpuAT1fdXNftqpxAheYnxwJv+Xp3+fjlFDHTk9uNcV2hMsAV
         sCcrPz/UrUZQmcF+uK6EUAjbLw+GxZVKpAfnGHxm+rjFwZAMUPTrGIcN2xThMfIdmH
         KBLPSeOKymHqd8uTcCBupJKK5tJOwkPEYHCO/iSG98fp533A/K3f767ctFd1EbXx7B
         BoEabBK2b0G0A==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lqYEP-0008Rm-7U; Tue, 08 Jun 2021 11:41:09 +0200
Date:   Tue, 8 Jun 2021 11:41:09 +0200
From:   Johan Hovold <johan@kernel.org>
To:     David Frey <dpfrey@gmail.com>
Cc:     Alex =?utf-8?B?VmlsbGFjw61z?= Lasso <a_villacis@palosanto.com>,
        linux-usb@vger.kernel.org, Pho Tran <pho.tran@silabs.com>,
        Tung Pham <tung.pham@silabs.com>, Hung.Nguyen@silabs.com
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21
 (with bisection)
Message-ID: <YL87Na0MycRA6/fW@hovoldconsulting.com>
References: <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
 <YLeapcNbvExeGKuE@hovoldconsulting.com>
 <cb99a25e-5758-051c-afb6-29d8ef26ee0b@palosanto.com>
 <YLpJzTmAnfsrE7UP@hovoldconsulting.com>
 <CAAvkfd-vmi_VJrCQg-ktF+sZZUfb5J+DJfjHv=TdVafyj1m1Ew@mail.gmail.com>
 <YLtOL5aZUnntfqWB@hovoldconsulting.com>
 <CAAvkfd-o+g2_uc-HqK8svrU_E3NB1m03md8J_F_eTc8pDkXmdQ@mail.gmail.com>
 <YL5O6/GrlnpNwGjT@hovoldconsulting.com>
 <CAAvkfd91cdQ-6RwGErJuBTwQh9=8cajbngcOgjsThnFruz27DQ@mail.gmail.com>
 <CAAvkfd-mnb-g_ANwXeMn03rDfOSJrFkCREtPMGB=KZOUDg4gKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAvkfd-mnb-g_ANwXeMn03rDfOSJrFkCREtPMGB=KZOUDg4gKg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 07, 2021 at 01:44:03PM -0700, David Frey wrote:
> On Mon, Jun 7, 2021 at 11:02 AM David Frey <dpfrey@gmail.com> wrote:
> >
> > I made a bit of progress.  I found that CP210xManufacturing.dll was
> > bundled with Simplicity Studio and in the same folder as the DLL was
> > inspect_usbxpress.exe.  It looks like that tool is able to report the
> > firmware version of the device.  In the output below, the first run is
> > against the device that I am able to program successfully on any
> > kernel and that shows firmware 1.0.6.  The second run is against a
> > device that I can't program and it shows firmware version 1.0.4.  I
> > recall reading some information that 1.0.6 is A02 and that 1.0.4 is
> > A01, but I think there might have been another firmware revision
> > that's also A01 (maybe 1.0.2?).  I can't find the source of this
> > information anymore.  I'm going to try to figure out how to use
> > wireshark to capture USB traffic now.

The firmware revisions were listed here:

	https://www.silabs.com/community/interface/knowledge-base.entry.html/2020/03/31/how_to_determinecp2102nrevisiona01vsa02-DCJI

Apparently both 1.0.2 and 1.0.4 is A01, while 1.0.8 is A2.

Not sure what to make of 1.0.6, but at least it works.

> > C:\SiliconLabs\SimplicityStudio\v5\developer\adapter_packs\inspect_usbxpress>.\inspect_usbxpress.exe
> > -slist
> > serial_no =
> > deviceCount = 1
> > device (0) {
> >   SoftIndex = 0
> >   adapterLabel = CP2102N USB to UART Bridge Controller (ID:0)
> >   SerialNo = 1017bfe99d98e8118ea47540c3e5cfbd
> >   Vid = 0
> >   Pid = 0
> >   PartNumber = 32
> >   BoardID =
> >   BoardCount = 0
> >   FirmwareVersion = 1.0.6
> >   Name = cp2102N version 1.0.6
> >   Type = CP210x
> >   Family = USBXpress
> >   Locked = 1
> > }
> >
> > C:\SiliconLabs\SimplicityStudio\v5\developer\adapter_packs\inspect_usbxpress>.\inspect_usbxpress.exe
> > -slist
> > serial_no =
> > deviceCount = 1
> > device (0) {
> >   SoftIndex = 0
> >   adapterLabel = CP2102N USB to UART Bridge Controller (ID:0)
> >   SerialNo = f06e721e74e1ea11bd9ddc2d9a583cc7
> >   Vid = 0
> >   Pid = 0
> >   PartNumber = 32
> >   BoardID =
> >   BoardCount = 0
> >   FirmwareVersion = 1.0.4
> >   Name = cp2102N version 1.0.4
> >   Type = CP210x
> >   Family = USBXpress
> >   Locked = 1
> > }
> 
> I configured wireshark on Windows to capture the USB traffic and I ran
> the inspect_usbxpress.exe.  I believe the request/response where the
> firmware version is provided is in packets 38/39 in the attached
> trace.  Perhaps the mailing list will strip the trace, so I will
> describe it a bit.
> 
> Setup packet:
>   bmRequestType: 0xC0 (device-to-host, vendor, device recipient)
>   bRequest: 255
>   wValue: 0x0010
>   wIndex: 0
>   wLength: 3
> 
> Response Data: {0x01, 0x00, 0x04}
> 
> When I captured the trace for the other device, the response data was
> {0x01, 0x00, 0x06} indicating firmware version 1.0.6.
> 
> Let me know if there is any other information I can provide.

Excellent, nice job! That's the missing piece we needed. I'll cook up a
patch.

Johan
