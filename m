Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9A29197665
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 10:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729631AbgC3I0g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Mar 2020 04:26:36 -0400
Received: from mail-lf1-f41.google.com ([209.85.167.41]:40479 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729594AbgC3I0g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Mar 2020 04:26:36 -0400
Received: by mail-lf1-f41.google.com with SMTP id j17so13365014lfe.7
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2020 01:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=LA8PyarAulLibE/NfYJ79zdHHf5d4PEzlPNSuWbQb10=;
        b=OlWhC1TlCb9nPgsdxO+lG75NiGLuRB0OppiXRRHr+GZxI6FxlPG7bJgCfQG7Bs4lRZ
         R2T6zNXqHTQoyLydKygUWYLqzZBQUy+W2Eg/YWIOxuug+kP/nTghoBwZSoJ9id4/BkOR
         zDU5JIf9MSWxBnzLHBuG1f8e20Lckqsi/x+ki5u+oOAlvoh4rf/3kGNvlCm+IalJ4LsY
         NQZytK6QbAdbcpziS2V8drW+Ip6nV211X1g7d770n2TBHuQWzVX86I9ckmkk7SzRTqEn
         idpTsCJmb6C9+BIyofyGMmGKvZIIdDXMulggnFVe/oQT7eetKe8jCLRcsE1QQ5QMjh4b
         0eXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=LA8PyarAulLibE/NfYJ79zdHHf5d4PEzlPNSuWbQb10=;
        b=VhgQ/JLuT1413w+B5PA3+/YfGaAxPB7UYAVqsY1e+sUeEIVRtJ0LYKcNxKRb3N7MjW
         tGCEls2BPwKoVaCyT0mGnsAA+gJF+ETnaYQ0tjAZGZA/lvSPzVsYR9AiFgh23Cdu+fkG
         H+5Gpi5w+YpUekft072pORUaqXKZKYV4ULNZOsW3p+87EZQwGZLG98cxm7vhgr2+J+GL
         vw7uCvZbdohEA2ERFWyfDH+kC7juz4ZEvP5yR05kfJB3B/F/UtevjKiyIXSqva4g8Nr6
         YK3pR8c8b2zX783XsNIZZxbgI4fAsja3h/PMbXUTncOoZRIaMINftFHuBstah5CLnaEl
         GfbQ==
X-Gm-Message-State: AGi0PubQSnM2kR/B6thWls3Iw4yA4hpcvAQ/y/HvSRhyzh2ZHB0JDKhB
        sSvVPNUPG65SJptPLuBN6ghZjdYbY30=
X-Google-Smtp-Source: APiQypL1ZjM8Cbq4k2gExhLS49U2KLoMHxRza0K8MwbdcK6RlaL39RDH86l6UPqLb5scsRtAZu48mg==
X-Received: by 2002:a19:22cf:: with SMTP id i198mr7498823lfi.199.1585556793154;
        Mon, 30 Mar 2020 01:26:33 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id i30sm8495082lfp.36.2020.03.30.01.26.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 01:26:32 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove incomplete check
In-Reply-To: <eca2ea69-89dc-3ccc-b280-c1b080ad263f@synopsys.com>
References: <660a74249e64b3b62ca9b394584387baee67a119.1583466150.git.thinhn@synopsys.com> <87d09ef01l.fsf@kernel.org> <df600201-0063-bb5f-19be-ecbeaada37f0@synopsys.com> <87blow239f.fsf@kernel.org> <9a2504a3-6a89-39f2-3a9c-9ee933903d8e@synopsys.com> <87v9mn37vb.fsf@kernel.org> <eca2ea69-89dc-3ccc-b280-c1b080ad263f@synopsys.com>
Date:   Mon, 30 Mar 2020 11:26:28 +0300
Message-ID: <87bloe2qq3.fsf@kernel.org>
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
>>>> @@ -2491,6 +2492,16 @@ static bool dwc3_gadget_ep_request_completed(st=
ruct dwc3_request *req)
>>>>    	if (!req->direction)
>>>>    		return true;
>>>>=20=20=20=20
>>>> +	/*
>>>> +	 * If there are pending scatterlist entries, we should
>>>> +	 * continue processing them.
>>>> +	 */
>>>> +	if (req->num_pending_sgs)
>>>> +		return false;
>>>> +
>>>> +	if (usb_endpoint_xfer_isoc(dep->endpoint.desc))
>>>> +		do_something();
>>> do_something() will always return true here.
>> Will do "do_something", then return true or simply return true?
>
> I mean simply return true here.

got it

>>>>    	return req->request.actual =3D=3D req->request.length;
>>> This should always be true if the request completes. By spec, bulk and
>>> interrupt endpoints data delivery are guaranteed, and the retry/error
>>> detection is done at the lower level.=C2=A0 If by chance that the host =
fails
>>> to request for data multiple times at the packet level, it will issue a
>>> ClearFeature(halt_ep) request to the endpoint. This will trigger dwc3 to
>>> stop the endpoint and cancel the transfer, and we still won't resume
>>> this transfer.
>> we can unplug the cable at any time, even mid-transfer.
>
> That's fine if there's a disconnection mid-transfer. The transfer is=20
> cancelled in that case, why would we want to kick_transfer again? Also,=20
> the controller would not generate XferInProgress event to notify TRB=20
> completion for the driver to enter this code path.

d'oh! That's true

> The condition here is if (!request_complete()), then kick_transfer().=20
> Let's take a look at what kick_transfer() do:
>
> kick_transfer() will prepare new TRBs and issue START_TRANSFER command=20
> or UPDATE_TRANSFER command. The endpoint is already started, and nothing=
=20
> is causing it to end at this point. So it should just be UPDATE_TRANSFER=
=20
> command. UPDATE_TRANSFER command tells the controller to update its TRB=20
> cache because there will be new TRBs prepared for the request.
>
> If this is non-SG/non-chained TRB request, then there's only 1 TRB per=20
> request for IN endpoints. If that TRB is completed, that means that the=20
> request is completed. There's no reason to issue kick_transfer() again.=20

not entirely true for bulk. We never set LST bit; we will never complete
a transfer, we continually add more TRBs. The reason for this is to
amortize the cost of adding new transfers to the controller cache before
it runs out of TRBs without HWO.

How about we change the test to say "if I have non-started TRBs and I'm
bulk (non-stream) or interrupt endpoint, kick more transfers"?

> When the function driver queues a new request, then there will be new=20
> TRBs to prepare and then the driver can kick_transfer() again.

We may already have more TRBs in the pending list which may not have
been started before we didn't have free TRBs to use. We just completed a
TRB, might as well try to use it for more requests.

> So, this condition to check if request_complete() is only valid for a=20
> request with multiple chained TRBs. Since we can only check for IN=20
> direction, the chained TRB setup related to OUT direction to fit=20
> MaxPacketSize does not apply here. What left is chained TRBs for SG. In=20

this part is clear now and you're correct. Thanks

> this case, we do want to kick_transfer again. This may happen when we=20
> run out of TRBs and we have to wait for available TRBs. When there are=20
> available TRBs and still pending SGs, then we want to prepare the rest=20
> of the SG entries to finish the request. So kick_transfer() makes sense=20
> here.

Right but we can run out of TRBs even in non-chained case. I remember
testing this years ago by giving g_mass_storage a list of 300
requests. The reason for kicking the transfer is different, but it's
beneficial anyhow.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6BrTQACgkQzL64meEa
mQZOqw//ZFG2ksuerEv0lzhOcF/K6PKmzVA7W8bRzvgTgR7Sdx5gOTotjnqNluvw
L5pvDIpIsK4+sQmQKKNxtw/+mfaV+H6Lz7wzhfPxrWHfOYN4+8cQkUQ1Ro5rGqug
DnWIp9LRl3J8GaGkcbU2Y80f6ADDJIQnYppJcPR8r3NYrkxelRmwEcpe1zYSgg6E
z8Ns7qiERjH/80arWuj3SGYGzUZWEm8vmc2ZsHAJe01P9uQuNDPEy/VQ01/VYjZC
YJzpxHvnjPi0gtrS8Zj7CE3qPNV25OV+8XVZ9ubbDSZEyNZYUP9iKw24C1UWy48k
47o/VcOcepwKcXM43z7QsryB2ejLvQgSW4ho+RmGbQ2B1p/CaZw3T+ojxMpLNpTC
gR8aVYijmjEU9YrJDlcONqjDpzOU9NUK8prfycuHX3KP2dwm3yFaVdx9mDcRVg/S
iKLJPKWYtpR/p2UJKhV98txcQd7bBM+1u0DQ63ggdnn7FZu7YwftB4F2+ytba6dw
CqtFDj+FxbomrTWyV2fMSlvnF+zcCXxueVWTNcsY0bp8m3MGljZGOKy6YGrVg56o
PtQpTPW9hIzcp0l+JbUxoRV0D70E0IRZghaIkzpPdO8NonmcxVzP43vGB6RouOOa
0BlTbmvLyy0itx7trDYmQq8uJfvJdql0kpqLK1ej2ulJbnaXhyU=
=H3Mk
-----END PGP SIGNATURE-----
--=-=-=--
