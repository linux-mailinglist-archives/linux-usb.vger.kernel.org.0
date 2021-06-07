Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29D7E39D899
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 11:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbhFGJZC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 05:25:02 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:42745 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbhFGJZB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 05:25:01 -0400
Received: by mail-wr1-f50.google.com with SMTP id c5so16709106wrq.9
        for <linux-usb@vger.kernel.org>; Mon, 07 Jun 2021 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=Bp4svgKeSGZzeStKw9Nz4dZ/nEa4yI5xaZWG+9pyxO4=;
        b=WydWp4InwihvXiKj2GsOiW3NKFxVVOU+CmObuT5OG+E86mAYOWUeWk6NrJUn7UTEO9
         LDZneLKdArLlGETeLYUCdFk6Zv8uCPm6xguLUKPnTu+PJPeSJYfl93f2eaQZ9jKA66tc
         2jDOMnv555wwQjROuXxa0dr3NOmOF/H9yv9T/apuZQ2GDMRrdDScihKoBMDnW+/jDriH
         PvXChhf3lL/zqcsqSASsUTsv9BUFNcFhnDRNFs3tdOxmm765aIdaknIMZe7RffIpLdy0
         AVEIonJh4B94fdXLSGZ7cwIXPDzZThaD/ivEDIl3lzwwUrECnVlpDG/joRddg9jzN+5X
         /VDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=Bp4svgKeSGZzeStKw9Nz4dZ/nEa4yI5xaZWG+9pyxO4=;
        b=AzNfYTSmdSteJow1FCTqRyj/RHjNePwuDBp49pPJ9HHpbKyC3qs/qxXdWTL5ubsG2O
         r3jsgJOElDamDxEWz7zeeIxMGq7N1gFHfcXsUqVWVpr6FJOsjv+ssSHYAhgvpmmlaSQj
         8dA2xfQWGuGz4tjRy2qAEfiJQJS1T2Zw/6ggu0/+Lm3MPX8vB9SSKhAppztEHfD7J0MZ
         0w9w8LLE2iNSsE0v+msi7e1NVkBvHNHD5eg32dQBdl3SnBieYNeJ/wS4fxKuwg52AHGI
         hFwf4UsGXYkYM58DKZEZH8VvC2DnRWkZlWq72z6AyIjPEhtWykLvQIdFXJOY1bsqoSKR
         dMig==
X-Gm-Message-State: AOAM531NRIOsWLJO++I8UDQnEAdNkuiPZ/eEXsZPBSfU5A02qyjxwOrk
        TxSnFACc4hdjNjCFLxmtI3Mlcw==
X-Google-Smtp-Source: ABdhPJyhvjDMPpFf60t50W3t43DkCrOPTul74tBHHMhR1+Vv+zCyiXAkYGOuWqFj2cUQWL60OAG8IQ==
X-Received: by 2002:adf:c087:: with SMTP id d7mr16240981wrf.406.1623057729977;
        Mon, 07 Jun 2021 02:22:09 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id u6sm16455032wre.76.2021.06.07.02.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 02:22:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 07 Jun 2021 10:22:08 +0100
Message-Id: <CBX9Y37I5UPS.329JON7IZ9YKZ@arch-thunder>
Cc:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Sebastian Siewior" <bigeasy@linutronix.de>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: usb: add entry for isp1760
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
References: <20210607083921.38441-1-rui.silva@linaro.org>
 <YL3jjPOWFTUsNXYp@pendragon.ideasonboard.com>
In-Reply-To: <YL3jjPOWFTUsNXYp@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Laurent,
On Mon Jun 7, 2021 at 10:14 AM WEST, Laurent Pinchart wrote:

> Hi Rui,
>
> Thank you for the patch.
>
> On Mon, Jun 07, 2021 at 09:39:21AM +0100, Rui Miguel Silva wrote:
> > Giving support for isp1763 made a little revival to this driver, add
> > entry in the MAINTAINERS file with me and Laurent Pinchart as
> > maintainers.
> >=20
> > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > ---
> >  MAINTAINERS | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 503fd21901f1..254803fe599a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18869,6 +18869,14 @@ S:	Maintained
> >  F:	drivers/usb/host/isp116x*
> >  F:	include/linux/usb/isp116x.h
> > =20
> > +USB ISP1760 DRIVER
> > +M:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>
> I can try to review patches, but I can't commit to having bandwidth to
> do so. I'm thus a bit reluctant to list myself as a maintainer here, as
> I fear my contribution would mostly be to increase frustration caused by
> unresponsive maintainers.

Do you agree with the bellow better?
+R:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>

you will be CCed on patches only.

------
Cheers,
     Rui

>
> > +M:	Rui Miguel Silva <rui.silva@linaro.org>
> > +L:	linux-usb@vger.kernel.org
> > +S:	Maintained
> > +F:	drivers/usb/isp1760/*
> > +F:	Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
> > +
> >  USB LAN78XX ETHERNET DRIVER
> >  M:	Woojung Huh <woojung.huh@microchip.com>
> >  M:	UNGLinuxDriver@microchip.com
>
> --=20
> Regards,
>
> Laurent Pinchart



