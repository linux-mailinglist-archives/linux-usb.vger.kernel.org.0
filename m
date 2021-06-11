Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D889B3A42F8
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 15:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbhFKN0E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Jun 2021 09:26:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:35638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229633AbhFKN0D (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Jun 2021 09:26:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA782613CC;
        Fri, 11 Jun 2021 13:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623417845;
        bh=4p9lJA9Kj8Xm3Kc+3faXazlwLBz9wS+bO5KCMyG5hzQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=MjLZqMziWBQtDldH+imGLIIhLiasDW/27ECKxnM4erH+5ZasN21Jes95F4pYwMVwD
         7bqJ2jnf7vi9ohYBzfTjJ70JFh+Bd5+jXFnl4QPsBA4caasNURHnBCb//fpiSdrln3
         I8aDpOc+EXubnn0esOOnLijbS8oDFPqWjPq+YgC62loY0GuSiTV2q0fCxJCzpr/NoG
         pbbgHhqgK70FpoZ4i9xmn9lcbQtKGtkTKeNx2C3ZAPeouxlvnPK25tDAcYabRvKnGU
         bmwQz5UDJRFUmx1oc/rkDqp/e2U7ImvFmV4GKxYK/s5mNjBj3AA4jeclSmblHa9Utt
         /eb6jU4sDGpDQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: dwc3: core: fix kernel panic when do reboot
In-Reply-To: <20210610135822.GA7839@Peter>
References: <20210608105656.10795-1-peter.chen@kernel.org>
 <20210608164933.GA2601@jackp-linux.qualcomm.com>
 <YMCDU+qoShVvJCGK@kroah.com> <YMCNHRLfLPqUhHtu@kroah.com>
 <20210610020047.GB6592@nchen> <YMGzCWCI1R9jvaor@kroah.com>
 <20210610135822.GA7839@Peter>
Date:   Fri, 11 Jun 2021 16:23:58 +0300
Message-ID: <87lf7gzg9d.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Peter Chen <peter.chen@kernel.org> writes:

> On 21-06-10 08:36:57, Greg Kroah-Hartman wrote:
>> On Thu, Jun 10, 2021 at 10:00:47AM +0800, Peter Chen wrote:
>> > On 21-06-09 11:42:53, Greg Kroah-Hartman wrote:
>> > > On Wed, Jun 09, 2021 at 11:01:07AM +0200, Greg Kroah-Hartman wrote:
>> > > > On Tue, Jun 08, 2021 at 09:50:01AM -0700, Jack Pham wrote:
>> > > > > Hi Peter,
>> > > > >=20
>> > > > > On Tue, Jun 08, 2021 at 06:56:56PM +0800, Peter Chen wrote:
>> > > > > > When do system reboot, it calls dwc3_shutdown and the whole de=
bugfs
>> > > > > > for dwc3 has removed first, when the gadget tries to do deinit=
, and
>> > > > > > remove debugfs for its endpoints, it meets NULL pointer derefe=
rence
>> > > > > > issue when call debugfs_lookup. Fix it by removing the whole d=
wc3
>> > > > > > debugfs later than dwc3_drd_exit.
>> > > > >=20
>> > > > > Ouch, thanks for catching this! I think in your previous reply[1=
] you
>> > > > > did warn about the debugfs_remove_recursive() getting called twi=
ce, but
>> > > > > it seems here the issue is due to the debugfs_lookup() getting c=
alled on
>> > > > > a stale dwc->root pointer after it was already removed.
>> > > >=20
>> > > > We can also fix this by getting rid of that "root" pointer as it's
>> > > > useless (we can look it up if we need it.)  I'll send a patch late=
r to
>> > > > do that, as it's a good idea to do anyway, and is independant of t=
his
>> > > > fix.
>> > >=20
>> > > Now sent:
>> > > 	https://lore.kernel.org/r/20210609093924.3293230-1-gregkh@linuxfoun=
dation.org
>> >=20
>> > Hi Felipe,
>> >=20
>> > With Greg above patch, this issue is fixed indirectly. I don't think m=
y patch is
>> > needed, do you think so?
>>=20
>> Which patch is "your patch" here?
>>=20
>
> The patch in this thread.

This one, Greg:
https://lore.kernel.org/r/20210609093924.3293230-1-gregkh@linuxfoundation.o=
rg

Now that we have that, I don't think $subject is required.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDDY+4RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjluwgAjcj0QtBH4vfaAwbrFB9i5RypY+WjnUs0
Onzq0Bcc1aSkefzGV+oxhKECSO5XC/TtAy9nqVHR4SnRh5+5aXHvf3hS83kjzSwq
j2SVjsvy6M9bVolSWXxRbpa+JfnpX3nDKBAbxZZ5HWtYyMLZbofnZwOqc8fe2z8D
P6uYnrHmsL7TCxwGPU30imBjxtE304WBWercNHRIx7zV08/TzzN6WCMeYKYO+LSq
49u3VAZb8Jdd7Q4ElsWavcOanV+ClE16h5XWO2Kz3OECYe+4GqGz+1hKjYt16zcR
n69suhVry6YsuiB5QTqHDy+JGH1k8y9u5D/IWms+Hkaq1AeJMUQk8Q==
=MEcq
-----END PGP SIGNATURE-----
--=-=-=--
