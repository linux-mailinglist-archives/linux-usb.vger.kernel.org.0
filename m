Return-Path: <linux-usb+bounces-3501-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A9F7FF2A3
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 15:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BCD92827CD
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 14:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF9151006;
	Thu, 30 Nov 2023 14:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48F1899
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 06:41:07 -0800 (PST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-48-t3ILSSs2OZqhiSRZq3Dljg-2; Thu, 30 Nov 2023 14:40:57 +0000
X-MC-Unique: t3ILSSs2OZqhiSRZq3Dljg-2
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 30 Nov
 2023 14:40:12 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 30 Nov 2023 14:40:12 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Lee Jones' <lee@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Yuan-Hsin Chen <yhchen@faraday-tech.com>,
	Feng-Hsin Chiang <john453@faraday-tech.com>, Po-Yu Chuang
	<ratbert.chuang@gmail.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: RE: [PATCH 3/5] usb: fotg210-hcd: Replace snprintf() with the safer
 scnprintf() variant
Thread-Topic: [PATCH 3/5] usb: fotg210-hcd: Replace snprintf() with the safer
 scnprintf() variant
Thread-Index: AQHaI3u56JraFtMggUKBqY7WM/KeMLCS64WA
Date: Thu, 30 Nov 2023 14:40:12 +0000
Message-ID: <f79f570f12cf424b992a7bc87664588a@AcuMS.aculab.com>
References: <20231130105459.3208986-1-lee@kernel.org>
 <20231130105459.3208986-4-lee@kernel.org>
In-Reply-To: <20231130105459.3208986-4-lee@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Lee Jones
> Sent: 30 November 2023 10:55
>=20
> There is a general misunderstanding amongst engineers that {v}snprintf()
> returns the length of the data *actually* encoded into the destination
> array.  However, as per the C99 standard {v}snprintf() really returns
> the length of the data that *would have been* written if there were
> enough space for it.  This misunderstanding has led to buffer-overruns
> in the past.  It's generally considered safer to use the {v}scnprintf()
> variants in their place (or even sprintf() in simple cases).  So let's
> do that.
>=20
> The uses in this file both seem to assume that data *has been* written!
...
> -=09=09temp =3D snprintf(next, size,
> -=09=09=09=09"\n\t%p%c%s len=3D%d %08x urb %p",
> -=09=09=09=09td, mark, ({ char *tmp;
...
> -=09=09if (size < temp)
> -=09=09=09temp =3D size;

That is actually a bug - even though it is trying to be correct.
The trailing '\0' that snprintf() adds (unless you are using the
M$ one) will end up in the buffer.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


