Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6EDD14ECF2
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 14:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728566AbgAaNJV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 08:09:21 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39049 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbgAaNJV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 08:09:21 -0500
Received: by mail-lj1-f194.google.com with SMTP id o15so1488956ljg.6
        for <linux-usb@vger.kernel.org>; Fri, 31 Jan 2020 05:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=JMGZVMTqAz1kiR409mz3Cv6daFAIOrYUTZ4PomAMPBQ=;
        b=OuEGx2wW1QJ48MKh4z5Ul7vruWAxuhSHL2hqfR4sXKIDx0KngSUif94FNFYPtaUnH0
         DA6o6dYbbdmvW4ZuTXiC2afw16lkFI22b0vumxpHwGOXZuz3Hfzqu8JsHczSaTF1k4Y2
         oxQa6Kobo/8P8hp+DW6ybZ5z/kyeL78zt0p0hVpFxi+Gi8Wz0Pw26csRI0Bbs6ZqYydu
         uBEiv+6b+FCXd0V3I5wh5ThciTswxrwMwUKa1DT0bwaUm9n5lng6bSO0L1x/cA9umtWc
         ZDown7eFCY4/ADWa8zzbYCgGRrLnYYuAB80UpJzsXEgTCjogMWwIpzXz5sSn1tXqZZgD
         +e3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=JMGZVMTqAz1kiR409mz3Cv6daFAIOrYUTZ4PomAMPBQ=;
        b=GHVyu7u6EHlUxk+L2TxR3sEs1mpEp6nhkiYsTuQj2alOjtkn7zf87C7RJrpAXZfN/T
         Q+tWchvlgYK62+fObwcZrHNkJJx9uUYEDmFWGvvQCpIAu1HMEL5h39iQjngzeWRn+RSj
         jR9Haep+9UUvfnUSFobziNSOjKqRUU5vaX1zRumvUxvSolMTe1BeWpAnYUFYebdtK50l
         6oF7mGVCp3tWOOlPap2CFKc2NNr+QZaB9a203EapvicaXUbxRpLtCO5rZKiKXPQrDkCT
         83s+gM0tmC+NI4NCO0sTBwGzK6zpWaRwzU6GrIe3HtQBJ9GT287bNCH6VZXeI8s0xzf5
         mA3w==
X-Gm-Message-State: APjAAAUFMTO9qruTtYtMoQwd7TE+bHrDqZbStfGKtGY4LNdfDhw5yVuG
        2pes5r08tFy2S/LpsfWPO9OSwl1Q48hakg==
X-Google-Smtp-Source: APXvYqx1cCaddI7HAxy/eB8wF0JUkboLGYWGj0X+i2WaYtBREy7JLOfsqKrEhn3pIMKxPahN6UJULA==
X-Received: by 2002:a2e:965a:: with SMTP id z26mr6210976ljh.104.1580476158786;
        Fri, 31 Jan 2020 05:09:18 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id h24sm4717328ljl.80.2020.01.31.05.09.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2020 05:09:17 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: u_audio: Fix high-speed max packet size
In-Reply-To: <2dfd0136-ebfd-102c-e944-0a04b405968e@ivitera.com>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com> <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com> <cfcef91b-799e-7d02-4a4c-26ee95e85ff7@ivitera.com> <20200114200450.064cd521.john@metanate.com> <24f0935d-16a7-4301-78f4-fa459e356ca9@ivitera.com> <20200117104022.5bb769f2.john@metanate.com> <495ccd06-9059-2249-ce70-aa9647609319@ivitera.com> <9607a759-c08c-97bd-a0a7-f506ca64435f@ivitera.com> <4588dcf7-7e2a-8bdd-48e5-e835f3503f5a@ivitera.com> <20200131112733.758ab77c.john@metanate.com> <2dfd0136-ebfd-102c-e944-0a04b405968e@ivitera.com>
Date:   Fri, 31 Jan 2020 15:09:05 +0200
Message-ID: <877e1793im.fsf@kernel.org>
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

Pavel Hofman <pavel.hofman@ivitera.com> writes:

> Hi John,
>
>>> I apologize for a basic question - please which official repository to
>>> check status of a gadget patch after being accepted? Thanks a lot for
>>> the information.
>>=20
>> If you have a kernel tree, you can ask the MAINTAINERS file:
>>=20
>> 	./scripts/get_maintainer.pl --scm -f drivers/usb/gadget/function/u_audi=
o.c
>>=20
>> I'd expect this to appear in Felipe's tree first at:
>>=20
>> 	https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git
>>=20
>> but I don't see it yet.  I guess it won't be picked up until after the
>> merge window.
>>=20
>
> Thanks a lot for you info. How does the maintainer pick a patch from the=
=20
> flood of messages? Some extra headers (Tested:by, Acked-by:) are sent=20
> separately by different people, does the maintainer have to keep track=20
> of all of that manually?

I had acked it, so I was under the expectation that Greg would pick it
up. Unfortunately, it seems like it has slipped through the cracks. I
have now queued it in my testing/fixes branch. It'll be sent forward
after -rc1 is tagged.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl40JvEACgkQzL64meEa
mQZCdw/+N7ypduvJ8zMKyxnZodiLT8lcZnjCr1JGQsGklnQNXnf3aAJhyES9OvYL
icVpu0u5ldwFneMuOsGq+HMEST1odbFleeWs1V9t3sBgtNvzxwc6DuL40MWgif4c
/RgKH8cCg2NO5880cJEj5N4rZwhMukmtzumawDaRwRuZ9qFeGXBfPA95JJytItYf
+KVxYhSXhNYim+seCqQmn+OyTHnTJLNc/T+JCOgREC+GNwQ/B4rlqkPvJJUpHfqz
hMyNUr2Np8npUPJyISQsPz/AZpsqUhCFtT/7jN8UTI2zQWjOWVocwM7QkEjdXHtm
ADDJHTRNud8ysC3TbySmNIOHhkQNOxNafRJqaZq92XXkqzv/dm4P2EdsYKPr7nKP
XkoLprSiyxbmzl3EoBeVt6Nyq6H6JuNXPAl1citW4CAjGApuRLq1EClBF/JY4cFN
cNFaXN1QBF7Ko0sJDVlXFGcOjzZqyY99aaxpkBacUPPJg2Eh6EtYzk2q/4dyl1CR
uR8l9zY+/A9WRBEWhED4F1ixiig6k/mcKli/n99xJXPYmnkdTQ8EPBabQuT3oLD1
PASCXePJ3vRqeiKcp/Kymw1gH66r7ZtIT35vI8FUxajHGu1WyuL7IU47lnfymYWj
1bF6KrCl8jx38lpLeGCzBJdHnFRwOd/iazDTdTRWKVk/QNtlP3U=
=lakk
-----END PGP SIGNATURE-----
--=-=-=--
