Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2442040FA13
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 16:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbhIQOS6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 10:18:58 -0400
Received: from mail.msweet.org ([173.255.209.91]:33628 "EHLO mail.msweet.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231259AbhIQOS6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Sep 2021 10:18:58 -0400
Received: from smtpclient.apple (unknown [206.214.229.168])
        by mail.msweet.org (Postfix) with ESMTPSA id C503D81FE8;
        Fri, 17 Sep 2021 14:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.msweet.org C503D81FE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=msweet.org;
        s=default; t=1631888256;
        bh=atiLdMkEoVobeO8+J8csYNRYvD8TmyH99ZP+5t/MaPM=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
        b=HU7toqUD9odeShLaYJJ2EJkSEDNNyAiGooh/HbF5FzZZ/o6ULfUFEh5/fZsuR2ZDA
         z0vnCUFoKppeeoUEWjpTvzL+sA/xGDbtqNo2no5ZnfJfcq2Ue1sEOGRIkSnFPzNbsX
         B80u6gMPE0g9yJjWgeSFarGSE2/qrrs2/4cSpxnw=
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.0.1.1.10\))
Subject: Re: How to register a new "function" in configfs?
From:   Michael Sweet <msweet@msweet.org>
In-Reply-To: <CAHP4M8W-z_L3r0kDbW943A6hm9y3gXzYJd=ZOpi+w9okS1zaaQ@mail.gmail.com>
Date:   Fri, 17 Sep 2021 10:17:33 -0400
Cc:     linux-usb@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3C27F76A-CE48-49E3-9078-CBE02B4E287E@msweet.org>
References: <CAHP4M8Vc+0eChmJDnLLa3ibuzGLOnc5hJ1Nk09794RHEJ7tEPw@mail.gmail.com>
 <CE84D77A-93F8-43B2-A952-896D6BED2E6D@msweet.org>
 <CAHP4M8VYhUDzvXO35=urBsz0suTA+0eMQ34f6-v9D0zE9fvDgQ@mail.gmail.com>
 <CAHP4M8W-z_L3r0kDbW943A6hm9y3gXzYJd=ZOpi+w9okS1zaaQ@mail.gmail.com>
To:     Ajay Garg <ajaygargnsit@gmail.com>
X-Mailer: Apple Mail (2.3693.0.1.1.10)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ajay,

It is really hard to help further without seeing source code...

I assume you've verified that your gadget driver module is loaded?

And in your code:

- Did you use the MODULE_LICENSE, MODULE_AUTHOR, and MODULE_DESCRIPTION =
macros to define your driver metadata?
- Did you use the module_init and module_exit macros?


> On Sep 15, 2021, at 9:51 AM, Ajay Garg <ajaygargnsit@gmail.com> wrote:
>=20
> Any pointers, please?
>=20
> On Sat, 11 Sep 2021, 20:28 Ajay Garg, <ajaygargnsit@gmail.com> wrote:
> Hi Michael,
>=20
> Thanks for the reply.
>=20
> I am a bit of old-school, and would prefer things in one place only
> (in the kernel) :)
> Thus :
>=20
> a)
> I wish to have all the endpoints configuration/management in the
> kernel only (like done in drivers/usb/gadget/function/f_serial.c,
> drivers/usb/gadget/function/u_serial.c).
>=20
> b)
> Only the attributes like vendorId/productId would be in configfs, to
> help setup the device.
>=20
> c)
> No user-space management of kernel objects.
>=20
>=20
> Either-way, I think that my issue of "function exposure" would remain
> the same, irrespective of whether we use configfs for managing the
> kernel-objects (please correct me if I am wrong).
>=20
>=20
> Thanks again for your time, look forward to listening back !
>=20
>=20
> Thanks and Regards,
> Ajay
>=20
> On Sat, Sep 11, 2021 at 8:01 PM Michael Sweet <msweet@msweet.org> =
wrote:
> >
> > Ajay,
> >
> > Quick question (as someone who has been down this road), do you need =
to do a kernel driver or could you just use the functionfs support to =
implement everything in userspace?  I found that path to be much easier =
and less error-prone (and one of these days I'm going to be contributing =
some documentation changes to make some things clearer...) and I was =
able to get my IPP-USB implementation up and running very quickly.
> >
> >
> > > On Sep 11, 2021, at 1:43 AM, Ajay Garg <ajaygargnsit@gmail.com> =
wrote:
> > >
> > > Hi All.
> > >
> > > As a first step, I have been able to load a gadget on configfs, =
which
> > > binds to the function "gser" (thus loading up the usb_f_serial =
module
> > > when the gadget mounts). Things work well till here.
> > >
> > > Now, I have written a brand-new gadget-side device-driver, trying =
to
> > > create a new function "gusb", via DECLARE_USB_FUNCTION_INIT.
> > > However, now when I try to load the gadget for binding to "gusb", =
I
> > > get the error that the function cannot be found.
> > >
> > > Seems that firing up a new gadget-side driver, that registers a =
new
> > > function via DECLARE_USB_FUNCTION_INIT, is not enough to make the =
new
> > > function visible across the kernel.
> > >
> > > Kindly let know what I am missing.
> > > Will be grateful for pointers.
> > >
> > >
> > > Thanks and Regards,
> > > Ajay
> > >
> >
> > ________________________
> > Michael Sweet
> >
> >
> >

________________________
Michael Sweet



