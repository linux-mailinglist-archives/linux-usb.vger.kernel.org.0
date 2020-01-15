Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D19F813BBA1
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 09:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729031AbgAOI63 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 03:58:29 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40954 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbgAOI63 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 03:58:29 -0500
Received: by mail-lj1-f193.google.com with SMTP id u1so17632329ljk.7
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 00:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=fHu/NwA4NTJNoJ0radcC3JqAj5S9NzKhljImujJbmrE=;
        b=o5mM1aAgT9KWcJyrr35TGk0H6nz76PdN73djp6ZWUiHONG/I4kxRnDvC8Mu33203lR
         6SCyPRGgEEotL4eQm4a7CCgOylzshJrTSz9Ckb9R/LlROR4w7yNSXkplZ6mrqecGQoOR
         VrllQW029tdxfXn+BKW8U5KKB5ycR8XW586EPWxsDmNGj3ZK9uAE5/VyOrhOXAH934Sn
         2PnWO3Sjy+xP1WYU5zKHefbYTHoUDvUjvVTpFDxySxxfoBGU8SSwsNhFoUi8q/pbcMRz
         ng6ur4n5JVlWFJGXycpwYgR5k/uVquioTBHCTy6wlvWb3sSzzAEV89fRpx5LZTazAGOK
         4mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=fHu/NwA4NTJNoJ0radcC3JqAj5S9NzKhljImujJbmrE=;
        b=kNLprsuVbztwh0WEffKVZ8sDO8Wxsj2WgnjK57XLQtpGbolNOD1Ldnw+pbib32Yrxh
         AzR5vF9LoUXxyBh9HWb4qiMw1+NCHZiIi0QMhkYgf7grZ+Clq6n6rDkjn7nSUgXG9zcv
         GSPiqhOmBZ8qZrmfTS7tuCedbMyPO6UMB3OiyPgB6M0sur3R6fM2uchtPPiPRirFiJFI
         UuiRThrrI2Ahefv1fhFuln4Lmp4CMjX5vroZfYOX1UJMsy8fPsf2xqAT+qf6W0tLXyQC
         YhuB+NPY6WlJISnWbUBS4TGITAQ1b9cXL7ekuH7FhXeUYrsFWDg9J7DNpQi11xZ3OUVr
         kp8w==
X-Gm-Message-State: APjAAAXnBS6JVQQp3dk+pSzpi9SPGg1DrdOKrN60zDNla3kpS1lRbkfw
        zpZS+MlMAYDkwl2cnvT6tQfaCwoFWJI+wA==
X-Google-Smtp-Source: APXvYqx57o7rOWNgdj+iGywIxtNrYxxQ/poYvjvEt+RJaxer+Sbwph18uq3SDE08IlqvN1CFZyWygA==
X-Received: by 2002:a05:651c:104:: with SMTP id a4mr1161818ljb.104.1579078706777;
        Wed, 15 Jan 2020 00:58:26 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id y29sm8687422ljd.88.2020.01.15.00.58.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 00:58:25 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Lukas Wunner <lukas@wunner.de>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: Drop unlock/lock upon queueing a work item
In-Reply-To: <20200109123617.5ovxwkfnmf7ou4z4@wunner.de>
References: <77c07f00a6a9d94323c4a060a3c72817b0703b97.1574244795.git.lukas@wunner.de> <20200109123617.5ovxwkfnmf7ou4z4@wunner.de>
Date:   Wed, 15 Jan 2020 10:59:27 +0200
Message-ID: <87h80x6qog.fsf@kernel.org>
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

Lukas Wunner <lukas@wunner.de> writes:
> Hi Felipe,
>
> just a gentle ping:  The below patch was submitted more than 8 weeks ago
> and I'm neither seeing it on one of your branches nor have there been
> any comments on the list.  Are there objections to this patch?

I don't see an Acked-by Minas, so I can't take the patch, sorry.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4e1G8ACgkQzL64meEa
mQZ/6Q//TblxGT4XpqGrpl2mn7RVkAn1gXeRtxnJoD4UtaJAWTqpGNz6LSInOGTu
rJLP3y4ZLymoziKJd2S/xSMDXV1DK8B+bLiSiVr4yey6TJeCOD9OouCx61vm9D1K
8yFLMxk6ixT5cYJ32nyE7/hazSs6o+xB5tqctWXkSE/kMs5tmhu02gg5SxHHcUea
fCmvV2JS9GzAJP7U9wgoRvsSbwC4aHTt6lDFln0pMEAoZRb1zXRO32IxUfVJbhFO
wMBS8YnAyayuau3jH2HMDC51t04TTIiKmVtEnEzFK/T8DajRvBsSzvRmNjcFJ3vX
h7lGQt8XMaAPx4550Plvb7Qw3F2MlWEj7JML2B/ZNC3qdodItxRT779DHN/oFVQ+
9qs+c4QVgCZL6Z9kG3mFX6/ibHefen6GD+dQ+tPusXl9VoRhm6tmMSDBDx7AC87e
jJnqXRv+KfzDrvcOt7nF9LZKybfFyC3vicsJVgIDXwrPkMOmTzAHn+DzunaGv36t
b/nVinZWONionM1T1gTgur2gyXnczJpiSEzBsy3cbsU27nMtyvnDWvqbZ0XgboUp
axdsFthtU+GbIxrVUh/mol/cUtCfGaXOCGOEWu5bhSz0yxBePlurabY26zc7btRz
aDkSm8yDNSSJYNR4c1NZVV/VUE7iGi9AhE5iQA2iexZDsn1uigE=
=2LYL
-----END PGP SIGNATURE-----
--=-=-=--
