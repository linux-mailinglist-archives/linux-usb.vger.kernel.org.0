Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 961231859EC
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 04:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgCOD4M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Mar 2020 23:56:12 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44997 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbgCOD4M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Mar 2020 23:56:12 -0400
Received: by mail-qk1-f196.google.com with SMTP id j4so3654765qkc.11
        for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2020 20:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hackerdom.ru; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hZx2rOPLdWA/1VmYwbYZK5WjfB53oXSHvcgbBAPYExY=;
        b=exC7Nrv3s0lxNyWlhjwCa+uB0sivgBfnovpl7PEzc6o6lX5CbHFfHuobH2fEZvUG32
         GcbqbHP2dNuE4YvG3nZFVNTOeOaubj+8K7yF3rkj2t+hTWPprK8uQFwLVIfiCxieM+Oz
         fJ0XK78J7Xgad96hOhnuBB5tVtwpj+2/unCjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hZx2rOPLdWA/1VmYwbYZK5WjfB53oXSHvcgbBAPYExY=;
        b=XHsTsT3j1Iq8ST7kOekr//dGer/YkZ1T0kLv5TMDd3B0hWFD6jxl624j9MPKP83U4+
         qJcVWFn+ga7/2Eeg7Xa4TBBizEL4uprt+T5CV3ueh0b3s9fCOufJWTFkk4k9HlJPOmIf
         zM8EoGQ9aPudGSfq3MIDLp/gzafdypryU0zuxQizSWneBGbelBXJ6vAbpdOoCjY1EYm0
         XRj7PPPw79qCl45AhMPhiZ6U3sRAXd7N9zdrQG6pFkPmuMJRbX0B/lKAKADS8+gwaRRS
         4bvbjbMnmGJpJ+1no65vWkmdA912MFltGTyKMYX7d+1L1mXcLaQSfxRFZ0v2oek1PnI1
         8wrw==
X-Gm-Message-State: ANhLgQ39zzH+HNk2aTt/9d7Ni4CFaK/dV7RWqIBMTFE6iJjZ7rmmDZ+P
        zyVtBo9Ywfx247QFS1lu7ngf4Q9LbCwPSbSTVxmrFquV
X-Google-Smtp-Source: ADFU+vuS9E+6Qs4gKJowHwafkV/H3TkBO0ASU3rb/yohJperpsO2TD2ryqlEm/MYhgG9qmS9yhksK3pGFKEUdSH5d4I=
X-Received: by 2002:ab0:28d8:: with SMTP id g24mr9015857uaq.121.1584164204756;
 Fri, 13 Mar 2020 22:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200313213823.178435-1-bay@hackerdom.ru> <20200313.204354.1099710416713347967.davem@davemloft.net>
In-Reply-To: <20200313.204354.1099710416713347967.davem@davemloft.net>
From:   =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCR0LXRgNGB0LXQvdC10LI=?= 
        <bay@hackerdom.ru>
Date:   Sat, 14 Mar 2020 10:36:32 +0500
Message-ID: <CAPomEdx_+Row-p4o3A901gHb1T6bkby-5rkqQd=xrp1va0V+4A@mail.gmail.com>
Subject: Re: [PATCH 1/2] cdc_ncm: Implement the 32-bit version of NCM Transfer Block
To:     David Miller <davem@davemloft.net>
Cc:     Oliver Neukum <oliver@neukum.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Networking <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Got it, thank you.

Done, sent the follow-up fix by itself relative to net-next tree.

Please let me know if you need squashed version.

Best,
Alexander Bersenev

=D1=81=D0=B1, 14 =D0=BC=D0=B0=D1=80. 2020 =D0=B3. =D0=B2 08:44, David Mille=
r <davem@davemloft.net>:
>
> From: Alexander Bersenev <bay@hackerdom.ru>
> Date: Sat, 14 Mar 2020 02:38:20 +0500
>
> > The NCM specification defines two formats of transfer blocks: with 16-b=
it
> > fields (NTB-16) and with 32-bit fields (NTB-32). Currently only NTB-16 =
is
> > implemented.
> >
> > This patch adds the support of NTB-32. The motivation behind this is th=
at
> > some devices such as E5785 or E5885 from the current generation of Huaw=
ei
> > LTE routers do not support NTB-16. The previous generations of Huawei
> > devices are also use NTB-32 by default.
> >
> > Also this patch enables NTB-32 by default for Huawei devices.
> >
> > During the 2019 ValdikSS made five attempts to contact Huawei to add th=
e
> > NTB-16 support to their router firmware, but they were unsuccessful.
> >
> > Signed-off-by: Alexander Bersenev <bay@hackerdom.ru>
>
> This patch is already in my net-next tree.
>
> You need to submit the follow-up fix all by itself, relative to my
> net-next GIT tree.
>
> You must always post patches against the GIT tree that your change
> is targetting, that way you will avoid situations like this.
>
> Thank you.
