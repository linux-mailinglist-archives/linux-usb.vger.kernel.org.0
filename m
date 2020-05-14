Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0FF81D2B84
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 11:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgENJed (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 05:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725878AbgENJed (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 05:34:33 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC638C061A0C
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 02:34:32 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id r17so2027420lff.9
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=4ochJLhArIn3MufWzxhw4gsCUtDsPdwSWwkbWfA3CIU=;
        b=s2WDd8r6qnbQt9YZ5oqaw5AbDvwOmNAjRDw00igCgWYQgkmdC4G5p+bMtOuVcix+oV
         f0+FBSpqJx/K+2+vJl2xPvz3AzCmwC/59I3+Ssg/tLodKgvFPpnqNexnMwUnhp0PCNfG
         DWZaCj5mDKNUDvhBkc/jrynBF9clz0EYOHl5WbVIduEz8nsaeCUqDAmZ1Iz2e1V4Phqv
         ecnIULCMfNt0xkua643WEVrrrAejOJu441zeDpHFyW9NFWvWZDg2vqN4oXQpb7LKiHPE
         BR5JRme9AogzFzCVxsVxFK7Fj2k6bj3PQjnK/Xke9lLZ9I8FbWx/ud9Wff/koB1g2g2q
         544g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=4ochJLhArIn3MufWzxhw4gsCUtDsPdwSWwkbWfA3CIU=;
        b=s7s14P9j/IQTJ93Z2dsbPa2AR8UDORCGOWN4Dv/TSp9ellS/DiHBWwKUAUo1msQYLf
         YrwyFBSgdbuYMjeYwPNpmMurqpxKIPi4vHpOx96DfvZJXVRjtzHw8w6KxLN8uO6nl6rK
         Ays4MFBaSpQ5DTS5BhugPiIaICTjscokPik1uYI6AV/XrrM4Nip6u9V7LumFgzZZeoRJ
         3w/zbjUNAsRAldVNot2JBSZajxcZOD8BIw3Bqp2mD9JUzVZb8GIrBtpaEZUY0OsG57Hk
         RaOYZYhWF6M3dF12T3pkfRioXMwjrPFbURQedyyNxcV8QHTcd8d4RAhbWe9a17eHVSB8
         TWvg==
X-Gm-Message-State: AOAM531zYgA6RwbUomQiq8nCuZmMZ+hGtMHW2sm//nPWF2BZZszPbL7U
        5ssoz+5eEBdr9SQHRs+AqUKgIGedmwM=
X-Google-Smtp-Source: ABdhPJwDCJ9l0rXSF8XraETapMV4NPFnadWmGpMQKDjonPwWwFn/6GN2IDsR+qWCsVAcne6OTWYEzw==
X-Received: by 2002:a05:6512:310d:: with SMTP id n13mr2751293lfb.205.1589448870840;
        Thu, 14 May 2020 02:34:30 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id f4sm1165502ljm.11.2020.05.14.02.34.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 02:34:30 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Claus Stovgaard <claus.stovgaard@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Options for forcing dwc3 gadget to only accept superspeed
In-Reply-To: <e44a96cff9bee0b9f47c82d05461570d47d96177.camel@gmail.com>
References: <8943a225c6d8354f2f5fe0ea7270dc0fa1293180.camel@gmail.com> <20200512195231.GA26080@rowland.harvard.edu> <6d19d49dcfe7467556b0462b16e76677c1999875.camel@gmail.com> <87k11gp9t4.fsf@kernel.org> <e44a96cff9bee0b9f47c82d05461570d47d96177.camel@gmail.com>
Date:   Thu, 14 May 2020 12:34:25 +0300
Message-ID: <8736826ese.fsf@kernel.org>
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

Claus Stovgaard <claus.stovgaard@gmail.com> writes:
> On ons, 2020-05-13 at 10:34 +0300, Felipe Balbi wrote:
>>=20
>> If it's "ending in super-speed" this means it tried RX.Detect and it
>> failed, thus falling back to high-speed. It's likely that the signal
>> quality in your setup has degraded or is, at least, sub-par.
>>=20
>> Forcing a SS-only setup would just give you a device that doesn't
>> even
>> enumerate in some cases.
>>=20
>> Could you capture dwc3 tracepoints of the problem?
>>=20
>> Also, which kernel version are you running? Which platform?
>>=20
>
> Thanks for you reply Balbi.
>
> Will start with from the back. The kernel is 4.19 in the xilinx version
> - https://github.com/Xilinx/linux-xlnx

4.19 is *really* old. Care to try v5.6 or, better yet, v5.7-rc5?

> It is running on a ZynqMP from Xilinx, where we are using the build in
> Cirrus SERDES as phy. In front of the phy is a tusb1042i redriver/mux
> and a Cypress CCG4 as type-c controller for handling the redriver/mux.
>
> Regarding signal integrity - it is on my radar. I know from experience
> that noise on the GND in the cable can highly influence signal
> integrity on the super speed pair in some situations, even though it is
> shielded.

Yeah, common problem with high-speed signals.

> I am currently working on a setup with a Beagle USB analyzer, together
> with dwc3 tracepoints, and automatically disconnect and connect the
> USB. Would like to have both the USB analyzer version of what happening
> on the bus, together with the dwc3 handling.

That makes sense to me. One thing you can try is disabling PHY suspend
(see our existing quirk flags) and also disabling scrambling for
testing. Do NOT, however, ship your product with scrambling disabled ;-)

> It just takes some time to create this test setup (need to do some
> python code for controlling the Beagle and the device), so it will take
> some time before I can have any data.=20
>
> So my email is also kind of an brainstorm for what kind of options
> there exist in the dwc3 to control how it falls back to high-speed.

falling back to high-speed is not something we can control. It's part of
the standard, and as such, implemented entirely in the HW. What we can
do is figure out *why* Rx.Detect fails and causes the link to downgrade.

A look at the tracepoints, even without the sniffer, may give us hints
of what's possibly happening.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl69EKEACgkQzL64meEa
mQYXcBAArxbECsmZrcJymxcX3UFn2saVSqaNq3OsBCueqsFIk0X4AASaLTzjceqh
kGR3926qziBGOPcbGVMOkonxSInkJAcwcCNHnWZ5+iQFWdN3p17BAl9uPE0vHuE9
3U+4yBAZHYcHg2xhO5JPiWAHV4ly++KtqxfiDuv1NAcujxTtmfJAF6JfrUYQ9tgS
4QQdS+zY1h8ohMIDnrbbzDe5qF0Jt33CXslTGled/0c/uItPOh6yC5HrQVIXK9OT
QtLdxVqzUNHdGOxym52MqTPE6jJnlaC3uoSP/MohK3nPSguwyhwW+MppYAbbE/zU
/Mzecb2qBvv2kHwmbsSV0L2SKqlsHtFCc2QA/ZQbmcbr9WyW6R51QWtR6lC0ttOy
E7pDrKnZGMxaeczW+KEehnVapySCMWZ4f4ZuEU9wElb0ZJtbJR0M9p6RDJtELHua
C3j3ZuxfrJ8YXMsBkHjIDg6/AxKpR7u4AFTVMiB7ZRL6skqCm4DypJbT3QQBnNAL
rhdOg39CCoXpngrIVFLwQzteCVyP/sMfZP7w2w7FqM5/zVVV8ZhguKBG/RSa9Z1e
IgwqjsWStZA2dxaUyXqf8DRDA0Ht0rH8OVVO6JPVBO7buWfzmoXxQMBSuCFXEKDK
SBUd7oFK/MnxsIk0ej/LLGlElSoRloieFEqjbBpZTG7BUi/pxoU=
=YZ6h
-----END PGP SIGNATURE-----
--=-=-=--
