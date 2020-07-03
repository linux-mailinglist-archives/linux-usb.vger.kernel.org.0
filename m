Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1826C21382F
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 11:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgGCJyx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 05:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgGCJyx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 05:54:53 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15E5C08C5C1
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 02:54:52 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q7so23005883ljm.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=A3I6O8tKQsBGV6k603/7oJM8GZ1L8svysydxuc5xRR8=;
        b=UakUIzVlhLF+p2dlB2gGFJcT8sLS0W0Z+vT6Q/ZsR8StGoYi4/p1uG+Klya17AHRUB
         YyvVoP7x9DMQv+8xcov3vSHuuOgGZNwW2nb4yQN7Jt3lmGIVXWFGJq5mg29iZoN4uVHN
         Rd94BizCUvMjA6eH31hlxWZRtbjC+R6e2GQ3EXiqwASTyfgHKGjuIHXHeaGlRnFIfaJ+
         Ef9365FivWbvr0AdksYWDlJLgD9YVFuBemoI2Q6JXgwNDYaJ2AFA61ug7sZQ60n/V4ia
         bEonVxVwPuAUyQsQpEK++NeT4HRu8sxxHhYhGnxzM2nvRacKSeHY7KoN4vV8XCI7jZu/
         vjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=A3I6O8tKQsBGV6k603/7oJM8GZ1L8svysydxuc5xRR8=;
        b=cNBArvCXYaIeg00FWJp3TJglo1jCwn1SPb4D/+qPPlkwqFuqluDHO8qmVzEKhC5cuA
         zOJHz11NQphq3ckFl55+gd8zia6LCyfUBtF7U0sbBmk8b4cXJcjvO71jHMkcgfsSTgdC
         PkBnfzOoewjx9FWzvoHOv9GJTfIqjFahOlPH1PyuT0N5mXKWGtqyCvKS9VV3AZXBnhCg
         qdnN6c/KQPoGWc3gi++7kJko6mJ3wG9WLqKTE419VIp+cgn6D6LIo/o166bzabilPkRe
         rZ/sh94Y8VPXll4wiJf+0fQIzsf6XjRQIkigqyHxd6JS5fEFLZUIfUIleLG4UQ/aa16L
         bJpA==
X-Gm-Message-State: AOAM53328eXjiockE0uzD0qdWryb0jrWWOgw6r1AdZQohn5EZ/Nf19Rw
        fJfZyPoWdIyfT4DPDI1+RYLhaMRzDQhRYg==
X-Google-Smtp-Source: ABdhPJwnzHyO8fMq5OWoZVYPxSqor3KW/o4OO/E3EEgaFR/xWxNzTQjCAB9mdsgeKs7LW2O3U4Xjbg==
X-Received: by 2002:a2e:8882:: with SMTP id k2mr9672583lji.352.1593770091086;
        Fri, 03 Jul 2020 02:54:51 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id a17sm4462809lfo.73.2020.07.03.02.54.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 02:54:49 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Yang Fei <fei.yang@intel.com>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Linux USB List <linux-usb@vger.kernel.org>
Subject: Re: dwc3 inconsistent gadget connection state?
In-Reply-To: <CALAqxLWAvvHGo1RYef1fJ_k65WqHAPCDhLfehO6_j_f8E2jB7Q@mail.gmail.com>
References: <CALAqxLWAvvHGo1RYef1fJ_k65WqHAPCDhLfehO6_j_f8E2jB7Q@mail.gmail.com>
Date:   Fri, 03 Jul 2020 12:54:45 +0300
Message-ID: <87o8ow7wka.fsf@kernel.org>
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

John Stultz <john.stultz@linaro.org> writes:
>   I've been tripping over an issue on my HiKey960 where with the usb-c
> gadget cable connected, the gadget code doesn't consistently seem to
> initialize properly. I had rarely seen this behavior previously, but
> more recently it has become more frequent and annoying.
>
> Usually, unplugging and replugging the USB-C cable would get things
> working again (but that's not helpful in test labs).
>
> I annotated a bunch of code trying to understand what was going on and
> I narrowed down the difference in the good and bad case to a dwc3
> reset interrupts happening after usb_gadget_probe_driver() completes.
> In the good case, we see the reset interrupts, and in the failed case
> we don't.
>
> [   16.491953] JDB: usb_gadget_probe_driver
> [   16.495938] JDB: udc_bind_to_driver
> [   16.499555] JDB: dwc3_gadget_start irq: 65 revision: 1429417994
> [   16.503803] JDB: __dwc3_gadget_ep_enable
> [   16.507791] JDB: __dwc3_gadget_ep_enable
> [   16.511715] JDB: dwc3_gadget_enable_irq
> [   16.515582] JDB: usb_udc_connect_control
> [   16.519510] JDB: usb_gadget_connect
> <in the bad case, this is all we see, the gadget device doesn't come up>
> [   16.811010] JDB: dwc3_gadget_interrupt
> [   16.814783] JDB: dwc3_gadget_reset_interrupt
> [   16.819047] JDB: dwc3_reset_gadget
> [   16.823935] JDB: dwc3_gadget_interrupt
> [   16.827686] JDB: __dwc3_gadget_ep_enable
> [   16.831611] JDB: __dwc3_gadget_ep_enable
> [   16.994477] JDB: dwc3_gadget_interrupt
> [   16.998246] JDB: dwc3_gadget_reset_interrupt
> [   17.002519] JDB: dwc3_reset_gadget
> [   17.005922] JDB: usb_gadget_udc_reset
> [   17.062422] JDB: usb_gadget_set_state  state: 5
> [   17.067069] JDB: dwc3_gadget_interrupt
> [   17.070823] JDB: __dwc3_gadget_ep_enable
> [   17.074745] JDB: __dwc3_gadget_ep_enable
> [   17.170898] JDB: usb_gadget_set_state  state: 6
> [   17.195605] JDB: usb_gadget_set_state  state: 7
> [   17.200179] JDB: __dwc3_gadget_ep_enable
> [   17.204118] JDB: __dwc3_gadget_ep_enable
> [   17.208057] JDB: usb_gadget_vbus_draw
> [   17.211721] JDB: usb_gadget_set_state  state: 7
> <in the good case everything is happy here>
>
>
> This sounds a bit like the issue in the comment here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/usb/dwc3/gadget.c?h=3Dv5.8-rc3#n3143
>
> However, I've tried calling dwc3_gadget_reset_interrupt() and
> dwc3_reset_gadget() at the tail end of dwc3_gadget_start() but that
> doesn't seem to help.
>
> I was curious if you or anyone else had any thoughts on how to debug
> this further?

Try enabling dwc3 tracepoints and collecting working and failing
cases. If I were to guess, I would say there's a small race condition
between setting pullup and the transceiver sending the VBUS_VALID signal
to dwc3.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7/AGUACgkQzL64meEa
mQYh/w//dGmlVXhgEjpC8Cxx6ocZbYSELYfJqIcKP8IjqD/bIhZfV8+NcqyXmb81
Gkdh4dQ7EADysCZL32l6AHFfajP4FXL6ly4bf70IfWu6d3JG/IU4iEF+PDLfpsnz
BUq8h6H24ktuOhDqaGSN1l2t8TPBuNf+Wlgh3+91MaAq7D+D0Bt3N6RYu0yV7LZY
6GIRa9KpGjKr6XknqC6XhGdE0/zD9kqpL+n+wzONsF3jVmd7ptQYxY74qAtrO1PO
gxwWo6UG5jORQ6meQ7VsuMmxUY1/kwZOP3l11Rmeu3LctJ+F+Aoh0/CmLJa5yIu6
Fpn2oAC+OovRVSwIv4c99DRtpW4G65M/FnxdyxPcIwOyQu0ebvrzyBgOKRD6mTZt
qeT/Hu/nXbjDcyN5kx3vgR7/k1TTYAzMAioC3ZmKQy4nXDqPmWukGzSu3tKKislv
/wSJn42BgGFtGo0OOI1+uBvJzzsuv1DKqzv/m+ixYJ0O964l3jtyjmJ7ro29/wsW
E2TUF/kuqBodW1kxg64zTfHCYuvYxl36tSCOLUVZGwL8ZuJmlEH2JIH3I1qCyMj0
tI6o65AYVrP+K1eRhqjcEL/edDAIRwnafFFTyWFZdOcOBe7HjudH7HWViwS7xuAz
/LE9QfrXXX+lf1EvtR6bCGEgEpJMbccijE7kBsJ3lBfnIyhzOGU=
=NP93
-----END PGP SIGNATURE-----
--=-=-=--
