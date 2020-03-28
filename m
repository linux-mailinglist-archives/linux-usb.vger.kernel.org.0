Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFDFE196479
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2020 09:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbgC1IeW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Mar 2020 04:34:22 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:45113 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgC1IeV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Mar 2020 04:34:21 -0400
Received: by mail-lj1-f182.google.com with SMTP id t17so12616423ljc.12
        for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2020 01:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=XVp8ImMiTZOUe1tMGLGkaph+zIseX6YmQWhcbOPx2V0=;
        b=WnlrPIKi5xe8IHJ3vGw4S+LLWDXLJDMOzrIGv8sdiPX/ybYJW9QvGXWR/5aOO9zEJf
         eBL5PqpxQ72wATYf/DEzS4TNUiyd3cBo/t/Jb18nM/XzUMCNWsX4Sgu6D/D3DwbHJikn
         iEt3EQcdRpN0AqHKKqWeFp/rCFbuCZJwjFB7cYo2gUXAO78ss/wb3nRm6m3eIruVuwMx
         pYDL8RzzLKbhIJqcdG5onCl6VhWVrIkk7jRxvO0wH+uloXygTmsGLWwWERPGLKiyO6LZ
         PpTVsnbrDDlswVlGC9BylTjXXdWmucH3EvDloxVNNLAdD3AOrwOatSlAKkckQiWzuDZz
         C15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=XVp8ImMiTZOUe1tMGLGkaph+zIseX6YmQWhcbOPx2V0=;
        b=nTJx6LwCZhqt7fJNTJZJWVYEQ8Sjbu5boaTj1/13SRyPmze04rpOF4BRfZ0Pc6wU4b
         RkSGRntu9yApZXy+0cV2PXjNGceD7qb1i8hJPSa5IeOBtKZU0IR1S3fXRh54GB6gznIH
         cwWz8T3/Bkn3WSNPbesGnUxK86x//Q5lOjD9TnaB+ziHRjsftLeTQNECcZOANLCt1QHQ
         vNr8MVL9XXQTQ8zYTcVlhVLXX/clfXkTrO8t40yy5mZAnkQ9Wbtq79SKptz43W2Ykt8O
         daTTGiiPeNE6VJZYC478zMFDch77FC1qFdj98hNMQsFberO3BpmgcN08nd1Iq+ea6euD
         2Z7A==
X-Gm-Message-State: AGi0Pub35a0AcIaTNwFnwJm9sXZDeSGcO9QkCOlq11MDza5k2mKbs60U
        ViOlHiBsX9YjCFIKREKuyfU=
X-Google-Smtp-Source: APiQypJdhIyyko+1AT02tgLKjfF5k9ZSWtpsUIE/FEOa+5LxKUxAPTF6w/RaZg0aA8hLT9amBzeYBA==
X-Received: by 2002:a2e:95c3:: with SMTP id y3mr1686141ljh.149.1585384458835;
        Sat, 28 Mar 2020 01:34:18 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id f26sm3623158lja.102.2020.03.28.01.34.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Mar 2020 01:34:18 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Sriharsha Allenki <sallenki@codeaurora.org>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: Fwd: [DWC3][Gadget] Question regarding the unmapping of request as part of queue failure
In-Reply-To: <53a4614f-d1bc-5856-8e01-eb790a6ff7fe@codeaurora.org>
References: <0105a5cd-936e-fb08-77bf-c2f1dbf0aeed@codeaurora.org> <53a4614f-d1bc-5856-8e01-eb790a6ff7fe@codeaurora.org>
Date:   Sat, 28 Mar 2020 10:34:13 +0200
Message-ID: <87369skhdm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Sriharsha Allenki <sallenki@codeaurora.org> writes:
> I was looking at the code flow for ep_queue and came across the
> following piece of code.
>
> __dwc3_gadget_kick_transfer {
> =C2=A0
> =C2=A0=C2=A0=C2=A0 dwc3_prepare_trbs(dep);
> =C2=A0=C2=A0=C2=A0 req =3D next_request(&dep->started_list);
> =C2=A0=C2=A0=C2=A0 if (!req) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dep->f=
lags |=3D DWC3_EP_PENDING_REQUEST;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=
 0;
> =C2=A0=C2=A0=C2=A0 }
> }
>
> As part of dwc3_prepare_trbs(dep), we get a request from the pending_list
> and queue to the tail of the started_list. But here we get the head of
> the started_list, now if there is any failure in issuing UPDATE_TRANSFER
> to the core, we unmap this request using "dwc3_gadget_del_and_unmap_reque=
st".
>
> But if this kick_transfer was part of the ep_queue and we have failed
> to issue update transfer, instead of unmapping the request we are trying
> to queue, we will be unmapping a different request (first in the started_=
list)
> which the core could have already started processing. I believe we should=
 unmap
> the request we are trying to queue but not any other.

no, we have to start requests in order and dequeue them in order as
well. There's no way to verify that the request is already processed by
the HW, other than checking HWO bit which is set during
dwc3_prepare_trbs(). This is a HW-SW race condition that we can't really
fix.

It is minimized, however, by the fact that, at least for non-isoc
endpoints, we use No Status Update Transfer commands, which means the
command can't fail.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5/DAYACgkQzL64meEa
mQZx6BAApVnaTu/iYkLk4ry8q67pBVl/0Ppo3hBsS3PBL+4KEZXREz67Af1ZZNlt
3MMIiia2/6ZPgeWTuzRn6gqxqPL6deEBHPppIauWNZZFhKDp7TcAJubWiu6DHu5S
bQxUpr14P7AE5/l5+E71zdRLpxot9LoeCId0CMhrGajmSfFQDkvL4fMVEjQAn9+t
NPKKJzREOYdbcOX9mMUDi5Dd+wNoe/3PxM8XSmkqtfqoFgBUWNTH1UaV6awxGOyb
eoJ8Naz65pWn2TIE6e4+IrTZNC4yPP4hm97jW/wuVywdEzNN5EMcSz3SPOYCidgX
4XTyr1o6afUsylD8fU5SJNoD7IJ6mWzcBUEkjfy2Feq5sbXFHvhA1Hmd/o5zibAv
gGXaY+xU+FtL1uXt6yNXVOwyd4gyFJxNoN8o2LYmY3LixqYWHdLeCOrih1lZplXu
n/CM8XH43vg+AdF06DooYhXQQqN6BIgV9fQdvwyI/3Pw85y6LBj5naofl/IGGG3U
cZgnZodTvIgFlO/9/H/dGF+W1JWsasCbD23okOzCBT+gtVprOcJDmddSf4P2rvR0
vnWXwFd0m0b4jcB0S4o0Afzdc08OHLXI0NF5/GX41CvtW11KzllFlHMT/L+q/s/L
R+fJIdPq4E/2qOgFA3Gbk+to0PYuiQtBnZruquyuI3viH4B0zNY=
=/Xs5
-----END PGP SIGNATURE-----
--=-=-=--
