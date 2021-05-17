Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A63B3823BC
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 07:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234353AbhEQFhU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 01:37:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:52890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234141AbhEQFhU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 May 2021 01:37:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E4446101B;
        Mon, 17 May 2021 05:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621229764;
        bh=EhlwCY8laf0qlXIJggTe0ebtKsshy0+Fxw1vLcMrw6Q=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=p6BcAM3n1xSDLTfuQydG2ADN4fT2AByeKsLVCN7EJKRQg2bNtANUKjAJg91Yw246R
         kthV4kuNnMWbF6ILp80KOSKDwfqF0sZI68YzpjNN1ka62Mv12F35QT0Dk+99SFrEjQ
         DzlU4fl9tBQqx5vOKI/KTsfpg9N7qNloTrkrrNJFgqmopLQsxTgtfC3miEQ9wpuvDB
         ytg+OMe58M03KxP/mjQYeSySeENL0jxlQfqh9ZfdQEvwQH0YIt82R0iYuiTLXXkj1W
         pwV2Ewdvqz0sUjEqY4IPacj/tIhKsKdCwpqStoh0L1Wvsqy0CIXWTJ72Cfl8AY6elH
         LTX9yfLsfu75g==
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
In-Reply-To: <20210516145151.GC1060053@rowland.harvard.edu>
References: <20210510193849.GB873147@rowland.harvard.edu>
 <87r1idfzms.fsf@kernel.org> <20210511212651.GA914027@rowland.harvard.edu>
 <87lf8kfnc6.fsf@kernel.org> <20210512153358.GC934575@rowland.harvard.edu>
 <87bl9d7oo0.fsf@kernel.org> <20210514165830.GA1010288@rowland.harvard.edu>
 <875yzk7b2y.fsf@kernel.org> <20210515153113.GB1036273@rowland.harvard.edu>
 <8735un6mjl.fsf@kernel.org> <20210516145151.GC1060053@rowland.harvard.edu>
Date:   Mon, 17 May 2021 08:35:50 +0300
Message-ID: <87tun16hxl.fsf@kernel.org>
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

Alan Stern <stern@rowland.harvard.edu> writes:
> On Sun, May 16, 2021 at 12:43:58PM +0300, Felipe Balbi wrote:
>>=20
>> Hi,
>>=20
>> Alan Stern <stern@rowland.harvard.edu> writes:
>> >
>> > If it's okay to call those functions in interrupt context then the=20
>> > kerneldoc definitely should be updated.  However, I don't see why you=
=20
>> > would want to make DELAYED_STATUS mandatory.  If all the necessary wor=
k=20
>> > can be done in the set_alt handler, why not return the status=20
>> > immediately?
>>=20
>> because we avoid a special case. Instead of having magic return value to
>> mean "Don't do anything until I enqueue a request" we can just make that
>> an assumption, i.e. gadget driver *must* enqueue requests for data and
>> status stages.
>
> Okay.  But that would require auditing every gadget/function driver to=20
> ensure that they _do_ enqueue status stage requests, and auditing every=20
> UDC driver to ensure they don't send unsolicited status responses to=20
> control requests with data stages.  Until this happens, we're forced to=20
> use the DELAYED_STATUS magic value.

sure, that's work for the future :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCiALYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUi6MQf/VyxqsXLA5UgTsx9loPr4SDJGuxIYanGM
A3/rhRaIgnNDXfhSITbJRCJYTAva4b6XZuw/LCa0zbZA2UISUtaorgxUmDCWgMcK
Hyvh02CSsdHE+imA0jkW67CzcObvG1q5IyLno/gUiatc92mZhNAwt7oj6HWGX1ti
S5u4MZRHINJDSBYLtDwcnpg12GW8kuGUqa3UTPHhXwcTOP/hO4L+wgNxFxu3Ll4+
IS5mG1qgFXe5BvhcK2ke7/3RSCm4RfJvePa8IyjBJlNwrPvGWl66qSMBXp0yopIi
ZC9CVgcHUoze83M8Tq6aAoSZTt48qUTH/JHMCJJoIbgE1loBUPMaTQ==
=DBgO
-----END PGP SIGNATURE-----
--=-=-=--
