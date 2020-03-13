Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83635184927
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2020 15:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgCMOU2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Mar 2020 10:20:28 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44204 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgCMOU2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Mar 2020 10:20:28 -0400
Received: by mail-lf1-f65.google.com with SMTP id b186so7927151lfg.11
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2020 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=L2fxLaKNR8vxIfdaMQAXxcw9TQsEwAJnc8HeWq/wnyU=;
        b=eWDoztnAVZEyKUjMde8/JwS2skePNWutyb81g2YVxRYrGQLbhnVeMKrvzAswy8xO5m
         FL4IVmsTo06buNdL4NRlIUl2LioTDnCbtWC95F83dJnjPIbCuieS7NHUFzFGnbKCemxg
         q2j9hv1pUP07+dbGU5uxEZNpc4FMZoPzTRIdcIpLHYrF6FKgxRR0ZqkuWNrg/IOJy5G1
         TjY5DmRtcCSaq6QHFMEvaUmK+Uk8jpG5/tM+86crWxoxLAqHJYX8XkajvCv/rkuKueEg
         sUvFtvIv7XTiilEc3HitXsiS7hvvHWrYw7sHOuEtdYHt5bWohG/JjSFU3abJHnVHgRJg
         0oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=L2fxLaKNR8vxIfdaMQAXxcw9TQsEwAJnc8HeWq/wnyU=;
        b=dIEuA1Q4hiQRLnQ0Y9Rsy2qJHJ/Zo/pbTh2gRB45luWpnzhuwP2HhCaYDTbHZ69Tzb
         bhVJohJLwC2e87ZENIvrlhOe/LCnEQ2kdEOP8JSEQmkm6YjBaeQXG8awQXvLUsdZmwl6
         V2LkMhEDbVkSfRKVG/19asGgbQn0iV/ADPxVTUvzZDf1VeH5yp5vUVU2+6gQ2a7t7WWI
         09E77a9slcQW6T2RlEIHzv64Hw8Nk2LFeBQzJt8nyA+SjxwRUD4PJ7wqVbqMKDcafFYq
         IfAEGsw6gz1lo92jIWthnmpQovyFXtCaxcM6fASLqcOhFBlmeOZKF+SXUXmYleZh8DSR
         MQbg==
X-Gm-Message-State: ANhLgQ1EOscaTjXyhgehlGG+ixgwT2oMaaVQcFOMm1b6tjHzdZHg8z9D
        nzMDW+5au5/6Hx47N+Cvmv8=
X-Google-Smtp-Source: ADFU+vtzcFcI159AESDUKvWbLyjZOBfJehZem+jpPW8frKdE1dFgLYMIirHZvPREJ8bAy2LsGBos7A==
X-Received: by 2002:ac2:5c5d:: with SMTP id s29mr8577754lfp.191.1584109225944;
        Fri, 13 Mar 2020 07:20:25 -0700 (PDT)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id p19sm1927874lfh.72.2020.03.13.07.20.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:20:24 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/3] usb: dwc3: gadget: Properly handle failed kick_transfer
In-Reply-To: <015470a7d9b950df757b1abfecd6ef398ef04710.1584065705.git.thinhn@synopsys.com>
References: <cover.1584065705.git.thinhn@synopsys.com> <015470a7d9b950df757b1abfecd6ef398ef04710.1584065705.git.thinhn@synopsys.com>
Date:   Fri, 13 Mar 2020 16:20:20 +0200
Message-ID: <874kusgwuz.fsf@kernel.org>
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


Hi Thinh,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> If dwc3 fails to issue START_TRANSFER/UPDATE_TRANSFER command, then we
> should properly end an active transfer and give back all the started
> requests. However if it's for an isoc endpoint, the failure maybe due to
> bus-expiry status. In this case, don't give back the requests and wait
> for the next retry.
>
> Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>

could you give some details regarding when does this happen?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5rlqQACgkQzL64meEa
mQZp+A/7B2zQel5+XrAjdrFDQRvXwSBJcdMQWfoAYTsK8aly6UMMUJQDqTQDavOA
KlG6O13kHhD7AS0lfInunnpDPZqKzGZNTelSt68/WWOqrIBuA3uPB91UElvQ88Kv
Fst5C4nkPUJkFT0koUkSL5c/FEQ2lckA/EikkCUrZThE/LrdNTSlJ+OguP0T6Fso
Em7Mhw6t4pYaVRslcV3+cwV5A1wKPAzuLSrTxyoIximN7YU9B0Q0WfcKYF7X7RNd
EPrOnu438DvW6imQ7KAW5j4LdWajw4v7PsiZpRK6/D6it5CYTyCnQiaNzBQh+CKo
9CtlASEItMszi4jtIf0MEeimhJCx0nV5fNtlKacLcUs0QfwVD1tpkIRG9TqaxgE1
tS2L/QqDxRGfP4Dv8e3+IIJc6O0k30J3Zwmsmhpu2hDFX7/+/Xln8DlXjsNLMLQg
C5YgunqHbu7b4ZdEaUZf5yS/NuFzRBRrQG+8/rSNSknJIVeHDm68ehnqdXGxZvML
sfgF1UAcDHZwNYFoTP44cL2idhj5802gguRQwVoc/GuJwuN5uyeaokI5XX2FBgzN
rRipb11rDqElCjmXQGgwEN84zMznv0NpLwV6Y7I5+hnatifRaFq/+Vqhi0UGLB2l
X6sc14WG25Y0WhtagzxQ4qhDUfknZwWmWYJnBUC58wAIHBzyNxw=
=SQv5
-----END PGP SIGNATURE-----
--=-=-=--
