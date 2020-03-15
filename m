Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E31C1185B6C
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 10:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbgCOJ0b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 05:26:31 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46028 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgCOJ0b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 05:26:31 -0400
Received: by mail-lf1-f65.google.com with SMTP id b13so11429267lfb.12
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2020 02:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=t1zt08mBfit5vL9XPuWnVH4jvHcmSRnToQancRskow0=;
        b=u1ZJGiM7aaZkbQnkeEr/4Kx6ZCdBHhA3KrsLupisoF1xAaHvgs3VYBwAFKFqM5JcV+
         eqvrvFwZuGJYKPIPhKLDtXRhmXTga5XDI4rVyDEeB1inbv4NuGRtIz1rQXtts/1EIsRi
         p3vcCHf7WQSt0AqvRQh/KzFOJ9xpeBWJe9XFU9ofT8iqzIAiHdkNCmSNFJ8SlmYoWAZr
         SjtgnXgp3EqKWst7fRL/aewYiypx9TpSQECvG0Y3Gy1nFVnG8HWyt7w3SFFpSgaBFzIb
         CU926EJoM6XGOjM/6vKU9dkAnRNk5efnbtdbt9d7SkkmhrBfZOLonhCCWyOdXwiccHGI
         jsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=t1zt08mBfit5vL9XPuWnVH4jvHcmSRnToQancRskow0=;
        b=h0MDIrqXDbr41oy8XwdQAOlDxlj2nNrOr9YyaoVKudJwui6EXaW9L2fOkfdv2rhKSp
         Tz+Gd+VeIGXuzw7DaGGaEPvj4wgvPk8HNUw8PXq+UuIpR4KKvb9xwNZFBPAApmDSDTkz
         CyIen3vRRpkWNHrS/TkRNO2jH6RQwyvL77wV22XE88xze/JITiVIyqWI98JtUdcqEPFu
         yhLFcCNlNVHLTH8iAfJqNPy9heje1k2ua8MG0cILxaAAUPXRdVn3ba8D1ffEOF3PO4V/
         5Dr1syRPbVglw3qVEVmiN8A6EjUfl6VVP6gAEijyMW0ILN6ZjdQf8cFXNPgE2UTKyfmT
         damg==
X-Gm-Message-State: ANhLgQ3Rus/InFhczCh2UWg2ewPUIVngeR8jAvInwf05gVvrL+EiDilT
        VVf6PZ/Z6J4IspSb/hf3nTEMemsyHsn/Eg==
X-Google-Smtp-Source: ADFU+vtMImgV5ky5AN5pToBEl3EKkIS6fEQwZ75nOof5OPFz5UZlHNMRBImFBsrszazcWDKnYSoT6Q==
X-Received: by 2002:a19:fc12:: with SMTP id a18mr1059257lfi.117.1584264388975;
        Sun, 15 Mar 2020 02:26:28 -0700 (PDT)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id m15sm6247917ljo.8.2020.03.15.02.26.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 02:26:28 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 6/6] usb: dwc3: gadget: Refactor dwc3_gadget_ep_dequeue
In-Reply-To: <17318e194eea91aca59a1965967f953a55629d1e.1583443184.git.thinhn@synopsys.com>
References: <cover.1583443184.git.thinhn@synopsys.com> <17318e194eea91aca59a1965967f953a55629d1e.1583443184.git.thinhn@synopsys.com>
Date:   Sun, 15 Mar 2020 11:26:23 +0200
Message-ID: <874kuqezpc.fsf@kernel.org>
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

> The flow from function dwc3_gadget_ep_dequeue() is not easy to follow.
> Refactor it for easier read. No functional change in this commit.
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>

doesn't apply:

checking file drivers/usb/dwc3/gadget.c
Hunk #1 FAILED at 1555.
Hunk #2 FAILED at 1581.
2 out of 2 hunks FAILED

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5t9L8ACgkQzL64meEa
mQZCvA/9HQyGXXstE0rcxLVQMw3qcZV/a3LzDCkBMBEcM5OBsX4YrmiAEbV8C6Yy
+6EuIem/w9CCJk1NPBYZTwNMUSJsEvMO4P+gEKJ0Ql8kbotniX1sMV2AsHdjKMbG
11wHTDf6MUr5XDIb7EQJAKurErM1q4HurvLbz/wt7Mi4LY9sSaf4smR5Ev4HZgSE
Zkgd8z09JAqknsGpYqwObEJFxuKPjEZf7ZmSAhg2BT7PsxqYqjC3Qdg6aPyJ5Ky1
UeLCqq3cR9OpgMz/+2N9ZdKxslFxpwJ3pzIvAi+wzf1oOi4lxfoRJt3bleNqhCt8
6iqkUKKRxh3KR3OW+Ii7PIDoHCH1z3ZLpwPOgszdvlJ6hcuonbbfStAiAxMFeipZ
O5gBp7Y3UgX2CDcS0JdaSUWadix19hNpEiaq/rCuDmSyhR/D0IoVaXuLK3xeMpoW
PUuNwkSTXTAl44krEZ4gZIN7hC5xDL/d5unC3uLi+H7k+VP7Je2ODCmH5tZ1r+iR
vGLCZxqlEuVIGRl3kO4P/UZwcMBUE6oJfO52VtD3XjWNEJShckoFxwuANdUnySqq
uDj2u0gt8HQhsmcwCCwLBW0cull+QeOCZkhAzsaSluyEt+cuPc0P0XDkP4UrX0Os
oqz2OZuYRPaqJG/cIqePfNQUFeCQXUD0JuGYEgdhTEvNCAC0MSY=
=8sUo
-----END PGP SIGNATURE-----
--=-=-=--
