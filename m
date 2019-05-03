Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFCFD129D5
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 10:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbfECIWP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 04:22:15 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56034 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbfECIWP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 04:22:15 -0400
Received: by mail-wm1-f66.google.com with SMTP id y2so5673502wmi.5
        for <linux-usb@vger.kernel.org>; Fri, 03 May 2019 01:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4V6VqqeBO9DBtvF/K+SOH47tq4ZdgaCD2n5RMUxlL5E=;
        b=ePtfGs9IUZDTbLhTCEZ/F15P3viImlv8hVpMAwikcZ9aVBunIWLi09H5q1oF6FIRqQ
         5tPQvCj0CNV3F9UqEAeDAhJHixsV696MXDlWd+2ZuRFCL0ZQ150hmMJZMPgDKxMMvdUt
         8YdJNf+rHftamZSCrXx4j3ctoRQ3GKRUs6E9LsGyletsktNWsEGJlx/TrZ5+3mitYpyi
         pAOOhw1dSvuL9WDQYE0snKoqLoBaNAbSmROWJfGY1msgcoNCMtWQQh8VvmO/1UanpCiC
         donFiM/QS/RoPm97QCE4Kfw2W72vSx/UGU5Erwju5qj4cBK9HsDMaxl/dsHLvTqpwJjV
         oO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4V6VqqeBO9DBtvF/K+SOH47tq4ZdgaCD2n5RMUxlL5E=;
        b=Vn/Fc1FuclG7bszn+yYHD129KAc7kxIo8mH+PjN/AUPOvbqDtNxLXECO8HkJLYBeF3
         tmfPLjmYcb4km8MJ1LfH81Y9V4k5ApjZ1eGmCZ+6ZuqSMrsvo84FFwN3fWhJ0+92qBQj
         qgNtP/GnPEfezgkb7emqrdJLU2+9HfMzc5nkBIW2jAhaOQGXpOjF90aanFETlli25s7m
         /a9g2r3TI2x1X+VLVVQloyyvOZBZUzA+SIFsHVArl9SuubKUrAmFB3avJHGgNRjvVxCj
         VfyBOAFdVDjttiIK0NiqwWJS3GMw+KXidqJloukk+R+iQ5jyVxzg4hL5/yejjzhxLGWS
         YJNQ==
X-Gm-Message-State: APjAAAXy5EG9mywErOOMAbA3lmeeGpuX3W0cPcdRNWJahDG3i5Jdt6A+
        ERfqqzGKPNUqZZSXcFOuthDUIDw0S1NPfGO/sboNmy8q
X-Google-Smtp-Source: APXvYqw8gU+JqrCouRZv2Mq1tG+ZcI3BCuknOgo0upnGes8ShUFHyYjhQxAvVxx5DBiDrmLj/7x8zCCLbPACbfa0sfU=
X-Received: by 2002:a1c:6783:: with SMTP id b125mr5492820wmc.41.1556871733314;
 Fri, 03 May 2019 01:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190429121237.13136-1-charlesyeh522@gmail.com>
 <20190503071128.GB26546@localhost> <CAAZvQQ6EmDu-Rh_LTGCpz7T=3BbCvP=tUDRo=HCCgqscwn8+zA@mail.gmail.com>
 <20190503074113.GA17809@localhost>
In-Reply-To: <20190503074113.GA17809@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Fri, 3 May 2019 16:22:01 +0800
Message-ID: <CAAZvQQ5AyH_Y0FtNxUUHjncV4af7rL2ihHtxVg7hVfmcz5s96A@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v2] USB:serial:pl2303:Add new PID to support
 PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Johan Hovold <johan@kernel.org> =E6=96=BC 2019=E5=B9=B45=E6=9C=883=E6=97=A5=
 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:41=E5=AF=AB=E9=81=93=EF=BC=9A

> Perhaps you did not use the usb-next branch? That branch has the followin=
g
> commit:
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.=
git/commit/?h=3Dusb-next&id=3Df64c3ab230682e8395a7fbd01f3eb5140c837d4e
>

OK, I will do another patch witch
"https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/snaps=
hot/usb-serial-f64c3ab230682e8395a7fbd01f3eb5140c837d4e.tar.gz"

I already have seen pl2303_update_reg in the pl2303.c file.

Charles.
