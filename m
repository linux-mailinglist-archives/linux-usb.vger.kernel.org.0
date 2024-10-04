Return-Path: <linux-usb+bounces-15754-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4609911EA
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 23:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3260228416D
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 21:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69271AE01A;
	Fri,  4 Oct 2024 21:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="pSJnAkjn"
X-Original-To: linux-usb@vger.kernel.org
Received: from sonic312-24.consmr.mail.ne1.yahoo.com (sonic312-24.consmr.mail.ne1.yahoo.com [66.163.191.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66141339B1
	for <linux-usb@vger.kernel.org>; Fri,  4 Oct 2024 21:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.191.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728079073; cv=none; b=i0C13vjojq1MkPezNmTR+RdFsTHhdyRp9OK3ZKmvLwSJL0LILpRgevZNMBTX0w8iao4CTVJvI61hAj++8iMvi2iFXyMt10+sGLugf0XR/k/o88MBmj5SZaXZ7WXBgfTzu81ibdNX7bf6nlK4B0lDaatx6SRFVGyOi/Gr5V+DeuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728079073; c=relaxed/simple;
	bh=YfN2yWEXouGKNmdMk57RVgbY6abyESOGGjKLw1dHIhI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=E9oiSsuGMSXpHEdlUPsKgy7xOfI/eoHSqXT2BxSR9jl10HuCuE9ETJw6+Yy/PI6iCmnKKBKpVPCrGW/L6lO3P7+ANfmkYT7fP5FA7W4FYOP4f0+9gAogObyyrB9ZwtEnz1OsJbIkb8pz6UWAOHyXDogIDRIZZ58/o9vQMvZB0Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=pSJnAkjn; arc=none smtp.client-ip=66.163.191.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1728079071; bh=YfN2yWEXouGKNmdMk57RVgbY6abyESOGGjKLw1dHIhI=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=pSJnAkjnM1sDC2gCTZcC/KDJ4JS0b4S4VYh5kTO+ygGV/9V6CzHy9cPwgQfiJXWNgSzgE+vCF29v55qDNb0oQcPYFMI4NpikaAifqRKMFJMa+8aw0gdrjcKlNE8TvAu+rwdPtfvJNvY3wPQMXUIpWjfoY+5RfyyF035gF7fIPWkiQe1MV9zSoj4uXhpXBsBINytlZtfCNXpvG3QnBSTCbC8Vf4vcbX2xtc7gQNWAJMXkdCqrtCWIS7MuADR4xfSZqfjnQ2iNSI/xcx0y758XJw0RtQ6bNE8bFb00/mHnAHratAe5vwCtflLOMKUxavHz/ZwK4ILucHaStWDAyVYXxw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1728079071; bh=PeVY3yV8LLvJH6eo12lvp9VNxufZeTZJA9WUiadwzXK=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=ru2O1Qloc8xKZi4oYUnDNLzc8GF+Njp2lIKUIj4KD/PULvtmyosukomS0VuWxnLOrsvBC+YTbSD0X2qLg+WdBwVHr9mOfygnAudTk8ULrMEF9zbChcdX31OhRjM+LPps94yGsoZVuklojJsVfVgawSd9i4FXrgZTq7UiSzr2XtXULdcQ+Slhrqboe9/b4dIs1MkueP0Kvbtv6ZJIDouWtAOmGmJputragnzVrjesVH5z87kSZIZ3sKrLeEqAg6uzoVZRroLnAW4+t5sfr4j5gdQo9NaFEkZ+DTNBU6o1SGNWStP5l6q5+1aY3DLGnxHydMlEa7EiLIJXpKftARNl2g==
X-YMail-OSG: QDI5kyIVM1lE88frtpruKKTdtdtJbrIb7T.08BamDgFqj9fRzLPgYzygGBiMqAO
 438k5.eTajr3uM2zpmNOS6UTGRzN9mBJKBBNLzKxkDBh.4f6.ElwKeKWq8Ic74r48EJ7xdor16Aq
 UQ7.pS8UiRegwAiFhlceAuOb5fySDrKfupcEH1DhNATg2cjarP8KHubBmGPAmFqallX0MtnbPfy6
 QQbrQsP9vKu995j2_x7eMEUAiQYTyhQQEi07I2te324LFhgdyHZp6BzsX7z7iqtbyqDO4bbLRUC8
 2My4YvB0ddI3tPsX1r8GjjdCyHr01KQoFSvn7FSfU557EXnRMVEnvIMMExIfrMg8LNw5KvZ_4u3N
 i6CCNLP1Q2wdopqTAkOPpf5EJrjfGZLnedTKdQ1yC1Vs81zWQFvdFV0rwhUsL0kSNHZsOHbS4PTv
 yztn_hYCQsYQsGbjGtzM6X8jDm15T6uDgj3DIuw6.u1duGLjiUO8iMUT2kCcaafW0vD.M25CxQ6H
 I38W2_vNwCrrn5RPAM6heLWlwvapvxUn1q3h_8VFKeFa3kPZPVgwMF.9DikvE9S6RsgOqL2CSAW4
 u4V6ocs2P7TmguHsaBfSCeXngX4ijaZnnJ30mQc7AG6Gy8ryqH1hvmNeGztLKkSQFBOIho5BNBMF
 9BXpsZkY3dhsgfGPjEUO8EkIcRjTuwY49rMCCKFEsH21SmIYyjKqpI381Kn5S__2C4VF69lcGiKA
 JICIgvFZNpx.sfILjHyeK5f5xu7gu6Wi44dwStq8NQKoQvUHkXJjC6NoKYMPK3JfywobVwqw4y7k
 LqRWqNAS4CMriptYr92h90CDXklMKs.Kr7yL_hlf4zXUdPgDzldLrE5aNBgNKwKbep5BMiBktVUG
 _BRDltoZZ28g0eiWQ115Vb9t8fCeILCUVbC8UtIMR8Tpf_P1Ydn1H4IcLPO2LxD8h6NS95RzoUh9
 yK5WTEf.GeJCrW8ceW.3WHZwM9JOzGMx4pNvN1v5tIjwxzbzQhHRASTkCX_iCgarzrSxGRN8Qq2Y
 x5egj9..PSthnN_LY7PY_imX9p2NeW2Ii6bP8NfUKdUM60wFdgzwFtI.KELLdBUpVr8p1ddd186a
 8ro.bAQu8JwEWz.uSCVAtyHSz54J1nPHoatMyL3Ua7.05GVGPLh5.ldzAImylX5pYb0ZhvJJVN5G
 eOmhgbrWbQU3n4AIxI8FRkQ7eXzVJb.TjkpJHdNhTJm6.cm9ppsfGWWEPni2wvVxD.rb3QPC8hDQ
 6tsC1131w354M1IIODw5SXbMPLib_VJzblkXEp0Qkvkimq.DkVZHXRFHWRY3WLNRp3KX4ZZTdpNh
 HaCbuqD8jQcQMjPoegQqT8DYzmnnTsuO7pHj_qoyI_emgk7EXANsjlCiRdCdShmY1yfuEqVekMC5
 yWCWyjFtKKxfqvT78IOlDARLWYXZ3MobfhDNBNjtLbtlY6Wj0713vtLmnebqQeTD1QjlvmFhu.m5
 qD5dbdg2.t8l2RrYGSr3qJgGCn7PbGVyzqEfhFSZu8jymoZDNQPcDA.G1weBuvU2ZHCdNyTbD_0z
 DuxcZD1qYOMiwNxHSLNVy2RqUibe5q5VI3.ov0dJnPGMpcXmGYh7JM544MMpI2v6fSihpObbNEoH
 6VV5PF2Rz.zWeFkQtchkkYpWSPNbGbszlHlymPbWhPPN9YuwoGSHoMaZ.onXxZ5O3XBNNME0.3r8
 2OVH_5x1qjNPQSmH04iX5fPJ3dSL3P5fOjBTh6zh8RZqNqWyh2z0MHXWS.jGEaVOC5pMehSsVgjZ
 H9Li7FSTdUvDd0vYBKe2Ps2Coip0Gn9cqXObu22HUeLVCvSnWXSpcmOUfSsneW.7HRoblKRy4UPm
 L9M_RumxOuLwb9QPhHN5WLzxpbyMnz0C897CMg2XItcMIj8to7moPkBmN6urL3sNeXc2OhXmxfzk
 C8gEr7hG3WGS4In9YYcimD3fm3c51VGvsoiEtpJI0SYpb0KS07cMIIeU3EeZDpN7QIo7ULkJf6Vu
 rpP1.A6DIOqHWMEPxBmAACGtlUf_DQAA0y7oYoYqqTtACH41Iat5k5ZwVtFUbSD.ZNyB6.929v4_
 ddMbvHDLnCXOov1akVBb8NYoQfDYHz_dgujcW6Vj8FmgYPwWO1eDNugZPNTN.ViMl2p4ygg29RTR
 rL2cQOX8h.AOjesQqDOUbYbwg97A4lgMdhWSgWiy6j0561_MrJF_xFnuTNuZiD5JQGnrWb2SLHiC
 SOs53.UPHSlYvOEuB1tFCEtAjQ1RrXjmkfEiQYHrK1CeBBg--
X-Sonic-MF: <sakunix@yahoo.com>
X-Sonic-ID: bca38fdb-555f-4981-89b0-280aa38a5d9c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Fri, 4 Oct 2024 21:57:51 +0000
Date: Fri, 4 Oct 2024 21:07:15 +0000 (UTC)
From: Manuel <sakunix@yahoo.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "duncan.sands@free.fr" <duncan.sands@free.fr>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Message-ID: <1373831583.16353031.1728076035398@mail.yahoo.com>
In-Reply-To: <2024100400-whiff-unspoiled-0e1a@gregkh>
References: <20241004030512.2036-1-sakunix.ref@yahoo.com> <20241004030512.2036-1-sakunix@yahoo.com> <2024100400-whiff-unspoiled-0e1a@gregkh>
Subject: Re: [PATCH] USB: atm: speedtch: do not use assignment in if
 condition
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.22645 YMailNorrin

El jueves, 3 de octubre de 2024, 23:20:08 GMT-7, Greg KH <gregkh@linuxfound=
ation.org> escribi=C3=B3: On Thu, Oct 03, 2024 at 08:05:12PM -0700, Manuel =
Quintero F wrote:> Fix checkpatch error "do not use assignment in if condit=
ion"> > Signed-off-by: Manuel Quintero F <sakunix@yahoo.com>> Signed-off-by=
: Manuel Quintero F <sakunix@yahoo.com>

Why twice?

When I checked the patch it was not signed twice.

> ---
>=C2=A0 drivers/usb/atm/speedtch.c | 4 +++-
>=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/atm/speedtch.c b/drivers/usb/atm/speedtch.c
> index 973548b5c15c..dfd362abf602 100644
> --- a/drivers/usb/atm/speedtch.c
> +++ b/drivers/usb/atm/speedtch.c
> @@ -324,7 +324,9 @@ static int speedtch_upload_firmware(struct speedtch_i=
nstance_data *instance,
>=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 because we're in our own kernel thread an=
yway. */
>=C2=A0 =C2=A0=C2=A0=C2=A0 msleep_interruptible(1000);
>=C2=A0=20
> -=C2=A0=C2=A0=C2=A0 if ((ret =3D usb_set_interface(usb_dev, INTERFACE_DAT=
A, instance->params.altsetting)) < 0) {
> +=C2=A0=C2=A0=C2=A0 ret =3D usb_set_interface(usb_dev, INTERFACE_DATA, in=
stance->params.altsetting
> +
> +=C2=A0=C2=A0=C2=A0 if (ret < 0) {


Why the extra blank line?

I already had that blank line before the if, and the checkpatch script did =
not give me that error

When learning to do kernel changes, I recommend doing so in
drivers/staging/ first, as that is what it is there for.=C2=A0 Only after
getting experience would I recommend doing this in other areas of the
kernel, and even then, only do checkpatch cleanups for code that you can
test, or that the subsystem maintainer has explicitly asked for.

good luck!

greg k-h

Thanks for the info, should I correct the blank line and send you version 2=
 of the patch?


