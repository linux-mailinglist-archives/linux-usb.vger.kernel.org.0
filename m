Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92EB3112B23
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2019 13:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727472AbfLDMOy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Dec 2019 07:14:54 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37325 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727445AbfLDMOy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Dec 2019 07:14:54 -0500
Received: by mail-lj1-f195.google.com with SMTP id u17so7854774lja.4
        for <linux-usb@vger.kernel.org>; Wed, 04 Dec 2019 04:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=8UD3n+eNOTqgH9ZpohiKTsWGGGn7XXdOv7rmJPWYULM=;
        b=jRFWVvcTScWNVAzmFra1gYC8pD/TcCImr+A+dIQoU1MkcjUvlCKRIc+pKYMq7nUdXb
         Bnf6ME6gZIEBJRSfbR6yQ35+enhaCZ82GU6JU8r3YHHExA8b8ZpHrkcAP2E3QrRfiD0G
         wen3s/pZXwBAm4kfbTbRk2k9ubg1WNM85wM813wEnlNTHdRimYTu5PiZBuspxUr/2/xd
         NHugg0QkUUZjjSyMAZ16gt4Gan363d7+belQYpt2hDYCRzdcik2I25fZJzW/6eRiVZCo
         hZZum0ptHeVfozWrA0S1LfwqaGD7X8TTms9MwnelkQOj0GeSoIivT6oLShd3Vkmr9LQY
         R8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=8UD3n+eNOTqgH9ZpohiKTsWGGGn7XXdOv7rmJPWYULM=;
        b=eCtVpXbNpQqqWGcboU7eksoV7GQiTHR+zoJLfpfHIyvtSNFZKIKOXHRonIUy+XcoKk
         CY8dKtXJHXyJThKMeEoSeXgpS2OjOHXJhHbMaiGi7Ady0NleomWfeXSrms8nxERMy1vS
         KcDDb5aqUvTkR5pdQjaBBjOSwU7QM5Ec4ZDHzqs+gZuDj+cyI40dCVJyqBZM9daQ7QDI
         jlKgwmBAZfba9gAI49qXhYplL3Q+04j0GhSfZM4EnOZRZM3j0nbQ29RcornctHa0Naom
         pnzolmG/2GqjH6Nk+CgB70ZtZzGhe9MVkL0L9ZnMDWwO7l3dcYf4KrlR76oO8sD0GOCc
         9m6Q==
X-Gm-Message-State: APjAAAXn9FoMgnw6vXMvNPIW0JA8tpZEsmEwlx1/M7HweXCAW58KrpGy
        4BShhi+az/rpWGjI8E5fmWIrcqBT
X-Google-Smtp-Source: APXvYqwus28E9OLLwNKY3ecIcoxapgG9KzlZkJ4P03CXYyQBpRSCG3sJUjBA/9hYGCf3k2+Lu76SrQ==
X-Received: by 2002:a2e:b52a:: with SMTP id z10mr1777846ljm.178.1575461692341;
        Wed, 04 Dec 2019 04:14:52 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id m9sm3199784lfj.57.2019.12.04.04.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 04:14:51 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     EJ Hsu <ejh@nvidia.com>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: gadget: fix wrong endpoint desc
In-Reply-To: <MN2PR12MB4126C72DAA5292DA99477FAACF5D0@MN2PR12MB4126.namprd12.prod.outlook.com>
References: <20191203104648.29291-1-ejh@nvidia.com> <87y2vt8ua9.fsf@gmail.com> <MN2PR12MB4126C72DAA5292DA99477FAACF5D0@MN2PR12MB4126.namprd12.prod.outlook.com>
Date:   Wed, 04 Dec 2019 14:15:41 +0200
Message-ID: <875ziwffrm.fsf@gmail.com>
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

EJ Hsu <ejh@nvidia.com> writes:
> Felipe Balb writes:
>>EJ Hsu <ejh@nvidia.com> writes:
>>> Gadget driver should always use config_ep_by_speed() to initialize=20
>>> usb_ep struct according to usb device's operating speed. Otherwise,=20
>>> usb_ep struct may be wrong if usb devcie's operating speed is changed.
>>
>>your commit log doesn't match the patch body. What gives?
>
> The key point in this patch is that we want to make sure the desc pointer=
 in
> usb_ep struct will be set to NULL when gadget is disconnected. This will =
force
> it to call config_ep_by_speed() to correctly initialize usb_ep struct bas=
ed on=20
> the new operating speed when gadget is re-connected later.

this would be a commit log that matches the implementation ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3no28ACgkQzL64meEa
mQbvxg//ZtMewK42OldERG6roCzHGKmmyP3pAuSo0fmhKBV70ciyNtfybosbJWbj
rrYlecvxaR2sR0uA1BG3fRwWO97U4J5iB0hDzzp8Oc07M1RHnbiR15r9yhUCRLSG
7csp8bDocoFja3wHI+jwIIwRil2LxfPHVPQNNSabz1dqxtavxbE/NtZtkZVuzTxJ
+f82DQ2q1BbBg0rgH2Enhz+uB5QRL8QeTN506s3r7G8xsxmHrSIj1mRaTHXw7Z0B
IRf4NrapuEkfXAjpGyn6G0v+cWWZtbQQm8Rjgd0Y00mgU84pDGjVuYkDQg0yM40Z
E7BByxgIaZu/jJeM1v9f86mG9RPMjm0+rusFfnqu60rNiJBc5Ws0kwG94lV9QJ1l
rgM4H/543mxSkyzhsaey4G9VNSok7z4Vrd/eZlay21KrQ2UW+Fe8/1zjPS9GQXqP
xAOHgbrIRo+/uDbMnbJrDjKsNXn5C6An15Q4BVKt7CqnBtfrwAZwYvqbRQwuBuGY
pfZ4xm6cYiE1S37XKeyhHnlsC4sYg/e3E8OehdUT2+XMkJiLqvE/xJ+qyssietdp
n7Iiv1TPdKDK1U0qyvRDeslBs4t+W6jMuZEpT5rtgjPJ9HsFZ+yatA7TI5OByEy+
9IvAKcgCz+nwKBChD32D37GL4R8Z10wYNX2Z9XPlmWSzvu99wkk=
=JYnM
-----END PGP SIGNATURE-----
--=-=-=--
