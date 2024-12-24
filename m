Return-Path: <linux-usb+bounces-18760-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 478689FB8CB
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 04:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9D0C16544B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 03:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C855199BC;
	Tue, 24 Dec 2024 03:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEKeka4r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEED28EB;
	Tue, 24 Dec 2024 03:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735009254; cv=none; b=bhC7U3hYDe6efqH52oHtC8zFBPeuWkyJgE0LK+kV601QeQuyqC+DwLDyk3tongWR1bYY6Ia9ZceH6yCjpa64Ra20DAKogXqTAVdMl/cjb3jCSO+zrxr75vg44fUW5eiMhp+Liq/21YyQs8xb79fLYM5W5zdPCyyadHNJ0xEjiNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735009254; c=relaxed/simple;
	bh=XZTCB4Wdc4Ss4KxrEhg9k4wCQGze9SU2On0n3Tjz51A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m06DJGSNwo8WxN5Gcod20gi9DNe79R3mp+oCmvQ60YNxvZNCgEnA5bS9qI+HWFQfbw5YYu5DyqLIHg2FBX3VgpEB/QN6HcX6bwNc2HfVsnCFo7dBMQL9c9SyoBS9cAPI5yEDrH+QCOMVKmgtrkfqgrNU64I25ZUYMRz4umfGtfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEKeka4r; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so5338828e87.2;
        Mon, 23 Dec 2024 19:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735009251; x=1735614051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3etr5a2NKKoJs2XI648yETx7pgNFNVIlsJZGrzN1Bc8=;
        b=LEKeka4rTv0z5XK2+gIZnqfhSmDBwakcPc069+hLmto3RUyl+g12OIND7n/moXlbGU
         Ae6pyRu1PdyqTC9NES9NmaOSAMlSbwGahGwUW2WQtDjRdPvw/k4CWeD4t8snMy91+JgT
         S1YTi1jwDii/xeSEgDH5BhpzSqm2891+V3SHALAy1ZKz4Gvjyl0VLCexi/UiLkvBPpLN
         VwDomMs/3rcOn4eaj3Pw3zrf8pNWfB/LUePqN7ITL81e1H+WyODRLeXbSvNZkm3icAzT
         iXkBleCAD8FWA62JK44IvZicZ+BTmwdm7fPUVEEDpr46VnfVybANAWVNm4F5ylHDI8Jw
         klQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735009251; x=1735614051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3etr5a2NKKoJs2XI648yETx7pgNFNVIlsJZGrzN1Bc8=;
        b=Yv/NSF85gq1EGz9eB030oaBWyhX/i+COURID7mGjaTHdekK1mQop7oJZnEH5DKHfuV
         cU4zKbjmXDYu3Mp0Deum7TUdX1tY1DnZbl19kOgfsf+oRjykjJJwVkCQ7Mpa48RrW1aN
         x7cxTAWaRIYzn6o6SZDZa/9Xdcv/fPoI6/UQytNMI5H9eMUSu4Be1FfTPIEFbWAtbjFx
         S7M46Bc/O4W+y7oq9+RED4S+GRfzyxhHpsECW3uvMwdHt/cxKph0l1TQep6XrVYeGqWM
         RmW2WTNpX+3viAthRxf9iEFSOLnZHbjZp4wnLH+Tbthzsj/U9VhjD9P3Kpu9JzwfM1DV
         YV7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeswg3IvtaBuG0NstEnjli4Gazn89eX9aNMwqKnwv5sDTqpm3gvcULxYAECALShGyHO/ZWeI30Lss7eADR@vger.kernel.org, AJvYcCWY8UCizklkpU5VRwHzFoqJR7dDpNCJYuTdds0TYatjTmoEsmRQPv/+CJeNUDR5wbhlywyH+eGmAyKl@vger.kernel.org, AJvYcCWqXAnsQJr7Y1QZ2rpgCWyVIT1DKxCZY+LFFqEBNM7f/UNTE4EorEX7ZADJ8B0Ip9f/fdvxpNYYVR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxObt9fqaA5T5SRYn0Cdh+mq6ctDTM1Q/rPhSVFwkiHIIQWmbM5
	TI9t3nKa4VFKSfOv5WqG6ChRFBVIxAlL+S+2pjvJInRAgpc7mton30nTRyJSO1OWNgmHSpTTTsh
	yfu6sbJT4KxUCp8PzrckNPniDbXU=
X-Gm-Gg: ASbGncvFFLQbzuRR6w79lpJp5hEaDQQLKJOPes462fknosxLXQvl3y5np/fEZC75CMx
	gpaGCQqXOnv+F/PVl8I/nU0y1LeqIQhqVpY2LLE8QCM9k05Qmynmdh+iIAphi6r2fbBfPE3RB
X-Google-Smtp-Source: AGHT+IGurwCBtLbeqw4NtU9On+vb8/Bsltm0tt9U92P6ct5qJ7tLDjpZ9N562XiKiFZd8rxtcrrdYE+hctY/GSO484U=
X-Received: by 2002:a05:6512:114d:b0:53e:391c:e983 with SMTP id
 2adb3069b0e04-542295229d3mr5701612e87.3.1735009250757; Mon, 23 Dec 2024
 19:00:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223090417.12614-1-gordon.xwj@gmail.com> <42623280-d7da-4bc9-98a5-65de33d4f6dc@linuxfoundation.org>
In-Reply-To: <42623280-d7da-4bc9-98a5-65de33d4f6dc@linuxfoundation.org>
From: Gordon - <gordon.xwj@gmail.com>
Date: Tue, 24 Dec 2024 11:00:38 +0800
Message-ID: <CAD2T5m-kZAqeR3fSXHVDtevLkU0FynriwM+tb==eYaNXvVhb=g@mail.gmail.com>
Subject: Re: [PATCH] Update USB/IP OP_REP_IMPORT documentation.
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 24, 2024 at 1:11=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>
> On 12/23/24 02:04, Gordon Ou wrote:
> > Corrects byte offsets for OP_REP_IMPORT.
>
> Add more information on why this change is needed.
>

The change is needed to correct the mistaken byte offset of the field
bDeviceClass in OP_REP_IMPORT documentation. The previous field bcdDevice
has length 2 and the offset for bDeviceClass should be 0x138 + 2 =3D 0x13A
instead of 0x139. Offsets for subsequent fields are also affected and fixed
in this patch.

> >
> > Signed-off-by: Gordon Ou <gordon.xwj@gmail.com>
> > ---
> >   Documentation/usb/usbip_protocol.rst | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/u=
sbip_protocol.rst
> > index adc158967cc6..3da1df3d94f5 100644
> > --- a/Documentation/usb/usbip_protocol.rst
> > +++ b/Documentation/usb/usbip_protocol.rst
> > @@ -285,17 +285,17 @@ OP_REP_IMPORT:
> >   +-----------+--------+------------+----------------------------------=
-----------------+
> >   | 0x138     | 2      |            | bcdDevice                        =
                 |
> >   +-----------+--------+------------+----------------------------------=
-----------------+
> > -| 0x139     | 1      |            | bDeviceClass                      =
                |
> > +| 0x13A     | 1      |            | bDeviceClass                      =
                |
> >   +-----------+--------+------------+----------------------------------=
-----------------+
> > -| 0x13A     | 1      |            | bDeviceSubClass                   =
                |
> > +| 0x13B     | 1      |            | bDeviceSubClass                   =
                |
> >   +-----------+--------+------------+----------------------------------=
-----------------+
> > -| 0x13B     | 1      |            | bDeviceProtocol                   =
                |
> > +| 0x13C     | 1      |            | bDeviceProtocol                   =
                |
> >   +-----------+--------+------------+----------------------------------=
-----------------+
> > -| 0x13C     | 1      |            | bConfigurationValue               =
                |
> > +| 0x13D     | 1      |            | bConfigurationValue               =
                |
> >   +-----------+--------+------------+----------------------------------=
-----------------+
> > -| 0x13D     | 1      |            | bNumConfigurations                =
                |
> > +| 0x13E     | 1      |            | bNumConfigurations                =
                |
> >   +-----------+--------+------------+----------------------------------=
-----------------+
> > -| 0x13E     | 1      |            | bNumInterfaces                    =
                |
> > +| 0x13F     | 1      |            | bNumInterfaces                    =
                |
> >   +-----------+--------+------------+----------------------------------=
-----------------+
> >
> >   The following four commands have a common basic header called
>
> thanks,
> -- Shuah

Thanks for the reply, please find my update inline, and let me know if an
updated patch is needed.

Gordon

