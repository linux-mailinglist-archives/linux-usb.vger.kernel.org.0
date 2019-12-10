Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1A81188EA
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 13:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbfLJMyX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 07:54:23 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33212 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbfLJMyW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 07:54:22 -0500
Received: by mail-lj1-f196.google.com with SMTP id 21so19797148ljr.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2019 04:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=wtQ20VtY8/7cqhe0tAkc4NM0DlQyqg8M5I8OLiINIbo=;
        b=oHJsJmNnZ4padQiXSFBHjAqkP7nVrs7Vwe9VoR8jMP5yGXBmgfDkE5tXvh/6kp2WhX
         tcb9PyE2fT8njjXkumPvDQ6BCPpy7TVPSrhevcb2DSTni0vb9A6sgrQaNUpUAGRJQg6u
         VqXUJbuRsPE4A0hDWikU9orY34xBZpQ3vjyXQOL6W+sQ3PO4+ZmQ5++MR9nwxoNqj5xj
         Kc6y2Ge+NcO/dWDBwlmnwh4/b26nmEy6Q7H7aOsJvHZaE7SVLC4F2bqbaOFysKy1UuFN
         Dort3dENDjiVn49nDqt98ybN2vgPKEQVGd7Kj2/JzxH2+nr6W/2tZZ2etXOcJAwV9EkM
         UGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=wtQ20VtY8/7cqhe0tAkc4NM0DlQyqg8M5I8OLiINIbo=;
        b=Hzwgg+IQnfGGcGzq2nKeuuTJbCt7yFPBBe8cEnIVblbYtFhHff29yWY9Wp0zxXFRbX
         eA4CvKihWrqRxcYR2c1y/W9iWkAfMrB7k5v2P6oXqYuR9OYleUH89nI+BnVWdzFgiffO
         QC76CStTnl1jht1E+srlhM3VeFcAyDc7aHfOWVDyAnZyVVGmCpMHPo8NoB25P7MwY1Py
         7CAhYGM00sZrKGEWVQEvoXpitvJDLqucLpuMWfJre3Qy+KK98b1GvW/iczdth3jVvSMs
         qAGErryTtT9tOFj2BqCotxJ1+wngLcZqjIk1ECBNGYJR2Di7nNBZJ9Th0/r98BxOJjP5
         na3Q==
X-Gm-Message-State: APjAAAUHGtBZqGpS6/438RhwyMRv1mxrr/idXkHeT2Dha+hSLpBRoXNt
        ovSXeccwjcRhh5nBcXZY90M=
X-Google-Smtp-Source: APXvYqx86Ng9t/+Qi0kM1BWvNipPFbxKhIAYBtG5jvT9IPA7o+EMvqZQ6kfLtlnUl0pp2N131Vw2ww==
X-Received: by 2002:a2e:a402:: with SMTP id p2mr20399971ljn.143.1575982460634;
        Tue, 10 Dec 2019 04:54:20 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id a21sm1546074lfg.44.2019.12.10.04.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 04:54:19 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Do link recovery for SS and SSP
In-Reply-To: <d120fc57ba8836df3f1dc597335499e2233aef53.1574893374.git.thinhn@synopsys.com>
References: <d120fc57ba8836df3f1dc597335499e2233aef53.1574893374.git.thinhn@synopsys.com>
Date:   Tue, 10 Dec 2019 14:55:08 +0200
Message-ID: <87zhg0jq6r.fsf@gmail.com>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> The controller always supports link recovery for device in SS and SSP.
> Remove the speed limit check. Also, when the device is in RESUME or
> RESET state, it means the controller received the resume/reset request.
> The driver must send the link recovery to acknowledge the request. They
> are valid states for the driver to send link recovery.
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>

Care to add a Fixes tag?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3vlawACgkQzL64meEa
mQa4YRAAvrIqZd6Lt6QmNePR2HXg1kFosOnqi7HTMYaNFXUF8yOadobuCJ+7xTBV
KVazsIN2i9T7BS6QQ1BSDI0ByKEBKuybGu1uBZgryoxsCE46VfDqZE6P6pD/q0Vb
fmU5YIpLNZL0PFzZf7oCtGQ5I/NAvWhkEOfaVo1SbgrJz+XGY3fC1dlTcJtuCrlu
wIoTbgXiwQ2gxW+LAgeGao5CVfgbw4vAV/tzS0AlQsW9p6ZYtHvxGCWdX0JUFNkO
5GDHWEAIIfEZlIBGKLKE4GEdspf8wKwU4CBJ0R145RAdOYQ0XK2lP/ax/GqGSzVk
MiJkqcLwfB0VdR0p1xUzZcCh8mqxHE3XIUSo9tDqLg07eV0E101/H3+DqRNoomoY
tHToHKPXTkAt19eDgyjEwXeBf7NazIBBkTdQSgaPFK80Hr7pImyq91JivEyUZ7V7
01vq8RIfbScZkx9oM7eA3sBRWtfuwTYDkGzWhHFyZ6f1LU2CdQVok4E7js7oQyCy
i/X8D8+f36YaycnGONxZ2S3Ie9iPpUPSbmSAy7osWfaPkD6F9Cj/GfSa/2KAeT2e
2YLLEI4rnMkeWYFmNqr/g3kmVec4m8FsJq/oRKEyDe1V997tBvE2JsWmBih7xctL
NhbpN73/NLD3ZzVQg+TWxkSj710b/yOCThZnukdK6TS4PQVJF6U=
=IcvW
-----END PGP SIGNATURE-----
--=-=-=--
