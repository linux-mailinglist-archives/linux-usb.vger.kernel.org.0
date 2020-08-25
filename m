Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14C7D25229F
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 23:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgHYVR7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 17:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgHYVR6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 17:17:58 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B69A1C061574
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2020 14:17:57 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a21so36904ejp.0
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2020 14:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9ihZ3j8DtnqyGE33hA7uToJ+yiy2yLJlVQnqNre7EqE=;
        b=aqLh+g8EzG2CFJg+haqv22Ux25YlgthMeffsbYP3N9X59SYNhCFoneAHpGnTc+Pj09
         VURWGZ40+b11HQV9VKpZYb/+dCZtCz0fJ7uYfh5VmG76O9P5HnBncIs60/t2FJPMYdlI
         ScqG0/rTE+x7IEkl1TOxjUZffc9cDRyvPHwB9Fm6vUc63yTbz1KypZ1wxbYi9LZN1BOm
         vZ2VBvDcXYmsCzfJ174EvF7RBmSguEFUw1xW6MDssnzVYkYA0rBqxMFC1fpSLSa72pMH
         MvNTQbMUVv4Hq6QoUOotO9oye4qhIHcbQ+o9QtC3Oqh9WFYTF+QSYMsxL+h7Mxbz7e4h
         WuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9ihZ3j8DtnqyGE33hA7uToJ+yiy2yLJlVQnqNre7EqE=;
        b=obH8ZT8qBIVKr0P+zadyPePL7vv9K45XWuTEO2e1BJ/bod1bBSxXKmqY/I0Cqcevxz
         ZJuLlHRw+ze+iQ4y2hSrmtmSTnq2KKv3KOHWXdq6fRP7i2W9kOrcf09T9p9c/LUsm+p9
         VMMFYfvvCTpX6FtuntmqLDMVySwmLhK6J8AW9UN7DS3uXy9RVGQ81LkJVQA7TnHJx/6e
         yN/LO/grc2rkypGEfszBQKgU6GLhm83sHVY0KpKKFVoQiF1UEvN4nCeqAgcLVDnkTF00
         eFp8IwuRoYwe7Wp0G+MSVUlgykylWzxibbOCyO84zgsgAcnuecKeIAbj0wTw1ghRiE1J
         19Eg==
X-Gm-Message-State: AOAM533M88d27SoZlKE9PLV1pOgrRn92L9All2I7RH3boiF3jOUTMWCA
        U2ElmnK1PsKLqRcCzy+nxR2vBgIaTy/2lsCphPc=
X-Google-Smtp-Source: ABdhPJyLEESR3OY8oNSY9zyYtof3dKaipoHMGN6YmfcYNa4gqtdcrOok0Q2x+BmeoNphiXGKvEnHEIVuDnEliEVSV/I=
X-Received: by 2002:a17:906:600f:: with SMTP id o15mr12197888ejj.529.1598390276416;
 Tue, 25 Aug 2020 14:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200825055505.765782-1-lorenzo@google.com> <20200825055505.765782-4-lorenzo@google.com>
In-Reply-To: <20200825055505.765782-4-lorenzo@google.com>
From:   =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Date:   Tue, 25 Aug 2020 14:17:45 -0700
Message-ID: <CAHo-OowA4qE5W77sE3wbB_cohbHgTjtAM1AXXv4TgyFQf5LDiA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] usb: gadget: f_ncm: allow using NCM in SuperSpeed
 Plus gadgets.
To:     Lorenzo Colitti <lorenzo@google.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 24, 2020 at 10:55 PM Lorenzo Colitti <lorenzo@google.com> wrote=
:
>
> Currently, enabling f_ncm at SuperSpeed Plus speeds results in an
> oops in config_ep_by_speed because ncm_set_alt passes in NULL
> ssp_descriptors. Fix this by re-using the SuperSpeed descriptors.
> This is safe because usb_assign_descriptors calls
> usb_copy_descriptors.
>
> Tested: enabled f_ncm on a dwc3 gadget and 10Gbps link, ran iperf
> Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
> ---
>  drivers/usb/gadget/function/f_ncm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/fun=
ction/f_ncm.c
> index cad3c9dd61..87f548bd97 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1505,7 +1505,7 @@ static int ncm_bind(struct usb_configuration *c, st=
ruct usb_function *f)
>                 fs_ncm_notify_desc.bEndpointAddress;
>
>         status =3D usb_assign_descriptors(f, ncm_fs_function, ncm_hs_func=
tion,
> -                       ncm_ss_function, NULL);
> +                       ncm_ss_function, ncm_ss_function);
>         if (status)
>                 goto fail;
>
> --
> 2.28.0.297.g1956fa8f8d-goog


Reviewed-by: Maciej =C5=BBenczykowski <maze@google.com>
