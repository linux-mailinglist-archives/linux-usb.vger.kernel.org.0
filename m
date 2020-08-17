Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2C32466EE
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 15:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbgHQNFb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 09:05:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:59666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728388AbgHQNF3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 09:05:29 -0400
Received: from saruman (unknown [194.34.132.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C68C72072E;
        Mon, 17 Aug 2020 13:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597669528;
        bh=U9Dx3ytR/l/i8TI2Xtg1aeEayPxg/HJLnHWeUbNaoyE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=UoluM1H2PM+h+KyzAEsfGEwlRQEyxIKpf0Bi+gC5hce4S2ad6hlf8k+MhA9x2mPRB
         eZQx5bBvh2nheDJuq7boZuNc2iT334Cm1ObWFEQMmTN5YnPL9uWYVcLrawaTP4iddj
         P4ptQxHWwQC/3HbN4PGnNSCz0Af0mgJ5syTHVm60=
From:   Felipe Balbi <balbi@kernel.org>
To:     Lorenzo Colitti <lorenzo@google.com>
Cc:     linux-usb@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <zenczykowski@gmail.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: allow using NCM in SuperSpeed Plus
 gadgets.
In-Reply-To: <CAKD1Yr17hFju=xvDHWWcLjwj=nuSBBVJn9xQ5ocHHXQm6PAw_A@mail.gmail.com>
References: <20200805075810.604063-1-lorenzo@google.com>
 <87mu39tmu6.fsf@kernel.org>
 <CAKD1Yr17hFju=xvDHWWcLjwj=nuSBBVJn9xQ5ocHHXQm6PAw_A@mail.gmail.com>
Date:   Mon, 17 Aug 2020 16:05:22 +0300
Message-ID: <87ft8lzalp.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Lorenzo Colitti <lorenzo@google.com> writes:

> On Wed, Aug 5, 2020 at 7:21 PM Felipe Balbi <balbi@kernel.org> wrote:
>> But anyway, if we change 13 to 16, then we 1Gbps. How did you get
>> 1.7Gbps? I think we should really update ncm_bitrate() to contain the
>> correct equations for bitrate on different speeds.
>
> I got 1.7 Gbps because that's what I measured in iperf. :-)
>
> But actually after reading the spec I think that for SuperSpeed and
> above that calculation is meaningless, because bulk transfers are no
> longer limited by a set number of packets per microframe. The USB 3.2
> spec has mostly replaced the words "microframe" with "bus interval",
> but I don't see any place in the spec that says the number of packets
> per bus interval is limited. Section 8.12.1.2 (Bulk IN Transactions)
> just says that "when the host is ready to receive bulk data, it sends
> an ACK TP" saying how many packets it's willing to accept, where the
> maximum is the burst size supported by the endpoint. After that, the
> host has to respond with an ACK to every data packet received, and
> every ACK specifies the number of data packets it expects from then
> on.
>
> It seems more correct that for SS and above the driver should simply
> just report the link speed minus theoretical bus overhead? Section
> 4.4.11 suggests that's about 10%, so it would announce 4.5 Gbps.

makes sense to me :-)

>> > +static struct usb_ss_ep_comp_descriptor ssp_ncm_bulk_comp_desc =3D {
>> > +     .bLength =3D              sizeof(ssp_ncm_bulk_comp_desc),
>> > +     .bDescriptorType =3D      USB_DT_SS_ENDPOINT_COMP,
>> > +
>> > +     /* the following 2 values can be tweaked if necessary */
>> > +     /* .bMaxBurst =3D         0, */
>>
>> should you add bMaxBurst =3D 15 here?
>
> I'm not sure. On my setup, it provides a fair performance boost (goes
> from ~1.7Gbps to ~2.3Gbps in, and ~620Mbps to ~720Mbps out). But I
> don't know whether there might be any compatibility constraints or
> hardware dependencies. I do see that the f_mass_storage driver sets it
> to 15:

there shouldn't be any compatibility issues, no.

>          /* Calculate bMaxBurst, we know packet size is 1024 */
>         max_burst =3D min_t(unsigned, FSG_BUFLEN / 1024, 15);
>
> so perhaps this is fine to do in NCM too? If we want to set bMaxBurst
> to 15, should that be in this patch, or in a separate patch?

yup, should be fine. A separate patch is okay too :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl86gJIRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZM3A/+OiBOB/Gqdw45tZxYxu/tGCDbpeoaWL6k
frutIleAtVtCA1O1PXb/NiXp4NsdfjjjYxK/t6NFXjnVhlsLMj3lb19ROFT2LiOa
JEOuiQufR4oKSFWp/GOABmpVsWAzxNUZx4cNRsZ5eOwJx2/a4mYK5o4o+a2WRJEc
dQW7OEZctU1hfyv4+tk7qm5ckeBC/n5v0jccmILQGzrDrHJVeGli7fV4ubH5i8+G
oO6lQBqN2oWsE1pQgmKvjV792/wqk2hNaFBroPBEXrIFj4LHdyokG3TweSQRhp8U
tqZvmkMROItM/j51BzXuTL9zAYhxn+cn5ZRhLUKJuCMYrg6bSKq6DR26N/xMAlI3
j98RL3npMb4S9rhxjcsSdZjS/3aQbtwux7HvMt/WUJfuRgPdURoe8gH4x/cplcKb
gsUEIYm10felBmU68gr1IBkaHH+UYw4908j4R36M74g7d4o/fVKnozhkfRylLm5u
qv9rDunU6dmx+YMO3gEdQPpDn4HpyPmT7wpCSEvuUOtNsNjsWPn3t1p+yUXhT4Cq
SIjRPyXP79zfJYdyQUapEBlnaZ9Qz/XD+XGRiQZBvM1SjxOYe2bFR/DG1H9JaJa1
cFP8Zm1tows4KhnthBN1PzKja9zqN94vqmMMWlF9j6IYajba5CHYP2c3uNs69VTR
BrhKYTGnpQs=
=NOs/
-----END PGP SIGNATURE-----
--=-=-=--
