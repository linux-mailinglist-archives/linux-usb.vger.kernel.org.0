Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4171C4F8D
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2020 09:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgEEHtu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 03:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726568AbgEEHtt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 03:49:49 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60992C061A0F
        for <linux-usb@vger.kernel.org>; Tue,  5 May 2020 00:49:49 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id y4so588136ljn.7
        for <linux-usb@vger.kernel.org>; Tue, 05 May 2020 00:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=RjlK3ep5+Rvp7LR/HqmtrZDJ/LNeU8oYhLoUl3iBlKo=;
        b=WO/JFjMlctivUrFhjiR46vE878u4Hh9OsU0/Er/WQNmP1NfjI4+EACurONbY06z1cK
         nnEJuH7xHnhaFLYkLMjEctra8nyLWMFV5TeH8XJQEjNAHMcodyeYwIlNynumJHSA99Ul
         jB3VNlVvyggskVN4l0aZAeXhZadwEL/TP1f7lIoWKuhGEORl7/Jh6a6LxNklxFe538Cy
         JCvvMNNvAL7FYcntiF3iSOyqx11WZDEXL539wRPeJW6qvXF96hoNh+jQ1hjPhsXG5ekS
         PwFiGMxWEPVdHctJVFXJIMMSQBx2dLlUwKKMDphAIP0Fq5vReCjIERg32p98rLwFo7Mj
         CE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=RjlK3ep5+Rvp7LR/HqmtrZDJ/LNeU8oYhLoUl3iBlKo=;
        b=CdwHjM/dvxwIRiKMH1E1ZFa4gF/VY2tmQT6Jz0bvfK5yV8QKCECKTnPQoQ94W2ASPI
         +XsoWPUzebB7875D/sQWaUe5zcDATLioPrKM6h8GMjFtDwEOmJMo6JSFDZjkCHZPBfZc
         bRYKxPB78J3diKNz7LH3jDeIe6MKwooy9Csodpww3bVlQrzL5EZHwlQo9HYshV67dXpr
         uIxEOvGN7+vedrhU9AKwCGTuwqF+octm+knc/CfUDXCV5A43zn8qkesAMbf0gb8w4imR
         1AEPD9pNuTcKX7VWKKQhP8UUE37OzT0VLQ/ChsGtQaAu0yIeR35+n3kPCWPwTdHWdEgc
         7A5w==
X-Gm-Message-State: AGi0PubyQTuhea8+V+CmiPQbD72k/gO9v0s9ef6pknQO13T6S+HrSQBT
        qj+MfWtMsDWmxMv96v3koAY=
X-Google-Smtp-Source: APiQypJVHkTRD6jE+X4HM94IqWNLW18eKhkRkMnN4hXv/J7+Pgr/zOGNsP2pZy6ti57VAKaPibVmJg==
X-Received: by 2002:a05:651c:326:: with SMTP id b6mr956990ljp.259.1588664987807;
        Tue, 05 May 2020 00:49:47 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id h28sm1089031lfe.80.2020.05.05.00.49.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 May 2020 00:49:46 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
In-Reply-To: <20200426130751.32556-1-peter.chen@nxp.com>
References: <20200426130751.32556-1-peter.chen@nxp.com>
Date:   Tue, 05 May 2020 10:49:42 +0300
Message-ID: <87368ebz3d.fsf@kernel.org>
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

Peter Chen <peter.chen@nxp.com> writes:
> Each setup stage will prepare status stage at cdns3_ep0_setup_phase,

care to explain this a little better? The controller itself will produce
the status stage?

Usually, the way this works is that SETUP stage must be *always*
prepared by the SW while STATUS stage is prepared on-demand, after we
get an interrupt from the controller.

Also, I see a possible bug in cdns3_ep0_setup_phase():

	if (result < 0)
		cdns3_ep0_complete_setup(priv_dev, 1, 1);
	else if (priv_dev->ep0_stage =3D=3D CDNS3_STATUS_STAGE)
		cdns3_ep0_complete_setup(priv_dev, 0, 1);

What happens here if result is 0 but ep0_state !=3D CNDS3_STATUS_STAGE?
Seems like you should have a "stall and restart" somewhere here as a
default fallback.

> it doesn't need to add extra status stage for test mode handling,
> otherwise, the controller can't enter the test mode. Through the Lecroy
> bus analyzer log, the controller will always wait status stage
> even it is prepared by software later than the test mode is set
> by software. If we comment out the status stage at cdns3_ep0_setup_phase,

It seems that what you're trying to say here is that the controller will
enter test mode only after STATUS stage completes even though SW has
already enabled the relevant bits in the register. Is that a correct
read of your sentence?

Is this backed by documentation or is this something that just happens
to work? Pawell, can you confirm that this is the correct programming
model?

The way this usually works is that SW must ensure that Test Mode is only
entered after STATUS stage has completed. If this controller works
differently, then we should update the comment (rather than removing it)
and put a reference to documentation section which describes this very
fact.

> the controller will not enter test mode even the test mode is set
> beforehand.

Sorry for being skeptical, but thinking from a HW design perspective,
this would mean that HW would latch Test Mode bits and only, actually,
operate on them after completion of STATUS stage. This means that HW
should have an internal "status_stage_completed" flag which gets ANDed
with another "must_enter_test_mode" internal flag, then only if both
conditions are true, will HW read back Test Mode number from the
register file and enter correct test mode.

Is this working against USBCV? What about LeCroy's compliance suite?

cheers

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6xGpYACgkQzL64meEa
mQaxfA/+PD2tgdMibwwTtZtFiEwR1hffUlPFuKEgFOXWMB2DrJeDtZY7cKl67B1D
eXnvNDfjNrGa5kBdNn8KgEjpUGUQtCqCKt80O6Z5S3RpUQDDXArVjwrkmVrVZlmA
0XmILvEMR3cjg1IKonIwcEea7p0DoE6Ab9deXY7ShlCdRu3U12Iy5MPN+U0GM6Bu
T8Qzf18kgXhxvKOptHUyiVLaGTgEH2889vtGB36DD30P8FgxYToovHLcn5RfvWv/
kW4OLrzY+d7OgmNINjXCx3x49/GW2SvRy69IKOd1Ma5nk0IH55zvnLtO5odBJMoa
XvfSoOKqq6lilK6lu4M2asRZVJl8CAG04RovF0KD6R20Ft8ljEL1fEJfjDu4qxkf
92hA3RvcLCIJRL0aokVlx6f+KWJWVgzk4dPBEc5j22XA5GGQX8STLsH4dFRUxsVt
WCw/PiYj7tRfjCSqac1QLPgJvaoutjWQue8H3oQ4/YZk6IpBOSKBmaTM1VnO6vRN
M3OPp9AnJU7Xa1CXX9Q+V0D/ctyUEWOPPJYICw40J9U2fu8IGN+FIOGxAwGGrMha
9tmzaBRDEnasZUaGAJFqnqe4SRIZKhG/CgJEyOqx8s5u2hMxvQPwdY6wGQ28G5tQ
MBoAQznZTym8d2j09BdVzs8c4PnsBFAa2QUQgfQGGKKHNxQOdOA=
=rNiI
-----END PGP SIGNATURE-----
--=-=-=--
