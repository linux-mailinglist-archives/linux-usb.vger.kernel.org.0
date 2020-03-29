Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B890196BCB
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2020 10:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgC2IEA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Mar 2020 04:04:00 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42779 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbgC2ID7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Mar 2020 04:03:59 -0400
Received: by mail-lj1-f195.google.com with SMTP id q19so14472786ljp.9
        for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2020 01:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=y1OB/SeNBIZx4WWAZpkRPwfVU3UJHqPMBIRJfNllULE=;
        b=lzUmm3kI7S9RkiTnEUEJ05fgSHinOBeEU5SRm8Mt98z4A73aIL8cYPwODGAQeSXFpU
         36PMv0MW7hg7ZC/aTOPfdoXuL8Q+wPxyOALbffb2YdJn/XP5sRVKZflmjxx49Vo4YV4m
         6D4Ng0x14jLTSV8mrENSOt0QWQSJPScBh59a5h1ex1tvVtQZdUfcI/ARnkmJtwIjAXr7
         Kx1B56FSzhTpiVwkRE9lxACz4IYA2N75lmTRQ2kYvgTuNmwIWZgNY/sSUQy5HXtEVXZp
         h8RIE8y2oK/IBw0ooNMoYL6ZeWWOezCREu0Kw0kn/p6DsphYw24+yNa/78dLSGD0cp8z
         Ezsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=y1OB/SeNBIZx4WWAZpkRPwfVU3UJHqPMBIRJfNllULE=;
        b=KoxodArGYR197Li+CkQ6RfkiUoqlW6Vv5EoVTFuB1aQqofLALOt+J7ndY0UYJxd6pj
         ui7VRlnTVZNg8eiJHCxLTVSnj5nStO2TrldcPL7GnkL1ve1v5bgrivbA/vPoDkSfWhz5
         +6uZaTzCILYX0cq6nNBsmnEC2hDR+pWCnLhnJNiRJC6tys9wjGBGNnu1QVO6/oMLqVPm
         j22mLjj3WenvnNqVKJyC9n3jowW//J0y4GNWA7me3bxTAIvawplYOx+bjdOgLu2uPCLX
         iHZ70gWbuT9O718yi5oKo61Is1Y415YDa03Qq8by0/BYFhIgpiFXTP7BBiHn3NSLU8Nl
         1Vtg==
X-Gm-Message-State: AGi0PuY69y1NDLpXEk6zS+oyi6TWKpBIFgk/3t0BAMAo4Kl85ylO5sgB
        NarDRuigIfVCrSLpz2RO1Hc=
X-Google-Smtp-Source: APiQypJ2zzlnWeVC2+pf6KHfH8PSjehgkSYwxa65l4yydTAm674eHX1uc4fUh9B2IbgkRAPDgsyMbw==
X-Received: by 2002:a2e:81c9:: with SMTP id s9mr4094085ljg.69.1585469037569;
        Sun, 29 Mar 2020 01:03:57 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id d6sm6512909lfn.72.2020.03.29.01.03.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Mar 2020 01:03:56 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove incomplete check
In-Reply-To: <9a2504a3-6a89-39f2-3a9c-9ee933903d8e@synopsys.com>
References: <660a74249e64b3b62ca9b394584387baee67a119.1583466150.git.thinhn@synopsys.com> <87d09ef01l.fsf@kernel.org> <df600201-0063-bb5f-19be-ecbeaada37f0@synopsys.com> <87blow239f.fsf@kernel.org> <9a2504a3-6a89-39f2-3a9c-9ee933903d8e@synopsys.com>
Date:   Sun, 29 Mar 2020 11:03:52 +0300
Message-ID: <87v9mn37vb.fsf@kernel.org>
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
>> One thing I don't get from your patch is why you're completely removing
>> the function and why isn't req->direction and actual =3D=3D length not
>> needed anymore. Could you explain?
>
> It's because there's no use for that function outside of checking for=20
> number of pending SGs and resume.

wait, huh? What about cases when user unplugs cable midtransfer? We have
versions of dwc3 HW which fail to produce disconnect interrupt, right?

>> @@ -2491,6 +2492,16 @@ static bool dwc3_gadget_ep_request_completed(stru=
ct dwc3_request *req)
>>   	if (!req->direction)
>>   		return true;
>>=20=20=20
>> +	/*
>> +	 * If there are pending scatterlist entries, we should
>> +	 * continue processing them.
>> +	 */
>> +	if (req->num_pending_sgs)
>> +		return false;
>> +
>> +	if (usb_endpoint_xfer_isoc(dep->endpoint.desc))
>> +		do_something();
>
> do_something() will always return true here.

Will do "do_something", then return true or simply return true?

>>   	return req->request.actual =3D=3D req->request.length;
>
> This should always be true if the request completes. By spec, bulk and=20
> interrupt endpoints data delivery are guaranteed, and the retry/error=20
> detection is done at the lower level.=C2=A0 If by chance that the host fa=
ils=20
> to request for data multiple times at the packet level, it will issue a=20
> ClearFeature(halt_ep) request to the endpoint. This will trigger dwc3 to=
=20
> stop the endpoint and cancel the transfer, and we still won't resume=20
> this transfer.

we can unplug the cable at any time, even mid-transfer.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6AVmgACgkQzL64meEa
mQbXbBAAm6sicjbn74GFLXFw4tuqBflMTk7TAzLFjkZjDLh8R3OPnAfki6zkAur5
kZPHnPtqdvoQBrbR4qEiIFmtN4P5UfUzsl2YBo/hGenZFG4DOYSUaHKaHpbVrzv8
1G0HCWQBmlH/iEp6sLF/rmwvWtu5VAlmX/1OUjkyzPMTE9P37yVM5zd81YK9vPei
lvBnpgwZttVRQ1gGLWSbHLyRzOVZLkeI33vTUCHLIXNUXJYrIG1GDQwxFdzTAbTr
73d0FQfn0LLvQmld1qgWLaoGN+XV9gn3Lt4gjjALDDIMUdhjGktTESe/yzjlRROU
4avqB9YDcvM5tx2zcwQtFEWoln6bm8/STpsnJaTydEo9WY8MIF1l0DOH6rKDUv8S
XdeZ+ysdXmD1hB5TRNu8rYOV/Mp74MT8qw8XrSsmZESbNhtCXnVFD+rd02SafEN4
fMsTcFYUobTIv895BDg3Q/UGohZ2k7/JG80UEdQl7fpbdfYl6seD0p/TBrNGfURx
OM1ZGsPrIuFd4wimQqaA9QRCsnC0KJJcj3NLEDiWT8xeNGGlGeStInOqwFpVNEWr
mJalyscLt8RvcCbQbN49rDTLtKTl1+3EwdHpwCALO2zyKQysxVea+gbBlMoodC8c
FTGvuuIre8DIFsvQkFjr8Ko8UHWzqivhY1fispdn5ZGpEp+wVg0=
=G8a0
-----END PGP SIGNATURE-----
--=-=-=--
