Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D496314DF82
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jan 2020 17:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbgA3Q66 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jan 2020 11:58:58 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33326 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgA3Q66 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jan 2020 11:58:58 -0500
Received: by mail-ot1-f67.google.com with SMTP id b18so3841654otp.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Jan 2020 08:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VkkAC/29FIiJsIoqn1/IGPQLhGYJQdYouYstDqlFPgM=;
        b=coBk1dC2VHCUDBwNDaf0tYDsfTzR4g6me2T9f8kdluZttCiZfZkpFOqJAyoBu2gQS4
         A3tx5kH/TIJOEyMdNfrFYUZiyCtmi9uD9cBqRCDNqNYmeOkImSAePiX7D4FtyXeBVlwG
         9dh3h1btqM9Qlu9B311uHJ/iVBUqh9z8pzfAQKzEDnatx8vi8gQY/cEQdv5RiDMxd0QX
         a7tdJMRRuFtJWM1a6kOy8G5GAOnMoMIdDv7xRViar2an6l/GMd6IDxIYwACU6i2vcwH0
         VOppFD/OBU7l92OKgqoRVmXIKxmtQ5Cj0OmVtetBovHMVkjw4Z4ZIgfCN3pmIMh8P72l
         C2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VkkAC/29FIiJsIoqn1/IGPQLhGYJQdYouYstDqlFPgM=;
        b=Qc482D5AtwQtnbmT7xdg88hL9ENbJfpbXamV7wUnMU5UIXU6bcv3TVnRQOE3wN35Nd
         euBiNpYrhlFAQOHQuc1JsNmPU4ivQqXIwFy88jGwH7c9RwM6yKqVB7hJ6iDH7oBf+lww
         Ott7xvbdi30dIlFrFQGQ+JwPHsy4CYL08p9y3t+O7m1GgKxIDrjrNCu+aPs8zsMxObxm
         QkdfNem7vZfrJTaFScXHHRWHREEmUd/fsasv+kqZIUE6zWlQR2bcdm5JCfMja8F4EtKQ
         8u73opY70kKfGW+5Pu8FJObkd8ktOcUrEG9LqgdlBc9d+AJVPCw/BgCtpNI5nY0trw8K
         E+wA==
X-Gm-Message-State: APjAAAXaQjos4lx1rBPw9YWYXHqqXSrss7MWKQyUZqBwlxh1mY+emI/Y
        Uo+WdTCUNYIw1MBCnj8BM55kMRQ/JsOUMiknCf0=
X-Google-Smtp-Source: APXvYqz6rJsGpWJnxbE1zXySPAGUcZjYqNmdZ/mvkXVyF+fjsfupl1DkUnl2ACZEc9evQiEvBWkpIJuQrFGoiWbrKR0=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr4174700otl.118.1580403537519;
 Thu, 30 Jan 2020 08:58:57 -0800 (PST)
MIME-Version: 1.0
References: <CAAWug1d8wv3Thu0b==j6fLajU965unYKs552j+s9t13MOytmng@mail.gmail.com>
 <1578907421.2590.2.camel@suse.com> <CAAWug1eZiDgMGH9qDi=_Cj_=-HU2icVpNCzeaRYJLzQBChJDJA@mail.gmail.com>
 <20200130063403.GB628384@kroah.com>
In-Reply-To: <20200130063403.GB628384@kroah.com>
From:   Richard Dodd <richard.o.dodd@gmail.com>
Date:   Thu, 30 Jan 2020 16:58:46 +0000
Message-ID: <CAAWug1erbkau-P5hdJ1F3hJBea_nmpiiOiNVJ2-HM2fZ==TS-A@mail.gmail.com>
Subject: Re: Usb midi device does not work on wake
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000074c800059d5e5fcb"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--00000000000074c800059d5e5fcb
Content-Type: text/plain; charset="UTF-8"

Hi Greg

Hopefully I followed the correct instructions. I have attached the patch.

Rich

On Thu, Jan 30, 2020 at 6:34 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 29, 2020 at 03:47:29PM +0000, Richard Dodd wrote:
> > On Mon, Jan 13, 2020 at 9:40 AM Oliver Neukum <oneukum@suse.com> wrote:
> > >
> > > Am Sonntag, den 12.01.2020, 12:06 +0000 schrieb Richard Dodd:
> > > > Hello
> > > >
> > > > I've got a Novation midi-over-usb device (LaunchControl XL) that works
> > > > correctly on boot, but remains in power-off mode when waking from
> > > > sleep.
> > > >
> > > > I suspect that there is some sort of initialisation that needs to be
> > > > applied. Could anyone suggest possible causes, or point me in the
> > > > direction of the relevant source code. I found `sound/usb/quirks.c`,
> > > > which seems to be the place to handle this kind of thing, but there is
> > > > no mention of my device anywhere in the source tree at present
> > > > (1235:0061).
> > >
> > > Hi,
> > >
> > > some devices need an additional reset. They have the quirk RESET_RESUME
> > > in that file. Try adding your device to that list and recompile your
> > > kernel.
> > >
> > >         HTH
> > >                 Oliver
> > >
> >
> > Hi
> >
> > I found the list you are talking about in `drivers/usb/core/quirks.c`,
> > and when I patched it, my device correctly woke up after suspend. :)
> >
> > Can I upstream the patch by posting it here. The patch is attached to
> > this email.
>
> Can you please resend this in the format described in the documentation
> so that we can apply it to the tree?
>
> thanks,
>
> greg k-h

--00000000000074c800059d5e5fcb
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-USB-Fix-novation-SourceControl-XL-after-suspend.patch"
Content-Disposition: attachment; 
	filename="0001-USB-Fix-novation-SourceControl-XL-after-suspend.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k60zflue0>
X-Attachment-Id: f_k60zflue0

RnJvbSA3ZDk5MWRmNjlkMmM0N2FjNDFmNDY1NzEwOWNlZTUxNGVlZjY4NzI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSaWNoYXJkIERvZGQgPHJpY2hhcmQuby5kb2RkQGdtYWlsLmNv
bT4KRGF0ZTogVGh1LCAzMCBKYW4gMjAyMCAxNjo1Mzo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hd
IFVTQjogRml4IG5vdmF0aW9uIFNvdXJjZUNvbnRyb2wgWEwgYWZ0ZXIgc3VzcGVuZAoKQ3VycmVu
dGx5LCB0aGUgU291cmNlQ29udHJvbCB3aWxsIHN0YXkgaW4gcG93ZXItZG93biBtb2RlIGFmdGVy
IHJlc3VtaW5nCmZyb20gc3VzcGVuZC4gVGhpcyBwYXRjaCByZXNldHMgdGhlIGRldmljZSBhZnRl
ciBzdXNwZW5kIHRvIHBvd2VyIGl0IHVwLgoKU2lnbmVkLW9mZi1ieTogUmljaGFyZCBEb2RkIDxy
aWNoYXJkLm8uZG9kZEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy91c2IvY29yZS9xdWlya3MuYyB8
IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvY29yZS9xdWlya3MuYyBiL2RyaXZlcnMvdXNiL2NvcmUvcXVpcmtzLmMKaW5kZXgg
NmI2NDEzMDczNTg0Li4zZGI2YzA1YWFhNGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL2NvcmUv
cXVpcmtzLmMKKysrIGIvZHJpdmVycy91c2IvY29yZS9xdWlya3MuYwpAQCAtNDQ1LDYgKzQ0NSw5
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCB1c2JfcXVpcmtfbGlzdFtdID0g
ewogCS8qIElOVEVMIFZBTFVFIFNTRCAqLwogCXsgVVNCX0RFVklDRSgweDgwODYsIDB4ZjFhNSks
IC5kcml2ZXJfaW5mbyA9IFVTQl9RVUlSS19SRVNFVF9SRVNVTUUgfSwKIAorCS8qIG5vdmF0aW9u
IFNvdW5kQ29udHJvbCBYTCAqLworCXsgVVNCX0RFVklDRSgweDEyMzUsIDB4MDA2MSksIC5kcml2
ZXJfaW5mbyA9IFVTQl9RVUlSS19SRVNFVF9SRVNVTUUgfSwKKwogCXsgfSAgLyogdGVybWluYXRp
bmcgZW50cnkgbXVzdCBiZSBsYXN0ICovCiB9OwogCi0tIAoyLjI1LjAKCg==
--00000000000074c800059d5e5fcb--
