Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92AAF185B57
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 10:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbgCOJJJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 05:09:09 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38860 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbgCOJJJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 05:09:09 -0400
Received: by mail-lf1-f68.google.com with SMTP id n13so9614009lfh.5
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2020 02:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=geg9hD6FX7DKuhaxEgdvGGHOUPPbfj6RvbTMi5mIFBE=;
        b=CjtkksM18ObJPYFlbe7sZUY0ubHwIr/+VNf7mOitTYddUsERtDpmW6f8mCVthGRHI0
         HDt/NmCzw5YDZUvrbNtzPftc2w8Ch5Qw7ZYpSKxhAANeJ9vX2nuL+63+A95/EOqrlrJe
         b9mRI5qLWcLEejt16aiLgs1QEM5ftq99EI8enSfIUO2v2m9UlsblW+5JBFA2NcodGQVl
         yloLxbdywpj968LQTyVDECUM0g/+YCSY8QwRkYpBOeT7S6Yj4SNvQFvOJnEK9b2O+239
         RIIpdmgVlYJdMmBPQd6ZqfIc0sECgzL5gTlq7whdOU4QDpeuZaQhyHAX62W6LD7q9xO1
         mEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=geg9hD6FX7DKuhaxEgdvGGHOUPPbfj6RvbTMi5mIFBE=;
        b=I3RI11Q0daKcjsDwHLfPH6GAwEpaLca7lwbR+JROKrq4clFi29O2+OsCKj9sv9mUdv
         cwG2DPXVMPzy1hBMPHDTRjxpfCg9a9062yz74r9dWHz9KfTDtqvjlUAs/45h77B3da2e
         j9EidqEqTfuBk89D9ZROamDSpfxBP+vrFURr6Fn9ALeb/V+0c4jWX+yuCSwVqkGMlexO
         FduVW9lJyFQslI8oZQ2EClHFwJw190xUjmoF1xLNiBoyhrZa6QBMXVoQX1mTSO/WMxT3
         sOo6AsP/slnmQ6Z1j3id3l2rbAEttGxPFRKfdMLXP7aCT38ILbZbw0cqv2F1AMb+ev95
         R8Aw==
X-Gm-Message-State: ANhLgQ0FK472hPZmC3iwx8q9KOGwId9tQrjbV0LInc2Ot+lM+Xqb49R8
        BA0vAP70aVR3i8SmcjdwZcQ=
X-Google-Smtp-Source: ADFU+vsyWOmBIge+ctYCuTULuO6mM9T/YBcc05EVvfJHoBxX9s5q9IUCxhbpJ3YY3T0rNpxYwO6JGg==
X-Received: by 2002:ac2:551a:: with SMTP id j26mr9940576lfk.145.1584263347417;
        Sun, 15 Mar 2020 02:09:07 -0700 (PDT)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id g78sm442383lfd.50.2020.03.15.02.09.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 02:09:06 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/2] usb: dwc3: Add ACPI support for xHCI ports
In-Reply-To: <20200312170721.GH1922688@smile.fi.intel.com>
References: <20200218151219.50121-1-andriy.shevchenko@linux.intel.com> <20200312170721.GH1922688@smile.fi.intel.com>
Date:   Sun, 15 Mar 2020 11:09:02 +0200
Message-ID: <87imj6f0i9.fsf@kernel.org>
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

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> On Tue, Feb 18, 2020 at 05:12:18PM +0200, Andy Shevchenko wrote:
>> The ACPI companion of the adapter has to be set for xHCI controller
>> code to read and attach the ports described in the ACPI table.
>> Use ACPI_COMPANION_SET macro to set this.
>
> Felipe, do you have any comments on this?

applied

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5t8K4ACgkQzL64meEa
mQZxuA/+PT/yoGGv6MxEkUsBCtk0S30YlZTxIgJZjXuM3cN4FyvYqgSvNAz5XxTe
S3Q0YuoZaHvJm44E9VEXSX6XrCa/tvxGhS6RsWBE8LfE5lZUNBkraYLFETaYGEtJ
5r9BQGjdr2sermUwdC0bA5nSfER5WYr6h0XDF4BJswqEo5aBFRjhuQFuHz5vc62+
aWJsqb6siW6ux/O0HYodkbZYkNpdZMozAgvmqwlDLCVLFuDdb7f5AqBnuVMMUyBy
mZNObXTXHN+q6Vfi3Uty+Y1HFTJwjALnpfAecpYc2JvNtPdmgO5eduYaVIJNS93f
U+hRGRB1455+HX+WEzdm/TAFV201/QxxLxzh0HXplPyE825yJQnp4Zuk4SbKr8Cp
H2IvTmWdnNjkO2jVk49kTzgLHGqGsPwMaBbSen0eOO9h3GptORUoZLxdJIHfL5pN
v3WlQeqjfPKaaBYuCBAy3/xCccjJ1VTH5oQgvZjMlW9TYBbdnmm3TptgYMf7acph
t+MttCtO0+qHAwuMdvTAUBcwiO/XPD5hiqYKIO7b7owZ/u6qUStFx0TWvM5etF9H
oR3qHiyLV2c5BQmscbFibOIYRXVvyO5R4KfH8Yc+EQNaL2g3oZ1kqHens5nIdNeM
biccD4kS8QakMyMwgC7bHgJbvP0nYFsTYfsz8wRO2QEFgGcttAE=
=CFH7
-----END PGP SIGNATURE-----
--=-=-=--
