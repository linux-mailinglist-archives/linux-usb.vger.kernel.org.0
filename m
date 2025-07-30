Return-Path: <linux-usb+bounces-26277-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62535B16785
	for <lists+linux-usb@lfdr.de>; Wed, 30 Jul 2025 22:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F79F7B2A4C
	for <lists+linux-usb@lfdr.de>; Wed, 30 Jul 2025 20:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7915F204C3B;
	Wed, 30 Jul 2025 20:19:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from verain.settrans.net (verain.settrans.net [93.93.131.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A43C1F12F4
	for <linux-usb@vger.kernel.org>; Wed, 30 Jul 2025 20:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.93.131.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753906752; cv=none; b=eqK/bFemOG2282AV5mca4k1sDPyAk1jStOo5FY3RbudtogsRN1pnpbzn0SbVnSwuNL9leEv9ipdBaA4JEKGMSGoVSt9ZaRjGvXcKBBh/9YDoa3w1JiY6SIcSqSMReL4LxvlrU4XJBUZvzQ+BZCdNj16cIG7fgNiZ3HVdPv2HnO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753906752; c=relaxed/simple;
	bh=njPLGGOgZjABHaqH/I/SYN4YPYgmW+0xac/31jDft7I=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=e9b7Hexv2eGX/ZhflR7lK7zSOGvApdmZKHlV59wK9QStu8TaZ0VRKS6oQYLC+zb1kvAi9MRFo9/x3fByCYwG/hCHhdNT3OwRadGlbelxM8ANf1zcsjJ3WUwbayOMchmr9bKlbLaATip9MqTvqF//UxEeiFREUaoNmJydwVCQ4oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=settrans.net; spf=pass smtp.mailfrom=settrans.net; arc=none smtp.client-ip=93.93.131.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=settrans.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=settrans.net
Received: from [193.187.128.66] (helo=[172.24.1.6])
	by verain.settrans.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94)
	(envelope-from <rah@settrans.net>)
	id 1uhD0Q-0006b9-G0
	for linux-usb@vger.kernel.org; Wed, 30 Jul 2025 21:02:30 +0100
Message-ID: <ba0ebd17-dade-4a97-b696-5ad19ebfca1d@settrans.net>
Date: Wed, 30 Jul 2025 21:02:24 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: linux-usb@vger.kernel.org
From: Bob Ham <rah@settrans.net>
Subject: Audio interface causing "xhci_hcd ... WARN: buffer overrun event"
 messages
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dwdQpLm1wuChFFAmFWttJFo5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dwdQpLm1wuChFFAmFWttJFo5
Content-Type: multipart/mixed; boundary="------------ez86WmE0mbiPJ1Jl8a0qMyBB";
 protected-headers="v1"
From: Bob Ham <rah@settrans.net>
To: linux-usb@vger.kernel.org
Message-ID: <ba0ebd17-dade-4a97-b696-5ad19ebfca1d@settrans.net>
Subject: Audio interface causing "xhci_hcd ... WARN: buffer overrun event"
 messages

--------------ez86WmE0mbiPJ1Jl8a0qMyBB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi there,

I'm trying to get an Arturia AudioFuse 16Rig audio interface working
under Linux.  During loading of snd-usb-audio and when trying to play
through the interface, the kernel spews a whole bunch of messages like so=
:

[ 1667.208402] xhci_hcd 0000:00:14.0: WARN: buffer overrun event for
slot 3 ep 2 on endpoint
[ 1667.216585] xhci_hcd 0000:00:14.0: WARN: buffer overrun event for
slot 3 ep 2 on endpoint
[ 1667.224778] xhci_hcd 0000:00:14.0: WARN: buffer overrun event for
slot 3 ep 2 on endpoint

When trying to play, there is nothing from the audio outputs on the
interface and aplay reports:

$ aplay -D hw:CARD=3DAudio,DEV=3D0 output.wav
Playing WAVE 'output.wav' : Signed 32 bit Little Endian, Rate 48000 Hz,
Channels 10
aplay: pcm_write:2127: write error: Input/output error

I don't really know anything about XHCI so I was wondering if someone
could advise me on what might be causing the error messages?


I followed some instructions from this list=E2=81=B0 on enabling logs and=
 traces
which might help shed some light.  Here is the kernel log (which
includes some debugging statements I added):

  https://settrans.net/~rah/misc/xhci-kernel-log.txt

And here is the contents of /sys/kernel/debug/tracing/trace which
unfortunately looks empty, I'm wondering if the instructions I followed
are still valid?

  https://settrans.net/~rah/misc/xhci-kernel-trace.txt


Thanks,

Bob Ham


=E2=81=B0https://lore.kernel.org/linux-usb/?t=3D20190409143433


--------------ez86WmE0mbiPJ1Jl8a0qMyBB--

--------------dwdQpLm1wuChFFAmFWttJFo5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQgzBAEBCgAdFiEEiU+rFDuOUMv69+HH4HfB7SDj464FAmiKelAACgkQ4HfB7SDj
464E2z/5AcHeVUPPAAkB/R1iy6lhPIHe76OTwXAIwXMtqH1mAFUCcv5JmSzT/rp5
CNPnP4vniKEAJzkb+Z9SFqnJjG4qAZE6cA2EN1SiUCLhUOJfPOrtcZ3W8QPjqDv2
Pwp2Ne4hNMkyXv5aucAnAbmVDmHObxjHpWy0IsdU94xgEGW5ysbjca+yVyc4v3Vz
ox+5QV1MnuTfHKrJPxtNkctMvKyp1ixJ0sbPduU12f5e/JtPEx+vGZ6wyf0Kvp5E
vLL/UNyY6kAJKLXI9+tuj5zR4mW+W24cPEZKZR4xwhWNqlK20aXg3S8nHZNCowHV
ldGJlPiEPuu2aCKzgeCLcfGMhj8Izbwwp8aIHdCqJFAnwBs642CUox3ReTfPP2dr
b9pPF1gymkOHBmxmuLOtAggR/Cy2hKRloD+KAwvtRdKNmh/egXIQyl2HI5KfhnxB
lXYbbSClW2n+chCtsv4/OT7Z6zrvNKQL2TXKvvkgw0agEle7r/t9qHGNKO0VOf/p
S4+CLM4Tds+m9IGDNdM2rPdrissshtLJ9bSb5fE2BydurvTiQRzwzy90Z+oPdBms
k2SYoAnFXuzLq7tmxqrSar/xE2a0i0LOE3JKucrgWLeRhwJIvucP9M1tmtHDTbDC
oFM7/SLNFgUut9PkhoJ2I82BlwPsWrpZje+MYaEVPbEP3r7wqv6gTYKfYcNxT8DQ
47VYjhGEgQQ8f7TcVGKzX8kfosgVeSshiE0Jb6q+ZojLpvIRQToZtpwbDIn0fkbm
rEbA5V3hCtzEw7fQi1xqYS8RTVLt0gNrYz5WN3BoAjKDFToF56323g0b4cbFy56Q
mPqefMi4muwvto8r6GEk6Lf6NfBtViMM8k+g4pB2M9nxOvPOdzmrutTxfhBSaPLl
yl0J3uHXl9hYlu1mSo0iyQXaDmPezGSc4dn5NnItu3NCq6AUs+SbH2A72kV4PeJZ
agd9uJzyk7XTfAiFrnz0vRxaOmxo3A2TgkpflGo+rLqHzJXKRfaql5CQ4rhLJmy3
30Hwfq9s4mmBSaBNnbdwcpxCKknle3cFKz6K4i4w/xu3Cly2azXsz5e78Do0gUiM
3J8IAvQg3KEC25eLOb+tpwhvu8wyrLp+JWN9Syh8DuaMf/JsIJ/l8wGN1k2lwdzF
mROharOOGsc2aR3F/At6jPT427tNQqQBiAbYglwWwVa1pex9P3bfx9CA4DX1efQM
ec2VdaE6enrWyHELi1s6iEHNeivsJJUmrry9CUz2jSFobC6kV3poF0DN7Dwdslr9
+H1oFdF5Bde9ohHpQLprVWTNzIpZscJjWbulDHRX76U+5VVMbDeY8PFRGwNcPvsP
yKHRBmL0gPPUMXbRAHpqj//Paa05pFYHZVX4TuQH2BMzcDeFC3llrcSwnTR+gkJI
YTeCTpU9sAEsVqGmlKgGJfXtzTZp4rCgqo2Pe7XoBNo1LXZWHNJoO6Ig/99tTtm6
zYxdRDyrNJeRMriP+xaoox+FeQSVw38lheDEIQFltOFJA5FHzzq2b9pPuu6E34Dv
OspRmkVcbQ6yjdBMi+sSDjCW03fjqpOW19zHRjvPeag2nJYD2RCsuRPs40BReRIo
cuOJL1VTVoTXTAJrt6NouNLDVjz/mEcizqOMyJmBtSwb8N88X58Dse7F05tw2kiG
X37EXiGHSBu/jE7TlUmViN98s913lVMyNQSE4cv2Ds7SqiBVbuyL33uvVduKuIEu
E5UwfAsAXdfF1GmCX4wFBlUoelH6p7JtRtBuep9X14znN3hVkCmd2c9SxlLA557S
CaRnzkCmxqUw7/2niuSO0dyYwYn4bKjpfiz6pVHWpg6s3y/TutT8kXKSjKkHDHWv
o+6iPUpkKnslNGkjzqJkjRFDRti9UiwU13StKplwccuP9O+oG/A4vO5I2jCJKc8n
AgK//lE26c/MmPL20qPZkS7jW2TTXpeIsKFt/fj2UItcCymNF/ZmA+FmMygWuYsg
nveXhwy+DnknUwrzMv/M61xsWmTv5WBouDcwV6+CnNPuwqPnDMwfo66jUBoATF7b
6j/x2Zy8TaptdzEXVWWhks7M0pLua+PQjiuwy/crLnvVpLaRh2kXSfWo2qg5GCwD
Nup/1Adc0aZUgRyCf8oRUhvBKThsJ3cdfDWrL/P6a3pwmaCb1ke2MG3NhjfvvsaG
ASlMuSHn7iwRSs5rwviPlpChip4QuH/rYPQ+IRQ5LlLfsN+xwCqdCE/yLQrxq4do
OnJL8YWgfYabTdXVXW/u05oGf1FaCLaItZ0q2ep0gepN3B2hc8Fm0g+A6zoBfXEB
9aJFEQuwCURoBcsYa7jelGkDsmnPlfxqJFCNKZUBa+CNdxUbskAnc6UrNwo+DkIN
3KW4ilH6sceanDh4aVbsd86l5bvNi56QlTeawnXV74tPMqsG77iUixPN0Ocua/Xj
vrHk/2nCn1EKiwUtCylwgToaO+Cfn1i5H9MIpVrog/HZ3bVzqGhSQg4StPo3jVAx
Rwy8F93tVG67Dvy39jrI06Y/JZNVoiu5czjZEAzs1sbZUhVRhIbSywS/DLxeRD9O
sX35Wrz4QdLW6I8KtO8b4dSOKUXjieSxo2HUhub+FuIjDJvUFHbM0M8Ke1IkRFKT
IE3kJYBDfuKqoTiFO+Ra1LsTCZUkNWWzjuv7VZcOJ8TqiwZJ8UW0DuVWZQSUNFZw
j0OVlgXzXdOFzsPHtjffDtelBLHsXgl6n4azvx1/56+5UGG9fC0=
=KmsG
-----END PGP SIGNATURE-----

--------------dwdQpLm1wuChFFAmFWttJFo5--

