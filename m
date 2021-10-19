Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB3E43365C
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 14:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235513AbhJSMzn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 08:55:43 -0400
Received: from mout.gmx.com ([74.208.4.201]:41893 "EHLO mout.gmx.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230097AbhJSMzn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Oct 2021 08:55:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
        s=dbd5af2cbaf7; t=1634648009;
        bh=cuNcUyBANEr5RzDOn6B7FXOi7Jc495+2pjTKnnD/mNs=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=0vd84S6F2Bl9BEZdOijj4M47HyQYXvPjVDfddRVgTnEasUTvOgs+ZhVmKXalTgUXa
         4uxtEiUvE+NXIVEJO2qFeq4xJo3TT7hdM2ercZKDFN67pat7Uo3blU+/6Adxpf1GHM
         ViFlXJR7mzqbhbFgJLZoHSKTzQbyhiNiDCfDdDgk=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [2.124.36.225] ([2.124.36.225]) by web-mail.mail.com
 (3c-app-mailcom-lxa13.server.lan [10.76.45.14]) (via HTTP); Tue, 19 Oct
 2021 14:53:29 +0200
MIME-Version: 1.0
Message-ID: <trinity-7db5ef0c-99a3-4fa0-a1d7-1e57c80cc4ff-1634648008985@3c-app-mailcom-lxa13>
From:   mark_k@iname.com
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB2 Link USB-SCSI converter and LUNs
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 19 Oct 2021 14:53:29 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <YW6pjieI5UwOM9LW@kroah.com>
References: <trinity-d3be8a5b-2b1c-45f8-8767-cf9cf758a0c0-1634638509008@3c-app-mailcom-lxa12>
 <YW6pjieI5UwOM9LW@kroah.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:V/sR9l/hSEgOUTsH90YDdqEtUGPW3hnGMAmy3zK5YeVn6nKWN8//LLSJ8uTZSj1qTrzAs
 MpyFxygCqIvQMdUFOnEEqrrKjchsU+kiXMJQE/ATSMJdRE0pdPRwqppDhgbOlyIdRZGhnuPHkdhM
 GIthSyGtLCSx+ifuaWTTM7VKMPj97UHaBHX/Dim5xSekS9Dvh36x9bQt3z3vFapxEPpaqeo1eAQ2
 sfsp6+4v3cTOeQfOeasbsMvWNkfIIupUA3yEYD/qOj+Z01HW3pBhLIGhtL2g8MtTwWLOzSy1eo0c
 bI=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:daJWWoehd9Q=:Sv8ZyuJM7Gbkq8uQwqDtF5
 koWizdQUoAilVFb6RIXstyg4qUU+wVyIU0aUFC3ClIBhujUv9X+rKScCXQQNuqeO6v3qJQMnu
 qQOeIM6PzQDg6pMlFhmGirPjSB2p4r/UOyQxlE9z1k3xPqqi2Fh649cNBFeIJfCOYH179dx5X
 68ZaV8wJ949ntxTdHAW42pA5RJ4T5Ge9+NL9Prm2qzKOzzT0VqkURtRrCYcgZOivyp421uY56
 YDjSoUC6z2ur4EtVL/O843CgEz6bdo2BzlVebxnic3uedW5fzSCSuSlTLpC9EidFdvHF4upTy
 jNMjPmFRs9nfgAJiNWUHQA7h3+PEzLpH3UZWBYod7yGbnBYyKZY6mHwbBijnqzTq56rvkR1ed
 aLDSPl1Mh4fTdSGFqUBEIP1WrGB1BryTpKgLXLCE4/mSnfKbui4qRXFwjCgbef4PnlnFIp+JB
 SMKoFnvWqhEww1dNjMSZ/5CVhGWNvY5L6hkI0XFEhzo9Pqoiji5uNB2Z2tpV8+WzYIUpOhd8n
 52ZAFDd/iSHgz7ipESLCJ3lKdV+ij5Y8PcyN2ORmhuGyaYDqEvBzh1K96fQT9tJiVurgngMGQ
 DYoN7tVY8Hz/RFLQYDgu0mp4m4CxQz6XYP5OS4rzD/a9fYByUAH4eY5ZDK1G83B+xmKRJxioM
 mVuHVa/7C4CNTWbOGPemWf0o/a9GMJE04OVwdYobOP21cFTDbBjLqo5QojlARylLsEPhr4HxM
 LPdYuXhZL0N3MN1Wo70i5fWBGOd/tLxMb+SKDQVIIu+v/XOjbTl7kQ8IJ3X7kQ7yYdyLr/0v4
 OpBRAMb
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tuesday, October 19, 2021 at 12:18 PM "Greg KH" <gregkh@linuxfoundation=
.org> wrote:
> On Tue, Oct 19, 2021 at 12:15:09PM +0200, mark_k@iname.com wrote:
> > I have a Core Micro Systems USB2 Link USB-SCSI converter (07B4:0380).
> >
> > Adding an entry to unusual_devs.h should get it to work, just needing
> > USB_PR_BULK. That should at least allow the connected device with SCSI=
 ID 0
> > to be accessed.
>
> Why do you need any quirk at all for this?

My mistake, sorry. Its interface descriptor has
  bInterfaceClass 0xFF
  bInterfaceSubClass 0x06
  bInterfaceProtocol 0x50
so an entry with USB_SC_DEVICE, USB_PR_DEVICE would work.


> > I'm just wondering, how does the usb-storage driver handle these cases=
:
> >
> >  - (What it thinks are) LUNs are not contiguous. Suppose the user has =
two
> >    SCSI devices in the chain, one with ID 0 the other with ID 3. Would=
 it
> >    scan LUNs (which map to separate targets) 1, 2, 4, 5 and 6? Or woul=
d it
> >    give up on getting no response from LUN 1?
> >
> >  - "LUN" 0 is not present. E.g. where the connected SCSI devices have =
IDs 1
> >    and 3.
> >
> >  - When different "LUNs" are completely different devices (e.g. one a
> >    CD-ROM, another a hard disk, another a tape drive).
> >
>
> That should all be up to the scsi layer in the kernel.  If this device
> is not following the standard, how is it supposed to work at all?
>
> Does it require custom drivers for other operating systems?

My guess is that (with quirk entry) it will work when there is a SCSI
device with ID 0. If all other devices in the chain have contiguous IDs
they could be accessible too.

I can tell Windows to use its built-in mass storage driver and that works
to access the device with ID 0 only. I haven't yet checked with more than
one SCSI device in the chain.

It could/should be possible to properly support multiple targets and LUNs
by using a similar method to the SCM USB-SCSI converters. (Those, after a
special intitialisation request, take the target ID from the *upper* 4 bit=
s
of CBW byte 13.)

But I figure an initial patch to add a quirk entry will be much easier. An=
d
in practice would be enough for most use cases.

