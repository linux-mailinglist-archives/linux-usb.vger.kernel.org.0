Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137E536A57D
	for <lists+linux-usb@lfdr.de>; Sun, 25 Apr 2021 09:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhDYHWT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Apr 2021 03:22:19 -0400
Received: from mx.exactcode.de ([144.76.154.42]:42226 "EHLO mx.exactcode.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDYHWS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Apr 2021 03:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; s=x;
        h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:Content-Type; bh=Chm0Okj7mdW2P7xH6lAP9Bg8PO6kd2ncy6mEEGrSIco=;
        b=latNAKBBHiKafLSxEX/+4dNU/aHxJVPvaDyXSIk5JhxJvAbl6xV09KaQrRm4ETRLmTHcrjsK+KIhdkEksawgPgJ3nQuno+sGKoa+yTeiORVsScQe1MN7nidLhWmah3QdkfMwkcNZAFe7AOMLXV5Pu4tMJSpMlnTagyYezOM5uek=;
Received: from exactco.de ([90.187.5.221])
        by mx.exactcode.de with esmtp (Exim 4.82)
        (envelope-from <rene@exactcode.com>)
        id 1laZ5N-0002B0-KO; Sun, 25 Apr 2021 07:21:45 +0000
Received: from ip5f5bd0cf.dynamic.kabel-deutschland.de ([95.91.208.207] helo=[192.168.0.14])
        by exactco.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.86_2)
        (envelope-from <rene@exactcode.com>)
        id 1laZ1g-0000OU-Uk; Sun, 25 Apr 2021 07:17:57 +0000
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
From:   =?utf-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.com>
In-Reply-To: <20210425023133.GC324386@rowland.harvard.edu>
Date:   Sun, 25 Apr 2021 09:20:59 +0200
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
Content-Transfer-Encoding: quoted-printable
Message-Id: <883AF188-7817-42E2-84E8-F1DD7A5F3C08@exactcode.com>
References: <20210424.220316.855336714119430355.rene@exactcode.com>
 <20210425023133.GC324386@rowland.harvard.edu>
To:     Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Spam-Score: -0.7 (/)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey,

> On 25. Apr 2021, at 04:31, Alan Stern <stern@rowland.harvard.edu> =
wrote:
>> Seagate devices" in 2017. Apparently some early ones where buggy, ...
>>=20
>> However, fast forward a couple of years and this is no longer true,
>> this Segate Seven even is already from 2016, and apparently first
>> available in 2015. I suggest removing this rather drastic global
>> measure, and instead only add very old broken ones with individual
>> quirks, should any of them still be alive ;-)
>>=20
>> Signed-off-by: Ren=C3=A9 Rebe <rene@exactcode.com>
>>=20
>> --- linux-5.11/drivers/usb/storage/uas-detect.h.backup	=
2021-03-05 11:36:00.517423726 +0100
>> +++ linux-5.11/drivers/usb/storage/uas-detect.h	2021-03-05 =
11:36:16.373424544 +0100
>> @@ -113,8 +113,4 @@
>> 	}
>>=20
>> -	/* All Seagate disk enclosures have broken ATA pass-through =
support */
>> -	if (le16_to_cpu(udev->descriptor.idVendor) =3D=3D 0x0bc2)
>> -		flags |=3D US_FL_NO_ATA_1X;
>> -
>> 	usb_stor_adjust_quirks(udev, &flags);
>=20
> I don't want to do this unless you can suggest an approach that won't=20=

> suddenly break all those old buggy drives.  Just because they are now=20=

> five years old or more doesn't mean they are no longer in use.

Well, what do you propose then? A allow quirk for all new devices going =
forward?
Given that the user usually needs to actively run something like =
smartctl
manually on the drive I don=E2=80=99t see that this should cause too =
many issues.
I don=E2=80=99t have any non-supporting device - can we not just add =
them to the
quirk list when someone reports one?

> Alan Stern
>=20
> PS: As a matter of good form, you should have CC'ed the person whose=20=

> commit you are proposing to revert.

Thanks, forgot to paste them ;-)

	Ren=C3=A9

--=20
 ExactCODE GmbH, Lietzenburger Str. 42, DE-10789 Berlin, =
https://exactcode.com
 https://exactscan.com | https://ocrkit.com | https://t2sde.org | =
https://rene.rebe.de

