Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75E6E14CDC7
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2020 16:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgA2Prl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jan 2020 10:47:41 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40880 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbgA2Prl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jan 2020 10:47:41 -0500
Received: by mail-oi1-f195.google.com with SMTP id a142so130729oii.7
        for <linux-usb@vger.kernel.org>; Wed, 29 Jan 2020 07:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=opRqrQ4hQcy22XTSPDm8TKwfQzSuJjwT3OxJonfKwjU=;
        b=ONdjKSMpSCLpSYL3o8aGV6sXQ6aaj1d8wvljvk5uHwcTyT2YmXpR1M72gN1qKnbHi/
         G898HgweBjVjUSoE0mjIKsBSQb7iE1dwkprZ8eQf0rIHe86Ld2QvlQ0N/YhNp8ltGnUa
         W9ueHmAD6PfwYOjGk1JoJ2110APyT/XF9BwEMdMcU7htoG9k54xXQsrDq2sIvpOMr+jO
         7DNpUnd1GfKGi6479oYt7dmO6+qFQuhCdD9rVYeytSs1cm2hXz5AajbONpyfbM3w5MR4
         NPRbwaY5nLkoBSL0A5lqYqnb0H3t2IgnK3wLGwIU5GpPmqQLzsTy2ZgS7uEGrdTIduIJ
         s0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=opRqrQ4hQcy22XTSPDm8TKwfQzSuJjwT3OxJonfKwjU=;
        b=ZXRq3fpnU7J2Ii7QlrNZBGfY6JIcgrqYWhG5+X6te8Hp9+d0Gl7RDtj06X9KXbZW3H
         gKJJc1JeXxI8qkjcjU2cgV/d2mHpy9GYPoqls26bAhHPeOwde6UMmZzwgl4eGbamXXwC
         IhA++aoHVpwWI79kUJmW4kUuFwtc4gzx9SZ4ccXY2c3dF1B2KVUp/nNhG/Bt0SNGIePv
         +pGiuc6EoU5kyIN37uKm8aNfdCaBlDW0p56oDbv6DuA/DOgxgQp8ZU9UG7Hjf2DDvKDr
         o+Yj03kG/+UIyRFyhHd2kxVOBANn51KtjDo9fbk3f/6QZEWarV004nhishjWAYgkVkmG
         bn4Q==
X-Gm-Message-State: APjAAAV5PUqLlCmAH4Po3KYD0ZW2DiLyQaimsrZNs6YSB8eb5F/1Q+RK
        g7ISfIwsO25XZPSmP1/TdOwAEdL8ub35WhWEqqqu0rM3
X-Google-Smtp-Source: APXvYqyeevKNbCwKtGbw/RgL9kvhwOAaNOKkxuNUsDvK2StLbiQMi1dm5ko20JbhXwZUwtuXYFPT4jFs4ElRuzwjL8s=
X-Received: by 2002:aca:dc45:: with SMTP id t66mr7021598oig.39.1580312860521;
 Wed, 29 Jan 2020 07:47:40 -0800 (PST)
MIME-Version: 1.0
References: <CAAWug1d8wv3Thu0b==j6fLajU965unYKs552j+s9t13MOytmng@mail.gmail.com>
 <1578907421.2590.2.camel@suse.com>
In-Reply-To: <1578907421.2590.2.camel@suse.com>
From:   Richard Dodd <richard.o.dodd@gmail.com>
Date:   Wed, 29 Jan 2020 15:47:29 +0000
Message-ID: <CAAWug1eZiDgMGH9qDi=_Cj_=-HU2icVpNCzeaRYJLzQBChJDJA@mail.gmail.com>
Subject: Re: Usb midi device does not work on wake
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000af9293059d49422d"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--000000000000af9293059d49422d
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 13, 2020 at 9:40 AM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Sonntag, den 12.01.2020, 12:06 +0000 schrieb Richard Dodd:
> > Hello
> >
> > I've got a Novation midi-over-usb device (LaunchControl XL) that works
> > correctly on boot, but remains in power-off mode when waking from
> > sleep.
> >
> > I suspect that there is some sort of initialisation that needs to be
> > applied. Could anyone suggest possible causes, or point me in the
> > direction of the relevant source code. I found `sound/usb/quirks.c`,
> > which seems to be the place to handle this kind of thing, but there is
> > no mention of my device anywhere in the source tree at present
> > (1235:0061).
>
> Hi,
>
> some devices need an additional reset. They have the quirk RESET_RESUME
> in that file. Try adding your device to that list and recompile your
> kernel.
>
>         HTH
>                 Oliver
>

Hi

I found the list you are talking about in `drivers/usb/core/quirks.c`,
and when I patched it, my device correctly woke up after suspend. :)

Can I upstream the patch by posting it here. The patch is attached to
this email.

Thanks
Rich

--000000000000af9293059d49422d
Content-Type: application/octet-stream; name=patch
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: base64
Content-ID: <f_k5zhgox50>
X-Attachment-Id: f_k5zhgox50

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NvcmUvcXVpcmtzLmMgYi9kcml2ZXJzL3VzYi9jb3Jl
L3F1aXJrcy5jCmluZGV4IDZiNjQxMzA3MzU4NC4uM2RiNmMwNWFhYTRiIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3VzYi9jb3JlL3F1aXJrcy5jCisrKyBiL2RyaXZlcnMvdXNiL2NvcmUvcXVpcmtzLmMK
QEAgLTQ0NSw2ICs0NDUsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9kZXZpY2VfaWQgdXNi
X3F1aXJrX2xpc3RbXSA9IHsKIAkvKiBJTlRFTCBWQUxVRSBTU0QgKi8KIAl7IFVTQl9ERVZJQ0Uo
MHg4MDg2LCAweGYxYTUpLCAuZHJpdmVyX2luZm8gPSBVU0JfUVVJUktfUkVTRVRfUkVTVU1FIH0s
CiAKKwkvKiBub3ZhdGlvbiBTb3VuZENvbnRyb2wgWEwgKi8KKwl7IFVTQl9ERVZJQ0UoMHgxMjM1
LCAweDAwNjEpLCAuZHJpdmVyX2luZm8gPSBVU0JfUVVJUktfUkVTRVRfUkVTVU1FIH0sCisKIAl7
IH0gIC8qIHRlcm1pbmF0aW5nIGVudHJ5IG11c3QgYmUgbGFzdCAqLwogfTsKIAo=
--000000000000af9293059d49422d--
