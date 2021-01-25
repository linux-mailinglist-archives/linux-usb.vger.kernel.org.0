Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618DF3026FE
	for <lists+linux-usb@lfdr.de>; Mon, 25 Jan 2021 16:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729678AbhAYPhV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Jan 2021 10:37:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729973AbhAYPfk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jan 2021 10:35:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9CEC061574
        for <linux-usb@vger.kernel.org>; Mon, 25 Jan 2021 07:02:43 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1l43Nz-0006BO-TQ; Mon, 25 Jan 2021 16:02:35 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1l43Nu-0007EN-Tu; Mon, 25 Jan 2021 16:02:30 +0100
Date:   Mon, 25 Jan 2021 16:02:30 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Paul Wise <pabs3@bonedaddy.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Opasiak <k.opasiak@samsung.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        linux-usb@vger.kernel.org
Subject: Re: proposal: move Linux userspace USB gadget projects to linux-usb
 GitHub organisation?
Message-ID: <20210125150230.GA19259@pengutronix.de>
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
 <YAhKAiz2U9KQWQPE@kroah.com>
 <42c4ad2fa7709312b7ac7bc682f05ed1a3edc9a7.camel@bonedaddy.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <42c4ad2fa7709312b7ac7bc682f05ed1a3edc9a7.camel@bonedaddy.net>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:01:33 up 54 days,  3:28, 96 users,  load average: 1.05, 0.45,
 0.29
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, Jan 20, 2021 at 11:39:22PM +0800, Paul Wise wrote:
>On Wed, 2021-01-20 at 16:19 +0100, Greg Kroah-Hartman wrote:
>
>> If you can get the "owners" of these repos to agree, than sure.
>
>Excellent, please invite these GitHub users to the linux-usb admin
>list, so that they can move the projects if they want to.
>
>Matt Porter: @ohporter (for libusbg)
>Krzysztof Opasiak: @kopasiak (for libusbgx, gt)
>Karol Lewandowski: @lmctl (for gadgetd)
>Andrzej Pietrasiewicz: @andrzejtp (for cmtp-responder)
>
>If you would like to invite me too, I'm @pabs3 on GitHub.
>
>I expect some other folks on linux-usb might like to join too.

After the ptp-gadget on git.denx.de is no longer available there,
I moved the latest stack of the project to my own github account.

https://github.com/mgrzeschik/ptp-gadget

This could be added as well.

Thanks,
Michael

>> But we should work out the libusbg and libusbx issue, which is really
>> the "latest" one?
>
>libusbgx is a fork of libusbg and is more recently updated.
>
>I'd suggest to also move libusbg and archive it (make it read-only).
>
>> If you are moving the repos, why do you care about the issue and pull
>> request database anymore?  Will they just not end up going away?
>
>When moving projects (as opposed to forking them), GitHub moves
>everything along with the git repo, including issues and pull requests.
>
>--=20
>bye,
>pabs
>
>https://bonedaddy.net/pabs3/



--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmAO3YEACgkQC+njFXoe
LGRlbw/9HcrrsdADLHJuEHwmUzVyxr3i6p5Rx5ARvMa2F6W8MykrJOlRjdeIcxgY
K5ly2JBnNNLped4wlWYN33N/WXtfIiMzY1QuqC73U1xkJ65RGufV0OVAmLSudUWr
b5AByzikM62AYDSqpS2n/ieWPoMWhPg25w1OuSnIJbG2LCaKWYM5sMnPu+MKa9uN
ukOU6Qv+X693xIGjNpQHJZyY18Vv0Dgw//9q0b2IO0PBespflAU27vNAG07AWGSN
bCATUZlyYAs0eVsx9zy2GuIrkCE5tLVuZX9yRHBo3RqPd5hp7h9NlYFb7uyDslF0
2IYjqegoVcUSwpCPkdK305uXJohzMU2Ly1FsspCfViC0cYQpdFNUGhGYHWZN3MZb
dAZLOIONecEE93FLKOUIoQqRKiQ7HCvR9UX9YVwpLF+HNLNCQ456yQvBYkFRhc2L
E2gNBTvbR62zjoPFWLmB2WsaGeSxoe6MBs6BMVZtXiUl3c5kYO35TvNIFqpn7LVj
F2YVDZuzQWO/r6sOcDG6SXhz7eEGqMkTkOtIqrLTdg7xQcDmuam8FV7I2omXkWrI
PwMMCNS0LpWvl2P6av92r4ip+HDFudsY/P0ZemJbcExoGgBEd9456TDjiiKGgM10
Wf7CDPO4D4TW7NCSzcWwHtLaaLidGg3K5iFOk7w2FIjf7qH5umU=
=BDvq
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
