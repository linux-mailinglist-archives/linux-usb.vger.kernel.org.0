Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D68822ADE8
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 13:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbgGWLlg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 07:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgGWLlg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 07:41:36 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B65FC0619DC
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2020 04:41:36 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h19so5938284ljg.13
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2020 04:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=9ELG5/k0pdLiKanAroqbWo9c4Z3rdM9fYEJfpS75iwk=;
        b=QhYprndnbPDzLzk99SK3JZ5l9oTP2cxL8zskegi2r1/rmp+RMbb6sP7eRh+0fH0bmz
         rsWvsoifF7uqFNgMdE7oWl2VZsQuI9wdHubh+U/mWU6WsOg8QwN4K3T2btBebm1XXLQy
         b5LFpGWflWcrDXqZbdYOxJ7WhEevQTPdam/A0b5riWeLjE9qipLgCrMgpeMpmWTbnJfe
         vySbL6shMrnuCEsnwQoxrylaBQBhK2NTKAsZahjlvk+dkGEp6rjWsp1eDgkuQu3bisUL
         HbdnAQLREKoZCtJ+be+bv6BpADTRLsvb7jIwzsF3D2vSoWzx5QEjcpYgsPWMDZnsON/K
         /7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=9ELG5/k0pdLiKanAroqbWo9c4Z3rdM9fYEJfpS75iwk=;
        b=e8OVxjmzRLDn+XZqkUPJFMCXIvzk6I/5LV7VlPpraxRA+lbX8EpjtDk352n0eOh81m
         kTHm0X6sSDyFiYsnXZwV2M0G/QVS26JA/xBDJ4Yt/sHxsPQcOV6E7WGnkwwpVvjoGIcR
         NTLtkNUkPOfdPk3ojxJ1RPHqT2rgN+o+ObDXd2W3nSunnQGJ9lV+IVX1KZHGaVNwJp3S
         FG0yA531eM54jGD81KgqNAwjBCzhIlKsNUgxTLm3YEbwzGEbpUfBUbfWqekeyszFJYYH
         IuT0KAxdf3Qr+jpVOu6ngjqL659lONI/j83J1iwt6U9mggbjJ3ICBy0VXAdNmaey5iV5
         9eCQ==
X-Gm-Message-State: AOAM532bjEQUM38LxOPZGvKmoRvViJu9xEmQBpsbbXqzKiwpAJHlgVIh
        SD1SoEPSVvRFxjF8eGCEMH4aEO4+pHqjow==
X-Google-Smtp-Source: ABdhPJzGiahXY7jBWLOq2gMRo+DMen04p3Emqqh0+Xm4qu9Jyqz21C/wcvXYR3paiGsRXcsZ8cAydg==
X-Received: by 2002:a2e:815a:: with SMTP id t26mr1923518ljg.182.1595504494040;
        Thu, 23 Jul 2020 04:41:34 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id y136sm2619882lfa.79.2020.07.23.04.41.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jul 2020 04:41:33 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>, qiang.zhang@windriver.com
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: function: printer: Interface is disabled and returns error
In-Reply-To: <20200701120027.GB2184169@kroah.com>
References: <20200630054407.33165-1-qiang.zhang@windriver.com> <20200701120027.GB2184169@kroah.com>
Date:   Thu, 23 Jul 2020 14:41:29 +0300
Message-ID: <87h7tyo3va.fsf@kernel.org>
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

Greg KH <gregkh@linuxfoundation.org> writes:

> On Tue, Jun 30, 2020 at 01:44:07PM +0800, qiang.zhang@windriver.com wrote:
>> From: Zqiang <qiang.zhang@windriver.com>
>>=20
>> After the device is disconnected from the host side, the interface of
>> the device is reset. If the userspace operates the device again,
>> an error code should be returned.
>>=20
>> Acked-by: Felipe Balbi <balbi@kernel.org>
>
> When did Felipe ack this?  I missed that, do you have a pointer to that
> on lore.kernel.org somewhere?

yeah, I don't remember acking this either.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8Zd2kACgkQzL64meEa
mQYP6w/8C//dekqQn4gmw6TFePY+xPgXyTcTQqq/wkobxAgJhKSBK0M5CJARzQxw
mWk+fIJGPrYb5fxPABzpCJdlhzEAuWOWvxodwa4imZ/8lYIo8Lj/yt2QJum4YX1B
6fHVBIWgSkq3NwobdlO/lBIJUGnWfiWuFA3Ub8UYG6Eb5sbi4fJuRx6TOY3L3iYR
RxV+XBiVdf1edL73u+YSGLQyOPE0E5YsJedjR+IhuZe1BThJSPAOfBNBk8Jji+FE
n+Ea3kJdV29BiCKMDqGzAxRyxUOY/JpMq0G0WwQ2vVE/sMqVKB8uAhe+2xdU6Qsb
dUQbVUBrx+0uf76fMfojaIK3tawCmw4GeNMcdmJOzKLV05dmlNN8SF3izfjJGuIO
WExpYCp1U+eY3a4TtUvEEb07uaF0WtSjPXerr4/91DuVURVOoKzS1oKP6J2g+ywa
l9UZmSUc0RLeSdZ/VvlmtJCXKMHoV5FNiwb2biI/LODWdQFkYvixPXDJpans+vfC
xgroro+b90M+mIwVaAjoa4/toWI6QwYvpBn4Ar81g1w3lJbKJ+2uoRlUVzPxexSM
Dg0IYbU4jFeSZUXXy9FOWJiVQnQHtx0XQPEjXlE+3LHEtjdsm74XHeoO9Z2FiuMI
E53Py5tJZJACnEVqOG9k6Y4qm3CBDB5msIIm6jaxgQIu3Ps0fkU=
=bLrq
-----END PGP SIGNATURE-----
--=-=-=--
