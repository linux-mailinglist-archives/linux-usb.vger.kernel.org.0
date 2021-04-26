Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BF436B170
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 12:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbhDZKSF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 06:18:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:48756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232253AbhDZKSE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Apr 2021 06:18:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C53A061178;
        Mon, 26 Apr 2021 10:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619432243;
        bh=gaTlQBfvV3oXbSv8n9Nhok+l9myJ4piCfXAZAtac2hI=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=QdevEW2NMHtkNYEjuj/7W3JSMZrZ5F/TKRoakQp0I4XrxcmFuiXjXGLqojaP93qT1
         pryi/1lbEA+FI64qThIIJyDYNNrorlVLwbQA8M2MxhwGE1aIjCwhrIXdy8lRJk8p7/
         IYNHVuS/WnHu7lAUR1exllG8pyiINS1u7XmYkhb0esJww+KWcekFszTz7zK0pzaEN7
         Cl9vC9z2GWe7/+6t8Wl8ZMJfpMI09F8pvaRNmSZsxoaxrds+58vZJ0lRuVUY7Augwp
         LicBbE2olQ+9Csc3HbcXcxW7xj3cw7JMOkIjG9g9QuMbnN4wxHn7RzS8LtTGLFs6jw
         2DfPFrSJo7W7Q==
From:   Felipe Balbi <balbi@kernel.org>
To:     Pratham Pratap <prathampratap@codeaurora.org>,
        linux-usb@vger.kernel.org
Subject: Re: ep0 request dequeue for function drivers
In-Reply-To: <655514e3-90c1-e628-d5e6-efb298f49038@codeaurora.org>
References: <655514e3-90c1-e628-d5e6-efb298f49038@codeaurora.org>
Date:   Mon, 26 Apr 2021 13:17:17 +0300
Message-ID: <87bla1l58y.fsf@kernel.org>
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

Pratham Pratap <prathampratap@codeaurora.org> writes:
> Hi,
>
> Let's say a function driver queues a request on ep0 and before the=20
> completion handler could run composition switch/physical disconnect=20
> happens. This request will be in pending list since gadget_giveback is=20
> not done but the composite driver will free the request from=20
> composite_dev_cleanup. Now, once the next connect happens, another ep0=20
> request is queued and while handling the completion of that request,=20
> gadget driver might end up accessing the old/stale request leading to=20
> list_poison since pending list is corrupted.

argh, I'm assuming you're using dwc3. It's always a good idea to Cc
maintainers for the drivers or subsystems in question. You can rely on
scripts/get_maintainer.pl to get an idea who you should Cc.

Anyway, assuming dwc3.

Have you tried to actually reproduce this? Did you collect tracepoints?
Did you read dwc3's documentation, specially in regards to reporting
bugs?

Try to consider what happens when the cable is yanked and you'll quickly
realize what you suggest can't happen. How does USB know that cable is
disconnected? What happens to dwc3 when the cable is disconnected? What
does the driver do about it?

If you really found a bug, please report it correctly, following the
Reporting Bugs section of dwc3 documentation, Cc the relevant people and
make sure to reproduce the problem with *mainline*; downstream kernel is
not acceptable ;-)

Also, please be clear about the setup you're using. The only thing I can
infer is that you're using dwc3 with one of the QC platforms and I can
only infer that due to your email domain. Please be clear, how to
reproduce? Which QC platform are you using? Which kernel version?

> To fix this, the function drivers might want to use setup_pending(mark=20
> it to true) flag so that when composite_dev_cleanup is run the requests=20
> are given back from usb_ep_dequeue; clear the setup pending flag in=20
> function driver when completion handler is run successfully. I can see=20
> this issue in almost all the function drivers.

Nah, we don't need that. Please answer the questions above about
handling for cable disconnect and you'll see this is unnecessary.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCGky0RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbRQw//XXK4wmTxJuEiWWf4u7A02PQP24k7Jy5p
sVjJkS8KelZZISH74rv8yhXfi1qgzo8U0FsLjkWpuiGfGqMvIdPYTZPvCIrkXmz1
q6qKa86zsFttpFE0Z9i+uRhWPTZMVn3oq6UNZsV4rvSdnGjrJ169xWyE5GW5uHTh
WhmdZVlWTxyEzRykE8RMLqXKObDFt9fJ7ftaaXhSmnuirS0WHlNg5LrTV0A9R0T4
Y86VZkNrKsWqT9eDI+Wmq7Xzgj76O/zE/Mcwl7DUPRSNMH1ATuxO3HOTyejadF3U
Xz94Ri0EiEJJJ6VZh3Q/fpWtPCgjRxJYKkZbc1xZj2I5ByhfhiQ+Cy1ken9A80Sx
stnxAYyfDie6LWKAE2jihlMIQVNxe2vAAy+1FL07yfKvigal+aT+s6zPepVCNBvF
fE5OXZ2qLx9wuzwNz/IoQgKXNORth0Tq/uRslwsEFjKKHhIzTuV+CTIwIo3DOJcr
KDQVMCCz78Se/8NUJocsW7gu8ty6bR1lUfh79hZiSPnauLyQknZx9W3QPB3hpwYu
yKrjOqmJXxJhRRH5Imds3VZ/zoxn8LUnbJ3jBWITQVSb6tU1MQErosk8u5qhehsL
6jjXxqUpIMju0Hkl1+SCGcfrueJIKtjytMQ0oCc2sfxGAj9a6dJgM01iAV6xFweL
zGV+ItQNJJ0=
=BAry
-----END PGP SIGNATURE-----
--=-=-=--
