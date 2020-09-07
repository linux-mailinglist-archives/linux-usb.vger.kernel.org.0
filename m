Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C2F25FF51
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 18:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729875AbgIGQa1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 12:30:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:51090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729829AbgIGO0r (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 10:26:47 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 283E920768;
        Mon,  7 Sep 2020 14:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599488789;
        bh=gfVWri0GxTk22fZ2X3aerqdZKGVKYf8woM5XW3zxXtY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=M44WWzX3pEFazxfoWecqX2CXps+HpYqrH/7mFlg3FzKyk5GhBn/AP2l47Azw8ykfH
         32TjZlrZ4mOKHPCj/NFfmdHImcJgNyy3PYc61Ruui+87TG2wL88A22rSV6IkJ0/dQy
         Zj9XS5GuAcsdw6PPmiJqiDOJyMsrkkOe6uQqI7qA=
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
In-Reply-To: <20200907141814.GA762136@rowland.harvard.edu>
References: <20200731095935.23034-1-peter.chen@nxp.com>
 <20200731115536.GB1648202@kroah.com>
 <DB8PR04MB7162B2FAC7FACD0A11F6D8218B4E0@DB8PR04MB7162.eurprd04.prod.outlook.com>
 <20200731122520.GB1655976@kroah.com>
 <20200731140553.GA8013@b29397-desktop>
 <20200731141632.GB1717752@kroah.com> <877dt610z6.fsf@kernel.org>
 <20200907141814.GA762136@rowland.harvard.edu>
Date:   Mon, 07 Sep 2020 17:26:22 +0300
Message-ID: <871rjdoe7l.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Alan Stern <stern@rowland.harvard.edu> writes:
> On Mon, Sep 07, 2020 at 10:48:29AM +0300, Felipe Balbi wrote:
>> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>>=20
>> Hi,
>>=20
>> > On Fri, Jul 31, 2020 at 02:06:20PM +0000, Peter Chen wrote:
>> >> > And this no-op function is horrid.  There used to be documentation =
in
>> >> > the kernel where I could rant about this, but instead, I'll just sa=
y,
>> >> > "why are people trying to work around warnings we put in the core k=
ernel
>> >> > to fix common problems?  Do they think we did that just because we
>> >> > wanted to be mean???"
>> >> >=20
>> >>=20
>> >> So, like kernel doc for device_initialize said, a proper fix for dwc3
>> >> should be zeroed gadget device memory at its own driver before the=20
>> >> gadget device register to driver core, right?
>> >
>> > It should get a totally different, dynamically allocated structure.
>> > NEVER recycle them.
>>=20
>> then we break usage of container_of(). That's okay, but we have to add
>> some sort of private_data to the gadget structure so UDC drivers can get
>> their own pointers back.
>
> As you've probably seen by now, Peter solved this problem by storing the=
=20
> private back-pointer in gadget->dev.platform_data.

Cool, as long as we have a solution :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9WQw4RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZ4kg/8CgW+VMhFors3KZ0K7lNkGG1/jWsjzbJ6
cJWwe+/Ke+HOHDBSFU+N+VZ0DZs107SAB29PIJaZ3BaHd6kbPp0ySvboox9Ll97B
V+ec4O92UBrVFn3OqKDhmnTHyPXf6K2GNrAwNQ6WTwz0qO5vBislnCAGrasirQO2
RQpOgcYfo9dq1ensCfv0b1pN0WxrVRF8vCvHxh26LfhUcWRKKSzUhBAOarosF5rF
Ibt/8t948X9Z0Omu6BbYmfjvOoNSXlMvEXIN5hb7y4GHfjYNuzcNudLYc654A76H
PihA7YodqawVDjY7+/U3wJhXySI7QqL7F8TaQ2i3I8zyIlxWxPXxk9fp53rdJjiW
pxMP6+8LcmVrk0JypaXMbfHVwBXZpNpsrh4KyyAsp/KmS/w0w8/B3oHjzeoICY8q
cPmrnB2oDpuvjIo+6mgL7+y9npPVjTPNAPl9EkUw8FqDnvLL4NrV+PeC48MxIWI8
m3YJOdPiFxW0jjwB5BaJ4UI8b77gHwDu2W4xVGQXXp/HqKl7n5t0ekQHOYS1JZAJ
JROnv/Jk6PbtyEaoxTaolXib0I6gG3ZpxHPXdQ0TrC66UDVGw2+E9O3qz0AawA4D
5euK7gNPfy4ygfMGAxBq2LfZvmj+KXdH7m22MNUiOj7mwTjDWbLirS5udti/R6cm
WbgXeOXk0k4=
=LVsC
-----END PGP SIGNATURE-----
--=-=-=--
