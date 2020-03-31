Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B765C198E0C
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 10:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgCaIM6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 04:12:58 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45941 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgCaIM6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 04:12:58 -0400
Received: by mail-lj1-f194.google.com with SMTP id t17so21041396ljc.12
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2020 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=60DeUVm6w/hMnq9VSvVI+GJRi0KZGSBj1VOotuaJzHw=;
        b=E+xlBUJ8+7vLiImuKw0ZslymJ1ksn/U7W2rckrEwrFUu4QuaVfGGFHWy5juV0gEzHM
         6mn74iLJH26G8li6DPvfzBB9Q7Wu6y5Uzo0cMMPqHSrD603Tka9iEUFWkGGl3RdXCja4
         FxXqQf0pS/gOdACqk9NmpJfYzGxk38RIqw3c15sLRbzYe+4mTO5BDWbAbV5oGTbTZu9H
         ee1eFbMrlDx0Dfbxlv2R8N8eaCIQt7jKY8d8axfOy4MAD0+Pq9ngsOL44lbjlb6VqA8u
         5sqnh6C5UuytesKOunnnlV9y+uL8yB+wVmo7wIVHmOBqL16L7LNTacVLQTyoHk1kUuHf
         pFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=60DeUVm6w/hMnq9VSvVI+GJRi0KZGSBj1VOotuaJzHw=;
        b=DsS83q4aHp0bLqQ34moKX293bxPyA4sB/bxC+U8B3u+h1a6i4ktlaQfcBn715yReiC
         802d9l+sfzokRChHSQGHU+P4W5mKXkIkIl1GRycQgaSC7EeiwsQ3quk13l5uBkgn/S2k
         bGeZOA//oFgBiBG9EUz+pStrdQr6QcFKEdm7G2BvAvLvia9n03jbHjW/VEm7Rb+t5ta4
         9DOTTgKTneJvZUv0Vc/ClIL8d01WQ7KSO6U/fNcajwefrs9RUyTUP7dLR/khmLjo68Vv
         YjKFhITJv75kBj6LUaklZXbK7Vr94jpcsVyboyODmfKamrvXMuzJu7hoOLoYvGSeAG3C
         5bCQ==
X-Gm-Message-State: AGi0Pua9Hgy8OE2E3PH3x3IrzXuCPk+Zqvb+d7C/9ECLLeHozBX7tvAB
        QV463Rp1YAckmdVOUWYsSr0=
X-Google-Smtp-Source: APiQypKEuAxaoEWndKePUzOccEbMLvHjA0hVHqv7LpVLLVBKmShCg8kogFh3qg2rIH5WBp5C3XsqbA==
X-Received: by 2002:a2e:3a16:: with SMTP id h22mr8779004lja.81.1585642374357;
        Tue, 31 Mar 2020 01:12:54 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id e4sm3318036lfn.80.2020.03.31.01.12.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 01:12:53 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove incomplete check
In-Reply-To: <804450e5-758c-5ec6-88ae-302c023bf1e3@synopsys.com>
References: <660a74249e64b3b62ca9b394584387baee67a119.1583466150.git.thinhn@synopsys.com> <87d09ef01l.fsf@kernel.org> <df600201-0063-bb5f-19be-ecbeaada37f0@synopsys.com> <87blow239f.fsf@kernel.org> <9a2504a3-6a89-39f2-3a9c-9ee933903d8e@synopsys.com> <87v9mn37vb.fsf@kernel.org> <eca2ea69-89dc-3ccc-b280-c1b080ad263f@synopsys.com> <87bloe2qq3.fsf@kernel.org> <d451b3cd-94e2-13a5-7169-8a87f89fa769@synopsys.com> <87369p34sz.fsf@kernel.org> <804450e5-758c-5ec6-88ae-302c023bf1e3@synopsys.com>
Date:   Tue, 31 Mar 2020 11:12:49 +0300
Message-ID: <87tv250wou.fsf@kernel.org>
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
>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>>>> The condition here is if (!request_complete()), then kick_transfer().
>>>>> Let's take a look at what kick_transfer() do:
>>>>>
>>>>> kick_transfer() will prepare new TRBs and issue START_TRANSFER command
>>>>> or UPDATE_TRANSFER command. The endpoint is already started, and noth=
ing
>>>>> is causing it to end at this point. So it should just be UPDATE_TRANS=
FER
>>>>> command. UPDATE_TRANSFER command tells the controller to update its T=
RB
>>>>> cache because there will be new TRBs prepared for the request.
>>>>>
>>>>> If this is non-SG/non-chained TRB request, then there's only 1 TRB per
>>>>> request for IN endpoints. If that TRB is completed, that means that t=
he
>>>>> request is completed. There's no reason to issue kick_transfer() agai=
n.
>>>> not entirely true for bulk. We never set LST bit; we will never comple=
te
>>>> a transfer, we continually add more TRBs. The reason for this is to
>>>> amortize the cost of adding new transfers to the controller cache befo=
re
>>>> it runs out of TRBs without HWO.
>>> Right, I was referring to "request" rather than transfer (as in a
>>> transfer may have 1 or more requests).
>>>
>>>> How about we change the test to say "if I have non-started TRBs and I'm
>>>> bulk (non-stream) or interrupt endpoint, kick more transfers"?
>>>>
>>>>> When the function driver queues a new request, then there will be new
>>>>> TRBs to prepare and then the driver can kick_transfer() again.
>>>> We may already have more TRBs in the pending list which may not have
>>>> been started before we didn't have free TRBs to use. We just completed=
 a
>>>> TRB, might as well try to use it for more requests.
>>> Yes we can and we should, but we didn't check that. Also it shouldn't be
>>> in the request_complete() check function as they are part of different
>>> requests.
>>>
>>>>> So, this condition to check if request_complete() is only valid for a
>>>>> request with multiple chained TRBs. Since we can only check for IN
>>>>> direction, the chained TRB setup related to OUT direction to fit
>>>>> MaxPacketSize does not apply here. What left is chained TRBs for SG. =
In
>>>> this part is clear now and you're correct. Thanks
>>>>
>>>>> this case, we do want to kick_transfer again. This may happen when we
>>>>> run out of TRBs and we have to wait for available TRBs. When there are
>>>>> available TRBs and still pending SGs, then we want to prepare the rest
>>>>> of the SG entries to finish the request. So kick_transfer() makes sen=
se
>>>>> here.
>>>> Right but we can run out of TRBs even in non-chained case. I remember
>>>> testing this years ago by giving g_mass_storage a list of 300
>>>> requests. The reason for kicking the transfer is different, but it's
>>>> beneficial anyhow.
>>>>
>>> In this case, the check should be for if the pending_list is not empty,
>>> then kick again.
>>>
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index 6a04c9afcab6..d8318de55000 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -2975,14 +2975,7 @@ static int
>>> dwc3_gadget_ep_reclaim_trb_linear(struct dwc3_ep *dep,
>>>
>>>   =C2=A0static bool dwc3_gadget_ep_request_completed(struct dwc3_reques=
t *req)
>>>   =C2=A0{
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * For OUT direction, host m=
ay send less than the setup
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * length. Return true for a=
ll OUT requests.
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!req->direction)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return true;
>>> -
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return req->request.actual =3D=3D=
 req->request.length;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return req->num_pending_sgs =3D=
=3D 0;
>>>   =C2=A0}
>>>
>>>   =C2=A0static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3=
_ep *dep,
>>> @@ -3007,7 +3000,7 @@ static int
>>> dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req->request.actual =3D re=
q->request.length - req->remaining;
>>>
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!dwc3_gadget_ep_reques=
t_completed(req) ||
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req->num_pe=
nding_sgs) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !list_emp=
ty(&dep->pending_list)) {
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 __dwc3_gadget_kick_transfer(dep);
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 goto out;
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>>
>>> This is unlikely to happen, but it's necessary to be there.
>>>
>>> Let me know if you're ok with the change, I'll create a formal patch fo=
r it.
>> Looks good, we may just rename the function to
>> dwc3_gadget_ep_should_continue() or something similar and move the
>> !list_empty() check in there too.
>>
>
> I forgot this condition skips the dwc3_gadget_giveback(). I have to=20
> split it. Let me send out the revised patches and you can review.

Sure, I think patch 1 can go in during -rc. Do we need a Cc stable on
it, though?

Patch 2 will have to wait until v5.8.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6C+4EACgkQzL64meEa
mQZirg/+ILA7ZXsFN2B8+FZZmJgvuDqYdHoA2gLFIdfJKsiR4uer2qURXwC7bPPA
PMJso4Al0PtOL2bhxN+o1lyemoeuO6S5tLYKbwtxqpkV+dp69EoaHu4BQCUgnttt
/nr+T4zCnZi6QEXZIVSFNEINIE3erUeiPsUqyLUK/Y93/BvAnCrHrShAs21hZrsS
4WiahecfHyzXuzS7N2Z6fsPFKpOwOUcU0adqqIh7fxg2sxNSWt9QROzX2792ouoO
Ap5rizAd6q90EMtLZFbyRZHp9AP+uSGNPf39eEhgLprpO5iqMpZ5FK8ruf4tiwYa
9p7K465RpBhwKdVKjZvJqEhCxNo37w62sQh+S0Cnf0M6+u7sOgkV4emJlQWyLV5+
HhgxFVyuMaxNK0oLSI1y+AXuvrLiLXToWmKHVijSzKv9Oz0FN+L79zamk+FlW3Ud
vfedgZKVPKnPwi46pEG2HMEANvu2gB4OKVfBm4Lr/ki3s85sx0g5vk8iUisldPqE
+Vc6wGZcHzwiTnxLeGRI6woTbFJyxPbsxO8N+xips4cHOAAbbNd0BUuqMyUNSBTJ
SXOXJ2+a0ZAGrhQN3AnEviNRNQPr2vBe5yhGoXy4gEoLiUI5+28sQ+P/KfLmvDj8
V6LzCZFSnPb2iT8U6ecksxWi7lpmoasFory20o4qhs9cmdEuMA4=
=5QUt
-----END PGP SIGNATURE-----
--=-=-=--
