Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B02A292367
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 14:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfHSM1S convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 19 Aug 2019 08:27:18 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:5873 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfHSM1S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 08:27:18 -0400
IronPort-SDR: 7/7OfXUJNth6MTQE0X9AlblZ99slCMg/PBlooQzMZdTQj2DT75FlLX+w4Q4d/iYUS2I6bJ8IbZ
 rv+yO9C8dSl4lYXtiQoSsskoQJvZNor2VmZVmir5FeptS5TOrFUFwlk7LUFzoLs6I7O/HP8ngZ
 hrr5YMtVqnMqrACQSMJW0TkbKIF42fhpSrJ2rjY+v6N3162WMYMe6+O3x0EvFIRhgUG2Seuf1x
 iUzwaS95b8EmWoibM/stD2iYtFRqnn0RcK7e61CCgRMfeJ23g+9YRlPDPZouvEe9F0ZQuPtxEV
 tyY=
X-IronPort-AV: E=Sophos;i="5.64,403,1559548800"; 
   d="scan'208";a="40570997"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 19 Aug 2019 04:27:17 -0800
IronPort-SDR: H2l6YtmwRC5naPKglnE7CqMjcYRWZniRbxooaIrnL4ETXs/27Lc0Fs8SzchJbRsED75wZ3XKZo
 M03NEcD1X7gBK9GqO8SKkCh6hHhnHkHixT0QcuT6DXQRPU+befdwVTRHoN6lXX39j609hkVtFZ
 zszM58sw+hMAGJXR5NNcfF9gDRhNlS5+sw8kWcAAGVnf+XPP7HvcCBWbuWvITuK3ds1wi/IuKN
 alqmyMelsGi+JFgY2w9hgcpFiOXZ491iVgIZhi7jvfwefViN8bbNuwTKs10eDAcD6Y3Ly6g2Ln
 pPc=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Oliver Neukum <oneukum@suse.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: AW: AW: AW: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters
Thread-Topic: AW: AW: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters
Thread-Index: AdVSeH/taFnFr9I1T4OXjPctlrQ3Ev//86kA///uBTCAAF8egIABinwcgAZBWoCAABTf2w==
Date:   Mon, 19 Aug 2019 12:27:13 +0000
Message-ID: <1566217633219.68806@mentor.com>
References: <db0e8930ea94408ca7a38192ddfd203f@SVR-IES-MBX-03.mgc.mentorg.com>
         <1565771508.25764.3.camel@suse.com>
         <f5e22fea4e1c4baeb2fc98d324ad9060@SVR-IES-MBX-03.mgc.mentorg.com>
        ,<1565788073.25764.8.camel@suse.com>
 <1565870525382.10504@mentor.com>,<1566216675.5663.19.camel@suse.com>
In-Reply-To: <1566216675.5663.19.camel@suse.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

we had a look at the adapters, and it's really a HW issue.
Nothing we can follow up here anymore.

Let's close it.

Thanks!

Best regards
Carsten
________________________________________
Von: Oliver Neukum <oneukum@suse.com>
Gesendet: Montag, 19. August 2019 14:11
An: Schmid, Carsten; f.fainelli@gmail.com
Cc: linux-usb@vger.kernel.org; Mathias Nyman
Betreff: Re: AW: AW: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters

Am Donnerstag, den 15.08.2019, 12:02 +0000 schrieb  Schmid, Carsten :
> > > I don't think its a regression.
> >
> > It would be better to know than to assume.
> >
>
> Happens with kernel 4.14.102 also, not only with 4.14.129.
> Looks more HW related.
>
> >
> > > Is there something i can do to force an error message to be seen
> > > when the ETH2USB adapter stalls?
> >
> > You can activate dynamic debugging for the xhci_hcd module
> > Remember that no data to transfer is not an error as such.
> >
> > > My current assumption is that the signal quality of the USB port is at a
> > > corner case, and therefore some "better" Adapters work, some "bad ones"
> > > don't. But as there is no error message seen in the dmesg, i am somehow lost.
> >
> > Two things you can do:
> >
> > 1. Generate a usbmon trace (it will be gigantic though)
> > 2. Activate dynamic debugging for the xhci_hcd module
>
> I did:
> echo -n 'module xhci_hcd =p' > /sys/kernel/debug/dynamic_debug/control
> echo -n 'usbcore =p' > /sys/kernel/debug/dynamic_debug/control
> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
> (used this when hunting for another USB issue in the past also)
>
> From traces/logs:
> ########################################
> I can see in dmesg at a certain point, i assume this is where trouble starts:
> [87800.393785] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.393869] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.393956] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.394045] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.394145] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.394216] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.394302] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.394385] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 15904 bytes untransferred
> [87800.394587] xhci_hcd 0000:00:15.0: Transfer error for slot 3 ep 5 on endpoint
> [87800.394596] xhci_hcd 0000:00:15.0: Cleaning up stalled endpoint ring
> [87800.394600] xhci_hcd 0000:00:15.0: Finding endpoint context
> [87800.394603] xhci_hcd 0000:00:15.0: Cycle state = 0x1
> [87800.394606] xhci_hcd 0000:00:15.0: New dequeue segment = ffff8d9330b29900 (virtual)
> [87800.394608] xhci_hcd 0000:00:15.0: New dequeue pointer = 0x174213400 (DMA)
> [87800.394610] xhci_hcd 0000:00:15.0: Queueing new dequeue state
> [87800.394613] xhci_hcd 0000:00:15.0: Set TR Deq Ptr cmd, new deq seg = ffff8d9330b29900 (0x174213000 dma), new deq ptr = ffff8d92b4213400 (0x174213400 dma), new cycle = 1
> [87800.394618] xhci_hcd 0000:00:15.0: // Ding dong!
> [87800.394622] xhci_hcd 0000:00:15.0: Giveback URB ffff8d931d65b600, len = 0, expected = 74, status = -71
> [87800.394629] xhci_hcd 0000:00:15.0: Ignoring reset ep completion code of 1
> [87800.394636] xhci_hcd 0000:00:15.0: Successful Set TR Deq Ptr cmd, deq = @174213400
> [87800.394836] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.394916] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.395005] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.395090] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.395178] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.395263] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.395350] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.395436] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.395525] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.395613] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.395710] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.395785] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
> [87800.395868] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 11328 bytes untransferred
> [87800.398155] xhci_hcd 0000:00:15.0: Transfer error for slot 3 ep 5 on endpoint
> [87800.398172] xhci_hcd 0000:00:15.0: Cleaning up stalled endpoint ring
> [87800.398175] xhci_hcd 0000:00:15.0: Finding endpoint context
> [87800.398179] xhci_hcd 0000:00:15.0: Cycle state = 0x1
> [87800.398181] xhci_hcd 0000:00:15.0: New dequeue segment = ffff8d9330b29900 (virtual)
> [87800.398184] xhci_hcd 0000:00:15.0: New dequeue pointer = 0x174213410 (DMA)
> [87800.398186] xhci_hcd 0000:00:15.0: Queueing new dequeue state
> [87800.398189] xhci_hcd 0000:00:15.0: Set TR Deq Ptr cmd, new deq seg = ffff8d9330b29900 (0x174213000 dma), new deq ptr = ffff8d92b4213410 (0x174213410 dma), new cycle = 1
> [87800.398192] xhci_hcd 0000:00:15.0: // Ding dong!
> [87800.398197] xhci_hcd 0000:00:15.0: Giveback URB ffff8d92b4374c00, len = 0, expected = 74, status = -71
> [87800.398209] xhci_hcd 0000:00:15.0: Ignoring reset ep completion code of 1
> [87800.398217] xhci_hcd 0000:00:15.0: Successful Set TR Deq Ptr cmd, deq = @174213410
> [87800.401654] xhci_hcd 0000:00:15.0: Transfer error for slot 3 ep 5 on endpoint

This points at a low level XHCI thing. Time to get Mathias involved.

        Regards
                Oliver

