Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17E3D141F19
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2020 17:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgASQo7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jan 2020 11:44:59 -0500
Received: from mail-lj1-f170.google.com ([209.85.208.170]:38553 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgASQo6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jan 2020 11:44:58 -0500
Received: by mail-lj1-f170.google.com with SMTP id w1so31410090ljh.5
        for <linux-usb@vger.kernel.org>; Sun, 19 Jan 2020 08:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=p6LvfqS6es9xAyhhJg/biKdG2b7VKpLL6+q8bq5fpko=;
        b=GTpLBz9VQ+KBbRzx3oeP16uk2tEhb6d64F8A67E9yiYRKmCbd270nEvMvzcS9mN64Z
         AzPjjZg4OuQcjsr+10dFJiOSnD4PE810i7j2zMRQOKC95YIvfw9m8Vb2br5+wr3Df8Vf
         mnJz7eNPGJ2E7hoXvI/pY0D7hnzBKaaccFJWgNZQ5CNPjKpu0UvQnQLRQEz2k9LMPf/I
         MCVZm0VGm2jRNf4AjKakQYbk/X1E6Ov0FBa41QXLAaXUuXAP0iteQN6BBDqN6InFMNVS
         XSe1TjR1INQMpgNoS6nytGPKQ6Vw65WFyddPcJyX/1UnFwgHSTeUkc1P055SYTsmVp0E
         8F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=p6LvfqS6es9xAyhhJg/biKdG2b7VKpLL6+q8bq5fpko=;
        b=FyurNffHbxJxMNjyfua+aIkykI5fKWmCyB5K5OxW0bjJiQ0zboM1GvqtBTbiUBfhOA
         vpXON9YC1eFufIjPuh+DvrU8q0A++nAY+AvU0az2aIAcU3UQCtizVQIgK79j8s3gjXKx
         p2gHrs2C6SEoZtK8K+QZi2ZnJi5I3uyyFFGkz9aM015EqeIOCTxA6d72xR8n7zwNFzAF
         c8Ezsd98/s5Yv7yjeWYm2JqpjQ9U7c/DPnAM30v1R340UqDDuQQt/l+PE98mi10TA5rf
         PKoC210ud4IudxW6Z7zM5NZFsZ9Llro3iBM8OfUs57bVqdUfCj29h1JJ+iaDVXY+uwDH
         wFTQ==
X-Gm-Message-State: APjAAAW5ZmbLi70vBIm9mN21d1/GqzJyL027EVi0YWzh8M/K1JrzO4Lt
        Z1KWWn1CsEOtw+Av++xrc/4mImwD
X-Google-Smtp-Source: APXvYqy008toUkExPA7czOavOFx1qD/EI15cfgiCsHtyjgnAwbW/RaLj6LIEJjZg+WRAPBYjL2mg2A==
X-Received: by 2002:a2e:b0c9:: with SMTP id g9mr11239735ljl.134.1579452295630;
        Sun, 19 Jan 2020 08:44:55 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id b17sm15286525lfp.15.2020.01.19.08.44.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Jan 2020 08:44:54 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     "Andrew P. Lentvorski" <bsder@allcaps.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Unable to set "iInterface" in usb gadget via configfs
In-Reply-To: <76a34192-6b09-357c-f1e0-2228a9ebab76@allcaps.org>
References: <Pine.LNX.4.44L0.2001151011520.1788-100000@iolanthe.rowland.org> <0453184e-353e-2a98-4f7a-c97b9dddf57a@allcaps.org> <87lfq75zcb.fsf@kernel.org> <26ebfc08-0952-8c26-b9f4-01da14ea4846@allcaps.org> <878sm65tak.fsf@kernel.org> <76a34192-6b09-357c-f1e0-2228a9ebab76@allcaps.org>
Date:   Sun, 19 Jan 2020 18:45:49 +0200
Message-ID: <875zh75r9e.fsf@kernel.org>
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


Hi Andrew,

"Andrew P. Lentvorski" <bsder@allcaps.org> writes:
> On 1/17/20 1:25 AM, Felipe Balbi wrote:
>
>> why? No behavior changed. Look at the very first commit on
>> f_hid.c. commit 71adf118946957839a13aa4d1094183e05c6c094 contains the
>> following:
>
> Oops.  I missed that.  Sorry for not being complete enough.  My fault.
>
>> Now, if there's a real usecase for this. Something that can attract, as
>> per Dave B., 3 or more users, then we can consider adding it
>> upstream. Remember that if we add support for changing interface
>> strings, it has to be implemented for *all* functions and validated on
>> all functions, then properly documented as a configfs ABI which can
>> never change anymore.
>
> Erg.  I did not realize that this was not going to be limited to just
> f_hid.c.

Well, all functions use the same infrastructure :-)

> That's ... ugly.  Reeeally ugly.  And a *LOT* of work.

yes :-)

> I can certainly see that "some devices do this" is nowhere close to
> enough justification for that.

right

>>> control board the ability to now also be accessed via ethernet or
>>> wireless (or even a better USB protocol) and thus now has an upgrade or
>>> higher performance path is a *really* useful thing.  And the Beaglebone
>>> Black is a really good "protocol engine".  Finally, after making the usb
>>> gadget emulation work, I can probably blow a bunch of Windows machines
>>> away completely since something like a Beaglebone Black is more than
>>> sufficient to handle the control without any outside intervention.
>>=20
>> You're getting to a point where things start to get interesting. What
>> exactly are you trying to do?
>
> I've got both a GPIB (with USB 1.0(!) only--as far as I can tell--talk
> about a relic) and an industrial controller (unknown protocol but USB
> tracing and a signal analyzer shows pretty much 1-1 so reverse
> engineering it doesn't seem problematic) currently sitting on my desk.

you've just made totally envious :-p

> I have one system which has enough USB devices in it that it won't work
> on a USB 3 system because the Intel USB 3 chipset allocates twice as
> many endpoints per device and hits an internal limit--they want a USB
> upgrade as an intermediate move to ethernet.

I understand

> I have a half-dozen other similar type requests queued behind these.
> People are finally reaching a critical point where they can't keep
> ancient hardware, ancient drivers, ancient Windows, and ancient
> computers all running anymore--even VM's are starting to fail as too
> many things have some level of timing baked into the driver (normally
> unintentionally).
>
>>> Anyhow, let me know whether I should attack the problem or not.
>
> At this point, I suspect that the correct answer is "Keep an eye on this
> while moving forward."

that's a good approach for now

> If I stumble over more drivers that are trying to use iInterface for
> some reason, I will see if setting it to 0x00 makes things choose a
> different path.  Simply changing the default to effectively 0x00-unused
> seems like a lot less work and might pick up 90% of the use cases.  It
> also means the scope would be limited to f_hid.c.  If I hit this a
> couple times, I'll have a lot more justification behind me.
>
> If I start seeing cases where I actually need to specify the iInterface
> stuff, I'll come back with data and we can revisit this again.  I
> suspect that someone is eventually going to drop a CDC class device in
> front of me, and that will give me more data, too.  If ever I reach the
>  point where I have multiple devices working around this, hopefully you
> will find my arguments far more persuasive.  :)

Definitely, if you find a couple more usecases where this is needed,
then we have much stronger evidence that this will be needed for real.

>> you could use dummy_hcd as well.
>
> Interesting.  I did not know about this, but I will keep it in mind.
>
> Thanks for being so patient.  Sorry for wasting your time only to come
> back to "do nothing".

no worries, you didn't waste my time at all. I had never considered the
usecases you mentioned before this thread ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4kh70ACgkQzL64meEa
mQZ0oBAAzPjl90IIJRw6EZPzApHWGyHRlcOVLmS976earEAc5DHpIUrOTAiRqVon
xWlMtN8oGOu/y+9WyYX3i9UOap6GZADgXzMcGHIX+7SSL6TKdMxcbSH5i37d/phx
sQEAZgSKVsOft1Ufe9LfiDaeGm5DDwy7qIk+fOhYhjYS/lQv3FDfNR9UnWn0IlwR
NztsQt5Pdw3V596kuyxVilgjrfS083bBcWBoodGhfHKzJgTGeC/Hui3iWFOYYL1u
91e9e12eaIfdc6653VsRDsf2k10voqyPhT9Q9NYVvWv1zkC1cqOiPCAqlWOYjIEs
pszfQWFEMRvFTtxYoF5p3oTci83R0f1fbzH6UENDNrzRTm22NvRvsqryahGxJoMR
T0N4K+v3CSKeF4jnzfcVFQuhOrwEmld9yuHSA3akMe80NlF2tCMxDaYq8keI1X3p
msmGu6r1Sd4vwRcHqt4Xm7O3nAimXKeSFzqU3+GgTzGKZMohx92PO+MHas/WUXH3
nVgidgPrpvLKgP4YXL5f8LT2U0ikMGyzB2YRmi7ZHWlv0Za2yMngYMsQs0Q88y8L
euS/l3sc4maz03ye+tTqr25++1cx/TtdI0WxbByb+eiTTFRoDCM+0hjLn70fzcUt
/gMyY76DoU6LqLFONNIv4oEkWMT8Rt5Oo/RJXlP66KmtVsJc2MA=
=os4M
-----END PGP SIGNATURE-----
--=-=-=--
