Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16397186561
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 08:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729764AbgCPHD7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 03:03:59 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45481 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728302AbgCPHD6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 03:03:58 -0400
Received: by mail-lj1-f196.google.com with SMTP id e18so17344492ljn.12
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2020 00:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=1urlhQiPYWcZ1g6mM1if3mg7E5s9CXYnMXplKKU3R70=;
        b=vdughB/+cZ/3rHWUdvAGKj5p1KvjDwa8+3A+7bbqRs7fKWXcY92nw2WCF6gKfaenYF
         w6x+aOmpgjbvXZRzFTCLx5zUjJ5as3ZZz5Ll6LMsr5QGiYPPuM6l10CJbFknhkW0i0jB
         g3zQpl1HHxK5dhXneLJ2f4ZYcINooTg03EnOIa6tKbaBvqRxnQJjSkYLRDsFspvV2f5w
         wK12Vy6m01ETP8IcQTTvu6Qh74jTa8Qhw3TZ3EoOSHRiH10o7uip52QGpT5XnwphXSsI
         mcWGnpU4N71hnZ307zAFjwvCOoguhMgpBLtwt3ftJhpY4k7jS5AwjypYO+a4XBTtyPJK
         xLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=1urlhQiPYWcZ1g6mM1if3mg7E5s9CXYnMXplKKU3R70=;
        b=m7gocn18gCH36I1/PvZV+vxb2OzdQH8h5+rSKXf6BMaMOQs84RrTXi5p60SAJIxoxV
         mRxH0WL0bhsYnMEf0OKaHw0Y8iPXp3Sed+TL0fMxnaSJrI53+jtqfbIneqsvjrlHhE2e
         n5FJ/kan/HnSB3ZIr7X/3o6c5iorSH/WMbp8ioVNk9CoxH+OsEycNVBimpI1L/4bzI2j
         RG3+dgBI2PuXhE8Pbivn5hMsN/EzbjkX++klIAF2i49fI8DXiKvcmOQQa9BGsarblmR6
         1/JJauzWEaTplKxeB7UQ+ugaWr4uyTeXzpCqHh+YMARyC3bAubE5t+LXTkjAjXhKWiPD
         eP8Q==
X-Gm-Message-State: ANhLgQ3YKuYyuEXgiVgyQqLbNEajqwd97iSfw5N7uLp4VuqdGda6Go0B
        Hj6PiofxYsLzo/uKaRdK7nU=
X-Google-Smtp-Source: ADFU+vvJSCx8Kidao/QqdfF/BegZ8OIYB1LqIr9ywK4WZARi3osHDDGzrdBjfxAmyyZjMAsNJz8qpA==
X-Received: by 2002:a05:651c:233:: with SMTP id z19mr14526956ljn.176.1584342236555;
        Mon, 16 Mar 2020 00:03:56 -0700 (PDT)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id z9sm2637673lfa.16.2020.03.16.00.03.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 00:03:55 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/3] usb: dwc3: gadget: Properly handle failed kick_transfer
In-Reply-To: <08f67bc3-2941-28a2-f1fb-0a3ebdab8559@synopsys.com>
References: <cover.1584065705.git.thinhn@synopsys.com> <015470a7d9b950df757b1abfecd6ef398ef04710.1584065705.git.thinhn@synopsys.com> <874kusgwuz.fsf@kernel.org> <c17da637-abf1-75b0-e8bf-737958773e8e@synopsys.com> <87o8syf1h6.fsf@kernel.org> <08f67bc3-2941-28a2-f1fb-0a3ebdab8559@synopsys.com>
Date:   Mon, 16 Mar 2020 09:03:51 +0200
Message-ID: <878sk0233c.fsf@kernel.org>
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
>>>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>>>> If dwc3 fails to issue START_TRANSFER/UPDATE_TRANSFER command, then we
>>>>> should properly end an active transfer and give back all the started
>>>>> requests. However if it's for an isoc endpoint, the failure maybe due=
 to
>>>>> bus-expiry status. In this case, don't give back the requests and wait
>>>>> for the next retry.
>>>>>
>>>>> Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")
>>>>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
>>>> could you give some details regarding when does this happen?
>>>>
>>> So, here are the scenarios in which dwc3_send_gadget_ep_cmd() may return
>>> a negative errno:
>>>
>>> * -EAGAIN: Isoc bus-expiry status
>>>   =C2=A0=C2=A0 As you already know, this occurs when we try to schedule=
 isoc too
>>> late. If we're going to retry the request, don't unmap it.
>> right
>>
>>> * -EINVAL: No resource due to issuing START_TRANSFER to an already
>>> started endpoint
>>>   =C2=A0=C2=A0 This happens generally because of SW programming error
>> Sounds like this should be fixed separately and, probably, we should add
>> a WARN() so we catch these situations. Have you reproduced this
>> particular case?
>
> There are a couple of examples of no resource issue that I recall:
> 1) When we removed the DWC3_EP_END_TRANSFER_PENDING flag, we wasn't able=
=20
> to check if the endpoint had ended. So, if the function driver queues a=20
> new request while END_TRANSFER command is in progress, it'd trigger=20
> START_TRANSFER to an already started endpoint

Okay, sounds like this deserves a patch of its own

> 2) For this new method of retrying for isoc, when we issue END_TRANSFER=20
> command, for some controller versions, the controller would generate=20
> XferNotReady event while the END_TRANSFER command is in progress plus=20
> another after it completed. That means we'd start on the same endpoint=20
> twice and trigger a no-resource error. (We'd run into this scenario=20
> because END_TRANSFER completion cleared the started flag).
>
> We added the checks to prevent this issue from happening, so this=20
> scenario should not happen again.

Cool, thanks

> If we want to add a WARN(), I think we should add that inside of=20
> dwc3_send_gadget_ep_cmd() function, as a separate patch. We can also=20
> just look at the tracepoint for "no resource" status.

The "no resource" status is important, sure. But users don't usually run
with tracepoints enabled. They'll have a non-working USB port and forget
about it. If there's a WARN() triggered, we are more likely to get bug
reports.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5vJNcACgkQzL64meEa
mQbJdA//WGSOIXSR2ga2uOfrW+DJnuIvISCFT6MYnu+8OCrtdzAuMHsa8PI2Nybd
OjgISfdC27II3nR3Pk+Zh44k2axoFhxjyzkUbEijVeOjI1vK+ZRQj6XS1CBM0oxA
C/ms26A6MBdFasK5VCVx+WiIV0o20GgTPMG7EvbD0NDdPefirhgiWN+3kl/Ft0rO
1GkASAJxMtbYLpQV0Xc2s3H0O3io2WdHzOV2ASG43MSjpnkbRiRr7fhpNvII88zh
24lM5jSVTaG+rvaz3KTF2sNErS0iCCRZqvEMdHjvkrZ7JD6fPW2uX8ny3cooGbuV
29R4ljpTTvU3x+FZ73GRbaS6/xFM0J+S3+IaT09Gmrz3S5hJKJFg2qRZLZ8n0naY
4+l3ACKENStpXozUfqthXM7qLPPUTZrICUE2jCwn3btyipP5Yqk8YxTzQlXX0fxp
vvPHZgXyle0Htf6piIi0J/D2zT955Y+oVq3Q5DuNJUREM7vaJb/Ds2iW/tORxu84
VQCPtZqurZkwDLwOwpUYDJYEG3IYafNtFZ9tVFAi/lK6W3Hg4rOdfA4tnGbL76j/
2SNd/cmeDx5YSaM5+qaiDHWxjGLYm/vWfCqIly75SAV/illlZ7K96HKXGPhkw3Cf
amzBu408atj0jRG+wRLvcLrLko4JyWHU2baQZc6zOVPLu5Ju0LE=
=9JAw
-----END PGP SIGNATURE-----
--=-=-=--
