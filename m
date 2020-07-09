Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAF42198D3
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 08:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbgGIGpW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 02:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgGIGpV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jul 2020 02:45:21 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD29C061A0B
        for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2020 23:45:21 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id b25so1109526ljp.6
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 23:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=zLbwuh7A7ACHut9XFRi686IRuex/0nXPFXYKWuVthgk=;
        b=d4j//XWShb4xOWCzbC6bCfeQaLXCVmH0ed8KI/ztyLvwnYjjHXGDS+MulSElnFuqB2
         3VlxJqnJESZpujKW0n7r0H1Fiib3qsebv+BQz+7aNwsHjV8pqf1bSLi+MwbJFUvi1Fcx
         T4LUnsgz4Ta+WrKyRwEDgdW7Gi6gz5PpuV6WLBBHeoOsIX9vcw6JPxAZkIfCMsNr9UTd
         ssAmAIA7lsNvQ9ZfKmlfdMVnX8LASFJ1lAuXdqPIxjFIusbFr4sSmZ8fM0RzBA3lWKnh
         ghyR6ROkkNCpN4AWAdxP6thGQ/CF+vItjjtwxtMu4wZKRcc5+P/IIyAXq/SWFw7pDdQn
         NZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=zLbwuh7A7ACHut9XFRi686IRuex/0nXPFXYKWuVthgk=;
        b=HdQMOFAEK24PjUVKcXjIbzfKZm8V4OSlKvtcoWFYu61SIqwOK6EbhL5PlpHeCH/A2q
         oZjyDJMZ3zZJFCRR1XMAFdZ5iDhW3FkmqHMD3zp5i2MRLyxq4K5ziUXE/GqoWDsaaSmv
         wU6ohHDCCZNWqsStPuNqBIZ8TvCJ+/drnHeV17ztX25oNnXeq4v4+VOJs28c6nIY96+X
         grGFWBT4AU+xIGZcTba0z7Eyye260nyrpP/6DKoHEalYQT84l2rFLW4ErColINW/AKW4
         QMMvnaeDoZ5QOYLruxojkMsYuo/i/n+jN+o02jx1wX4su+zI8wC7JDEskjudPj3HSU4Y
         t2hQ==
X-Gm-Message-State: AOAM530NIBRoFeRywDXMFgb57ng+tI2kE0AWlNiw/zqSOjedx/OPrU7Z
        PAhUpz73M/zxPyacXzN7rTc=
X-Google-Smtp-Source: ABdhPJyF5PEYDT3QiAkhXbM3iuCcqcqMeC4bzPb5yfY2v+gqQwAN94iT18sz/Q8jHJyZZQ6In6wpPg==
X-Received: by 2002:a2e:9907:: with SMTP id v7mr15155403lji.347.1594277119701;
        Wed, 08 Jul 2020 23:45:19 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id 23sm603382lff.91.2020.07.08.23.45.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 23:45:19 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 1/3] usb: cdns3: ep0: fix some endian issues
In-Reply-To: <20200603065356.14124-2-peter.chen@nxp.com>
References: <20200603065356.14124-1-peter.chen@nxp.com> <20200603065356.14124-2-peter.chen@nxp.com>
Date:   Thu, 09 Jul 2020 09:45:14 +0300
Message-ID: <87fta16vb9.fsf@kernel.org>
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

Peter Chen <peter.chen@nxp.com> writes:

> It is found by sparse.
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

Fixes?
Cc stable?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8GvPoACgkQzL64meEa
mQa9xhAAqkfCyDoVvjrtuNpQ1/Agt00jcFMqExQrvV/M/zTwHmkjmkEfqSUtf0mB
MFWsv4U6hAd0EHWgE5IzxRYNsnO2vwWNKp12aOYBFRnzzPJOLB6yOY1xF1qvvOTK
ddNtCltRwZE9d5pmJwm7wzPNxCmtg8V2WVXLfAGhE+qQgTJB2L9VA+Achok2rREA
ab+qzg2TNg4Bu+OeUyqoZAdg11Dm2EtBmznkyQ916lKhUTxvufOuBArAYmo/6RtA
lIs0s8LV04yEjWPoKhJSo0Cde+Re9QfmmM/GqnK0Wnj74WbUR5DxL29IFocxo1Rc
NoVEAIYl5xISpUHuxR8qAwx0K3d4jrpilYu/tbIHpL8U4JOCcwvRYV793sUmeOMm
EOxLrQklIjoUO6tnsonfIuPidaoj/3j5HIxdz64p5UAFcJh6RDM9UAbhDh0JgNU1
JRTe/ea9fDeO7BzEa8Fyf5lRw9FFohqxOPXYARNnsvuQlXa1uYGA9bM1A5Ko0bsm
fit0z0iXdTFIDxY9JX1KGI/5q4WnXVHtHKdNIbxopDLza4E9/ZdKB+HJu6ZcL1Kg
qR6HCuifLFwgzAfexWWb+3c6cCpIErHIIW15nzrkmAuapeBzhYdzHXKslgG1gB1f
x74EvviHM2oTpZYvWWsmwkhnxQ15GLu5TGhRkX+0EzKNzIlHJ60=
=D1MV
-----END PGP SIGNATURE-----
--=-=-=--
