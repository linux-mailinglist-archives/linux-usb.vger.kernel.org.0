Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22134373B7B
	for <lists+linux-usb@lfdr.de>; Wed,  5 May 2021 14:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbhEEMjY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 May 2021 08:39:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:53256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233372AbhEEMix (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 May 2021 08:38:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02DCF608FE;
        Wed,  5 May 2021 12:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620218277;
        bh=t70+ygCN/PMHoyJSmSY0p8NsH1xM9Zu7IlJzkWvjedI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=YfpXh8Q7gkduFl4vLQBzspbwVdtvGAw6vUizlka8en4ZS1X4FvU8rsbq0QBng/Mta
         NRAF8nb4lnAOn7+zHucn27WTrGF1Ii8VWKO+JWa2x/fcRaGZjGMUMw1GYstfUuFpRt
         NpegUG+S8/3Ag7MPR6tOOidoAfKiQmMLEe/+O3BID1NBqjv/WmafglGz5Q2mjlynUl
         ShPdtyUPdwtxAxkAr83znRIlhB+m16ea3Qq0g/hzSwfQv9aSbRPREpR+TRb0cbfFJO
         UeqMiiKLH14lzYjl8hb+9tBVegw+8ggF6al5Jw9JkrAtLQGpM999zvhwU+VV4qpqkG
         LDcvUmnV+Ctsw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Sebastian von Ohr <vonohr@smaract.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Thinh Nguyen <thinhn@synopsys.com>
Subject: RE: [BUG REPORT] usb: dwc3: Timeouts with USB 2.0 LPM active
In-Reply-To: <da6ebfb4f58a4249a095d250d9abe3ed@smaract.com>
References: <c9b5559a05f5459d92e3c704772edb46@smaract.com>
 <87eeenj56b.fsf@kernel.org> <3d2305a43c1f4e3dad2e29286f42982d@smaract.com>
 <87bl9rhv15.fsf@kernel.org> <da6ebfb4f58a4249a095d250d9abe3ed@smaract.com>
Date:   Wed, 05 May 2021 15:37:48 +0300
Message-ID: <878s4ticf7.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Sebastian von Ohr <vonohr@smaract.com> writes:
>> From: Felipe Balbi [mailto:balbi@kernel.org]
>
>> For U1/U2 it's mostly handled by the HW itself. The only thing we do is
>> set the appropriate bits for the relevant SetFeature requests, see ep0.c.
>
> Is this also the case for USB 2.0 LPM? USB 3.0 U1/U2 transitions seem to =
be=20
> completely different from USB 2.0. The SetFeature functions in ep0.c only=
=20
> handle SuperSpeed and SuperSpeed-plus. My connection is only USB 2.0 high=
-speed.

should behave the same for USB2

>> >     bU1DevExitLat          10 micro seconds
>>=20
>> Hmm, this is the maximum allowed value
>>=20
>> >     bU2DevExitLat         511 micro seconds
>>=20
>> This is not. Can you try setting this to 0x7ff and see if the problem
>> goes away? It could be that your platform needs more time to
>> wakeup. Then you're going to have to characterize it to figure out how
>> much this value should be.
>
> I've changed it to 0x7ff but no difference. Also isn't his field for USB =
3.0 only?

It should be part of one of the BOS descriptors that describes LPM, I
don't recall which one in particular.

> Meanwhile I've spent some more time looking at the driver code and enable=
d the=20
> link change interrupt. I've attached a new trace where we can actually se=
e what=20
> transitions happen:
>
>      irq/13-dwc3-236     [000] d..1   174.435986: dwc3_event: event (0000=
6084): ep1out: Transfer In Progress [0] (SIm)
>      irq/13-dwc3-236     [000] d..1   174.435988: dwc3_complete_trb: ep1o=
ut: trb 000000005384b162 (E2:D2) buf 000000007348a000 size 4080 ctrl 000008=
18 (hlcS:sC:normal)
>      irq/13-dwc3-236     [000] d..1   174.435992: dwc3_gadget_giveback: e=
p1out: req 00000000f8e0932d length 16/4096 zsI =3D=3D> 0
>      irq/13-dwc3-236     [000] d..1   174.436497: dwc3_event: event (0005=
0301): Link Change [RX.Detect]
>      irq/13-dwc3-236     [000] d..1   174.436544: dwc3_event: event (0002=
0301): Link Change [U2]
>         usb_recv-812     [000] d..2   174.636131: dwc3_ep_queue: ep1out: =
req 00000000f8e0932d length 0/4096 zsI =3D=3D> -115
>         usb_recv-812     [000] d..2   174.636139: dwc3_prepare_trb: ep1ou=
t: trb 0000000085f38bb7 (E3:D2) buf 000000007348b000 size 4096 ctrl 0000081=
9 (HlcS:sC:normal)
>         usb_recv-812     [000] d..2   174.636147: dwc3_gadget_ep_cmd: ep1=
out: cmd 'Update Transfer' [20007] params 00000000 00000000 00000000 --> st=
atus: Successful
>      irq/13-dwc3-236     [000] d..1   175.438282: dwc3_event: event (0000=
0401): WakeUp [U0]
>      irq/13-dwc3-236     [000] d..1   175.438353: dwc3_event: event (0000=
0401): WakeUp [U0]
>      irq/13-dwc3-236     [000] d..1   175.438357: dwc3_event: event (0000=
0301): Link Change [U0]
>=20=20=20=20=20=20=20=20=20=20=20
> We see that 500us after the last transaction the link state is changed to=
=20
> RX.Detect (in HS, means Early Suspend) and then shortly after to U2 (in H=
S,=20
> means SLEEP). I'm not sure what early suspend is supposed to be as I can'=
t find=20
> in the USB spec (dwc3 specific?). Then a new receive request is queued, b=
ut the=20

yes, that's dwc3-specific

> link state doesn't change even though the host has data to send. Data is =
only=20

it could be we're missing a wakeup somewhere.

> transferred way later after the host write times out and tries again.
>
> For a test I've changed some conditions in the driver so that=20
> __dwc3_gadget_wakeup is also called on transfer updates and the link stat=
e=20
> change also happens when in U2. This change actually fixed my timeout iss=
ue.=20
> However, I'm not sure if this is actually the correct thing to do. I'm by=
 far=20
> no USB expert and I don't have access to the dwc3 databook.

Right, AFAIR the databook was a bit unclear about this. It stated that
it was required only for Start Transfer, but I always had the same
doubt. No idea if the databook has been clarified since then.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCSkZwRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjjAQf/bkdSNZEcAA+TzYvgnxcDN/N8CHYNW2Us
X0pI9X9+YMNbsUAPhPseHjmZzoNNJBeft5YTWq9I9SMRmdqQVOsS/Jy+Ub9pSd8/
/tyt8NdpN+GviygzlHHv5D+oIYMl6t5X+yglHAddQrvdnA13/2BcHHgfCJ9MqiWH
KudxPHTacATxli1wtB4D1BfSPa9dSos16iXBWorPJq5wso8QinMRbg5uE+LZo2kG
GJqhfNjC+tYfHDJF+bRYgUvYYjXDbZUaeZrBfy4rOA3CmMtEjN5vqgUVVDjweFrf
r8ps7Hkg+gVn9iMfLPONmhjdDZ/85WM52cqi+ZHojmIn4AVJtw4Lnw==
=LU2V
-----END PGP SIGNATURE-----
--=-=-=--
