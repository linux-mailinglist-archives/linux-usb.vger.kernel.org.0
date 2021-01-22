Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5672FFDC9
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jan 2021 09:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbhAVH7x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jan 2021 02:59:53 -0500
Received: from mx2.suse.de ([195.135.220.15]:38984 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726351AbhAVH7v (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 Jan 2021 02:59:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 064E8ADCA;
        Fri, 22 Jan 2021 07:59:10 +0000 (UTC)
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     hudson@trmm.net, markus@raatikainen.cc, peter@stuge.se,
        USB list <linux-usb@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tyler Hardin <th020394@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>, pontus.fuchs@gmail.com,
        Sam Ravnborg <sam@ravnborg.org>
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-2-noralf@tronnes.org>
 <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
 <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
 <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
 <1ea4e6e4-0806-dba1-a424-47f178dc882f@suse.de>
 <7f055c8e-4b60-3da5-058e-3991637db37a@tronnes.org>
 <a1de51bf-b602-9ac2-1058-b8ced7c6973e@suse.de>
Message-ID: <57dab920-1aaf-e009-59c9-38e79b43edb1@suse.de>
Date:   Fri, 22 Jan 2021 08:59:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a1de51bf-b602-9ac2-1058-b8ced7c6973e@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XpMwuMXaRbcK8D7wMg0ov3pkYTpYUK44g"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XpMwuMXaRbcK8D7wMg0ov3pkYTpYUK44g
Content-Type: multipart/mixed; boundary="7itqifw3deecmn20jACgRoOoGVAmq57oX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: hudson@trmm.net, markus@raatikainen.cc, peter@stuge.se,
 USB list <linux-usb@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tyler Hardin <th020394@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 pontus.fuchs@gmail.com, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <57dab920-1aaf-e009-59c9-38e79b43edb1@suse.de>
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-2-noralf@tronnes.org>
 <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
 <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
 <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
 <1ea4e6e4-0806-dba1-a424-47f178dc882f@suse.de>
 <7f055c8e-4b60-3da5-058e-3991637db37a@tronnes.org>
 <a1de51bf-b602-9ac2-1058-b8ced7c6973e@suse.de>
In-Reply-To: <a1de51bf-b602-9ac2-1058-b8ced7c6973e@suse.de>

--7itqifw3deecmn20jACgRoOoGVAmq57oX
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 22.01.21 um 08:54 schrieb Thomas Zimmermann:
The more I look at it the more I think it should be 'Unknown' here.
>=20
> BTW, can I try this out somehow? I do have an RPi3. Do I need a special=
=20
> disk image?

Oh, I saw that wiki url now. I'll check this out.

>=20
> Best regards
> Thomas
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0};
>>
>> Noralf.
>>
>>> Best regards
>>> Thomas
>>>
>>>> -Daniel
>>>>
>>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>>>
>>>>>> Beware, new connector types have in the past resulted in userspace=

>>>>>> burning&crashing. Maybe it's become better ...
>>>>>>
>>>>>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>>>>
>>>>>>> =C2=A0=C2=A0=C2=A0 /**
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 * struct drm_mode_get_connector - Get co=
nnector metadata.
>>>>>>> --=20
>>>>>>> 2.23.0
>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> dri-devel mailing list
>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>> --=20
>>>>> Thomas Zimmermann
>>>>> Graphics Driver Developer
>>>>> SUSE Software Solutions Germany GmbH
>>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>>
>>>>
>>>>
>>>
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--7itqifw3deecmn20jACgRoOoGVAmq57oX--

--XpMwuMXaRbcK8D7wMg0ov3pkYTpYUK44g
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAKhcwFAwAAAAAACgkQlh/E3EQov+BW
lxAAp8Cou5KuCVIYp21fZ/yDoA/fC2XnxPjTDiX8arQIv0Eau/d4FJ0vQx8ex5tNeMcwRs56C6Ja
pOLGdjphfGoOnpYNgDHlKkK2mDFRGwp/rTV2FNb2gRSbKHFKebzACBBIUe/Z01GoBWBLd8kUlj+2
cOpvHaHK1aioBEYp1bZcOZ/OWjI2zR2Yj3qjaVi3ZR79pDRKVf2H7+QlzubwCSZgGPo+4jApmiBG
sANTdLVpqZAtRoZ/c4u3ALq3WiZUj4I3T9AV7QE2On1fUJ7KaKh98zRsxH3cqA5I7UiVMA8NB9BO
X7qfjBXwNgjlOU2+lhkK1wwDPPX87JnbXTO/b1U9GbkKNJNp2TPHeLcy9HRW2iK2tkeDSAwax9uh
3oeLVz9ucIZ3YizHVf58MTOrM95y/0O/LFSf6Tuadyng0/Hn4psSeaGKHhntXFp9fcY8fIndhPvW
n4WreDLn4tePKnfCWApEr/CmxDuaxNzDVAMCRhe+Txt+pavFTxW84lO8jsRNbjmq9Y1mn77tRvYF
jNURnpdGTZONIIIbyEZvTqGzozuEVdgmf/mqCTFZNWC+H13r4YydHhViKhw3nqrsHwmkpB31o64L
jsrZqgl38YNyKak0jnV4OeV261qxol06jJzM/C2+aPIGLOP2aPu/bKtY8GeWZsZFOG0/a2WCsSFR
EHU=
=fl2O
-----END PGP SIGNATURE-----

--XpMwuMXaRbcK8D7wMg0ov3pkYTpYUK44g--
