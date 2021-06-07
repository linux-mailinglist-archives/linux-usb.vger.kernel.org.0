Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 742E239E494
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 18:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbhFGQ5z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 12:57:55 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:40557 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbhFGQ5z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 12:57:55 -0400
Received: by mail-wm1-f44.google.com with SMTP id b145-20020a1c80970000b029019c8c824054so94284wmd.5
        for <linux-usb@vger.kernel.org>; Mon, 07 Jun 2021 09:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:to:cc
         :subject:from:references:in-reply-to;
        bh=+PCKLDjp91q61LUVlJCxNV4eAaiIcKWW2BEkZ+Rvjbk=;
        b=V/VnQUlM3q4XbY6Tlv/xczQunJWbB5z17qVDOYQLrQH9ZnQNJdL1zpPKRNu1VXSk74
         bhSw7fzgiSSjTp91aC8QGm6rvo/8i9tzwrJBGzQIhnMojRdB7FT9W7pPMn9aZK1ajGS6
         Y636ebDwD4dBPkYEi3GPqX3JueHO8qTMbd2UbWYWSXyfGJ+EN/OaQQohD/dbtq2/lU8m
         dumEdnOrODBa4EYzZlMirQ/IvJ6cIBuIGP7i7bwL2r7qf5TTijZyhDFdWCO94xdRW0gN
         1RDsIW557ZPgSD9R1X53NAjkOTzaY/9rNTWfbAcc5BelQFCSTVmDv+zWHD6mtD846sLI
         TlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:to:cc:subject:from:references:in-reply-to;
        bh=+PCKLDjp91q61LUVlJCxNV4eAaiIcKWW2BEkZ+Rvjbk=;
        b=TplyFNnDRnV4vyaz8QkBKoNwctm/CLtXvJApxT4M4E1wexF+RcRUINRLGDD6sH8ArZ
         qrp30w4WTmVcCCJ4vQMgKKfZSqu1uWTsbxhusJYyk4+LpuyHFAl1U7Qa4Xb7rMC+MGLZ
         CE4PHoc0qDhNpQDC5ra2ckzg8q1qsWUtKwTIw33sJ4PHKehErq2uMVgGmt36PcCYnOXY
         PQ1WbhSdkfA5c9oEiMpymvIQOYt1A1IfC07j8hJ8QNvt7JGabBnjkNyjO2ykDpi26dvG
         2YVkMHP7ASRA6whwiwbXMHhwUbGLKYXZhByOv5rhD5DIBM+vdzS6yQFA9GEM0TPHoV72
         BEHA==
X-Gm-Message-State: AOAM531f0Y4VsqcWA7AXlBQ68ahMEQtpvcERDDNczs3eH2vXuVxfCwKm
        vjHe4JpeTpmtkBS7KY7B/odmgg==
X-Google-Smtp-Source: ABdhPJx7jW5FhA3ALAgVpCQCHAQH6QOST8RKrWTzkx9raiDDfZBEQxzYFo5hSLxt6TiksZc6au2pww==
X-Received: by 2002:a05:600c:3b23:: with SMTP id m35mr31354wms.185.1623084903159;
        Mon, 07 Jun 2021 09:55:03 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id l22sm46380wmq.28.2021.06.07.09.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 09:55:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 07 Jun 2021 17:55:01 +0100
Message-Id: <CBXJKU9FGJD4.31VMI9Z0J5NZU@arch-thunder>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Sebastian Siewior" <bigeasy@linutronix.de>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] MAINTAINERS: usb: add entry for isp1760
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
References: <20210607101538.74836-1-rui.silva@linaro.org>
 <YL5M+xnwS1yGEVqk@pendragon.ideasonboard.com>
In-Reply-To: <YL5M+xnwS1yGEVqk@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Laurent,

On Mon Jun 7, 2021 at 5:44 PM WEST, Laurent Pinchart wrote:

> Hi Rui,
>
> On Mon, Jun 07, 2021 at 11:15:38AM +0100, Rui Miguel Silva wrote:
> > Giving support for isp1763 made a little revival to this driver, add
> > entry in the MAINTAINERS file with me as maintainer, and
> > Laurent Pinchart as reviewer in a best effort style.
> >=20
> > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > ---
> > v1[0] -> v2:
> >     - move Laurent to reviewer instead of maintainer by his request
> >       because of lack of bandwidth
> >=20
> > [0]: https://lore.kernel.org/linux-usb/20210607083921.38441-1-rui.silva=
@linaro.org/T/#u
> >  MAINTAINERS | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 503fd21901f1..bd3bdb22a608 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18869,6 +18869,14 @@ S:	Maintained
> >  F:	drivers/usb/host/isp116x*
> >  F:	include/linux/usb/isp116x.h
> > =20
> > +USB ISP1760 DRIVER
> > +M:	Rui Miguel Silva <rui.silva@linaro.org>
> > +R:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>
> Honestly, what's the value of listing me if all the e-mails will go to
> /dev/null for the time being ? :-)

Sorry, I got you wrong there. I will remove you.

------
Cheers,
     Rui

>
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



