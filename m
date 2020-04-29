Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837961BD639
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 09:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgD2Hj7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 03:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgD2Hj7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 03:39:59 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B5BC03C1AD
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 00:39:58 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a21so1495886ljj.11
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 00:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=4rAFqQQzgqrKKlnDKMCjqOBHoJ4VOWeRgTMfselSWKQ=;
        b=BGk6SQcxoW5wPDl+wPY33Nve4ob4dL6cCZw8vETSh1n8IuaYcVYCqZ2Sx3SIfsKJxw
         yUJORO/M+VWDnD+ID//nUKcAg6EftqLVF7/3rc5BA9qZke6EdE22LlypcK0iS7CovPgf
         nlgO3jmKlFmm2NM0RzUKatqOiNI2sDvQ2UqR2CqWd1Jk7SHBRHZAPz9jmK4CoBCxegSS
         Yoelyd8lizjSA2hvHqb0ZzPvT4Zm+r4LlzM1ffzvOVfmrox4G7Rp+0LLbX/89vQCp2F2
         ftCEFQ3e8+nLGGMjhVyokpRgFJjb/SQ1BWRmbYCV3ZrHcXXJppRoStUPrjbf/AQda4o4
         84BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=4rAFqQQzgqrKKlnDKMCjqOBHoJ4VOWeRgTMfselSWKQ=;
        b=cBUCzcRqRHKtggS0eibpC4L60N2wDclKlVb8PO4EIfGbwZpjQ/pquCfSCv07x/p/XE
         fCZ1Nzpkn8d8bArLTnkR0nmrYMHGaBvRxO+KxCi8wkDFMWYIdyUrBuLDvVsQECJ7+lo0
         CGI6psy/qmNBbRV5UJaFA1ZB0xVYQvNIHUsVP0Cl9ogCNwFhbPGYVzYz/BXIEKnuvD4+
         RBKe5wV1Ax9TY4i8QmxfcejM1BOphIJz4DYBTxVFHzfeRp7haFx0qCcnaM0HXjJEvGwa
         fg0CLtvOdPzDTJ3FMoD2wVgv59I5WOsAiLzuseuCdeI7K0njoNkqzcJdgYPzG8R2iQ1r
         6mWg==
X-Gm-Message-State: AGi0PuZoyJHJm4U3L2mnbdvzbrwBOqUnE/7DNWAlZY+9OTT/I2PUoY01
        O3hp0b9gPimyvirDvyg1n/s=
X-Google-Smtp-Source: APiQypLLvCQLxWYP4xG51BVTBysmELdjXvknuJl9R2kgZ9dV14rYxW9Tym7F3+FzzjVOJLV6T/I53A==
X-Received: by 2002:a05:651c:1055:: with SMTP id x21mr17166123ljm.210.1588145996852;
        Wed, 29 Apr 2020 00:39:56 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id s7sm1692497ljm.58.2020.04.29.00.39.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 00:39:56 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Recommended USB3/SuperSpeed gadget device
In-Reply-To: <CAAeHK+zBLWKn-YQjoD6S5uwwhuB-kTmdnBD28E06ujrx8ymv7A@mail.gmail.com>
References: <CAAeHK+zBLWKn-YQjoD6S5uwwhuB-kTmdnBD28E06ujrx8ymv7A@mail.gmail.com>
Date:   Wed, 29 Apr 2020 10:39:51 +0300
Message-ID: <87ees62114.fsf@kernel.org>
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

Andrey Konovalov <andreyknvl@google.com> writes:
> What is the recommended driver/device to test USB3/SuperSpeed gadgets?
> Ideally something cheap, but at the same time with good driver
> support.
>
> I have a EC3380-AB board [1], which kind of works with net2280 driver,
> but it passes almost none of the usbtest tests with g_zero (only tests
> #1 and #9). I need something better.

You have a unique chance to fix those problems :-)

If you're not willing to do that, I anything using dwc3 (dragonboard,
beaglebone AI, and many many others) would be good here.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6pL0cACgkQzL64meEa
mQZe2A//cjYaEQr/FuxkWO900p3IOZWj5Um5T70UdrwDTt9JwaGpMRHJnENANN2v
r7xYGdljh4Fi34NKcyFVrn+ViaoYpV7pvSZy4I3MuWvSOZ9Kq/2xeEYOzlWdXAkk
M/LM4uJHOv51Q3phVAl6FgOeB0Wvy1BLZ2SsbXnISx2kp7JT0LbKdlxfjvOZXBZ2
DmwfluAexi3jiSxywN9xLqC6IYbt6GhEIIMMDmtmwg5ISEP6OpsOuLFvwpsdi4od
rdROoWD0o5+yLbGyn0BOzQUs+zGvUABs2aw1acrBqTbuVISsDJMS2EjlPGaW3BgM
7YDpkPOe9FWdukUGzcZv6y+NmLAYw61+PIMN5Mxuawl7LRNymRE9WbVbg1vpNKWp
3hTKgaYJrR1b2VgntIg6WJUwcFDInJ/sE5lN6R0yFNdFyGlsz71HTdsdzZ+x82fu
JGkUx1E8lplfGRAmDnF8LZQ41sLGlk+wjmHApHiXRAJq8APKg8cn3pHjyEPukxDW
Nf9AR5RKNXRZ/EgTfNmDV1qePyY1xRa8DGUQM7jFFbxZCCYjWqGp9/vvTyRzTBcH
mZnmZtwZYNa1BnSEJT7viZJHVKJaa9Lw9Lou1MEiga6iFo3is7sQzDFok81BPyto
ZDIS9yKGRNMrJNueAa7CXycxbYYiWd+UXRIZ4wLS4LY50DOkCuM=
=i0GP
-----END PGP SIGNATURE-----
--=-=-=--
