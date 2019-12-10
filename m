Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E85011871E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 12:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfLJLuO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 06:50:14 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41125 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbfLJLuO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 06:50:14 -0500
Received: by mail-lf1-f67.google.com with SMTP id m30so13440907lfp.8
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2019 03:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=SkCrk4wA0jvJsXzJp04NMJ6UF3G5cITgsSb19wdhNH4=;
        b=cssSsZUoQMzwlC4BNxWievCnAfdqNmftvHpK3gRTikJn1NjJWiZoWlympLEKR5vBkm
         aOIDZ/EdZhrBA4lWb1AcdDSijBNHRv1AZqeNNaC1L6B8hmx6yI2xqFzTJvYt3i/s3vUY
         D23YUpxoJg4eKmaL8nYJ/v9amG7eUKv2R0X8Qs28MB7d+ndX1mFSEbE3NH9CLGnU+ohm
         fMUL1oeP8odgudU10xpRHisfp1yWYHnlqDWiljGYkChmvjqpB94XLfq2TF9BD7t6VfUQ
         ebwZ4JftRz3boFilG99JViZfkTRZvcCqUkVt+Xn9VIp3BsY8CGGJv+Soi7HePff3jpV3
         0f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=SkCrk4wA0jvJsXzJp04NMJ6UF3G5cITgsSb19wdhNH4=;
        b=rCQpETbWl2A++7vdcJ7JAH8fsYscn0oeP1laLXvDQu1j2yg/s5AGcYe1xMLnm1/G6R
         RdewL1ei2A018N7LCJglQa+DtcdwoW5dh7kWd9pKgexQ7T0pTYXTTT6ErlLIBqKF93N+
         b4KwadHfyB6GzaY1as4H3Hs49qI3fKsyseeilQFTRxBvUaQSvixHeZZxuCZVa5p0PBxo
         wc/0NlkOR+/sBR2G5pVhjYyngCDaY29puxYgKSfytgE/EI/FUpvahPTmFrob+UTDRiDg
         mF8dYDmPWALQkgS+k2rw28VP+jaCJw+RIDE26nJC0DJe3S27pJ1vuhQu7SjRlVKqY8hw
         gA4Q==
X-Gm-Message-State: APjAAAWHKyc4qv5nVIeu1KVk+D5TRSks46v4vzjUBjmEIcCjbbJyM3eJ
        1Qdf16FwvCH4ZLN8yCSG4betQxCSEfw=
X-Google-Smtp-Source: APXvYqy4jGvbGYYU/XH5C2GDUkDoVbMg04JyRewfmyqCPriFTIw5z3250bI4LZuHEhAuTW5QNJG9ZQ==
X-Received: by 2002:a19:7604:: with SMTP id c4mr6423382lff.101.1575978610896;
        Tue, 10 Dec 2019 03:50:10 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id 30sm1963537ljv.99.2019.12.10.03.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 03:50:10 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Bin Liu <b-liu@ti.com>
Cc:     Roger Quadros <rogerq@ti.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: turn off VBUS when leaving host mode
In-Reply-To: <20191209171522.GA26131@uda0271908>
References: <20191113141521.1696-1-b-liu@ti.com> <87blt9psrd.fsf@gmail.com> <f12d3637-ad95-b5f5-f331-df791e85ab3a@ti.com> <87r21ncgy1.fsf@gmail.com> <20191209171522.GA26131@uda0271908>
Date:   Tue, 10 Dec 2019 13:50:58 +0200
Message-ID: <875ziol7q5.fsf@gmail.com>
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

Bin Liu <b-liu@ti.com> writes:
>> >>> VBUS should be turned off when leaving the host mode.
>> >>> Set GCTL_PRTCAP to device mode in teardown to de-assert DRVVBUS pin =
to
>> >>> turn off VBUS power.
>> >>>
>> >>> Fixes: 5f94adfeed97 ("usb: dwc3: core: refactor mode initialization =
to its own function")
>> >>> Signed-off-by: Bin Liu <b-liu@ti.com>
>> >>> ---
>> >>>   drivers/usb/dwc3/core.c | 1 +
>> >>>   1 file changed, 1 insertion(+)
>> >>>
>> >>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> >>> index 97d6ae3c4df2..76ac9cd54e64 100644
>> >>> --- a/drivers/usb/dwc3/core.c
>> >>> +++ b/drivers/usb/dwc3/core.c
>> >>> @@ -1201,6 +1201,7 @@ static void dwc3_core_exit_mode(struct dwc3 *d=
wc)
>> >>>   		break;
>> >>>   	case USB_DR_MODE_HOST:
>> >>>   		dwc3_host_exit(dwc);
>> >>> +		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
>> >>=20
>> >> seems like this should be done as part of dwc3_host_exit()
>> >>=20
>> >
>> > That wouldn't work well with OTG case as dwc3_host_exit(dwc) is
>> > called when switching roles and we don't want PRTCAP
>> > to change from DWC3_GCTL_PRTCAP_OTG.
>>=20
>> if (port !=3D OTG)
>>   set_prtcap(DEVICE)
>
> During init, the PRTCAP is set in dwc3_core_init_mode() besides
> dwc3_{host,gadget,drd}_init(). So for tearing down setting it in
> dwc3_core_exit_mode() would make the code logic symmetric and easy to
> understand.

Fair enough, makes sense.

> Also it turns out that setting PRTCAP is required for OTG mode too to

But, then, how do we go back to OTG?

> de-assert DRVVBUS. If left GCTL[PRTCAP] to OTG, grounding the ID pin
> would make the controller to assert DRVVBUS without any software
> involved. So the fix should be the following. Please let me know you
> comments.

But that's expected, no? If port is OTG, then it must obey ID pin rules
specified by OTG. IIRC, dwc3 is OTG 2.x compliant, at least the version
TI uses.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3vhqIACgkQzL64meEa
mQaA1w//XypVtzXAGIVXmh30/5Cxfzpw5qN7wpT4C78AcJo81S8lDQvuoENkrGmn
RthDoxrFnvmwTt+PAkZpWUu+IGjwfWEpuWRDJgu/uM10vtfb4owgSSJXdAzcebEf
/wvrkcwUrv2mSYr6HanK+zAE6snqGQQejDqItZIcrvxYa891igEnEq3+D6t2NmU2
c+s17nFQbVkJ/3dkLrK6xwLHbtIGXtr5whLX9oTsT8ldzvyY0AxHK6U+jWGUJ2UL
4M/RwMn/9d8TiFXqxKvjR9KJ9UVmam2CnaENE9noe0ymNUZjVwerqoEisp36uB4N
ESHG3hDSNM5bTHmeEHSLa3I0TEW+x55bnCgZOSk/MZo1ICIA0FIpvvzTJuk1+VCP
Sd3PyYum5zZcUeduEazTINmPG0A08j6XJhKEaNgstNysuLTsuLrT0OUl4LPac9dQ
OzLbq5BzUiy2eKOPM4yReuci0lt5oD+7W5kTX7iKNSpSE7ueYAZO7Gt+mQ5pS+df
zhfarTw9sL5Q7UdCcsZV01lXwg+xe0nGh+9L4lqZudtFeLVqcBSr8j7XLsrz5r01
KxqSzJEmEJfDpqTz6EbcLywybj4KHbDWeXPor+lSP/UOjSZzUVtC3w0fpx4HtjsY
Xh9c21+8ejY/CVVpUVSxTVV8aYFUrHvP51RICmQSPAN9u7k7i6s=
=aTMp
-----END PGP SIGNATURE-----
--=-=-=--
