Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A534D198699
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 23:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729024AbgC3Vep (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Mar 2020 17:34:45 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40412 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgC3Veo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Mar 2020 17:34:44 -0400
Received: by mail-lj1-f196.google.com with SMTP id 19so19748648ljj.7
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2020 14:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Ltzymk6ud3AUxmA/t4VM4kvvyatrDQRU9OfOPs8RYt8=;
        b=Rlh9h04W0UNiUXoG8bahlbUmcm4yn5EGT/NETSfrDG5iGi5QaLU3v2dbRL5p2yz0VZ
         CWRnuBwsV7yEB5yN7fDS/r5FhBb07hObJijAd1+zAfVx/vtbs/UWJDv9H1lyh82JGT4O
         xiwUsJwVQOA7yBFMmBximuBc1rIYybQb8U2WT4XQyYVlS65XFIy8kJGdehm8WuO1W3k8
         ypLRKoIQBFf5bvRt5lQIDmWhPtXBDqpz9kATE0dierQv5m+kb0V6xSzmAKWO4QYuxNWa
         vMKICMCICDdmirtLxmEUpje1g82mxkLGexyuNmZYrkNSCwrnyZJoQdQp3W4J1mlIgnEo
         PK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=Ltzymk6ud3AUxmA/t4VM4kvvyatrDQRU9OfOPs8RYt8=;
        b=r2Let5et0bHDtx4b7y7l1Sq/sh9e8gosIqZuApgP02IVrCvnyhzrSh6gH5QKF3ds9W
         o3UqF8v563WqhidiaBzW0gFVxib12aSWvvD19duk0H0M8bnkrzVRstxZlldjOO3y3Vk1
         9LV3jvXTP8dgmNPeBF8Ii0k/DEgTr5m+ok52qJEUEyTXQhXYbkQSAtYskDvekUWwxPf+
         OCKAjzRZ1YDpR53G2jn1a+b644OdiOFKcpflst9HmNsKyG5Jo69CLiRxb6ibV84O3rX8
         y2/KJOTNSPUZ2WS3y4Z+MxR9aPx3bxw6wL+jETyLBaUiU3N2dfmXnMuIEfyvkTrfiLbH
         CLeg==
X-Gm-Message-State: AGi0PuYxGAuL2wjWv/wEZBItE9fOHTuj3CJcO5OxggfoucFBpI3wfRLk
        uc6OoPhmXeEtGfL8EL2T2KY=
X-Google-Smtp-Source: APiQypKyuyClLiu7EqGNHf6T5qerIY0dKYp5AOOGL79x1UYHVTSpXiJ+GESd4PaUfYdAug8NYBctTA==
X-Received: by 2002:a2e:3612:: with SMTP id d18mr8230980lja.97.1585604081861;
        Mon, 30 Mar 2020 14:34:41 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id e5sm1495583lfc.5.2020.03.30.14.34.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 14:34:40 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove incomplete check
In-Reply-To: <d451b3cd-94e2-13a5-7169-8a87f89fa769@synopsys.com>
References: <660a74249e64b3b62ca9b394584387baee67a119.1583466150.git.thinhn@synopsys.com> <87d09ef01l.fsf@kernel.org> <df600201-0063-bb5f-19be-ecbeaada37f0@synopsys.com> <87blow239f.fsf@kernel.org> <9a2504a3-6a89-39f2-3a9c-9ee933903d8e@synopsys.com> <87v9mn37vb.fsf@kernel.org> <eca2ea69-89dc-3ccc-b280-c1b080ad263f@synopsys.com> <87bloe2qq3.fsf@kernel.org> <d451b3cd-94e2-13a5-7169-8a87f89fa769@synopsys.com>
Date:   Tue, 31 Mar 2020 00:34:36 +0300
Message-ID: <87369p34sz.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>> The condition here is if (!request_complete()), then kick_transfer().
>>> Let's take a look at what kick_transfer() do:
>>>
>>> kick_transfer() will prepare new TRBs and issue START_TRANSFER command
>>> or UPDATE_TRANSFER command. The endpoint is already started, and nothing
>>> is causing it to end at this point. So it should just be UPDATE_TRANSFER
>>> command. UPDATE_TRANSFER command tells the controller to update its TRB
>>> cache because there will be new TRBs prepared for the request.
>>>
>>> If this is non-SG/non-chained TRB request, then there's only 1 TRB per
>>> request for IN endpoints. If that TRB is completed, that means that the
>>> request is completed. There's no reason to issue kick_transfer() again.
>> not entirely true for bulk. We never set LST bit; we will never complete
>> a transfer, we continually add more TRBs. The reason for this is to
>> amortize the cost of adding new transfers to the controller cache before
>> it runs out of TRBs without HWO.
>
> Right, I was referring to "request" rather than transfer (as in a=20
> transfer may have 1 or more requests).
>
>>
>> How about we change the test to say "if I have non-started TRBs and I'm
>> bulk (non-stream) or interrupt endpoint, kick more transfers"?
>>
>>> When the function driver queues a new request, then there will be new
>>> TRBs to prepare and then the driver can kick_transfer() again.
>> We may already have more TRBs in the pending list which may not have
>> been started before we didn't have free TRBs to use. We just completed a
>> TRB, might as well try to use it for more requests.
>
> Yes we can and we should, but we didn't check that. Also it shouldn't be=
=20
> in the request_complete() check function as they are part of different=20
> requests.
>
>>
>>> So, this condition to check if request_complete() is only valid for a
>>> request with multiple chained TRBs. Since we can only check for IN
>>> direction, the chained TRB setup related to OUT direction to fit
>>> MaxPacketSize does not apply here. What left is chained TRBs for SG. In
>> this part is clear now and you're correct. Thanks
>>
>>> this case, we do want to kick_transfer again. This may happen when we
>>> run out of TRBs and we have to wait for available TRBs. When there are
>>> available TRBs and still pending SGs, then we want to prepare the rest
>>> of the SG entries to finish the request. So kick_transfer() makes sense
>>> here.
>> Right but we can run out of TRBs even in non-chained case. I remember
>> testing this years ago by giving g_mass_storage a list of 300
>> requests. The reason for kicking the transfer is different, but it's
>> beneficial anyhow.
>>
>
> In this case, the check should be for if the pending_list is not empty,=20
> then kick again.
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 6a04c9afcab6..d8318de55000 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2975,14 +2975,7 @@ static int=20
> dwc3_gadget_ep_reclaim_trb_linear(struct dwc3_ep *dep,
>
>  =C2=A0static bool dwc3_gadget_ep_request_completed(struct dwc3_request *=
req)
>  =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * For OUT direction, host may=
 send less than the setup
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * length. Return true for all=
 OUT requests.
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!req->direction)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return true;
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return req->request.actual =3D=3D r=
eq->request.length;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return req->num_pending_sgs =3D=3D =
0;
>  =C2=A0}
>
>  =C2=A0static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep=
 *dep,
> @@ -3007,7 +3000,7 @@ static int=20
> dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req->request.actual =3D req->=
request.length - req->remaining;
>
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!dwc3_gadget_ep_request_c=
ompleted(req) ||
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req->num_pendi=
ng_sgs) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !list_empty=
(&dep->pending_list)) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __dwc3_gadget_kick_transfer(dep);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 goto out;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>
>
> This is unlikely to happen, but it's necessary to be there.
>
> Let me know if you're ok with the change, I'll create a formal patch for =
it.

Looks good, we may just rename the function to
dwc3_gadget_ep_should_continue() or something similar and move the
!list_empty() check in there too.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6CZewACgkQzL64meEa
mQYblg//azw/94amNOHSF+jpWZ4s0wO6rZj+7d+hzbzF0blVpkgu/XqLC6EEsOGE
Q6DHTkXu6vzs6crwVMQUsqS498lld9as2v/hZru4zFLxjuXB1qBntLjqV5Ou36Ds
8EhXVw2+x8Ie4h78Hz1fDvBDp9wajxVmBREQe66Q5xQ6vliWCWfDBNebphT+fTbS
v62lbivsLHHb0jR3MO8Zr20EGULHT1arFFIexEuWGzzore2lsgIZhZOQL+KdvI/A
R4jrGjNRAsns7feU4Do+LMa+K5fpK1Qc408R71/Ny66cZNHgSNsk3GuFNTYJfOTA
OlDWXdJLzEvirRqElZxW0PNAnZFT8deuPxeTqYmv1P4ALoSQ1/NyNdY3tdJXJ8/O
uAskyuU1B1LzMnqfWkla4ZwTeRMgE55OyxiG/WXjzAA9MkGZjUHoYXaXbTy8/zO+
tpSauIOFDVVBSKOT8keTfg0FLvTtYLAiisjKUtlmBfMRXjsA29MNw31X+9xtaAmb
d41S/tkQNPBAs9CUlNpmRVzfGwloDKwP7ZoUjneWqzKnAoVxIsh1A0IvJHOy1inr
TXtnsK3w9JKsPHJUcK1frnUAR4DHeJn3NbPl864mdBfOz5HY59lZMqBg84PUj3yI
rd3YZJYTMmf8TGt3DkxUYLawe+hf3f8JczjNpHkRGE0o33nwTmQ=
=a/2T
-----END PGP SIGNATURE-----
--=-=-=--
