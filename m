Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8F939E7BA
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 21:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbhFGTub (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 15:50:31 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:40941 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbhFGTua (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 15:50:30 -0400
Received: by mail-wr1-f49.google.com with SMTP id y7so14295094wrh.7
        for <linux-usb@vger.kernel.org>; Mon, 07 Jun 2021 12:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:to:cc
         :subject:from:references:in-reply-to;
        bh=ebDVMcKsv/UX9GHo//XkDLGULvc/vGm3pd15+MJ8wAM=;
        b=kjOogvipm6GY7xcEY0orGyK8FpY8FwbioaCHcRx2VDqkPBpnIK7sV44oxaLBaxw+rv
         9HltXNyL3o5T7aCKPNDGeTMLO5gzgPIXzCrcNnM4zUx4KZlnh2iQW+WIKkRdwU4jwt3S
         ZtU3HDnFG3/gcuHQHIjFyrH21pe6KNLEVHhtQ+1nEWMJza9q4x7ZVYOkXfLzoFfB3F8R
         pg7w+8l5F63zAuiL4zp35+EDkZJi6/fzleUPEIcQNey6HWJxabafCMPTR0rgOmOi3fSI
         HJUzz8XN0YQosHY8KLetZ7ERIHoJK955deFRu4PEEd6si9ftPP11ZIOZipN5x/dr0hu+
         7mOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:to:cc:subject:from:references:in-reply-to;
        bh=ebDVMcKsv/UX9GHo//XkDLGULvc/vGm3pd15+MJ8wAM=;
        b=SdpGuFxwTkP0qfO3t+M+iUZb5+6nFWKgOlP51BuBJzj90fUmdmQfth1fF8VtVwOBW2
         wlO5J3mbj4x8azx+x9zYtZYGUa6XkID1Qysq5xEZjsrgqp97J5P6cz3o2d7der0a09TN
         vwOaq+iTZ5yUrImuCYry7SWMed7i9t5xQdIA/8fefpNdAcRCqs5X8jaXP6VZl9553GY+
         cmJyD3Y/FvQC9x9OU1vN4gjH6LvCkSP7hMaN4YG1m8pNiR6Vz3NlnqJwe8CpDU73aV1+
         7csjTNAm1gByjYAJWFZErK92Z3aXVnSi6qcAdBh7nZKYhwFlv2ygUulUCsScoZVrnwI3
         j9XA==
X-Gm-Message-State: AOAM533/Z/tDtFZQy7c7YET75Rk5zjpNA7wL1vVq+Hg8A6wZW7zMoNtH
        4oNZHcS5paN9x+6v8WNcySf/ow==
X-Google-Smtp-Source: ABdhPJzjX+v2jqafQjzrqrnUkLtRsnTbQdgsORR3N8ntQgyM3gtHh3AR2W/0ijT1tPrVruWWb73SnA==
X-Received: by 2002:a5d:6952:: with SMTP id r18mr18337542wrw.392.1623095258284;
        Mon, 07 Jun 2021 12:47:38 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id l16sm482603wmj.47.2021.06.07.12.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 12:47:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 07 Jun 2021 20:47:37 +0100
Message-Id: <CBXN8ZEEZBLL.G07343E9H3YV@arch-thunder>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3] MAINTAINERS: usb: add entry for isp1760
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
References: <20210607170054.220975-1-rui.silva@linaro.org>
 <YL5tMGFyTDU3ExUo@pendragon.ideasonboard.com>
In-Reply-To: <YL5tMGFyTDU3ExUo@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
On Mon Jun 7, 2021 at 8:02 PM WEST, Laurent Pinchart wrote:

> Hi Rui,
>
> Thank you for the patch.
>
> On Mon, Jun 07, 2021 at 06:00:54PM +0100, Rui Miguel Silva wrote:
> > Giving support for isp1763 made a little revival to this driver, add
> > entry in the MAINTAINERS file with me as maintainer.
> >=20
> > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > ---
> >=20
> > v2[1] -> v3:                                                           =
                                                                           =
                           =20
> >      - remove Laurent completely
>
> Sorry for the misunderstanding.

My fault, no problem and...

>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

thanks for the tag.

------
Cheers,
     Rui
>
> > v1[0] -> v2:                                                           =
                                                                           =
                           =20
> >      - move Laurent to reviewer instead of maintainer by his request   =
                                                                           =
                            =20
> >        because of lack of bandwidth
> >=20
> > [0]: https://lore.kernel.org/linux-usb/20210607083921.38441-1-rui.silva=
@linaro.org/T/#u
> > [1]: https://lore.kernel.org/linux-usb/20210607101538.74836-1-rui.silva=
@linaro.org/
> >=20
> >  MAINTAINERS | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 503fd21901f1..28ebc6423cf1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18869,6 +18869,13 @@ S:	Maintained
> >  F:	drivers/usb/host/isp116x*
> >  F:	include/linux/usb/isp116x.h
> > =20
> > +USB ISP1760 DRIVER
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



