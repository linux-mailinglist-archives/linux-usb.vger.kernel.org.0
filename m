Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD74513DAFE
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2020 14:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgAPNBQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jan 2020 08:01:16 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41689 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgAPNBQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jan 2020 08:01:16 -0500
Received: by mail-lf1-f68.google.com with SMTP id m30so15466951lfp.8
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2020 05:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=1x1YXKs94Hx43n2QuSWjLfkzm2K8Cuc1cIeZXBvHJ5k=;
        b=JBjL/Y/u1O7r7k7MH2sgYRaDH+H5Ea7GI3/939DRLflNbwplmcQemknYKb0yKzq2nx
         4KycbVdOgwTSrHaneyh6MSetHMuFlKrxE8qOS9bMlrP4FkSQFu1PTtmRwshhi01ANz8q
         RbR12mQI456tQOMliUZsqavgPU9p4jlCbYhBCGh/Wf6PBBHX1cFJ+HT1j23Le11pNkBU
         p00wIXVEkKuR4LkDp1r/dPPKrWd09hLqnUubuoosAYVO3Ro5HNGzMJKn0a9fU/r/E5cQ
         rWaauzH8Rqrcooj7SZiFwtIH1CPsakXp4AeGxUACfOv3t2QK09fF4iIIZn5tZnBqPbDy
         FJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=1x1YXKs94Hx43n2QuSWjLfkzm2K8Cuc1cIeZXBvHJ5k=;
        b=eZ7/vLPMpReHSVRXDn4NY4mLyWn3IkHLweScwARY7rEhOZq17xtdvv3dmTLz5Kh4Ts
         rCFN0E/3F7ggLzS6oylYfLU0l6FJEQh5j9feszoWZaYufdIvrUYTOl6iq1hKhJwBrRto
         biHXDOMmT2Kju3a/ce8ObaMieZL8oESEcg5iiI0iPLEBHEqKapeUJ9mKm+YAx7kbr75U
         qXBjlpCfbL03mAstCsjdw+x1zdK4TIzTZt69iCmJROroj9BAaE801zH4hBZLprcn/2dE
         i+Lgdwcj9hxCoB8mlayG/CoaR2Gusxczh+sA430l7Gjow7sJgAYLODEXUXhopVG2Ynp6
         K2hw==
X-Gm-Message-State: APjAAAV8tXAKRBuWHA909QKCa/1IPoGGKEOlQmlTvVKMsXW3u274Su6e
        VBLlKaddOhVsYMXqUPX0egq/r+gL1G6ryw==
X-Google-Smtp-Source: APXvYqztFBXdjUImF3PUmf4NRRtnHiaNIWXyCfFVV2IwH85RByBtxcGOfdCF0S4snmrJQmQXk9Tnsg==
X-Received: by 2002:ac2:5635:: with SMTP id b21mr2397366lff.127.1579179673593;
        Thu, 16 Jan 2020 05:01:13 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id d24sm10674705lfb.94.2020.01.16.05.01.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 05:01:12 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     "Andrew P. Lentvorski" <bsder@allcaps.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Unable to set "iInterface" in usb gadget via configfs
In-Reply-To: <0453184e-353e-2a98-4f7a-c97b9dddf57a@allcaps.org>
References: <Pine.LNX.4.44L0.2001151011520.1788-100000@iolanthe.rowland.org> <0453184e-353e-2a98-4f7a-c97b9dddf57a@allcaps.org>
Date:   Thu, 16 Jan 2020 15:02:12 +0200
Message-ID: <87lfq75zcb.fsf@kernel.org>
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


hi,

"Andrew P. Lentvorski" <bsder@allcaps.org> writes:
> On 1/15/20 7:14 AM, Alan Stern wrote:
>
>> I don't think any earlier messages in this thread made it through the=20
>> mailing list, but this one definitely did.
>
> Yay!  I also saw this one in the archives so I was hopeful.
>
>>>> I've been trying to set "iInterface" in my usb gadget to a specific
>>>> string, but I simply can't find a way to make configfs accept this.

iInterface is not a string. It's the index to a string descriptor table.

>>>> When I set my gadget up on my Beaglebone Black (uname -a: Linux
>>>> beaglebone 4.14.108-ti-r113 #1 SMP PREEMPT Wed Jul 31 00:01:10 UTC
>>>> 2019 armv7l GNU/Linux).
>>>>
>>>> I get (output from lsusb):
>>>>
>>>> iInterface 5 HID Interface
>>>>
>>>>
>>>> But I want it to be something like:
>>>>
>>>> iInterface 4 LPC-LINK2 CMSIS-DAP V5.224

Why? Oh, you want your beaglebone to behave as a CMSIS-DAP to trick some
other SW?

Do we need to support that upstream, though? It seems like this is a
one-off thing. Does anybody else need to configure interface string
descriptor?

>> Then maybe you need to fix f_hid.c.  Or maybe configfs isn't meant to
>> allow the user to specify these string index values (I don't know any
>> of the configfs details).
>
> That's kind of my problem in that I was hoping to get someone far more
> knowledegable than me to at least flag these before attacking it:
>
> A) I didn't overlook something stupid and this really is hardwired with
> no way to change it (either in configfs or ... some other? kernel mechani=
sm)

yes, it really is hardwired

> B) This is an *actual* bug.

Not a bug, just was never a requirement.

> C) This is an actual bug *that should be fixed* and isn't that way
> intentionally for some Linux reason.

Up until now, it has been intentional. Currently, I don't see a need to
change it. I may be persuaded otherwise, but I need to see arguments
other than "I want to trick some SW into thinking I'm something else".

> D) This is actually the right place to fix it.  Obviously there is going
> to be something at the configfs level, too, and I have *zero* idea where
> to start looking for that.

drivers/usb/gadget/configfs.c, look for GS_STRINGS_RW(). Note, also,
that you should *not* allow for strings to be changed after the device
has been enumerated.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4gXtQACgkQzL64meEa
mQb1oQ/8Dw2TM57OmJPDuK16d7lLy/7v0jFqZK09vhCZ9RZdRWqBxqeqetw+Wme4
7osBPjqUxxMaN9ueLyxEWWwcR+dHthWTw27cTy7AB1jboJwXOxDPvOIzVgPrUr2C
bRH+sdH2rfvNi3sZmFpeOV2E/mZJCLn1iLCjE5z46zwrXBW2+1Q3ew5HxNfkblfX
loCqDkinNSHcPaIfID/+k4dn0Luwz2xl+hePFD3pQsf57NZqungXTbH5wVr13FXw
ZDfoTni/HdqYkHvVOEk7sMjVT/I3ivXlxXFWuZIottot9VUNolinsGTLHOxJH6TA
OEYGiDiaOpo8Y722Z/TlBR2+pRyx+2NzvzoBOgtQ4Jx54YcU1paLQWgwwtF41kJu
J1vomViImLmPUNpQ33U5LDTFA7rBPX8cRcc0QkqOEH73/DecFWDmGjNpobRfKxjF
W9Xvozn7pLDvEabuMAICfK35L7nPxZ6j/hYP2G4iiZohALyhORqA/YyVEySWD5X+
tK+bS80WMWYT5DF/jlxdc9mB0PhE5RyO7tBBqaEpKLH4Ow8bQw2H9sASjLxRz+z6
J8iCugCrBYlkveslRRdIKYUqblb90jIjFcVvGKx3BeQqbl4JgKDMH9oidusIVytB
QjaHMmwz5koADTBpRLClBmdoYSuP5NwKf2EZZ0uLheq1xAcUk6U=
=9Cqh
-----END PGP SIGNATURE-----
--=-=-=--
