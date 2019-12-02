Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D55E110E66E
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2019 08:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbfLBHlA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Dec 2019 02:41:00 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44623 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfLBHlA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Dec 2019 02:41:00 -0500
Received: by mail-lf1-f65.google.com with SMTP id v201so26044225lfa.11
        for <linux-usb@vger.kernel.org>; Sun, 01 Dec 2019 23:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=RsfOqwd+vzNJgRHPGsdJcCNRLzkbD9+OlUlpCLneetE=;
        b=o1O6edwPwbu9GNNzniPl0OcBeAFuAnjCAelIoQs8NNZdltSiMVbSMW5J+CCYbMmhmG
         5dxUoPw3tCFgeSTsyT9BPvyR9uD2ddNekJSsWp/ja3HlJjP3ao944x2u/6H2GDeEFmHL
         AAl5kfjC604Zbj1RIGqyJ4+iFdRRi0c3qYz+kVJWrk4bMvv8RBmcxekm26Qj0Axcb1Iz
         GAFXuQrE5pu5VawjdY4qIvbsBpyaYol78NIXSmdxciXaT3vHBkFKDP4X/vcpWCGAlelz
         9jI7HdQDH6yF2OsQTvVg5c9x76Jk3LSca9sMckfW+Gcysdca8cITTazPqG7kbwyA59d5
         gdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=RsfOqwd+vzNJgRHPGsdJcCNRLzkbD9+OlUlpCLneetE=;
        b=I7ut4o2GqKJg/NdqoNEKGZY7x/7HU9Ho3vGlRuK+IDpFZGW5wkpspK2IcmEoaJcFeM
         BORgo8epU0RFfB3TPSz+EZJqdMkch7ZnRtLaarHhzfDdi34i2mWU5cMewvKqZln/cvys
         X2giES3YRUrqr9eYiVzWbRnhRS4Kg9rTPHygrObGV0wS5C2KLKPtlUHpdWmgdAq0EzYN
         Ar4oHEEMzL01i8KgVtx3VJn+GfBbXTqhqSMmURh3M6eLk2yE/gGAZXwUU8ehOsDYcFe1
         NrGv6vAbU+FB4IL5hObPP/iT+nEvBcwboXTTrk+7qdjKWTPSW2NQrpnLi2rjvAlqvllo
         Cblg==
X-Gm-Message-State: APjAAAVtJX2sU3AstblqqY+xq30QBz6JiD3yEMEEbFczqiR0j3pd4ORe
        yD8PXl6esyEs0c0lpFJcZaxwDvDdpCs=
X-Google-Smtp-Source: APXvYqxy3elVHgGxWFD2IHYqgjvELH3boleodigo7FhkodwYr/iB3SiYOytcqu9WH6JXMWkijo87fA==
X-Received: by 2002:a19:f006:: with SMTP id p6mr2094863lfc.94.1575272458594;
        Sun, 01 Dec 2019 23:40:58 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id c8sm3974490lfm.65.2019.12.01.23.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 23:40:57 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Roger Quadros <rogerq@ti.com>, Bin Liu <b-liu@ti.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: turn off VBUS when leaving host mode
In-Reply-To: <f12d3637-ad95-b5f5-f331-df791e85ab3a@ti.com>
References: <20191113141521.1696-1-b-liu@ti.com> <87blt9psrd.fsf@gmail.com> <f12d3637-ad95-b5f5-f331-df791e85ab3a@ti.com>
Date:   Mon, 02 Dec 2019 09:41:42 +0200
Message-ID: <87r21ncgy1.fsf@gmail.com>
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

Roger Quadros <rogerq@ti.com> writes:
> On 18/11/2019 09:07, Felipe Balbi wrote:
>> Hi,
>>=20
>> Bin Liu <b-liu@ti.com> writes:
>>=20
>>> VBUS should be turned off when leaving the host mode.
>>> Set GCTL_PRTCAP to device mode in teardown to de-assert DRVVBUS pin to
>>> turn off VBUS power.
>>>
>>> Fixes: 5f94adfeed97 ("usb: dwc3: core: refactor mode initialization to =
its own function")
>>> Signed-off-by: Bin Liu <b-liu@ti.com>
>>> ---
>>>   drivers/usb/dwc3/core.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>> index 97d6ae3c4df2..76ac9cd54e64 100644
>>> --- a/drivers/usb/dwc3/core.c
>>> +++ b/drivers/usb/dwc3/core.c
>>> @@ -1201,6 +1201,7 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
>>>   		break;
>>>   	case USB_DR_MODE_HOST:
>>>   		dwc3_host_exit(dwc);
>>> +		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
>>=20
>> seems like this should be done as part of dwc3_host_exit()
>>=20
>
> That wouldn't work well with OTG case as dwc3_host_exit(dwc) is
> called when switching roles and we don't want PRTCAP
> to change from DWC3_GCTL_PRTCAP_OTG.

if (port !=3D OTG)
  set_prtcap(DEVICE)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3kwDYACgkQzL64meEa
mQbzlBAAuzV6TJgS+J2mxXtS7Wx6v7r3HcjGsSG/Plt336+FSRoid8BZtYZ05hFu
oczPdTHBAnhUg+GX6tqSsszn5QvgCMhu/XvlC06gOBeQqqzX78jd+epDHlx7fTHi
LuT93QS2RVg+Z3Z/0sxmLXMXGrGvcHTgpli10G6m4eu1zm401Ir546NiwiTumV1Q
QFgxgdTjtl9JVL5Gd8T3xqH2rNIvdjnYffrON/RLqeE0uIHmyMi4wY4eh9COL41b
aGxxuqFInOMJroaI5FdS5bSvcsEGP/iUnlRemZBsVW6Bc5nksWx6fG2dZrch6XV+
/WnjTkyZ6hn7ayfSJxO8YDOOCCupJEs4mCfZwXLE01mX6LLV2CvMtesjlayMwAbA
amMqDAgwvE22sol6Evo3eI2wL9dVGUQ458Y/iH0p+LbJ7xov1UjYkQ6dOyMNW3c4
JBrOkPYAPWAF+JVPUr0sYCUhqCfjh1xubmkb1C+6xENGGU9J9Tzo+iqrw9gHSZvV
7iZAk8cSY/64OfcS04HtokQ2IXv4VPpXC0p5XQ/Cu1rxcV5YSGWAw9mRxFFDGMjJ
8Rjo2KSf/LMgAxEc7SivJhYUffZLOHdIbtZOL8RlriaR76rXBnI+HrAtCun4MS3u
mQ0mvIi2K+IPvi6AbUcBCz8yK0rLVw4PioAF2/Gbqwi1StcnuVY=
=LDT6
-----END PGP SIGNATURE-----
--=-=-=--
