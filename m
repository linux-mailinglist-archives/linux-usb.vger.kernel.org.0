Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 316E21D2D02
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 12:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgENKiQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 06:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgENKiO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 06:38:14 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E93C061A0C
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 03:38:14 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id l19so2913597lje.10
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 03:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=b3PJLigGGW/woucgM+z4vCA9eeUtsl6llobsXbQ3L78=;
        b=DTzVsO3kffZ4Hg9qjwPU9QWwohzQu5r5tVgFbw2oQe1gEu24x3xIsd1fzoLBsmqHse
         EcUBkCna/ULYwW1yMac+DqbdllKPJeGJJyZA+0Su4+QXkYlz66yj3fBN5UWz7dOBcM9T
         7HFcNU+Q5i5MPXvUFDtWMn37FhHQaAEpHkR5qnulEO+dVBQ5TnGaDCYvqiaMhlf3bbOR
         9dinQt8fnG4w68YihZobq5Tlv41Ky/E8PIdVnYXs40jidIc1US/7TlT0K3TzwG/Z0XHN
         fCIWWV/XX8WWhfaFZabB2dqlVhrFEjdxFuhY94R31Yj//zH/REJVHp6SQCSOVHSOBu3A
         TEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=b3PJLigGGW/woucgM+z4vCA9eeUtsl6llobsXbQ3L78=;
        b=VoFMmpdfhrZkqPItT4E8XtIN0C84XtuJBam6n6YVClOGw/oOaFz/ylb1jKyiHwKRSf
         ku09xvOC+hM0k+SCOaNwcJjl9RQ7dQrIuw+ud5ZaK4EZhxKXGkEwuUDOFl21zItI9D6m
         kRdcefeK1s3/VCPOFqX1VGqpfYz6pAzl+xd63OCKphUqXgKyso8kJOXJsqvoN/PI3msM
         6W44jcTRPbZNRVeSIfzf+RAB1wjXNEwXuR0MB74XUep+PxW6aHMokclsJYlVJpW/7f6y
         KCXhdJIzuDV3TtF3ODn2/elBX1RP5noCZC83QzmYRxSTNcrMj0CvgdxN0H7IFWGhVjzf
         pbUw==
X-Gm-Message-State: AOAM533YwRs6G7wKxCrRpJ3lnc8ujFQVN7jWe3kAYZxfQ6srG6y4RAtt
        xHP360l/l2bdqDIzokhMdzjhmFMb4n5iEg==
X-Google-Smtp-Source: ABdhPJwvJh0eLYsacEeIJcO9Y1OHZVdriBMUpEjWc9HpbFkdU1WDdXbqFnoOI8G3gFpo04XJXpaI/w==
X-Received: by 2002:a05:651c:449:: with SMTP id g9mr2415696ljg.278.1589452692773;
        Thu, 14 May 2020 03:38:12 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id w24sm1498110lfk.47.2020.05.14.03.38.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 03:38:11 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 4/5] usb: dwc3: gadget: Handle transfer completion
In-Reply-To: <ad3a0e37-c611-c6e9-959b-7351fb82ed0a@synopsys.com>
References: <cover.1588025916.git.thinhn@synopsys.com> <70555c2202529c6e0bdd23124003d0d4bc637cdc.1588025916.git.thinhn@synopsys.com> <87blna20n3.fsf@kernel.org> <ad3a0e37-c611-c6e9-959b-7351fb82ed0a@synopsys.com>
Date:   Thu, 14 May 2020 13:38:07 +0300
Message-ID: <87o8qq4x9s.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>> @@ -1223,6 +1231,10 @@ static void dwc3_prepare_trbs(struct dwc3_ep *de=
p)
>>>=20=20=20
>>>   		if (!dwc3_calc_trbs_left(dep))
>>>   			return;
>>> +
>>> +		/* Don't prepare ahead. This is not an option for DWC_usb32. */
>>> +		if (req->request.is_last)
>>> +			return;
>> this requires some better description. Why isn't it an option for dwc_us=
b32?
>
> Internally, DWC_usb32 does some advance caching and burst that we should=
=20
> not prepare more TRB until the transfer is completed.
> This doesn't apply for isoc, missed a check here. Need to apply on the=20
> next version.

Do you mind re-wording this statement as a comment in the code?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl69H48ACgkQzL64meEa
mQYUfg/+MJyJW9Fj/uNMtClTfWHYykq9NXntEyMOuSwdBlsfhppA7lfBhS4yYEvd
iYGMIPaEhG+DRu0pnjbiy4GAPtACUe/tnMkGbezXj910DwbhVDS3Ac0pQqjji9xl
QL0uZyqxgV5pN8TjsD3MoIjFBblZH68E35rEVNJ7MmRtik+ywf2FXgW3tyKNb77O
dFheeUWYrGLGj4P4ay0Z0tsuuxBq/wKEPfnj20xvlELyAKMg+Xia8WJKcRiYNIwL
mHi1otSXs7BsiiO7W+N4KXVpsleQ5E8NHQXI/KaUjGXNIvjD6mHk2DONq6g0Asd/
FcZVYZ//Zumt+bE1M1R6PAA6Xdo2UiRAqogE/VLTjSgcjZjI7rtrKGav8ltqE1mG
4IUKLXIxvGoxh14cjPm7VwIeViSnbKeLhMC/2PeKMqvdCRO0gCSLFD7W5xVojuaz
Jj6s/I4NNhJCG25ocPkQXjeAEp4ZwKM3Go2ODn7tasLvn48PRBVHs2N/WSQzt+TH
qJ/mPfTdlBp+RxQA3CGpHQ/bX8vZM/3W4kRA5qdOt7MPlP4lwmsPMGc7ku1ssTsh
v07aDCWMNxravbsnUYzDxxAkFCrHzLrfruLbCqx9K1dRvTcbF86RDfubz4Kgnow8
UGaWxons6wncD6jHIARol1fD1MSJGYpON07ZeliM6QsnN/MXmpw=
=7Yjr
-----END PGP SIGNATURE-----
--=-=-=--
