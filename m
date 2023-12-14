Return-Path: <linux-usb+bounces-4163-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2A1813514
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 16:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE8C11F217CA
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 15:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0592A5D8FD;
	Thu, 14 Dec 2023 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmadams.net header.i=@cmadams.net header.b="OXfPbLa1"
X-Original-To: linux-usb@vger.kernel.org
Received: from linode.cmadams.net (linode.cmadams.net [209.123.162.222])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053219A
	for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 07:44:06 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by linode.cmadams.net (Postfix) with ESMTP id 4Src8j2L3yz72m8;
	Thu, 14 Dec 2023 09:44:05 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cmadams.net; h=
	content-transfer-encoding:user-agent:in-reply-to
	:content-disposition:content-type:content-type:mime-version
	:references:message-id:subject:subject:from:from:date:date
	:received:received; s=20220404; t=1702568644; x=1703432645; bh=h
	5z/yFNgbg1/UvjOD269z+Ia9W7z5iCpdHQqGD4Hu4Y=; b=OXfPbLa1dJRUKT/1v
	qUMFhgHZgHij7VegOMXFMWaWtqOGWagTkcHGLzCOoI5PSTGGThs7wESw6s81CYVg
	Rd/MS8R+Fu+rTZJ1okMvD/Ruj5XNNGLTyz+GT+bwHN5gKIDPcvNpehsOkF+/Jn0g
	OZmzenOFiUG1o7SPsmLXsVJg/s9MiuZaaekUTwq8bFjoSgiEW9QpK6G2CeZ1VMYP
	7ZHUV+IJ54XUZf1rpd3GGYcuTRiDMEvZ1nbLm3VS8GszUBK0goBShQrqmgxWEDkJ
	A/cM8rozjgPqGgTjsADYS2GJfekGCVJWXOOeBmI8zdJBZOy+Ush0n5hIaaqEMtTZ
	CXRLg==
X-Virus-Scanned: amavisd-new at cmadams.net
Received: from linode.cmadams.net ([127.0.0.1])
	by localhost (linode.cmadams.net [127.0.0.1]) (amavisd-new, port 10031)
	with ESMTP id qpUO7ueQhy_b; Thu, 14 Dec 2023 09:44:04 -0600 (CST)
Received: from cmadams.net (localhost [127.0.0.1])
	by linode.cmadams.net (Postfix) with ESMTP id 4Src8h517cz6wVZ;
	Thu, 14 Dec 2023 09:44:04 -0600 (CST)
Date: Thu, 14 Dec 2023 09:44:04 -0600
From: Chris Adams <linux@cmadams.net>
To: Rajaram R <rajaram.officemail@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: See USB-C charger info?
Message-ID: <20231214154404.GA10926@cmadams.net>
References: <20231213191649.GA28331@cmadams.net>
 <CAOiXhaLQB45XzQLjbew50t-brA2aCYTQ5mMG=J4yW-qO=cMiZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOiXhaLQB45XzQLjbew50t-brA2aCYTQ5mMG=J4yW-qO=cMiZA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable

Once upon a time, Rajaram R <rajaram.officemail@gmail.com> said:
> On Thu, Dec 14, 2023 at 12:48=E2=80=AFAM Chris Adams <linux@cmadams.net=
> wrote:
> >
> > I accidentally plugged my notebook into a 15W phone charger instead o=
f
> > the 65W computer charger... but got no notice under Linux about it.  =
I
> > happened to reboot for updates and got a message from the BIOS about =
it
> > (this is a Thinkpad T14s AMD gen 4).  So I started looking to see if
> > there's a way to tell that from within Linux, but I couldn't find
> > anything.
> >
> > Am I missing a way to tell?  Would this even fall under the USB stack
> > (if not, any suggestions for where might I ask)?  I know USB-C is a
> > "complicated" port.
>=20
> Please have a look at
> https://github.com/Rajaram-Regupathy/libtypec/wiki/typecstatus---Gauge-=
your-USB-C-port-for-better-UX

Hmm, that doesn't show anything on my system.  It looks like that uses
info from /sys/class/typec ... but that's empty on my systems.
--=20
Chris Adams <linux@cmadams.net>

