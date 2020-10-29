Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3351B29E40F
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 08:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbgJ2HaX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 29 Oct 2020 03:30:23 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33914 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727906AbgJ2HaB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Oct 2020 03:30:01 -0400
Received: by mail-pf1-f195.google.com with SMTP id o129so1635557pfb.1
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2020 00:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kLnflbG9D/v2dA7LNdvu2mNwh0LIBnekNkTfNwOzZcQ=;
        b=Dz2HQ0u+Fd5cmb4yeSi14Kb4wmHd9XZWVIe/6eQnj2CC4aWafK7QzkqMaXfpxs8eLd
         tllyxnODlCS8ZyYqoZE07zEjdDXBXFAB4T+27UM2vGyca453cLlfLZhPpJtZG/738YhN
         uD/tXLQu0man2kMiDO/lS88hrXUjNnVZZPTfLb0CtY9lBL0zCmHjLBPx/d7D8KdoHES0
         EAbAaiqUupptfd80vFDt+QcmMSTBNiRXFfOdpZeKEDNbkc7MtX6LKp53b+TyO7akbRO4
         +nCMc4J5CpP69YppfjYGHk7CZcTBwlfAgw/p0/1zgwu7BV1Vcd20pxEYz5p6Tfw/L4UK
         t37w==
X-Gm-Message-State: AOAM533kIbX0RBq16NSr9X77SQbLwjsd4FmNTkvhOPM49EziJCAPvqEj
        Ex0+TA4UcWpRjOC3TlSXkL0J4icK4oFY2b7T
X-Google-Smtp-Source: ABdhPJx6mdHF2c14PgHLZI52KEcl/4qqS8Xc5+PJTvyyFavBgZfxvmqfStxc7wK0BWa/sgGIzw/qDg==
X-Received: by 2002:a05:6e02:bcb:: with SMTP id c11mr1921855ilu.285.1603949728780;
        Wed, 28 Oct 2020 22:35:28 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id q196sm1290520iod.17.2020.10.28.22.35.28
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 22:35:28 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id s7so2071689iol.12
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2020 22:35:28 -0700 (PDT)
X-Received: by 2002:a05:6602:214c:: with SMTP id y12mr2265234ioy.24.1603949727974;
 Wed, 28 Oct 2020 22:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <4cc0e162-c607-3fdf-30c9-1b3a77f6cf20@runbox.com>
 <20201022135521.375211-1-m.v.b@runbox.com> <20201022135521.375211-2-m.v.b@runbox.com>
 <4f367aba2f43b5e3807e0b01a5375e4a024ce765.camel@hadess.net>
 <CAE3RAxuUiejhQtByfgeORrjy6v=QAP4gPrv+L-Ez4roNNsQY=g@mail.gmail.com> <299d5037-f8d7-b71a-f7e7-3a52c06221d2@runbox.com>
In-Reply-To: <299d5037-f8d7-b71a-f7e7-3a52c06221d2@runbox.com>
From:   Pany <pany@fedoraproject.org>
Date:   Thu, 29 Oct 2020 05:35:16 +0000
X-Gmail-Original-Message-ID: <CAE3RAxsaUa=dEaSj7dVH1jtzGQpf1-4uMvDRxZnTpEBW+WpsoQ@mail.gmail.com>
Message-ID: <CAE3RAxsaUa=dEaSj7dVH1jtzGQpf1-4uMvDRxZnTpEBW+WpsoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] usbcore: Check both id_table and match() when both available
To:     "M. Vefa Bicakci" <m.v.b@runbox.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 29, 2020 at 3:34 AM M. Vefa Bicakci <m.v.b@runbox.com> wrote:
>
> On 28/10/2020 00.00, Pany wrote:
> > On Tue, Oct 27, 2020 at 6:25 PM Bastien Nocera <hadess@hadess.net> wrote:
> >>
> >> On Thu, 2020-10-22 at 09:55 -0400, M. Vefa Bicakci wrote:
> >>> From: Bastien Nocera <hadess@hadess.net>
> >>>
> >>> From: Bastien Nocera <hadess@hadess.net>
> >>>
> >>> When a USB device driver has both an id_table and a match() function,
> >>> make
> >>> sure to check both to find a match, first matching the id_table, then
> >>> checking the match() function.
> >>>
> >>> This makes it possible to have module autoloading done through the
> >>> id_table when devices are plugged in, before checking for further
> >>> device eligibility in the match() function.
> >>>
> >>> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> >>> Cc: <stable@vger.kernel.org> # 5.8
> >>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >>> Cc: Alan Stern <stern@rowland.harvard.edu>
> >>> Co-developed-by: M. Vefa Bicakci <m.v.b@runbox.com>
> >>> Signed-off-by: M. Vefa Bicakci <m.v.b@runbox.com>
> >>
> >> You can also add my:
> >> Tested-by: Bastien Nocera <hadess@hadess.net>
> >>
> >
> > This patch works well for me.
> > Tested-by: Pan (Pany) YUAN <pany@fedoraproject.org>
>
> I realize that I am a bit late to do this, but I would like to thank
> Bastien and Pany for their efforts in testing (Bastien and Pany) and
> co-developing (Bastien) the patches.
>
> Thanks as well to Greg Kroah-Hartman for committing the patches to
> the usb-linus branch of the usb git tree and for fixing up the patch
> descriptions while doing so.
>
> Thanks everyone!
>
> Vefa

Thanks to Vefa, Bastien, and everyone for all your efforts! The patch
is perfect.

I’m so honored to be part of this. Thanks again.

-- 
Regards,
Pany
pany@fedoraproject.org
