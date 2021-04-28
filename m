Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FED536D5D9
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 12:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239448AbhD1Ke0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 06:34:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:48564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230057AbhD1Ke0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Apr 2021 06:34:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B25BA613FF;
        Wed, 28 Apr 2021 10:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619606021;
        bh=l7IMgaZyYJRjIGyvx68h86iDLPLdkste2iB/7x6K1x0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=gFmhLTyru1nnNm92ssYwj4ewBsz/8wCNuZ5DqucLdT/l4Gt5v0pNzQ/QW+MYUsuex
         r0vp41otJYU50Gquxr1iOs2u6hddzGmVUmBNvLkVVkvb9rrqVwQSe2SLIfD21VAKAo
         h1bA3rThuyQAgjwt7S9yiY5OUdw6lMYFgHhBnMP6gObWMFyCpYpoxONjSRkF/44kXk
         WmskfrV8ReVK/l2DmsbyTLsMJdhBWBxS1c5fCbyHAjTyK14EB+UIkeXJ/t1jrdTuEO
         ZPU6Xd/9Aga2mtsGV+vmbrru6x7LPJadOise8Qj6utdfAqf+3pg3ob0N8llj4lR0iZ
         rP3LGV8MBASvQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Pawel Laszczak <pawell@cadence.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "ruslan.bilovol@gmail.com" <ruslan.bilovol@gmail.com>,
        "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Rahul Kumar <kurahul@cadence.com>,
        "peter.chen@kernel.org" <peter.chen@kernel.org>
Subject: RE: [PATCH v2 1/2] usb: gadget: f_uac2: Stop endpoint before
 enabling it.
In-Reply-To: <BYAPR07MB53818C8D0BF96BAD15ED3918DD419@BYAPR07MB5381.namprd07.prod.outlook.com>
References: <20210426044815.5393-1-pawell@gli-login.cadence.com>
 <878s55l50t.fsf@kernel.org>
 <BYAPR07MB53814E672CF41548418248C1DD429@BYAPR07MB5381.namprd07.prod.outlook.com>
 <8735vdky1t.fsf@kernel.org> <20210426145047.GB365717@rowland.harvard.edu>
 <87zgxljdua.fsf@kernel.org>
 <BYAPR07MB53818C8D0BF96BAD15ED3918DD419@BYAPR07MB5381.namprd07.prod.outlook.com>
Date:   Wed, 28 Apr 2021 13:33:33 +0300
Message-ID: <87bl9yk8aq.fsf@kernel.org>
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

Pawel Laszczak <pawell@cadence.com> writes:
>>Alan Stern <stern@rowland.harvard.edu> writes:
>>> On Mon, Apr 26, 2021 at 03:52:46PM +0300, Felipe Balbi wrote:
>>>> yeah, this is a requirement by the spec, IIRC. A SetAlt to the same
>>>> interface/altSetting means the host wants to reset that altSetting. Fr=
om
>>>> the peripheral point of view that means disabling the endpoints and
>>>> reenabling them.
>>>>
>>>> I'm just not entirely sure if we should do this in u_audio or
>>>> f_uac[12].c. Arguably, composite.c could detect this and disable the
>>>> altSetting, but that would require a huge refactor on the framework.
>>>>
>>>> My gut feeling is that for the minimal bug fix, we should patch
>>>> f_uac[12].c, but all audio function drivers have the same exact bug, so
>>>> I don't know.
>>>>
>>>> If we follow the "standard" of patching the relevant set_alt functions
>>>> in the function drivers, the moment we decide to go for a refactoring,
>>>> it'll be easier to see common constructs.
>>>
>>> FWIW, f_mass_storage.c handles this in its do_set_interface() routine.
>>> That routine first deallocates any related request buffers and disables
>>> any enabled endpoints in the interface.  It then goes on to enable
>>> endpoints for the new alternate setting and allocate request buffers.
>>>
>>> The audio function drivers could follow this approach.
>>
>>right, that's what all other drivers do, in fact. Only audio seems to be
>>different. The question here is whether to patch every f_uac*.c (there
>>are three of them) or patch it in the generic u_audio.c
>>
>
> I agree that the best solution is to create common implementation in
> composite.c. Maybe usb_function->get_alt and usb-function->set_alt will
> be enougt to detect such case from composite.c. The problem can be
> with testing such change with all functions.
>
> For fast fix bug I don't have opinion which place is better u_audio.c or
> f_uac*.c.=20
>
> First version of this patch makes change only in f_uac2.c and the second
> Version moved fix to u_audio.c (as suggested Peter).

okay, I missed that Peter had already asked you to move to u_audio.c. I
guess we should go with your patch, but it would be nice to get some
Tested-bys.

Peter, would you be willing to provide some testing for this patch?

> Change in u_audio is simpler, and as wrote Felipe is common for all
> UAC drivers. Maybe for fast fix it's better.=20=20
>
> If you want, you can feel free to change and modify this patch.=20

heh, that's not how things work around here :-)

> It is important for me to fix this issue because it was hard to debug.

yup, no question.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCJOf0RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQY60A//V+Hyf9GKwSsZVr2Y0S4DH/x/KpwvYy/h
od+E3uUNf46s1kyidPViHV54uhg476VXmMDxlGTJW/7t0xcLSxqPQhw2vzGgrXx2
EKXfLjnDXlrxoxcHntxIlCosodeloHi6LKUb+KqOk7jm2VelU2daX5D9SWFjpqDd
94fzABKK8grlCbFile5KoG6+lb1he2uEHwud18g5Tx2sCgJvnV130CwEdANY+9bJ
qGHAzhMtUzm+QEA8c/t80K6rSCaTZC2D3KafPQFEqnzVNuuL6GfaQcSbcnI6mtkz
61VWimEeOTNARwc2/SNKeIivN2TshWM0dquwjPynYWIHifXBgYT0kfk8f2Bfhon/
SP+LcFDJLKihvL5FjoFMcMxG9SPhQqOXnaXMZYTsJ5oXeDataLpZQDSyN1i/MSmD
pA7RmtAzpXkIOx1hDZmZc5UlDuPJcQb8UH1Sf7LtTAJAZfhJVItBXA5lepvueVzw
1qtT3CunFyDXcZ0JVwXm7+WxDdfLAHmNk4M6K16ngJNxTA63KOswnU/TiCT79axV
VVQUAwNM+MOJ+Ad7t3JBLyXRu8stkQOP7B906CaB3FrJnZT8E8tYdOnPbUKxIw3s
iB5trzsVbsAvzvA19mppJjUBIWYRXj+ydlrH7jrnnopp6h2qcYdfsLRdJJbQD+Nl
iRzfHuF3lBQ=
=acG2
-----END PGP SIGNATURE-----
--=-=-=--
