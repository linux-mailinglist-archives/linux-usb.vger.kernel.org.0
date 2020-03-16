Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 530F11865FB
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 08:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729877AbgCPH5c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 03:57:32 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42675 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728302AbgCPH5c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 03:57:32 -0400
Received: by mail-lj1-f196.google.com with SMTP id q19so17429662ljp.9
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2020 00:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=qSRQe18xWkX5W1+ghpr3aqPUXshIYNAAg5KciqDBCxI=;
        b=KKADDRTealOJA5ZJuZC47rdt/KnsD+kyNW7MTyT/A9ArmeQC1CR/p/Q69NHaH6TT2O
         LnxXdDA48V1wyUZz5L/zToQcHe78lCSYjUDL1oVISYUgP+3ZgaRb3WjUFJiH0R+VbrPO
         OrIvuZQ6qMhTJoJGSvFStC254K9Z2gUJte9Q//iwNSeYtTXN7OYs8iXKSNE44cCztqQC
         nJ3ljhsmRjhnBY/piFj6/wCwMjRp1H4xoVeligHgsdGzya2sMXdNQpycYfUmzKTujZTn
         YehQUpYQHYPGcLRU4vJcXnSZiV3ThQszwvny/EhO26GRRIoYdUIkfKjIhuyVlLtnmNsW
         EWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=qSRQe18xWkX5W1+ghpr3aqPUXshIYNAAg5KciqDBCxI=;
        b=RnWEjXZnlMK+cmjYGDBDikW7ZG/sJuvWjWkpiJ+Kv2JwHJ0kuwM7T9di9+Jugnnq2d
         EXUREiAfZpuYgp02Jv0QRyKJbK6ACCrm57YptT0aCYD9vg9PQVbgRoWM2aNSu/55ilDP
         P6gTOUZlqNiACXCfaej1H9VInyeaHJ5QSN68ihbzZ0Bqf+M9hOE2MO9PaFmCSo8PNGI+
         9Iv4TmZx/ELh25Gz2Fbuhz+0iXfvDkO/pl9c4WBvUdkqZ/9DfkJ4b9tpaItGtxVWU1dQ
         7vwKtc0NMlBLiPLdqU0dJqf4VjsI3Jtkd40URzUaI6B9h6TNF/tzi0S7cGOmi2J7CWwO
         I1KQ==
X-Gm-Message-State: ANhLgQ1sa75JDwvJKMTl76OaEvwb/ZPCadVKosdXXiBGvWqKdsDjZMnJ
        eSkh/5u6ibqk4kgh52JBeolLsmkm1Zc=
X-Google-Smtp-Source: ADFU+vvkObSwP+2ZRM75W5Gv9CBwo3NiplziHFfEnwqzsUonY9sE/XPkwrmhiTgLlQRFnavX1LsZwA==
X-Received: by 2002:a2e:81cc:: with SMTP id s12mr14332016ljg.35.1584345449759;
        Mon, 16 Mar 2020 00:57:29 -0700 (PDT)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id e27sm3360676ljp.64.2020.03.16.00.57.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 00:57:28 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB for v5.7 merge window
In-Reply-To: <20200316072604.GC3019942@kroah.com>
References: <87wo7lenor.fsf@kernel.org> <20200316072604.GC3019942@kroah.com>
Date:   Mon, 16 Mar 2020 09:57:24 +0200
Message-ID: <87zhcgzq8r.fsf@kernel.org>
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

> On Sun, Mar 15, 2020 at 03:45:56PM +0200, Felipe Balbi wrote:
>>=20
>> Hi,
>>=20
>> Man... I did it! I managed to get through all 500+ patches in time. I
>> can't believe it.
>>=20
>> For everyone involved, I'm sorry for the delay, but I've been super busy
>> at work. I genuinely apologize for this and will try to better plan my
>> week to guarantee at least 3 hours a week to look at the mailing list.
>>=20
>> Greg,
>>=20
>> If you want anything to be changed, let me know.
>>=20
>> Cheers
>>=20
>> The following changes since commit 2c523b344dfa65a3738e7039832044aa133c7=
5fb:
>>=20
>>   Linux 5.6-rc5 (2020-03-08 17:44:44 -0700)
>>=20
>> are available in the Git repository at:
>>=20
>>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git usb-for-v5=
.7
>
> Hm, I hit the issue that Stephen also hit with the merge and build
> breakage.
>
> Then I hit this problem too:
>
> Commit: 238d76021654 ("usb: dwc3: meson-g12a: Don't use ret uninitialized=
 in dwc3_meson_g12a_otg_init")
> 	Fixes tag: Fixes: 729149c53f04 ("usb: dwc3: Add Amlogic A1 DWC3 glue")
> 	Has these problem(s):
> 	        - Target SHA1 does not exist
>
> I'll "override" the failure in my scripts, as I don't want you to have
> to rebase your tree, but something is odd there...

Odd, that object is reachable from my tree:

$ git describe 729149c53f04
v5.5-5403-g729149c53f04

Perhaps one of those occasions where you took patches instead of a pull
request from me? Sorry, I didn't notice this before.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5vMWQACgkQzL64meEa
mQaYIw//eCnWkBW7b7PPz2wu9/xNnjOthP5fhtNTjKujEsIdVJawWpydOXnyiJna
XSFMG4oKo7sn+qF1l887gfGHRNszNY5dG8oJSPeDV0fzKGcgXBvkBQeVe1oeEDvb
ZN7vVcMFS6XFXi3fvMKbEinDjS7TUc+Zpi9riqYpH93ozboIGY1zfa7xlGpzWLXk
fheHMbh2tqAyLR+pQzOWzc1s7CwSAfSiHpbzVLYGffIOAZLqneKpF8ZrcYtGBYq7
dzNOZxF6JPLYPpWbOyUdeq8wsKZ/4KFdzqqZocC5A0OtpI3qIn4cgVdPuhJw9hAb
5jbm88KxxBRYqj+961tATM7/fiIf2C/p7b41lAirRxcy3VJjRTLUQasdyVatP80z
P5YiLMm68ZvRApL3whUgehzvWqRDwRSm6DuQHALeW4nbI591wZSLS2q0S2SA7+As
ysiFjPnA1evueULSwV+cw7KFV0T38ihhwpyBgcubKXsGBXV1RZqma3RzyZwltob1
6OTfrDKhdw5AYYm+vow8cygz3uE6YCzj/2wx+eXrvB1/nMYPtm9DkcZpnD+4lMZ3
K32DsL2RYAX4q2ePJZSzZl3LgaBUhqcc1Q0CGUCuo6RV2Cy8I6JaqpPhTQeVFRkl
xKiCnM0IFholaboQR4HRxSrqTtltc4ZymksjK+djqIw1HabDvf0=
=uVGT
-----END PGP SIGNATURE-----
--=-=-=--
