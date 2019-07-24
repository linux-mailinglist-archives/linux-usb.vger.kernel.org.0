Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6580733ED
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 18:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbfGXQ3e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jul 2019 12:29:34 -0400
Received: from mail.seal-one.com ([194.9.72.89]:32866 "EHLO mail.seal-one.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725826AbfGXQ3e (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Jul 2019 12:29:34 -0400
Received: from [192.168.0.13] (limes.novosec.com [46.252.142.130])
        by mail.seal-one.com (Postfix) with ESMTPSA id 594F92000E7;
        Wed, 24 Jul 2019 18:29:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=seal-one.com; s=mail;
        t=1563985772; bh=R7VFl7BfjzvBY/Ox5jfHZ4EBFxltJpNpzGG7HP0wOUs=;
        h=From:Subject:Date:In-Reply-To:Cc:To:References:From;
        b=XDw1aLldbrdfox81J5Q9euJlFDv4AWoX0tCFf/d6uxuyKzn/Lr4ht0BgDhmdvNTFp
         F+sWHBpHdytSlMmmlSsITJuKzLc0HVakMgvDLJSUoy/X5TmZQ7pyG7oDcbKsk3aSzs
         o50p2+XA3HzviRHF5VmnrRYZ3tJGBqca9gt12SsA=
From:   Maik Stohn <maik.stohn@seal-one.com>
Message-Id: <8F5BB91F-39D7-43D0-AED1-EE74E5BC717F@seal-one.com>
Content-Type: multipart/signed;
        boundary="Apple-Mail=_A7883630-D004-4292-A035-030F26CF00E2";
        protocol="application/pkcs7-signature";
        micalg=sha-256
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: KERNEL CRASH when using XHCI devices (affects any architecture,
 any USB device)  
Date:   Wed, 24 Jul 2019 18:29:31 +0200
In-Reply-To: <fca83889-e320-d0e0-fbb7-d260f1fcaaed@linux.intel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
References: <21B63064-BAD5-4DC3-8E1A-3986CD948A93@seal-one.com>
 <20190724142031.GA3087@kroah.com>
 <F200CEE8-2611-4A83-A5FE-3D8A9E588BCD@seal-one.com>
 <fca83889-e320-d0e0-fbb7-d260f1fcaaed@linux.intel.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Virus-Scanned: clamav-milter 0.100.3 at mail.seal-one.com
X-Virus-Status: Clean
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--Apple-Mail=_A7883630-D004-4292-A035-030F26CF00E2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

>=20
> Am 24.07.2019 um 18:03 schrieb Mathias Nyman =
<mathias.nyman@linux.intel.com>:
>=20
> On 24.7.2019 17.34, Maik Stohn wrote:
>>>=20
>>> Am 24.07.2019 um 16:20 schrieb Greg KH <gregkh@linuxfoundation.org>:
>>>=20
>>> On Wed, Jul 24, 2019 at 03:27:51PM +0200, Maik Stohn wrote:
>>>> KERNEL CRASH when using XHCI devices (affects any architecture, any =
USB device)
>>>>=20
>>>> This was already reported as a kernel bug in bugzilla =
(https://bugzilla.kernel.org/show_bug.cgi?id=3D204257) but I got told to =
report it here since it is usb related...
>>>>=20
>>>> Affected kernels: 5.2, 5.2.1, 5.2.2, 5.3-rc1, ...
>>>>=20
>>>> This bug is already causing real world problems with existing =
software and devices using SCSI BOT with raw SCSI commands and libusb =
software.
>>>>=20
>>>> Reproduce (tested on several different machines with =
5.2,5.2.1,5.2.2,5.3rc1):
>>>>=20
>>>> - usb flash drive attached to XHCI controller (e.g. USB3.0 flash =
drive attached to USB3.0 port)
>>>> - generic scsi module loaded (e.g. /dev/sg0 comes up when attaching =
the flash drive)
>>>> - command line tool "sg_raw" from "sg3-utils"
>>>> - execute: and press a key + return (-s1 sends one byte which is =
read from stdin)
>>>>   $ sudo sg_raw -s1 /dev/sg0 00 00 00 00 00 00 00 00 00 00
>>>>=20
>>>> -> KERNEL Oops
>>>>=20
>>>> - same for -s2, -s3, ... up to -s8   (sending 1 to 8 bytes, exactly =
the maximum of bytes on my 64 bit machine where the "DMA bypass =
optimization / IDT" kicks in, see below)
>>>>=20
>>>> Since this can be triggered by any normal user (without any special =
USB device needed) I think it is important enough to fix it for the =
existing 5.2 kernel as well.
>>>>=20
>>>> ---
>>>>=20
>>>> Patch introducing the crash:  =
https://patchwork.kernel.org/patch/10919167 / commit =
33e39350ebd20fe6a77a51b8c21c3aa6b4a208cf - "usb: xhci: add Immediate =
Data Transfer support"
>>>>=20
>>>> Reason: NULL pointer dereference
>>>>=20
>>>> ---
>>>>=20
>>>> I took me quite some time to find the cause of this.
>>>>=20
>>>> I narrowed the crash down to the place inside of =
"xhci_queue_bulk_tx" in "xhci-ring.c" where the next SG is loaded
>>>>=20
>>>> ...
>>>>    while (sg && sent_len >=3D block_len) {
>>>>      /* New sg entry */
>>>>      --num_sgs;
>>>>      sent_len -=3D block_len;
>>>>      if (num_sgs !=3D 0) {
>>>>        sg =3D sg_next(sg);
>>>>        block_len =3D sg_dma_len(sg);           <=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D CRASH
>>>>                                                                 The =
comment of "sg_dma_len" clearly states "These macros should be used =
after a dma_map_sg call has been done..." - which was
>>>>                                                                 =
omitted by the new "xhci_map_urb_for_dma" function since the transfer =
was considered suitable for IDT.
>>>>        addr =3D (u64) sg_dma_address(sg);
>>>>        addr +=3D sent_len;
>>>>      }
>>>>    }
>>>>    block_len -=3D sent_len;
>>>>    send_addr =3D addr;
>>>> ...
>>>>=20
>>>> This only happens if the transfer was cosnideres suitable for IDT.
>>>> When I patched the function "xhci_urb_suitable_for_idt" to always =
return false (nothing suitable for IDT) everything was working fine.
>>>>=20
>>>>=20
>>>> Unfortunately I'm not deep enough into the inner workings of the =
kernel usb host driver to find a solution for this other than reverting =
the patch for IDT.
>=20
> Nice catch.
> The immediate data (IDT) support assumed that when there is max 8 =
bytes of data,
> and it's not already dma mapped then we can just copy the data =
directly from
> urb->transfer_buffer.
> 										=
=09
> I didn't take into account that this small amount of data can be in a =
sg list.
>=20
> Does the below code help:
>=20
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 7a26496..f5c4144 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -2175,7 +2175,8 @@ static inline bool =
xhci_urb_suitable_for_idt(struct urb *urb)
>        if (!usb_endpoint_xfer_isoc(&urb->ep->desc) && =
usb_urb_dir_out(urb) &&
>            usb_endpoint_maxp(&urb->ep->desc) >=3D TRB_IDT_MAX_SIZE &&
>            urb->transfer_buffer_length <=3D TRB_IDT_MAX_SIZE &&
> -           !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP))
> +           !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) &&
> +           !urb->num_sgs)
>                return true;
>         return false;
>=20
>=20
> -Mathias

Hello Matthias,

Your patch fixes the problem with short SGs and IDT.=20
No more crashes. Tested on 5.3-rc.

Will this be applied to 5.2.*  as well?=20
I need to inform some users how this problem is mitigated (e.g. using =
updated 5.2.3? when available or not using 5.2 at all and wait for 5.3).

Thanks for the fast feedback,

Greetings,

Maik Stohn=

--Apple-Mail=_A7883630-D004-4292-A035-030F26CF00E2
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

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
AAAAAA==
--Apple-Mail=_A7883630-D004-4292-A035-030F26CF00E2--
