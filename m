Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 760E91D49BA
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 11:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbgEOJfk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 05:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728015AbgEOJfk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 05:35:40 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4508DC061A0C
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2020 02:35:39 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id d21so1495876ljg.9
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2020 02:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=iXhF7D1hPO4XXnmzrJ0OP8MEf9xy7u4HVEnxVVE4nTY=;
        b=thAt7z5Wbgv/47GN24I/S2K+5hA8T9d6TuhxfCVc4aOisUWOwevWm+7EDBp76xtGnu
         eX27PpLVwNyZepgHvMAXLH2IcRdovi6W7A9rayowkKKJowdIDS5lBHKIwBGhhiWSvvFD
         hr3mOzaCabYmGmW8znZbacjSJg5WwRtR4TasubjwvFCH3oR9VuvOAFboTbLo6YaU3Qtj
         GdyCmrY6RVfODGSAHTxeBaYrAR55xsPx+4Dr09K4hXv8FeovQ2wo4clcTQbVkUD5AuWL
         Tmcwxk6yNEyy5TXykKkYUO4O2+DStoUTxppsNCbIwmwQICgzn5QJJGIPUQnIpiCOqqQD
         +wnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=iXhF7D1hPO4XXnmzrJ0OP8MEf9xy7u4HVEnxVVE4nTY=;
        b=rOtt3T+1yEWXfotWyG4oY3zuTCprkr2dwsRRJcNKQNDIdbl70fIOTWNNRnI38FM2H6
         NGSgmWDJQ1g7Qvb9jBpmaQ88hhA0jsB2MtioBVpj7ovyQJBbqiYIfaWlzXLo2zppwfY0
         eVud3/PUKbqqXT0ZNw9ex1YMnfLWN938oqvq2MdQIBDxFnoFEiEqqs4kUEhOcm7O2OKi
         eCTagEjc72EV5NSRa1oYlUsO76T1UfTP+MoK0RzRg1VaFkkJMsAYWjQhV2Pus3uyDOKU
         hA2GR7k7rdeCFfha2fg0xFsLKGpmC6QmP08PsT+qqrB9vYCzrGpv6nvUo0CasL5cP3sy
         nMig==
X-Gm-Message-State: AOAM5303vubjjX9xNMHMV1knxzW+nEzBe2Tcyt9LfbbQj1qwZZBCxz72
        1x0KqvRGyH13pXyzQzSvc7s=
X-Google-Smtp-Source: ABdhPJx6tyX90qivR6R8T1HcbunEbbTWyyChSDOCN3Ws33RVSaKb5KPEvEx1pSIACQaZRuQxIjQcng==
X-Received: by 2002:a2e:6a08:: with SMTP id f8mr1810954ljc.8.1589535337609;
        Fri, 15 May 2020 02:35:37 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id r20sm856488ljj.44.2020.05.15.02.35.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 02:35:36 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        USB list <linux-usb@vger.kernel.org>, linux-imx@nxp.com,
        pawell@cadence.com, rogerq@ti.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jun.li@nxp.com
Subject: Re: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
In-Reply-To: <CAL411-q4euWFrJ5Sp+tocBEsXXYkviQXt_pz_SyHHC=ELNf_sQ@mail.gmail.com>
References: <20200426130751.32556-1-peter.chen@nxp.com> <87368ebz3d.fsf@kernel.org> <CAL411-q4euWFrJ5Sp+tocBEsXXYkviQXt_pz_SyHHC=ELNf_sQ@mail.gmail.com>
Date:   Fri, 15 May 2020 12:35:32 +0300
Message-ID: <87ftc135i3.fsf@kernel.org>
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

Peter Chen <hzpeterchen@gmail.com> writes:
> It seems the yesterday's reply from nxp email account is blocked by ML.
> Send it again.
>
>>
>> Peter Chen <peter.chen@nxp.com> writes:
>> > Each setup stage will prepare status stage at cdns3_ep0_setup_phase,
>>
>> care to explain this a little better? The controller itself will produce
>> the status stage?
>>
>
> Unlike the other controllers, the CDNS3 does not need to prepare TD
> for status stage,
> it only needs to write register bits EP_CMD.REQ_CMPL to tell the
> controller the request
> service is completed, and the controller itself will send ACK answer
> for the Status Stage after that.
> The code sequence like below:
>
> cdns3_ep0_setup_phase -> cdns3_ep0_complete_setup ->
>             writel((send_erdy ? EP_CMD_ERDY : 0) | EP_CMD_REQ_CMPL,
>                    &priv_dev->regs->ep_cmd);

got it.

>> Usually, the way this works is that SETUP stage must be *always*
>> prepared by the SW while STATUS stage is prepared on-demand, after we
>> get an interrupt from the controller.
>>
>> Also, I see a possible bug in cdns3_ep0_setup_phase():
>>
>>         if (result < 0)
>>                 cdns3_ep0_complete_setup(priv_dev, 1, 1);
>>         else if (priv_dev->ep0_stage =3D=3D CDNS3_STATUS_STAGE)
>>                 cdns3_ep0_complete_setup(priv_dev, 0, 1);
>>
>> What happens here if result is 0 but ep0_state !=3D CNDS3_STATUS_STAGE?
>> Seems like you should have a "stall and restart" somewhere here as a
>> default fallback.
>>
>
> At cdns3_ep0_setup_phase, the status will be CDNS3_DATA_STAGE
> or CDNS3_STATUS_STAGE according to if there is a data stage.
> If there is a data stage, it will inform of controller ACKing the status
> stage after data stage has finished, it is at: ep0.c,
> cdns3_transfer_completed->cdns3_ep0_complete_setup
>
> But I don't know why it needs to send ERDY for ep0 transfer without
> data stage, but do need for ep0 transfer with data stage. Maybe Pawel
> could explain it. At spec, it only says below for ERDY:

Would be good, indeed. Pawel?

>> Is this backed by documentation or is this something that just happens
>> to work? Pawell, can you confirm that this is the correct programming
>> model?
>>
>
> No documentation, maybe Pawel could confirm with designer.

yeah, Pawel?

>> Is this working against USBCV? What about LeCroy's compliance suite?
>>
>
> For NXP USB certification flow:
>
> The test mode is only used for USB2 electrical test (eg, Eye diagram),
> The HSETT tool is used for device mode which will send command
> from Windows PC to let device enter test mode.
>
> USBCV is used to test protocol level, like USB CH9, Mass Storage protocol
> etc.

Entering test modes is part of chapter9 tests, IIRC.

> For Lecroy's compliance suite, we usually use it for Link test for
> USB3.

You need to run the HS compliance suite ;-) USB3 devices must still
comply with HS/FS/LS.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6+YmQACgkQzL64meEa
mQZovA//aksI3VNEN6VRgifFN7NWHo9dF4JQmEbeYg88jZ+DajMBgVZIjkpb8jl+
2LKepgkCrSkNbuQf+0pu83eC3LQljLZ/4Ad6mFwZ8+VcjiqFSbD0Dva5vBf0BwTj
5AsJijd+gF0mXGbkc7F10pfzN/6mBfIOk0mCSRPfpRs9fvX05qbJ2llbRVOeBrQu
AAO5i1MF0Jk6pwQdTrQG+UwtnYIb8SxYEPcgakavvtS1JCgrxeHMyAKTuFo0xs3g
0boalqgXe1ynHzgbtKwjEuRFQE/BGMdW8yhUkxEkD2Zu0NrXZ0T8Qa3K35zb2oFb
IzjDTvaH5hM5a8oa26idsdcG8uaCkwuAAJ01+ilkcdSvhHxPAgt5NOd+YgzGe9gn
k3bQk7quGtEasbI+zKY0/+BjF0OP4xLVEzO6gY7+EWmnZQL5SpL8nqokSxJmUfGf
dmy9XIzuEc2atP4c4lptScIdit8nu+XeWpMELID5Dl0mOIxPZ6VwwLYjn+Bo0TyS
cM1FBBRGG2A8hmByvgBc/+c8J1+PRUXGJlJSFC+m/3BKlye/Gu3n7hc5ddj9gckr
W101sYfDORah49BmS6dYvR72n8/omFRjxuMv2GgQafQINfyBRPR5SW82F+QUG7C1
WBD/pWU4R79z4ubYJql8grxUQgyRtYUlzdgJF0a2JIYQcjcMZPU=
=/JR2
-----END PGP SIGNATURE-----
--=-=-=--
