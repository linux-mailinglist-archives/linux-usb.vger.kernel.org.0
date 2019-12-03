Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2F510FDA9
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 13:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfLCMav (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 07:30:51 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37488 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfLCMav (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Dec 2019 07:30:51 -0500
Received: by mail-lj1-f194.google.com with SMTP id u17so3609999lja.4
        for <linux-usb@vger.kernel.org>; Tue, 03 Dec 2019 04:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=718VI2Jsn3k39lfBrysBdgnfNRqlbd/nZW220XH2KRs=;
        b=BRKOnckwz4+aAV3aUQZJSme605wI4qaPZCf6aoN1iCztsr+rP3adV1XlIYOl45klMT
         u6uk9pB8cudxdrbogzvQ+nTdlU0b3a7fuZzxXYWqe/5zi6IrLOpxSGbflI+ipuuzhrvZ
         aYikkOQyQzypz2UlS6ZnJ0NR43ONyiL28tHXRsLHARNpK6ocy3Fv/URabVvh5idwR5lQ
         oovM9xdu42VW803nT8ODtY2DSeLce1bl4i1NFoJ7QAWPGhXKLhFPIuutxy+zA5WHBQn8
         GBMjlalWBGaqXmalVY9WrfvrlwidYmDLqGFUqfqIN5sUlMvX75FYbL70owtwcr6KBOZu
         rtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=718VI2Jsn3k39lfBrysBdgnfNRqlbd/nZW220XH2KRs=;
        b=sSZDLui0mvOPJsGrIGaShPafAAnJHqAXOyX/MNwyno4dpw/77vcV2kTvjqLXgvBV2K
         nqRB1Kyx8u2RF6DB1wAZFZPGWhnHz1gRt8v5LFF1ysUwYecxuQBZ/BXNniwD0zNB0b62
         WA5OARkxeibF0/TA/H+SCCNc/PMJCSPXjgWnjo44DWWuquNuS2oSZGZQCqDYCnpe55ER
         t4eLy4EZCdR9VAARkxJQRqZkizB5UxSGoptpMk59VqGkeDWYvU19iWSzdhcdXaWADTTo
         slVRkUfkAhYka2SrEU+A7nKwsJ/fO+/lyQHI+0Ylb9kJXUCVXMm8kHa+QqFp+1Cz6IjW
         nxFA==
X-Gm-Message-State: APjAAAW6UR4PLJz4SZUfGMhbWC3ZPo3RZ4WcgYGDoK3FjYRXvJ6GmMry
        +TMzWNMofxXtnk05KQ06Ml4=
X-Google-Smtp-Source: APXvYqyOKdY6B9MWweVcNGeLdJWxrzQcxr3hhWPDQphAY8jGjGVkPPePgDrdwbIng/9YYykxTKKIEQ==
X-Received: by 2002:a2e:8e97:: with SMTP id z23mr2361926ljk.125.1575376249281;
        Tue, 03 Dec 2019 04:30:49 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id h7sm1271823lfj.29.2019.12.03.04.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 04:30:48 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     EJ Hsu <ejh@nvidia.com>, linux-usb@vger.kernel.org
Cc:     EJ Hsu <ejh@nvidia.com>
Subject: Re: [PATCH] usb: gadget: fix wrong endpoint desc
In-Reply-To: <20191203104648.29291-1-ejh@nvidia.com>
References: <20191203104648.29291-1-ejh@nvidia.com>
Date:   Tue, 03 Dec 2019 14:31:42 +0200
Message-ID: <87y2vt8ua9.fsf@gmail.com>
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
> Gadget driver should always use config_ep_by_speed() to initialize
> usb_ep struct according to usb device's operating speed. Otherwise,
> usb_ep struct may be wrong if usb devcie's operating speed is changed.

your commit log doesn't match the patch body. What gives?

> Signed-off-by: EJ Hsu <ejh@nvidia.com>
> ---
>  drivers/usb/gadget/function/f_ecm.c   | 4 ++++
>  drivers/usb/gadget/function/f_rndis.c | 1 +
>  2 files changed, 5 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/fun=
ction/f_ecm.c
> index 6ce044008cf6..494fe4e38a65 100644
> --- a/drivers/usb/gadget/function/f_ecm.c
> +++ b/drivers/usb/gadget/function/f_ecm.c
> @@ -623,6 +623,10 @@ static void ecm_disable(struct usb_function *f)
>=20=20
>  	if (ecm->port.in_ep->enabled)
>  		gether_disconnect(&ecm->port);
> +	else {

coding style. If one branch has {}, both branches should have {} ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3mVa4ACgkQzL64meEa
mQZYixAAninj3TlMfxRL6o6BXEVHLNFaJ5oBv8hj19mfVn2spcpJAkLveeV5vNuk
e6CI2/iy9DoEnZA2lM9FZz0dew36Blzz4aVz8iKTnlHdG7W6pNCYi9FsX07ufjBL
1pMJbH0n0NJQvoyDmtRVN7PP3FENyZS9ZcF9KqbULdYV0Cmg4A05Q4PWnO06k1Tz
ASviEUBZ9NYxlhB65xqzuWANKPniRn6RCJdnTLu4YkN6HQAwEzOJSbYi02/JKCfy
DMoQ2S0FUrYnJ73WjPHulTtH0JIwsGO9Ff7+e/LTZqxF+7kz8y/o4Jm0uD6cudxP
dL6lSoYO3GHC4LuEJi9olQcdgGQ0wTMYrvOQJurVsQ4HgTSZ7UUnh0HLinXafJ5n
NloR0rz1C7OOuPiysJl4hMy+Fb6p4ams8IgZem7vjDouyzCaKBZtH0LZ7KuvUQyZ
Jowz7owxp+vPJ1U2S6WXfJh3RnkWJWUVQiKTHUJIO8bojD5R0KblhD/taYGHJBmK
W4cD/u9cChbkciUqHeKihZDb81APCQlLPNuStvP1ZVCSO71HVz0q1aWf6QbXGwlW
2MlmieC0XXsi6hF/sTi4BAogbo7viOYgbHXdsyeBrHmq/fx5sqzi8/FIroO39/FM
usvDvG2apKYMNPjeYe0aSBsdgKbuPypFs0KjFLODrQyPleqdz7w=
=cKdS
-----END PGP SIGNATURE-----
--=-=-=--
