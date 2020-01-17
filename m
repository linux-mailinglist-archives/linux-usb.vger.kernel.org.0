Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF261405FD
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2020 10:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgAQJYO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jan 2020 04:24:14 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37631 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgAQJYN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jan 2020 04:24:13 -0500
Received: by mail-lj1-f196.google.com with SMTP id o13so25711713ljg.4
        for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2020 01:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=1dq8Vca9ZcGRQQXV5R0nMNhFtWXbn+43buv1MOtx1QU=;
        b=LDVdHtiO2SmOhaNTrAX1jjaeW0I3aSzbpnYC7KqGUt4Xt/0N9FIRw8VWQH2DiBCSgn
         bH429UpBjTCgB06whpZfkYuhaba+UAMmbcY8JmjKPb+7+CuqetEytnf/mxliIqlNUgkS
         y31VJI1MzOTgiN2t/thUYVOuN5BOYt4+KzBDdjtKZxQvV/r/H5IA9O6N9T/uCja+Lloo
         vHVID7gNaJs1r15JG99TqOfgFDngnkqSJzuppn5oZw2lAYzmRxEkOTCt6eGmgN0OQuX0
         /2cMxk/mB8IO+Dj+79a+CZexpzDhthDrHzy/TQPVfopUWxcbcqnxjt1jffL9mihD26I6
         2Zig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=1dq8Vca9ZcGRQQXV5R0nMNhFtWXbn+43buv1MOtx1QU=;
        b=qvI2pWHZpURkB9+xH6Ngqnzox4oeX18DXhPiml138XlFoCgrfQPABfRZJf1jVjx3nn
         GG07r2WH+TSPO27ubPtAgvYeCuNg7bKXt7Or2APXG3AX8JdEc7aI4NXy80S/yQg4vnKW
         YjR7XbE6kr3OU/mIkvEW9RXpJAdkd5cuFBWJ8D/aDd2Xug84vg3w0yOdnjKpj9QHzsJY
         yTx1E8y+asRcsToO6Dl8ys67hvS3fFvH/4akKbsuMdMwvZ6JP3uwJ6zeBpr2ELsXor0z
         bHACom+JEhteOYuOASfCYWB6JetJaTY/xWGFdOcseLZGt8Xid4BQEaT6MSluCDogq5nd
         SSNw==
X-Gm-Message-State: APjAAAWBpaT5yMfmLtlMwdE/OHH5rpZf00PQ3PW6/iQHHH+T2vUX5TQd
        XuDsEUPkjHWSB6afufWBbojIoWgI45Im2Q==
X-Google-Smtp-Source: APXvYqw4McQA3KaNYE2okYsakjk0WuR6e4q4LZTJXvKUcnsY63O1aqe0DrYC/zMCZLo5ElsWYTD7+Q==
X-Received: by 2002:a2e:7e05:: with SMTP id z5mr4654544ljc.99.1579253051202;
        Fri, 17 Jan 2020 01:24:11 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id q13sm14217247ljj.63.2020.01.17.01.24.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 01:24:09 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     "Andrew P. Lentvorski" <bsder@allcaps.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Unable to set "iInterface" in usb gadget via configfs
In-Reply-To: <26ebfc08-0952-8c26-b9f4-01da14ea4846@allcaps.org>
References: <Pine.LNX.4.44L0.2001151011520.1788-100000@iolanthe.rowland.org> <0453184e-353e-2a98-4f7a-c97b9dddf57a@allcaps.org> <87lfq75zcb.fsf@kernel.org> <26ebfc08-0952-8c26-b9f4-01da14ea4846@allcaps.org>
Date:   Fri, 17 Jan 2020 11:25:07 +0200
Message-ID: <878sm65tak.fsf@kernel.org>
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

"Andrew P. Lentvorski" <bsder@allcaps.org> writes:
>>>>>> When I set my gadget up on my Beaglebone Black (uname -a: Linux
>>>>>> beaglebone 4.14.108-ti-r113 #1 SMP PREEMPT Wed Jul 31 00:01:10 UTC
>>>>>> 2019 armv7l GNU/Linux).
>>>>>>
>>>>>> I get (output from lsusb):
>>>>>>
>>>>>> iInterface 5 HID Interface
>>>>>>
>>>>>>
>>>>>> But I want it to be something like:
>>>>>>
>>>>>> iInterface 4 LPC-LINK2 CMSIS-DAP V5.224
>>=20
>> Why? Oh, you want your beaglebone to behave as a CMSIS-DAP to trick some
>> other SW?
>>=20
>> Do we need to support that upstream, though? It seems like this is a
>> one-off thing. Does anybody else need to configure interface string
>> descriptor?
>
> I ... don't know, actually.  That's probably a good question.
>
> What I *can* tell you is that a quick survey of the various USB devices
> in my office with lsusb shows the majority of iInterface are 0x00, but
> that everything else is a smattering of all manner of stuff: "Integrated
> Camera", "Bulk Control Interface", "Volume Control", "Firmware Upgrade
> Port", etc.
>
> Microchip's PIC32 USB HID sample code sets the value to 0x00.
>
> USB Complete (5th Edition) also shows this as 0x00 on page 267 for a
> configuration_descriptor for a vendor-specific HID.
>
>
>>> C) This is an actual bug *that should be fixed* and isn't that way
>>> intentionally for some Linux reason.
>>=20
>> Up until now, it has been intentional. Currently, I don't see a need to
>> change it.=20
>
> Clearly, some HID devices *are* using this field.  So, this probably
> should be made changeable if we want the HID gadget to be maximally usefu=
l.
>
> As for the technical details I can see from the code:
>
>
> A bit of code archaeology shows that .iInterface was expected to be
> dynamic as of the origin commit for f_hid.c (commit
> 71adf118946957839a13aa4d1094183e05c6c094).  This still persists in the
> file today.

What you're missing, though, is that iInterface is merely an *index*
into an array of strings. What's dynamic is the index, not the string
itself.

The reason for this is that we want to build different gadgets by
combining the different f_* functions in different ways which will, in
turn, change the location of $this function's strings in that array.

> The allocation of usb_gstrings_attach comes in at Nov 6, 2014 as of
> (commit 5ca8d3ec9970f4798e68bd21a9d44db3d0ff4da7) with the message:
>
> "Before configfs is integrated the usb_gstrings_attach() interface
> must be used."
>
> This looks like a case of something that simply got lost in the shuffle
> in the upgrade path to configfs, and I'm just the first poor slob who
> tripped over the oversight.
>
>
> However, I'm a little concerned as to why this was set *at all* (which
> seems to be what is actually tripping me up), and I'd be interested as
> to what drove the specific choice of 0x05 "HID Interface".  I don't see
> this in any spec anywhere obvious and this seems to be a deliberate
> change from previous behavior.

why? No behavior changed. Look at the very first commit on
f_hid.c. commit 71adf118946957839a13aa4d1094183e05c6c094 contains the
following:

+static struct usb_string ct_func_string_defs[] =3D {
+       [CT_FUNC_HID_IDX].s     =3D "HID Interface",
+       {},                     /* end of list */
+};
+
+static struct usb_gadget_strings ct_func_string_table =3D {
+       .language       =3D 0x0409,       /* en-US */
+       .strings        =3D ct_func_string_defs,
+};
+
+static struct usb_gadget_strings *ct_func_strings[] =3D {
+       &ct_func_string_table,
+       NULL,
+};

The string has *always* been "HID Interface"

> If this isn't user configurable, then it's probably a highly
> questionable choice to give this any default value other than 0x00.

why?

> This would have been quite a bit easier to code, too, so I'm *really*
> scratching my head about this.

what would've been easier to code?

>> I may be persuaded otherwise, but I need to see arguments
>> other than "I want to trick some SW into thinking I'm something else".
>
> Obviously I'm biased and scratching my own itch, but why would you
> consider that not to be an important argument?

Because you're asking me to accept code that will be used only by you
for, perhaps, a few weeks while you make (possibly) openocd think your
device is a CMSIS-DAP. If that's the only usecase, you can modify the
string in your own kernel tree. If it's a one-off thing, we don't need
that code in upstream.

Now, if there's a real usecase for this. Something that can attract, as
per Dave B., 3 or more users, then we can consider adding it
upstream. Remember that if we add support for changing interface
strings, it has to be implemented for *all* functions and validated on
all functions, then properly documented as a configfs ABI which can
never change anymore.

> Being able to fake being a particular piece of USB hardware that's
> currently tied to some ancient Windows binary driver is a great way to
> insert Linux into industrial and lab control pipelines.  Giving a

fair enough, but your making a claim that help you and only you :-)

> control board the ability to now also be accessed via ethernet or
> wireless (or even a better USB protocol) and thus now has an upgrade or
> higher performance path is a *really* useful thing.  And the Beaglebone
> Black is a really good "protocol engine".  Finally, after making the usb
> gadget emulation work, I can probably blow a bunch of Windows machines
> away completely since something like a Beaglebone Black is more than
> sufficient to handle the control without any outside intervention.

You're getting to a point where things start to get interesting. What
exactly are you trying to do?

> My end target isn't "CMSIS-DAP"--there are a zillion really cheap
> CMSIS-DAP devices so emulating CMSIS-DAP would be mostly pointless
> pedantry (although perhaps a good usb gadget tutorial).  CMSIS-DAP just
> happens to be a really good test case as it is an extremely well
> documented HID-based protocol and has extensive tests to validate it.
> Consequently, I can be sure that most bugs and difficulties are
> localized to my gadget implementation code or the gadget driver.

Fair enough

> Anyhow, let me know whether I should attack the problem or not.  I

I can't prevent you from working on it, I just think that:

a) perhaps you haven't considered all the intricacies around supporting
   this upstream (hint: you can't implement for f_hid alone)

b) you haven't convinced me that this has the potential for more than
   one user

c) you haven't considered the extra that comes with making this into an
   ABI

> suspect my biggest issue is simply that I will have to do all the work
> on a Beaglebone Black as I really don't know of any other way to test
> that gadget subsystem.  This will probably be okay if I can build it as

you could use dummy_hcd as well.

> a module--if I have to do a full kernel build it will probably demand
> that I set up a cross-compiling environment (and that isn't trivial).

cross-compilation for the kernel is trivial in most distributions. Just
install arm-linux-gnueabihf toolchain which should already be packaged
for you.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4hfXMACgkQzL64meEa
mQYa3Q//Z/K2f75f3twU725UafeWuQIpT63TmXJWb7MBCae3rkl/Wg8WMzDsxApD
/ZfDSxwMC0l9tx5pclTt5DZZjhHv/oAcUb1JAO6monP2JutoIsrLXlCdtL9zLzXP
m7nSnuvzg4rVGxQLDU3OxNXwsk5AZy9fj9wTYf6d2EmyX/2YnHCslWlmf1mXbMw1
u0GTlulK49HWzDbS4Whd3+Aeg3zsvJ0i62pTCEqcC7rXtYV+sn5eDK+qrrHFFzXZ
EVuLw8ZudUANHOnIEo+BKWphXl8okDC4Vq6Vl3cSy4AWFD5do42U94ws6rolRk2w
Ayvl4Ird5SZRGkpKtSs/+HPQbJvYKuOSzpQ9WDolsetn7RvEJMAkh0+nQj6uff5L
1FNyNn4UBWdD0h1LLOLGaHg2tTjb9i5mU9wcOBpWbjjwFkLaI9bkHVlfaqaJgHp8
n69NYx+NAHlMdvvDoDdUKze30Rew51Q2+dAQsaV8n9CdopK/UMVd9469Tv07/5op
2HcuIq/nhZmdUYmg54iBcAzMj0BiMzUYZD1E2uF7lE6W+5c0kTwZaTPPaN/Pt/DL
PlKFGaoMtB5HyMH2Ye0ZCWJCtZfnFfZ4KnPurEvHJSapgazjgpErNEj1Q7yKLwBo
TU6D1PoxAWEdlIjCXEemW89CMRzfdCB0NeZhNUSDrvMIZ9DVP6I=
=/DXu
-----END PGP SIGNATURE-----
--=-=-=--
