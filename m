Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2943C198E08
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 10:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729795AbgCaIL0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 04:11:26 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34911 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgCaILZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 04:11:25 -0400
Received: by mail-lf1-f67.google.com with SMTP id t16so15681618lfl.2
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2020 01:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=lQgJXPohTQLyM7oFXw6PMp6DNpTxVG8t0AXi1walu40=;
        b=JVu9j+JvZCUR6cu4k8RnQ7+GQChcHsK4KL5y+N3uFnD4bTPfK7dnj8KV1WdtXG44uX
         dMqq1tn1AAdRQVS2aYSJY/NK9c93UVHPTyes8YNVo0/4QXqTnaLBVkuYPSFIjIEBu+2I
         mT2Talfw/AttxMT5AQZqI5K0mnQvTp81oMxVfB7zryvwgGzJ922RWXq1VHcul2+GAA71
         O3DjuxlJQHsI4/y+IGb5vCf7kYjtCXG+ig2PY5U+RxfXS/WEdUT1UsTKvFldm+659Shu
         NKK+Jo80m84gC32z683PJRqYzaxFWMNLMPvZmpIpq0CG/l8iNnECCYa4HKoSshGR3xC5
         Ubow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=lQgJXPohTQLyM7oFXw6PMp6DNpTxVG8t0AXi1walu40=;
        b=qYUHDPeYCIGx27rhfADiN3aB6SbmZwJIljHgyO/EFBr9YuhKcQ3R6Gww19b2F1+/pQ
         Lmcd7r4CyAVwFfb+0hmHk8noxuMmQln82m9VQqBaLgRnRkgIWUyuddSp/IBHRT2Lj7pw
         CZYiN6X4uKtUSfUACyH2flJ3R+gCyAf7F/fVfsImw1yVjx9flgNwg4aK2VBy3diIBWHz
         UoZl3nN/IgLgJHBiNliLuEjNNqInopvEcAENvaQv9MN8Mb50jj04amYf4DKZuF988dJy
         tFsTrd+rpRoTHxhOlR4GlD1dlWtlWrHE1vQkFdYodO1YqHbPRMkqY+eSGIz3MP2l+5d0
         t5jA==
X-Gm-Message-State: AGi0PuYoaDlXvRc8VukY7zyN7hS2PBXpozMyXZgaSgKHFVTQefylmmTU
        uFzsSnxxsfL9aeSOPihc5bS6/ULnXE4=
X-Google-Smtp-Source: APiQypK54BUB/NW5T2ZzA8E4C9Bj+nKsG+jCu0rZmcc87g0uh4em2OCMca1rtxeDzvxv0BYNNZs0PA==
X-Received: by 2002:a19:89d4:: with SMTP id l203mr10345085lfd.45.1585642283037;
        Tue, 31 Mar 2020 01:11:23 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id t23sm9186097lfq.4.2020.03.31.01.11.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 01:11:22 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     John Youn <John.Youn@synopsys.com>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RESEND PATCH v2] usb: dwc3: gadget: Do link recovery for SS and SSP
In-Reply-To: <73b1d4e0-6ce4-7c60-2c08-ec6a6e233304@synopsys.com>
References: <20c05d4e60c97b03314ede8d7f2d7c29b34f665f.1576028945.git.thinhn@synopsys.com> <73b1d4e0-6ce4-7c60-2c08-ec6a6e233304@synopsys.com>
Date:   Tue, 31 Mar 2020 11:11:18 +0300
Message-ID: <87wo710wrd.fsf@kernel.org>
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
> Thinh Nguyen wrote:
>> The controller always supports link recovery for device in SS and SSP.
>> Remove the speed limit check. Also, when the device is in RESUME or
>> RESET state, it means the controller received the resume/reset request.
>> The driver must send the link recovery to acknowledge the request. They
>> are valid states for the driver to send link recovery.
>>
>> Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")
>> Fixes: ee5cd41c9117 ("usb: dwc3: Update speed checks for SuperSpeedPlus")
>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
>> ---
>>
>> Resend note -
>>    This was on Felipe's next branch some time ago,
>>    but it was lost somehow.
>>
>> Changes in v2 -
>>    Added Fixes tags
>>
>>   drivers/usb/dwc3/gadget.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index a9aba716bf80..3dcdde9080f5 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -1712,7 +1712,6 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
>>   	u32			reg;
>>=20=20=20
>>   	u8			link_state;
>> -	u8			speed;
>>=20=20=20
>>   	/*
>>   	 * According to the Databook Remote wakeup request should
>> @@ -1722,16 +1721,13 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
>>   	 */
>>   	reg =3D dwc3_readl(dwc->regs, DWC3_DSTS);
>>=20=20=20
>> -	speed =3D reg & DWC3_DSTS_CONNECTSPD;
>> -	if ((speed =3D=3D DWC3_DSTS_SUPERSPEED) ||
>> -	    (speed =3D=3D DWC3_DSTS_SUPERSPEED_PLUS))
>> -		return 0;
>> -
>>   	link_state =3D DWC3_DSTS_USBLNKST(reg);
>>=20=20=20
>>   	switch (link_state) {
>> +	case DWC3_LINK_STATE_RESET:
>>   	case DWC3_LINK_STATE_RX_DET:	/* in HS, means Early Suspend */
>>   	case DWC3_LINK_STATE_U3:	/* in HS, means SUSPEND */
>> +	case DWC3_LINK_STATE_RESUME:
>>   		break;
>>   	default:
>>   		return -EINVAL;
>
> Maybe this patch was lost somewhere. Let me know if there's any issue=20
> with this patch.

It's now in my testing/fixes

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6C+yYACgkQzL64meEa
mQZLmhAAmvIyC2LEVtWcM9e+xzfJOK1o3elqPbdfYhIt3Rp0mymBMZ6QY/0wjgp4
gzi18z368B5chCbJu8e7BlNQoyzQy2jgV3lwgs48xRRwYuNiguTYiGOw9+pFAlI7
LHPQfXsP88gHvWa+mTxY/BR3yeW7QfWeQ+tPbBVr+mqo2dW7eDTum66QstFGSgLd
kg60OaKeoW/qs6I30nnaAh8Au8L0WfqBWJUZNemci7JrMdBEjHvIUSK442noUSYA
4QahyyACLzZJE7YsKzx7jJoKs/gVZ3ZJanxVVKDLB+GJhKm56MvjrBx9poieo6Ob
UfYAWjb6lE25J00is+HnIUkOGdFgPAHXA4OQ5kcvnod7gubt4JlbiVfwfc5/UAh1
lyU8jfcRK+wWJvg+wyxHsp7pRgvVI9c6FHR65rpRyYU2Ez4K7P3ekW9wkKDyB/ii
AlZpSqEN6VlG20LtV651g1fc7ppxUbyFh7ylsYNa+IDA21vHA8XJ3X9K2p+txIaV
SgGHwTmQsU91QXBXJZGrbYMlC1qmELB3Z1eJgxAFhliK9MDxpUYkRRdLVGkz2PrP
c/uXfuIRe65mITdwMAAoIzw4wmtJ0oYLS8ExDaFeKlmRJJ8CCVoVcqHPZJMdOzl7
0mjxLvAB4CjGSlFOthuZguZhPbFtr2Xalt0F4OWQ2rG7Lf28zMA=
=11k7
-----END PGP SIGNATURE-----
--=-=-=--
