Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1118B12F615
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2020 10:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbgACJ2y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jan 2020 04:28:54 -0500
Received: from mail-lj1-f171.google.com ([209.85.208.171]:38585 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgACJ2x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jan 2020 04:28:53 -0500
Received: by mail-lj1-f171.google.com with SMTP id w1so21307456ljh.5
        for <linux-usb@vger.kernel.org>; Fri, 03 Jan 2020 01:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=EwjHr72yjNdnfC7M7ZqH27AbhpG4Vro5zjHSNJPfpCs=;
        b=bnsFP6qzP1Dn0js0awyU3k8Mljdz7VIxLJI+gfC3FWSBeXl58FJ6CrbPpYRM2tg66M
         VMh+gJIPG80bb5Rt+AYe8herLVkN50TJz9/tz8+MzOkUx6EytJywNfnrw4tA4GV1XCJd
         ZVXzjpRygWEV1YpnlsApgt3fLMpbM8TrhUQv4ZDacNE4jRDauPiuT4YoSqpb+SjgNGVy
         63eaH5juH84++CaUMm2CGkwpYLdsnA9gx+IUBSVR5Oe9IgjXWtRfQfP5CUSOtq0YVu5u
         sOmZi5MD0Oy7bakxC9keuq57sFmpkiuRt9QyArZU4OZY3aamvVelfCjoohswdt9v6Yfn
         MG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=EwjHr72yjNdnfC7M7ZqH27AbhpG4Vro5zjHSNJPfpCs=;
        b=iWGgWOlS+t/+M6Btb6z2jWrjWXW1pNALjHiV72R7/JwJaQaeqE4ppNNLOx43De/Ioh
         p5oNLFfPiv5zjHo9YfylpF2y5GmUp76olwm5v4x5PCh4fBblLNhQKW2CrQRV8j4tV89x
         0kdVYP6LB7yhu1moiO5iYiD0Xs2jR88B3V5qt7rVtCR71SrRSYRddKUVusrOknk7RTln
         HsnxD8T3yn7kjeFXmfypFd2/0AXTW21kfZwtWfqQVJJLXKx9FSFJ8dA8bLR3rZm2C6o9
         2U13QSPhqfRc6G428i6sG6v/wKm/i5KFsvyC2LK3fGfnVwDmi2aYAMbaqCWRohAiC8BX
         jEZA==
X-Gm-Message-State: APjAAAWFYioHdhoeCcCY+kEe1xbvTyzvzs7igVVCw5yF/o0nOtVnXco/
        2/eJNQYhhrzlApBZesbIIeou7QG1Ayw=
X-Google-Smtp-Source: APXvYqwyb03UKK+twT04jbj8cwiuNov0zJwTKCkyVIHmQSXiS9L63rxBkOGbIC00/DOhZmi4meOQzQ==
X-Received: by 2002:a2e:3e03:: with SMTP id l3mr40749469lja.237.1578043731784;
        Fri, 03 Jan 2020 01:28:51 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id m24sm29059774ljb.81.2020.01.03.01.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 01:28:51 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     "Rene D. Obermueller" <cmdrrdo@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: ERROR: unexpected command completion code 0x11 for DJ-Tech CTRL (resending as plain text ;)
In-Reply-To: <6fb5bd57-5209-3344-b52c-a1d311ac1644@linux.intel.com>
References: <Pine.LNX.4.44L0.2001021024090.1546-100000@iolanthe.rowland.org> <6fb5bd57-5209-3344-b52c-a1d311ac1644@linux.intel.com>
Date:   Fri, 03 Jan 2020 11:29:33 +0200
Message-ID: <87v9pskhvm.fsf@kernel.org>
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

Mathias Nyman <mathias.nyman@linux.intel.com> writes:
>>>>> Maybe forcing it to one of the allowed values could work.
>>>>> Does the below hack help? (untested)?
>>>>
>>>> Is this the sort of thing we should handle in
>>>> config.c:usb_parse_endpoint()?
>>>>
>>>> Even though 4 is not a valid maxpacket size for full-speed bulk
>>>> endpoints, many host controllers and hubs will handle it okay.  Much
>>>> the same is true for devices that have a high-speed bulk endpoint with
>>>> maxpacket set to 1024.  Should we try to treat these two errors the
>>>> same way?
>>>
>>> Makes sense.
>>> Looks like config.c:usb_parse_endpoint() shows a warning if maxpacket s=
ize is incorrect for
>>> high-speed bulk endpoints, but leaves the maxpacket size unchanged.
>>> If xhci is used then the xhci driver will later force the maxpacket to =
512
>>=20
>> Does the driver do this because otherwise the controller will refuse to
>> handle the endpoint?
>>=20
>> There are indeed high-speed devices that have a bulk endpoint with
>> maxpacket set to 1024; I have used some.  They work okay with EHCI
>> because the driver and the controller will accept the invalid value.
>> But probably they won't work with xHCI.
>
> Looks like high-speed bulk endpoint maxpacket was forced to 512 to handle=
 cases where
> wMaxPacketSize was smaller than 512. Some xHC controllers apparently coul=
dn't handle that.

yeah, that's part of the USB spec. High-speed bulk endpoints must have
wMaxPacketSize of 512. Similarly for Super-speed, it must be 1024.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4PCX0ACgkQzL64meEa
mQbI7w//ai06FdEsmZKp1WkI/jVaLxWyYfqV7g7bDWqQF/qnijFQdYDI+MI71I2p
mPy44weMFgcdgx1AjQfOaqWQB07/BD5PXKB/zMatmhlIPXXZ7NbsGlfmZ0Sw5Fg1
QnKS9PlJVtvmnbXrtcuvTMBeTpFZfqtrSUSmrIU2JqQy/5ptuKFPpGYGPLWKSy5B
UIzRW5XO9ps12rRrwrRH9cVjjkA70MSgfD3Vji6i1Nfu0O3vq1Auh+6zqWiplVin
YQS/ltHMHdb3w+0mGelXYfNg1AMODRlJMw4F+I3/h65IvmIpu4kPIQxCB92DZnGd
AmFhiooezQT22azYOZWfC5yIRpMgNrlYpBxuNe/8WSFXnh/U3qO4XnKjo3Z2MnsQ
OOjm6nhZAaLpPzAb+pmlQ/w8JAOYA1oOlmtr8aRKF9rRPBHbcD3q8oK5ZDLSwOeY
cS2IF5WLuBn9b4ZiRSwaUSknjNLF1cSsPt7xqWAAxejux/akIpUW2MSPZuTj7A7D
014/FFejBMidcOyNyJdGRrQhyNwN424USjZvtFLS+aK7yYq7U9qUXnsnCjTO3Zjc
QyMWT8igMWyJLFLftHSlpM13yXuJOM8Dx4N1G2wYvtxADFV8k8PQli6V9BrbDjfB
6M7SURPcugmO4BrEOmEVOdvQqVIR4EeuD4bdFRBrg9/LmErNPhQ=
=M1ph
-----END PGP SIGNATURE-----
--=-=-=--
