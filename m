Return-Path: <linux-usb+bounces-35855-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDnGHRlAzmlQmQYAu9opvQ
	(envelope-from <linux-usb+bounces-35855-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 12:08:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D33A238776B
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 12:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 399313024977
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 10:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB723C65FC;
	Thu,  2 Apr 2026 10:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkUjSIHI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6253DC4A0
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775124315; cv=pass; b=RZWVytSlZrbR+H9m24DrOsqSezT5n5hcV9Y0jex+s3R97aBc68W7uO4ThNIRwFVIqhHhobZZbVyAmpjJIq+eDu6MQCw8If9ICr3fdiEqsWVBOEpK0Ckpm35pZN6MoLwng1ibYpZSTOhckJckmAm/9OWWCuDudR8Q1u+H/qoO/Pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775124315; c=relaxed/simple;
	bh=OsiL/1pwgaLk9UGEMEVqaS1tHbhO879gXMnD9GeFmM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gOEk8NoR+tdlWqxeoEu5M4fGEEL/X4ILd72H0X8QXbC5brjuTmr1HU1M45gu2WWT2gO5M5a76XSZu8gK7TusD/CGlBfiZPE9VjS2KvyXsjRd+jXsaNx9JExt52qSkHlM/A9cypYrqMtB7zhvs4xyPj8enAEScdhgbQY/Tvryw3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkUjSIHI; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d751ef36ccso414507a34.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 03:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775124313; cv=none;
        d=google.com; s=arc-20240605;
        b=DXaXmOI6uEjhVp1FWB/vInwjS4jfoNrPQlACdjya6b4BXCrkpy7Gl3iTGVAz4P4hZL
         hZC61L/nYCy4rIgYEaDzwL0mXdUxiH+OZ9VjLjZkkGpBeO+qiKf1I4VmVa28Wj4Ykv2/
         7jzjdVvS6NUThiqTDMn/rm/Z+sTmS3y53HKrEQzjULQSIooVaiRy3ujEaEgP6IvEzPQX
         c8BZzlyj003oia19KmWzKGsQwpkF86Mb5xxE1QujuwIRHSJxlm1Z+7yEqWMHgwmJnYh6
         ybdU9g6tglAS/MgwRQAo9MT2p7McQxkIQ1p2GvZoi2w1WU3QG8JcEvks6GP9gaAGxQvW
         1VrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Z0F0LSV4rb0+tEeskaVV3h52HTcTsqrrJt52KWcr8c=;
        fh=slpmbzV2+oCngYxkoWkvTQMPRDbewrKzPxdcs3OVV7s=;
        b=Rn2VeY58Xv/ud8LjiBqcJRVNk6OumhgGBPtcs4IReC9dtiPAa8J5RDx67W905zACHb
         4pXi8RwN2P4PSHFkt1dHP5/XTanv/X2TtbEsuld6AKHRfKGDKKy38r/nwsyZjVJjSoGx
         WEUxn7LzlQZ8owTuWYbaFBQfmpMjX0TSaePggzWDnOHQOCmlfsE8yLHdviohlZ6wTEpJ
         BcWq+EI55zm9qZNpZRDMjY841caSl4IBdGLRD7Y9vVcDNcgK3VajEJ1qtu6XD6aP3dw6
         8E4avKrj1Kf4qYZ9s6PE2LevVfa6d4RdwC0Zdu5QOkQzLRvDwnnyfhfqsrw0SQYeplZ2
         DnOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775124313; x=1775729113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Z0F0LSV4rb0+tEeskaVV3h52HTcTsqrrJt52KWcr8c=;
        b=UkUjSIHI1U703viqbTydlU4JHi7AFAl51AUpCMx9b+wVryiST9od87YB4RwLXhKC7u
         l1jt1voRP5Mgg0J9rUDkORvIYjtHKc1q4cFgy9vQowZ1mSYQLEYH22A6IRr1yCaQ6t6H
         8hd0UZ5DO1+4d/OzgIsSmaLeoLGZj+cdrf7jySzpiknlouXB2ZZsjsycsIo3y8Ft5IGp
         evKaQJbKktL19N/SqAtcNIy3qOD7QOcIA7LKwPnBtPbNcEq7z6OzA3CGT+ZBJlW9r+Hg
         Ul0KYMmbBXL1u2qAVj6FsUqGa5Ir4a2xrVKODmmTypPrRYTgIc7iZLKRoS//MYNeC7JU
         pOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775124313; x=1775729113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Z0F0LSV4rb0+tEeskaVV3h52HTcTsqrrJt52KWcr8c=;
        b=il/GaKEGouEeS6sO1LiQHurtXmQLQU897MLDr32IqbNIqaN0zKD18eJZxWQUuy0p3g
         NKsz/LypUozCVzX+8l2nICTEqmHtqhSx/M9M+hqy0p8CE9oIhKrGmy/KwivpSqyuYc4j
         0ywcV3+Zdqstn17Mg0RgLk9/lFFFx+ehVblLlvGEdNSYP111qlKd0xU4UADkc1jkfwb2
         1ebHtHyA8x8Ku5nCFd2wa+hVgMkTiMPmkgYvkxfBBveqtw5hpg0CD7uClAEaeimEm+x5
         K37bbwr0dVj0z0hT153bEHwYIswZ0INxGwAf9JquAU+vANQQvBS1JmL6J8E74Loj72rY
         eBYg==
X-Forwarded-Encrypted: i=1; AJvYcCVgD/NDFCpyZAkMGtN2Q6tesui8TbbywvFyvjQRwKxvNR3cAJGJMbLokAffO8U2k9NboO2DSRd9GU8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6sSRIMFvRAiMF+yarwVQSRaCbwit4wDGb5I5Hjxi4HSH7aJiA
	aWJgcA0qGFqHdLkdU5wS5bTRlO6YEHIT4sjY8tr80+28TiHXp+nkHOmGzkf7xfQ/uXBMDZ8nt2N
	qq+xZCcZ2QF3wyP1+r1B+1ZH81WSkfzbq5KqPoh4=
X-Gm-Gg: ATEYQzxu7rugVHb4+Cek7iwJAVYT2hn3zC58DPVjUEqcYPW1GagW8wAXcCTb4oZ7MKu
	grSsBN57sk6YvRUilxeH/FEALbayzi6cz0DFW+2zbwtjpxNE44VRHdqgmX0Rxg//EvdNMhMIhNl
	au/Cio7umoASNh//RR9L+HoNVuMiEH0JDt+BPHrfRV3qwrH2zbtl+0hxfyA3Kt8j+2907IHI9My
	0OFgi5Iu7JHCg8XLlCJnGtnEyq/mnnvOh2vy+Jbfmm6BbVmVPBCydJzyH5psizNW4WtLlqBKShH
	oqmw4BT2uRKa3OEPgMByL4DtyTYgVUvJEpZLBHKrqqezLxOvjZZtEOxoi4GR0mrY8aRH+A==
X-Received: by 2002:a05:6820:3087:b0:67e:3265:1659 with SMTP id
 006d021491bc7-67fabd0ee58mr3470951eaf.62.1775124313530; Thu, 02 Apr 2026
 03:05:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402083722.100973-1-fabio.porcedda@gmail.com> <ac46YeSJeYVvm0Hn@hovoldconsulting.com>
In-Reply-To: <ac46YeSJeYVvm0Hn@hovoldconsulting.com>
From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 2 Apr 2026 12:04:33 +0200
X-Gm-Features: AQROBzDG6MB7MLj_5-xfUluKajqLUUg8YfN3uzie3Tuh6LKnQWHoKmLCh6Jmgto
Message-ID: <CAHkwnC8avsKQFdbGZ=sTgjhWgoykjH+nLm=si8J5siwr=DkB7Q@mail.gmail.com>
Subject: Re: [PATCH v2] USB: serial: option: add Telit Cinterion FN990A MBIM composition
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	Daniele Palmas <dnlplm@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35855-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabioporcedda@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D33A238776B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 11:44=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Thu, Apr 02, 2026 at 10:37:22AM +0200, Fabio Porcedda wrote:
> > Add the following Telit Cinterion FN990A MBIM composition:
> >
> > 0x1074: MBIM + tty (AT/NMEA) + tty (AT) + tty (AT) + tty (diag) +
> >         DPL (Data Packet Logging) + adb
> >
> > T:  Bus=3D01 Lev=3D01 Prnt=3D04 Port=3D06 Cnt=3D01 Dev#=3D  3 Spd=3D480=
  MxCh=3D 0
> > D:  Ver=3D 2.10 Cls=3Def(misc ) Sub=3D02 Prot=3D01 MxPS=3D64 #Cfgs=3D  =
1
> > P:  Vendor=3D1bc7 ProdID=3D1074 Rev=3D05.04
> > S:  Manufacturer=3DTelit Wireless Solutions
> > S:  Product=3DFN990
> > S:  SerialNumber=3D70628d0c
> > C:  #Ifs=3D 7 Cfg#=3D 1 Atr=3De0 MxPwr=3D500mA
> > I:  If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D02(commc) Sub=3D0e Prot=3D00 Driv=
er=3Dcdc_mbim
> > E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D32ms
> > I:  If#=3D 1 Alt=3D 1 #EPs=3D 2 Cls=3D0a(data ) Sub=3D00 Prot=3D02 Driv=
er=3Dcdc_mbim
> > E:  Ad=3D0f(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D8e(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > I:  If#=3D 2 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3D60 Driv=
er=3Doption
> > E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D83(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
> > I:  If#=3D 3 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3D40 Driv=
er=3Doption
> > E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D84(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D85(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
> > I:  If#=3D 4 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3D40 Driv=
er=3Doption
> > E:  Ad=3D03(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D86(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D87(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
> > I:  If#=3D 5 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3Dff Prot=3D30 Driv=
er=3Doption
> > E:  Ad=3D04(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > E:  Ad=3D88(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> > I:  If#=3D 6 Alt=3D 0 #EPs=3D 1 Cls=3Dff(vend.) Sub=3Dff Prot=3D80 Driv=
er=3D(none)
> > E:  Ad=3D8f(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>
> > @@ -1383,6 +1383,8 @@ static const struct usb_device_id option_ids[] =
=3D {
> >         .driver_info =3D NCTRL(2) | RSVD(3) },
> >       { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1073, 0xff),    /=
* Telit FN990A (ECM) */
> >         .driver_info =3D NCTRL(0) | RSVD(1) },
> > +     { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1074, 0xff),    /=
* Telit FN990A (MBIM) */
> > +       .driver_info =3D NCTRL(5) | RSVD(6) | RSVD(7) },
>
> There is no adb interface in the usb-devices output in the commit
> message. Do you still need to reserve interface 7?

The output of usb-devices was not complete, I've sent a new version
with the full output:
https://lore.kernel.org/linux-usb/20260402095727.108281-1-fabio.porcedda@gm=
ail.com

> >       { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1075, 0xff),    /=
* Telit FN990A (PCIe) */
> >         .driver_info =3D RSVD(0) },
> >       { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1077, 0xff),    /=
* Telit FN990A (rmnet + audio) */
>
> Johan

Thanks
--=20
Fabio Porcedda

