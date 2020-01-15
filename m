Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCDDC13BD76
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 11:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729662AbgAOKco (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 05:32:44 -0500
Received: from mail-lj1-f175.google.com ([209.85.208.175]:46453 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729639AbgAOKco (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 05:32:44 -0500
Received: by mail-lj1-f175.google.com with SMTP id m26so17910518ljc.13
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 02:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Z3jPXwFyQpxRa7g5yAjfUy5l0G7CtcuCcWiw/eYE1NI=;
        b=pp8QP7Mh3Nx13OTdG7pcSo/nSPwvMwQG8X5y3qvxM9zvzWS/c8Vm0DlP/3L8+hKVyY
         zdB2CRAElzXeS3GyZ0WsOTEyYgpue+2Z/RB70FjpCdj0yuoJZsAfJTc4j+0G/m8bP7Qj
         SlcwymDtgu1LHFjY0lKUxuepfBVYDfW0JWetaRuU4Tb1rNEeBF4BIU2+olkSz4202+Yb
         g/feXPHpFhU2D6q7rh0XMwsTHkY+EA3I8yzwRZgzuEsogCdBwPgtesI+5j9lm6/p1Rng
         JDt3KmXWcZi/fcCxS6AJL3F7OlbImDyVkwbZUVOLaGe0KQPdWdwHnwLvGY+iSv2ggbDa
         5qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=Z3jPXwFyQpxRa7g5yAjfUy5l0G7CtcuCcWiw/eYE1NI=;
        b=l/9egE09ddwAoT/qtN67m9KhufR/RERlhGHKaT6TrOXF9ZErguPzTkAnENLSiunbpz
         kYhcBH1SKyWC9RCT9x4CZSOSp3LcXkITFMcEUZQxk9a49J1MV12ywTxETARPmpONJuSf
         hr5qjcMJLbeG7UKMNJo4cfP8LYuJF/uHZreiwRR4ltVayxCQPfeB0jGp9zKS6sxVSOp7
         i1o6jVsoTAVRHGZu/UvupHjv/BxcXSXNFwmyT4+qSHMvIEXiuk8fjpa3zxA1NwlFEscT
         ooAihdt4/RTS7nBgU7Anq4duDhsx48cMey0OxvWQrXzXV86cKbl+kAjhp693Kc6Xcakc
         VRlA==
X-Gm-Message-State: APjAAAVNlo/bX9lGB9dsSSVIcMxSe6/TY0OhTdRH6jJnb8TTdNHP8N43
        NqaWLNKXncoLFBQDih38njoKLZi9dsDkHg==
X-Google-Smtp-Source: APXvYqxQ13QvUtNaMGGIyMlwG7CBr2gLlf10tE2/LiwTdtR7YQ9tHNV2A6HzXvfhgFQq110Iny5XsA==
X-Received: by 2002:a2e:7a07:: with SMTP id v7mr1384609ljc.271.1579084361357;
        Wed, 15 Jan 2020 02:32:41 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id l7sm8542643lfc.80.2020.01.15.02.32.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 02:32:40 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB: changes for v5.6 merge window
In-Reply-To: <20200115093746.GA3177342@kroah.com>
References: <878sm96pzf.fsf@kernel.org> <20200115092813.GA3153837@kroah.com> <20200115093746.GA3177342@kroah.com>
Date:   Wed, 15 Jan 2020 12:33:41 +0200
Message-ID: <8736ch6mbe.fsf@kernel.org>
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

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> On Wed, Jan 15, 2020 at 10:28:13AM +0100, Greg Kroah-Hartman wrote:
>> On Wed, Jan 15, 2020 at 11:14:28AM +0200, Felipe Balbi wrote:
>> >=20
>> > Hi Greg,
>> >=20
>> > here's my pull request for v5.6 merge window. If you want anything to =
be
>> > changed, let me know.
>>=20
>> Did you send this twice?  Any difference?
>>=20
>
> I did a pull, and get this problem when checking the patches:
>
> Commit: 6a6ae4e8e926 ("usb: gadget: f_ncm: Use atomic_t to track in-fligh=
t request")
> 	Fixes tag: Fixes: 40d133d7f5426 ("usb: gadget: f_ncm: convert to new fun=
ction interface
> 	Has these problem(s):
> 	        - Subject has leading but no trailing parentheses
> 	        - Subject has leading but no trailing quotes

Oh, I missed those.

> I'll go fix it up, but that will break your tree if you try to merge as

Thanks for fixing. I'll reset my tree to yours.

> I will have to rebase :(

no worries.

Out of curiosity, what are you using to flag those? Is checkpatch doing
that now?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4e6oUACgkQzL64meEa
mQZSDRAAtSTfMHf7IdcMAbYMKbBhggoQJYz3EXs6TNUP4m4ZzDvdsV//sG2uWfqH
FUe6JPNflP1aBV5jsCrVz1XGD21jdok/kcXq26n7PW1qMEPGII58JCJL/ccozd5i
Cc9hjp1ZQl34vmuggGtfdCbifguAcC/21x0CCmYji+3X4hlAmVdHTXuf33dwKQaT
tBNKO5zeV0A6FnfBYb48phrBK3e3mtbOOZK+dfMa4IhJgM94UULGso/ZPuKQmd7h
JNnawdSCdE2hO+CBPBjyrEhpa6GhVXo7WIJXwUxXMZXGlHwuWCFs+z+2oBBKJ2jM
jNYEMQWYlB9CoudSu4KnTPHzL6ss7FfCfWYpZ7LApkbUjkuXU+6HfoyGL7jZSjdY
rqtCnrXI2+ZK19JTtdcbX4HDWQq4SLgKB7XYAC/r9WVglWvHF9dNCYswk3UAOHlq
y65giMa8eW6d7fkN5c3W1eMla3/yFmRp4zP7qDY01sJDyQhpxwOfHfDkiDlvlYRR
ZcXY9i5c0FDdNpMzbC8ECkERmpL9Irsvv6m1lOOPG2EFl6VSrduavA0pTv3fKOTU
amrhZ/92Tsr22htwY9C6xTtRRff8apIM7bMOEzd5z7Uz0f/emwuzQzm9g8Yl/Jeo
PbmbuP4dlSIWzmuH+O400FPkoy0Gdlta51db5jLfzxWYgOPmLZo=
=zHwH
-----END PGP SIGNATURE-----
--=-=-=--
