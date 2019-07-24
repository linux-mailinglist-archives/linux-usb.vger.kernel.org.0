Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA7FB731B8
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 16:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfGXOeI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jul 2019 10:34:08 -0400
Received: from mail.seal-one.com ([194.9.72.89]:59148 "EHLO mail.seal-one.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726855AbfGXOeI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Jul 2019 10:34:08 -0400
Received: from [192.168.0.13] (limes.novosec.com [46.252.142.130])
        by mail.seal-one.com (Postfix) with ESMTPSA id C57AC200146;
        Wed, 24 Jul 2019 16:34:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=seal-one.com; s=mail;
        t=1563978846; bh=eHA93SEs7wjssCKpQ5DKD6U4XHlJh3Y6vt1A1KmtowY=;
        h=From:Subject:Date:In-Reply-To:Cc:To:References:From;
        b=OdNn831cSnNGwEg5XPtWKRFsQmnGX58yqbG43h6A68wiN05fcqTnYaJwIEst+6zSw
         duQgITSEiRuTHNizvic6eRtqFjnABRbtjBgzV2vOyJKYqhhQHg0lMq2mWyUplMuMZv
         9qLKz/DrKt/t4F4VupNe3EpIXGCDltO449aTFKG0=
From:   Maik Stohn <maik.stohn@seal-one.com>
Message-Id: <F200CEE8-2611-4A83-A5FE-3D8A9E588BCD@seal-one.com>
Content-Type: multipart/signed;
        boundary="Apple-Mail=_91532805-DD2B-4220-8E90-4D36596F4E2F";
        protocol="application/pkcs7-signature";
        micalg=sha-256
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: KERNEL CRASH when using XHCI devices (affects any architecture,
 any USB device)  
Date:   Wed, 24 Jul 2019 16:34:06 +0200
In-Reply-To: <20190724142031.GA3087@kroah.com>
Cc:     linux-usb@vger.kernel.org
To:     Greg KH <gregkh@linuxfoundation.org>
References: <21B63064-BAD5-4DC3-8E1A-3986CD948A93@seal-one.com>
 <20190724142031.GA3087@kroah.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Virus-Scanned: clamav-milter 0.100.3 at mail.seal-one.com
X-Virus-Status: Clean
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--Apple-Mail=_91532805-DD2B-4220-8E90-4D36596F4E2F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

>=20
> Am 24.07.2019 um 16:20 schrieb Greg KH <gregkh@linuxfoundation.org>:
>=20
> On Wed, Jul 24, 2019 at 03:27:51PM +0200, Maik Stohn wrote:
>> KERNEL CRASH when using XHCI devices (affects any architecture, any =
USB device)=20
>>=20
>> This was already reported as a kernel bug in bugzilla =
(https://bugzilla.kernel.org/show_bug.cgi?id=3D204257) but I got told to =
report it here since it is usb related...
>>=20
>> Affected kernels: 5.2, 5.2.1, 5.2.2, 5.3-rc1, ...
>>=20
>> This bug is already causing real world problems with existing =
software and devices using SCSI BOT with raw SCSI commands and libusb =
software.
>>=20
>> Reproduce (tested on several different machines with =
5.2,5.2.1,5.2.2,5.3rc1):
>>=20
>> - usb flash drive attached to XHCI controller (e.g. USB3.0 flash =
drive attached to USB3.0 port)
>> - generic scsi module loaded (e.g. /dev/sg0 comes up when attaching =
the flash drive)
>> - command line tool "sg_raw" from "sg3-utils"
>> - execute: and press a key + return (-s1 sends one byte which is read =
from stdin)
>>   $ sudo sg_raw -s1 /dev/sg0 00 00 00 00 00 00 00 00 00 00
>>=20
>> -> KERNEL Oops
>>=20
>> - same for -s2, -s3, ... up to -s8   (sending 1 to 8 bytes, exactly =
the maximum of bytes on my 64 bit machine where the "DMA bypass =
optimization / IDT" kicks in, see below)
>>=20
>> Since this can be triggered by any normal user (without any special =
USB device needed) I think it is important enough to fix it for the =
existing 5.2 kernel as well.
>>=20
>> ---
>>=20
>> Patch introducing the crash:  =
https://patchwork.kernel.org/patch/10919167 / commit =
33e39350ebd20fe6a77a51b8c21c3aa6b4a208cf - "usb: xhci: add Immediate =
Data Transfer support"
>>=20
>> Reason: NULL pointer dereference
>>=20
>> ---
>>=20
>> I took me quite some time to find the cause of this.
>>=20
>> I narrowed the crash down to the place inside of "xhci_queue_bulk_tx" =
in "xhci-ring.c" where the next SG is loaded
>>=20
>> ...
>>    while (sg && sent_len >=3D block_len) {
>>      /* New sg entry */
>>      --num_sgs;
>>      sent_len -=3D block_len;
>>      if (num_sgs !=3D 0) {
>>        sg =3D sg_next(sg);
>>        block_len =3D sg_dma_len(sg);           <=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D CRASH
>>                                                                 The =
comment of "sg_dma_len" clearly states "These macros should be used =
after a dma_map_sg call has been done..." - which was=20
>>                                                                 =
omitted by the new "xhci_map_urb_for_dma" function since the transfer =
was considered suitable for IDT.
>>        addr =3D (u64) sg_dma_address(sg);
>>        addr +=3D sent_len;
>>      }
>>    }
>>    block_len -=3D sent_len;
>>    send_addr =3D addr;
>> ...
>>=20
>> This only happens if the transfer was cosnideres suitable for IDT.=20
>> When I patched the function "xhci_urb_suitable_for_idt" to always =
return false (nothing suitable for IDT) everything was working fine.=20
>>=20
>>=20
>> Unfortunately I'm not deep enough into the inner workings of the =
kernel usb host driver to find a solution for this other than reverting =
the patch for IDT.
>=20
> What patch did you find that caused this regression?  We can revert it
> if that is the easiest thing to do.
>=20
> thanks,
>=20
> greg k-h

I included the patch causing it above: =
https://patchwork.kernel.org/patch/10919167/ =20


Greetings,=20

Maik Stohn


--Apple-Mail=_91532805-DD2B-4220-8E90-4D36596F4E2F
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

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
AAAAAA==
--Apple-Mail=_91532805-DD2B-4220-8E90-4D36596F4E2F--
