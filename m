Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1309146260
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2020 08:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgAWHPr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jan 2020 02:15:47 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34809 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgAWHPr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jan 2020 02:15:47 -0500
Received: by mail-lj1-f195.google.com with SMTP id z22so2070245ljg.1;
        Wed, 22 Jan 2020 23:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=lT6qJL1c2voTb9U/jayZRO46LyAyIO2sqT3pNlCo0EI=;
        b=HAulJcaYG8a4V8rqbBcuprkbo9Zq7N7mLGC4UHBy4NbBFUiXylGOcEqmE6NFyPbRgY
         mhFpA8DrO4Kj8uqV7/vA5wsvrq18x91c9VFpnv6lKgNcAhni0/hfG+dqduC/AlBcGHGU
         lI6XEUEdbE1P8nKUS3IICScMg/HRWSxEPcdC/ZN+ZKm8YyRbBMjoFx8w04c2hzjd0tIH
         waJU1zGMJZHYBdVB1iTMuXA+u9J6lzoa77ZmvuZ5NynM2q1xH+yGkA/6n+jMTlD1q/jo
         rV3bPKwErfFs1oUIQX2Rx6mYpuBkGoEwZkBOld3baEWpLxkcE8JL0sNh3wOvltG3i8ij
         xdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=lT6qJL1c2voTb9U/jayZRO46LyAyIO2sqT3pNlCo0EI=;
        b=Lvhs0oNUen2yz5pCahrFcLSrMelpORSWL9P2luR+F7cjjj0ZcsYxZ1ISwtffhdosmU
         BAWfS3B1FoIk1B/1kvXFhaM4NyaJMm8LNo8QZXfJsKsYkC+GISm4clUNtcZQaa7TyRk3
         JM9BZCkdEBJsvUwtgNBsEIzTQiySuOiWShx6v/XkQemcNhVVT1qMWxtjUWVsgGbKI7tC
         iJ5azcn3DqXSfSwafrJQZkymuhlwAoSVflioX8zV+9HtK4M1yytuh2DY24E/E3pfNIYO
         +FGX+ZDDdiU5XaBqSSpF2O825NvAvW1BDZk3qCgpyxPDOWp+0C0FhlTRNAoJytHLjRpS
         TN4A==
X-Gm-Message-State: APjAAAX0+Y2TZbpAIQqOA1Kman15jfwppPumjSf1oDUR1n0wi2pN0jm6
        DTTg/8ydEHIQfUyZSsqs6jgAgkw9l9c=
X-Google-Smtp-Source: APXvYqxwcawQpKqQo0rX5X7w+UvTgRv70R9j+UnWCdUX9AxMDPZmbvI420d4f1mfyrURfzPac3hzOQ==
X-Received: by 2002:a2e:9d89:: with SMTP id c9mr21873107ljj.129.1579763744116;
        Wed, 22 Jan 2020 23:15:44 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id r6sm592066ljk.37.2020.01.22.23.15.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jan 2020 23:15:43 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Colin King <colin.king@canonical.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: fix spelling mistake and rework grammar in text
In-Reply-To: <20200122234437.2829803-1-colin.king@canonical.com>
References: <20200122234437.2829803-1-colin.king@canonical.com>
Date:   Thu, 23 Jan 2020 09:16:33 +0200
Message-ID: <87zhee4p7y.fsf@kernel.org>
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

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> The text contains a spelling mistake, "to" should be "too"
> so fix this and re-work the grammar to make it more readable.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Greg,

if you want to squeeze this in:

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4pSFEACgkQzL64meEa
mQZtnxAAkIO+iANSyFn4Xmze+yspYSGIakS289zIh6h2dJ91QmPtgF9WtxBqRpa0
IIdVHW3HrGgd88Dorz4JNyguQtMYR9Ok7XeilaaelQ/9qjnBj9dZfzc5XWK3653O
ATl+6IBrnlMGOjlLnMI31tzeF6p7++RRv2FEpUTf2g4nhK5CKvfRw0qEAybX3Wmx
yvePHijcySPxhJf06fAmUSfPueeqxYmyy01nuWhSFFe0hQuTXsnb7u91m+nqVXmr
5oNhcRztHkfMJBI1v0rCruZXm0d7nls3rRAtn9tFSl4PVdscgXNx+xvMrtL+KEyr
a1DdnuC4sljeYmuT8WMD+TMjAmY1vy8ecpXdGCtDzpsVn45b9ZamZbPD4k+xC/b9
ncMmwlBQq3//rQadGY1DB7zDrWwXr36exkE3IjO5QTHhHlHVztk/kaUZU5fQjPjt
lBnLfm+NHlGrKvBnt2BrvZXFvyrODHwkaO117Cp75dmqeneJK4aOvqY3jUBKvQex
Yohs2QvBlEsaGCLob+SnzJ3YgxGiCxouapfLzq++8lyWLGzGCq50azsPt5dzQlPA
xD01s1v8qyi4e8dSXNBy2Dbn3QZzuFCf27B1LXgxSGu4w2s41/E/9pbSFzTYpySO
h0jkRYJqlUN5ToJZDJWVaYABkJmH4q4Z7XDj2g4h92fsKPXrv24=
=s4W3
-----END PGP SIGNATURE-----
--=-=-=--
