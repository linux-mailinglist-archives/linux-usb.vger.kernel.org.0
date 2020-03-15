Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7F6185B5F
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 10:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgCOJTJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 05:19:09 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43404 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbgCOJTJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 05:19:09 -0400
Received: by mail-lf1-f65.google.com with SMTP id n20so8088802lfl.10
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2020 02:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=4lJiBsfxvDGqoRCLwodBICkU4yDdrZFKR/XKF+pu52I=;
        b=Au6HoH19VV794j49APfdnNw7pOQDunN+fsga3mHMbrQthq88LxDzV28JDgiffXbnwe
         0jjZFO6WLCcjF6eSpJT0zkdSLOtQjfJW/7HRb2CrDAKN0nhCZ+hbxh99KsQIG3MUh45H
         sZCOc0DApxkpHUvgGE/rpS+x+7XNdEOwaqGCekgPgslPVak9gP3wjJzZnWdxlCQuBqIU
         nt65FGWzXrir+ABavX26ns2/O2UUasRntow8IhN9nufxBJizyiJ1FVR5LkwXC5t+lANs
         4sALo/u+yEBSq+1XxY+j0yri6U1oCk3XqZZB7iCR4ildWDsU8de7Wsc1WKw4imhgvFi2
         uH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=4lJiBsfxvDGqoRCLwodBICkU4yDdrZFKR/XKF+pu52I=;
        b=JYScEae2ERXIlD+KBgDbVUdiREDzyEJkdNia5BESeHWirP8jb6cNCKrSYCgZhfQZFl
         gV0dB0VFiTqgQRIoHAPaVMVxYlwecL/9ZuK4IPl8VUM6kX0na3s/x875o9O2YFmxf75x
         Bdk1aJ/BJ2ty7yyv7qSkdNwo0+TXBhPRUuGZYMNTnSKKc+N1sAGHg0Lg8Yccj4W3SIDS
         BN90sgE+PUPi0GHseXPWQkZep/9F4cOjyzDUmm4X76kNVdBkzR7TY7yesmgpUO/6TMii
         oobiRODyBip6tktu9R0nYLqzvMuV9V1a1K200Y7m/TYlaGrXGahoht7uEfNpAYkIzAvG
         rN0A==
X-Gm-Message-State: ANhLgQ0KG2ECbrzlj5EHv9t8NGuBC4d7pvGi4E07ksfyH6WFwljrGU/Y
        Om5xmeTlmTjC/Z1oo4Zmt8f+X4bIS3ci7g==
X-Google-Smtp-Source: ADFU+vtL+Ux5DdE59hF5pC+/osNm+ICH2GGSq0G4ycQPnvDqp3hdWZ3ZRJeL7Ij5/bpI+Gtxxov0BQ==
X-Received: by 2002:ac2:4145:: with SMTP id c5mr13801132lfi.71.1584263947209;
        Sun, 15 Mar 2020 02:19:07 -0700 (PDT)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id a9sm8524866ljm.90.2020.03.15.02.19.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 02:19:06 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove incomplete check
In-Reply-To: <660a74249e64b3b62ca9b394584387baee67a119.1583466150.git.thinhn@synopsys.com>
References: <660a74249e64b3b62ca9b394584387baee67a119.1583466150.git.thinhn@synopsys.com>
Date:   Sun, 15 Mar 2020 11:19:02 +0200
Message-ID: <87d09ef01l.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> We only care to resume transfer for SG because the request maybe
> partially completed. dwc3_gadget_ep_request_completed() doesn't check
> that of a request, at least not fully.
>
> 1) It doesn't account for OUT direction.
> 2) It doesn't account for isoc. For isoc, a request maybe completed with
> partial data.

I would rather fix the function for these cases instead of removing it
completely. While at that, also move the req->num_pending_sgs check
inside dwc3_gadget_ep_request_completed()

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5t8wYACgkQzL64meEa
mQZkjg//ZgrtYRjZL1jO59qNLojlyrC47pgVEH4P3AVaF2RInj8osJayGwpFJLaN
vVw7J4bX4lJjH8yzpL5WlqUKGDdU1iaczLKxj7+EtyXVeLH+cocBNuWwVMQndYP0
Ms6b3EaTWyObJXJr2SjVZRZysLuUChNf3SJy74XEvTIWtaJFxbHceHHG7a/NLOpi
DLh4PO2vBZVKG0m+nw1jVHxjn4HvwfPnwEgAocvD/pzpgvmu98Av5neID4mhnMhU
6z5TxEN6QXpS6VGxStvM7j9nurupTIoBIkoS/GpZ17enXdYoDnFJ/Y9dNJlnYlLv
rtKn3mayYBvyyCQrSzc0KtjH6cBuzIU6ZJ+Kmv0enbOyXp4EkOwT3wfbRUZdlGmR
1LomKbd+pSB8c3FNqGrJDJsqWPiCLThfozujK5EZ0GDYldhOb7pX0VG59+kP64fq
XfCS+zXWOG1iXbruCapTcnzukSNfyUeyT3Z8iGfl9D1S30jvvvyT61Om/8VXeuUU
LAof5s3zrO5jghqTSy6BIVfc4150ss3gsFc/Ej4craM7ALR0yMXxkxPV5B876iHL
1vDYvUltoo9tEtEkB+ex0Zpy5X+nFx2X2VHYJEb61aV8QZqvaGVGhzzOWRgWoaUt
pulDziBW3Pwx170A32+HmWl+5eDjWHULBO8qde0tHsh3R+wzm3c=
=RPGz
-----END PGP SIGNATURE-----
--=-=-=--
