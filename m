Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 428A9185B65
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 10:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgCOJX7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 05:23:59 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38441 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbgCOJX7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 05:23:59 -0400
Received: by mail-lj1-f195.google.com with SMTP id w1so15262018ljh.5
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2020 02:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=m9g+CtH9FdNBHbisn+RYgjeOjg5lSdgCU/7z33WMuRo=;
        b=kRIa9YDCHFQ/l9vvrfGV/8ok+DblGSok97WmB+okpFw8n7UXplDWYBN/iRilaxrYBA
         ZaReweqcHuiJso5Cvg9AxyzAX8bFx3MU0TKNpUmtqG21S+yilLT0Dq2xb3TU9ZuH42lu
         Ds0fXHyZilu3MC3AOBSVrgBoG+9HVHIgm89LoTuLq2z89uTziys81ZeF8qdJXgWOmUkh
         0bajjHEKiqAltJAJkCSBnypSs8SBeJTYwzaOlzBVWHjJfITP1lhLMSuVayFv7FFUrZ5/
         B7VoX9wSZ9c4OYT7NozdORTpnWiUat1FlQtu2gbHzmG538qsdkBmGzNmY3PtVL5uD3cf
         7Usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=m9g+CtH9FdNBHbisn+RYgjeOjg5lSdgCU/7z33WMuRo=;
        b=Re/5Xz7b3n1/JP8ODmkWg+9i402DnWRzdkjBJj9scpB4nfw3trSaWrEjrgSfTJBncI
         TTfW1kkDbW7W6Bjvvvl9UvF6siuMJmd8VK8Ee4Dagi9sJp7NTdsSSQHRQVtqNdmQTEro
         rA539wMn1YRe3BzSu97Sx3jrisEYYYL5bpq9RbfnKqtiWAN98Dwl9hxw5Zf8UtZiZte8
         qVnPEvI6bW08N+P8aO7X6MMWvnzyFq4i+XNg2jzwsyIPj+pMjIxM5UnQPxJeCDr94eor
         vAfPg1V+Ze7OunS93R/Tg0im0O9R9CCbrc0JomquinMtOvcfWVdPNDMX6eNtzKqxl8na
         y2AQ==
X-Gm-Message-State: ANhLgQ1xQDd8rO/HS9PGKlhvRrtzMwGPG1wq0ZQO6TmU6y+zO1Rrkfxc
        qsCugxGkvSxMYB0k2hVTVyU=
X-Google-Smtp-Source: ADFU+vtn7bX61BRoaPSDQ2kbEzCC4qcG7vdZCQTKEJvbF4Qkcul5lnpofA/7u4om9uqIMlox+FsQiA==
X-Received: by 2002:a2e:89c7:: with SMTP id c7mr13589389ljk.265.1584264236331;
        Sun, 15 Mar 2020 02:23:56 -0700 (PDT)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id j7sm3044911lfm.65.2020.03.15.02.23.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 02:23:55 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 4/6] usb: dwc3: gadget: Give back staled requests
In-Reply-To: <a3732fbf370a2cf180c1c5757f46faed8399bbe5.1583443184.git.thinhn@synopsys.com>
References: <cover.1583443184.git.thinhn@synopsys.com> <a3732fbf370a2cf180c1c5757f46faed8399bbe5.1583443184.git.thinhn@synopsys.com>
Date:   Sun, 15 Mar 2020 11:23:51 +0200
Message-ID: <877dzmeztk.fsf@kernel.org>
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
> If a request is dequeued, the transfer is cancelled. Give back all
> the started requests.
>
> In most scenarios, the function driver dequeues all requests of a
> transfer when there's a failure. If the function driver follows this,
> then it's fine. If not, then we'd be skipping TRBs at different points
> within the dequeue and enqueue pointers, making dequeue/enqueue pointers
> useless. To enforce and make sure that we're properly skipping TRBs,
> cancel all the started requests and give back all the cancelled requests
> to the function drivers.

Which function driver is *not* cancelling transfers correctly? We can
(and should) be defensive on dwc3, but let's not hide bugs on function
drivers either.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5t9CcACgkQzL64meEa
mQZLQxAA3rYv9eapYGYu9REGpxAUl8pW8Lp55eKHCbQrx4NY+Bbwdtx/GpUuy+0r
5S/3UkMiEUtwEarSP7yYr/XbFpr/aeXEmJeR5fWuVBvh7uUDvw8FXLwYwubmdsyb
uyhKg956owtKsn02CcVkotBmRlxnvXpe0+RaA2xDxnkBBXxlnfwJ1mWMyEUUsgyS
tzza4+RhDw8+5v1HWc9jm22ccGSAZecFNH5xPy79RBqlwcPpWBpS1GmYrEwVuPR6
3E+s6WeyyJ0wMMrUQyIiu/mzXnn1NRqWjr1An/NIJWOGYF0G2IMzdXkOOMtA39sK
u91svi3dnmCU+mrmmQJprKrinmDlHkG09wg8cvLO0Iy0Dr3Yi3MQesY3otjvJzAX
lRgPPUapw6wPnbDRMSYFYzNKG2nCelNgBU68Y8rQ4tqQab9G3T4egy98u9Y34T3e
RCSm/Hy1DXXqpIl6UNYElHou88NYb4sTDiZO8rbobSgQ9/dmV3+YwV2SL4tvmKzb
7uo61bEpwrN3b+V8mr7enXsV29cSI7iRJuPbXtycCKPyU+pdSt0B5csQFri9+j6V
gZNKAcOYF8p5ydMKnjL3+BFbK8T0SkNcOgevGFAwhI2+njQt96P7Gw5Jb+fSH+mf
TUJCkru66dX/5M9l34kmaPGT/6Q++VzwNFVLf5HSk+fIWsYNVNU=
=QtIO
-----END PGP SIGNATURE-----
--=-=-=--
