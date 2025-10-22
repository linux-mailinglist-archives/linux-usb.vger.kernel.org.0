Return-Path: <linux-usb+bounces-29525-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 12099BFC9D5
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 16:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8B6A8354710
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 14:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166E434845C;
	Wed, 22 Oct 2025 14:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcci.com header.i=@mcci.com header.b="Ed49brTA"
X-Original-To: linux-usb@vger.kernel.org
Received: from spamtitan.mcci.com (spamtitan.mcci.com [66.152.127.76])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D078B3321A8
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.152.127.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761144264; cv=none; b=JNeZta+46dxCPsX/NE4j5Zeblugba6dKfwxqVs/kpv14MxOCzqzTX0NtWAWdbzSPJfQVUvUpjjGNA1miMjaNaq8vrkLUJW2Y6axoZQMTbJW1ozVawr1ehYFfC3BXfv7Wg+aL49fSF5QlF+sx4qzZkNHhKjjDLgcIT2Hu8uRuvac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761144264; c=relaxed/simple;
	bh=PPjawrC4aFMBHlg7/NCzrYQtSUhzVqs3eQVtpo6hzWU=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=pWnEqv8NnXNug5Cd3BmU1buR9CT6HcKI3UGxF6qNdAFArtOgv+kPmIGhAPA0LBZSuVN1GgOZvhna89JEMOPCuN1mIXXA5vQGxunEhQPfjUCw/cPLp8ei2v/JNDq2S0p6RTpPSkUQaVYymi3tZyaNU8ZxdXKZxiVAybLIcabMMKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mcci.com; spf=pass smtp.mailfrom=mcci.com; dkim=pass (1024-bit key) header.d=mcci.com header.i=@mcci.com header.b=Ed49brTA; arc=none smtp.client-ip=66.152.127.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mcci.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcci.com
Received: from spamtitan.mcci.com (localhost [127.0.0.1])
	by spamtitan.mcci.com (Postfix) with ESMTP id 26BC833659F;
	Wed, 22 Oct 2025 10:38:06 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mcci.com; s=spamtitan;
	t=1761143886; bh=PPjawrC4aFMBHlg7/NCzrYQtSUhzVqs3eQVtpo6hzWU=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date;
	b=Ed49brTAnzCFfQzMAzpCEwK6FoIvXXCCtoPCyp9bchkJdipeQL7dgCv3WHUWt7k/t
	 EDl6Xq04nQpG8qRcVR+XnxBc3cMrqI8wszHdMbdDIix+8M92gk+NVDBlzDuzeWK+0u
	 idAqbCHHbD8Oqe1QdMu2Ln4vC7woVFro1b1QB0dY=
Received: from localhost (localhost [127.0.0.1])
	by spamtitan.mcci.com (Postfix) with ESMTP id 1F3ED33659D;
	Wed, 22 Oct 2025 10:38:06 -0400 (EDT)
Authentication-Results: spamtitan.mcci.com;
        x-trusted-ip=pass
Received: from net2.mcci.com (net2.mcci.com [66.152.127.141])
	by spamtitan.mcci.com (Postfix) with ESMTP id E0AEA33632B;
	Wed, 22 Oct 2025 10:38:05 -0400 (EDT)
Received: from tmmnote12 (net7.mcci.com [66.152.127.168])
	by net2.mcci.com (Postfix) with ESMTP id B49AD1524C;
	Wed, 22 Oct 2025 10:38:05 -0400 (EDT)
From: "Terry Moore" <tmm@mcci.com>
To: "'Greg KH'" <gregkh@linuxfoundation.org>,
	"'Ruinskiy, Dima'" <dima.ruinskiy@intel.com>
Cc: "'Oliver Neukum'" <oliver@neukum.org>,
	"'Oliver Neukum'" <oneukum@suse.com>,
	=?iso-8859-2?Q?'Maciej_=AFenczykowski'?= <maze@google.com>,
	<linux-usb@vger.kernel.org>
References: <6c22b4d5-7d6d-41ab-9b00-9dccf3ec8963@intel.com> <2025102259-purebred-amulet-b6d2@gregkh>
In-Reply-To: <2025102259-purebred-amulet-b6d2@gregkh>
Subject: RE: cdc_ncm driver and NCM 1.1 revision
Date: Wed, 22 Oct 2025 10:38:05 -0400
Organization: MCCI Corporation
Message-ID: <00f101dc4361$7a5b8860$6f129920$@mcci.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFuWoWLMwmxFgSFPKvs3lm8BPFLQgFuUoYDtZ6aJvA=
Content-Language: en-us

Thanks Greg, Oliver,

I'm the NCM committee chair.=20

Of course, if people can get funding, patches will be pushed. That's not
really the reason for establishing the connection.

We're working on an interop test in December. We really hope to find any
active open-source developers so we get them involved in the interop
testing.=20

Best regards,
--Terry

Contact Info=20
Terrill M. Moore=20
CEO | MCCI Corporation | tmm@mcci.com | www.mcci.com  =20
mobile:  +1-607-703-9582 | https://linkedin.com/in/terrillmoore
Initiator, The Things Network New York | https://thethings.nyc=20
Initiator, The Things Network Ithaca | https://ttni.tech=20
 =20
Ithaca Office=20
MCCI Corporation, 3520 Krums Corners Road, Ithaca, NY 14850=20
+1-607-277-1029 x118=20

New York City Office=20
MCCI Corporation, 1140 Avenue of the Americas, 9F, New York, NY 10036=20
+1-646-380-6643


-----Original Message-----
From: Greg KH <gregkh@linuxfoundation.org>=20
Sent: Wednesday, October 22, 2025 08:29
To: Ruinskiy, Dima <dima.ruinskiy@intel.com>
Cc: Oliver Neukum <oliver@neukum.org>; Oliver Neukum <oneukum@suse.com>;
Maciej =AFenczykowski <maze@google.com>; Terry Moore <tmm@mcci.com>;
linux-usb@vger.kernel.org
Subject: Re: cdc_ncm driver and NCM 1.1 revision

On Wed, Oct 22, 2025 at 03:18:07PM +0300, Ruinskiy, Dima wrote:
> Hi Oliver, how are you?
>=20
> You are listed at the maintainer for the cdc_ncm and usbnet Linux =
drivers.
>=20
> The cdc_ncm driver has only had a handful of changes in recent years, =
as
the
> spec too has not been updated for some time.
>=20
> Recently, the USB NCM workgroup has finished and published a major
revision
> to the spec - NCM 1.1 - with several new features as well as data path
> updates.
>=20
> The new revision is available here:
>
https://www.usb.org/document-library/usb-communications-class-subclass-sp=
eci
fications-network-control-model-devices-v11
>=20
> An "executive summary" is here:
>
https://www.linkedin.com/posts/mcci-corporation_usb-if-compliance-worksho=
p-1
39-activity-7335815355266719744-BAdf/
>=20
> There are on-going initiatives to update the Windows and MacOS NCM =
drivers
> to support the new 1.1 features.
>=20
> Do you know of any plans to update the Linux driver as well? I expect
there
> will be some inquiries as soon as the first NCM1.1-capable devices =
appear,
> which may happen already next year.

Patches are always gladly accepted to add new support like this, thanks! =
 :)

greg k-h


