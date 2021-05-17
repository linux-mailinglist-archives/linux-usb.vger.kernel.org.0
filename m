Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D82F3823BB
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 07:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234284AbhEQFfV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 01:35:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:52498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234141AbhEQFfU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 May 2021 01:35:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EAC56101B;
        Mon, 17 May 2021 05:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621229645;
        bh=oMLV4oKImCy5P+OX2KKqvJswrwnMPOFZdfqphYj6A2E=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=JSkW9nJFaGPz5YBnqOhGReUQLa8/CXTbhTBVDl5f8Ssh9oS7mibOP21hgMlo8Httb
         MYbwBniwBLLp/aG3AK/nRIsT/zGYKB9X1VBsxsdAPCN4QMDGH5G4DQ7UQq2E0i5VAC
         z/py1Ua1yWo/Y4+Oxm2kqUxRlxY3916RSmzucpINCfaCAP2dUBpIxHdCJRD29Yit68
         9wB+a0Ia1DLv8YqMAvj9dBTua1fFbJ+B64HvuQxJHxUl45pnjfk0f3o8ZDQy60xEPu
         nOfs4LWOL+d3NA3ksmdbcgUvzgYCkkYmGlT5Q47TnFwwk2WT8VghGSzQtZtgjr9eMq
         0eMyBvqIC7XEQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
In-Reply-To: <20210517020010.GA28030@nchen>
References: <87r1idfzms.fsf@kernel.org>
 <20210511212651.GA914027@rowland.harvard.edu> <87lf8kfnc6.fsf@kernel.org>
 <20210512153358.GC934575@rowland.harvard.edu> <87bl9d7oo0.fsf@kernel.org>
 <20210514165830.GA1010288@rowland.harvard.edu> <875yzk7b2y.fsf@kernel.org>
 <20210515153113.GB1036273@rowland.harvard.edu> <8735un6mjl.fsf@kernel.org>
 <20210516145151.GC1060053@rowland.harvard.edu>
 <20210517020010.GA28030@nchen>
Date:   Mon, 17 May 2021 08:33:57 +0300
Message-ID: <87wnrx6i0q.fsf@kernel.org>
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

Peter Chen <peter.chen@kernel.org> writes:
> On 21-05-16 10:51:51, Alan Stern wrote:
>> On Sun, May 16, 2021 at 12:43:58PM +0300, Felipe Balbi wrote:
>> >=20
>> > Hi,
>> >=20
>> > Alan Stern <stern@rowland.harvard.edu> writes:
>> > >
>> > > If it's okay to call those functions in interrupt context then the=20
>> > > kerneldoc definitely should be updated.  However, I don't see why yo=
u=20
>> > > would want to make DELAYED_STATUS mandatory.  If all the necessary w=
ork=20
>> > > can be done in the set_alt handler, why not return the status=20
>> > > immediately?
>> >=20
>> > because we avoid a special case. Instead of having magic return value =
to
>> > mean "Don't do anything until I enqueue a request" we can just make th=
at
>> > an assumption, i.e. gadget driver *must* enqueue requests for data and
>> > status stages.
>>=20
>> Okay.  But that would require auditing every gadget/function driver to=20
>> ensure that they _do_ enqueue status stage requests
>
> CDNS3 UDC doesn't enqueue status stage by SW, instead, SW tells HW to do
> it by setting registers.

That's a peculiarity of this particular UDC. Gadget driver will still
call usb_ep_queue() in some situations.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCiAEURHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUijZAf/Vdntvxpt4+8cd9yCPL283fWLXUeml/FT
l8k7ftrpA5w63ihi0dMbhkzQo5lXp4O7Z3TBz8HekfFgiXFeScfkvEfhnX/niAvA
5lqXGY/QhXmLa0QKPkqYtoa9SKerUAAbqmUR3M7ml+vzjeDqcAmrrQARuC8iTz0q
5BTCmkkKNG6yf5K+qcAUMxelVIT+r8UR9k5BNKZ4TYzy8kkr0vNIxZSFQ7ZiDvkY
8QM2lUJnMQqbo219VhaG0N26w4ZiGqeevH/bDYTLXRGhNt4oqHk8nSysm96rBsx1
5vRSk2nGDxlCUQmLSRqcp2mAIyYR4RKJu0M5w3pNGvoirXERp8QUpQ==
=FvJo
-----END PGP SIGNATURE-----
--=-=-=--
