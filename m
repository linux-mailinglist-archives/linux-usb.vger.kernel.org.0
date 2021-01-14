Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4ED2F5CBC
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 10:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbhANJBD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jan 2021 04:01:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:40768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727244AbhANJBD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Jan 2021 04:01:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE72C239D3;
        Thu, 14 Jan 2021 09:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610614822;
        bh=6rnZj3Krzfgg8bKsBEta50ZSopCDSVBFUyfWhhqFz4k=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=C4ZUWfXkasmuQS21mExZvDErQLRxjb543ePDx2/uwboteuN+tWeSFXXshSSY5Lx7V
         KQ6zIHRJ35K1wss66OBHl8CpuhkweZ1Op0szJfvSg9k5zPxi8KAzJ06rHg8/807Y1C
         slMaCf1OtyfyfMA97JSm0D6IfOckeQ1YUM+eE+PrLl2Sa3Bxnmb09kQFTEkSp3tL7a
         rZ0jZwvyqtoWkasv6+DxFi1T+sVFP2gKnnxkIpXRJ9DHRqfjJ2cAazoy85mHhQkils
         9XdqyAnQpK/N3UqCtIdx4CG1YXS+OZAjm8YxhcAAWB3lBn0RiPzBfq4DSlleve9yC+
         j7+9ffb3MSPMQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>, Greg KH <greg@kroah.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: gadget: dummy-hcd: Fix errors in port-reset handling
In-Reply-To: <20210113194510.GA1290698@rowland.harvard.edu>
References: <20210113194510.GA1290698@rowland.harvard.edu>
Date:   Thu, 14 Jan 2021 11:00:16 +0200
Message-ID: <87h7nj3nbz.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Alan Stern <stern@rowland.harvard.edu> writes:

> Commit c318840fb2a4 ("USB: Gadget: dummy-hcd: Fix shift-out-of-bounds
> bug") messed up the way dummy-hcd handles requests to turn on the
> RESET port feature (I didn't notice that the original switch case
> ended with a fallthrough).  The call to set_link_state() was
> inadvertently removed, as was the code to set the USB_PORT_STAT_RESET
> flag when the speed is USB2.
>
> In addition, the original code never checked whether the port was
> connected before handling the port-reset request.  There was a check
> for the port being powered, but it was removed by that commit!  In
> practice this doesn't matter much because the kernel doesn't try to
> reset disconnected ports, but it's still bad form.
>
> This patch fixes these problems by changing the fallthrough to break,
> adding back in the missing set_link_state() call, setting the
> port-reset status flag, adding a port-is-connected test, and removing
> a redundant assignment statement.
>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Fixes: c318840fb2a4 ("USB: Gadget: dummy-hcd: Fix shift-out-of-bounds bug=
")
> CC: <stable@vger.kernel.org>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmAACCARHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYTzw//TkPyo2EeeoEi5INXap1Va1HfDo4H+Nak
kzTI1ysVTT52Mn7FsrKSOVL0QPWBMKKcZgpGkW+fuYuLM12aCYLCE4UYDKVbLPww
saelzwMOK8DanszBxqrfyKq1dY1n0XG8vC9adgT0kqEihL1jZ68Jte6tkeq73KK+
wifdZ+WECPL6Q9a7wF0cmdYLn0OLJT5BiUTW4VllLIm+gOCzN/kOme4uqyqubNnP
l9rmpULk6yyyvw6IyNC++c8SNRr2BhHtQM4tu/FjZEeibev4EExEaFbkNvQRTsbk
XQ5h6JyNqD2oEs4r/IpgcCv7hCof7VSGGSsA5C0rGgcOZgP0nsmAvpXnFjhY3tpi
+YF30PDNOrBXWzKD1QHijZ5ehDhOeKa+O2pIUR50lmfg6CbSt/s8pBTlc8h+e2aD
93kpCeE0t0BkELUZdFj+gwxLpiii4FhA6Sx7fAxduKXtcaB96x4grU3W75EGJouP
cn1aTZyFPrrdde5U1jYd/9pIu3pWWWwyzPzszjGqb3SXjy8oHqv8UdNM12LREi/N
wnS8l0KXkcj9FJjahX5t6uLE0W7e31yxlXSY4nlE0pR7V19nKngc/g/VP3Qvek+z
M873LJHCHoAR6duYiuJlZFeLyOH7cihTpYKkmBJ1fry6p4+ILD3FBccdCT74Y8JE
VdFx6FrbaPY=
=Mjw9
-----END PGP SIGNATURE-----
--=-=-=--
