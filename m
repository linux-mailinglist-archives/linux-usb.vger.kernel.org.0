Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0E9212F304
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2020 03:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgACCln (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 21:41:43 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36379 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgACClm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 21:41:42 -0500
Received: by mail-qt1-f195.google.com with SMTP id q20so36000563qtp.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Jan 2020 18:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AQ0GBFqtrFyYyS8ZxIeJy6Z9JL9rXes1HHHfcGztnP4=;
        b=O0nMTIIDok1tdf5FhCiZOldM1/KLuU9V8bAVvn6tXI6zMh7ALVJtpHMQ7hXUz6nUKi
         MJuTDOa3ZM3oYYi3/gVJYSczMosU440uBpOuR6LM9+HBh4G2OOHoS6m4612D8Gv0mn5k
         wYhlI8eUP2tVPx/5hUrH3wedHHgRZHX/I1tpRZzgfGOOdPj1/3vt81q3A7zeL9Qw5dFg
         kPayckKVLJxbskjEti205t2C7FPLCx50gjWteizQyzV6oX0m5gw5+/f4qHiSFayIw0sG
         v61EaBPaOEV2l/QwuNGmwi5yNXXDlV9sIN5QgtEAZWAZFp4USeCtTqaoQi7b4pqRO8sH
         7kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AQ0GBFqtrFyYyS8ZxIeJy6Z9JL9rXes1HHHfcGztnP4=;
        b=dCHNFClWrh0R6rePOdKrf9vk+DovyZHsKvfhVw/fUH9Q0C70NmiezfgahzK1LJZBqd
         ecZumeWTMpWRU7gjfwECuMcXY89N7pCtH8X2SjLMAva0pr6WTOXPZhQtuctfm/Ttffhy
         7AqUXvLZ5sB74kvP6bYrkWyXFpOfB9dYRK7PAIDv5Dtd6R29cdCGh/U06svHTFS32+4l
         dngI17Y183dCQipG4G/oDPzsswmcQmbArnjUaLPAUz4lKhCI/dsI6CDNnRfGuQL5rwho
         8rXdUllbK0FAxKxvxKwnm1BFPXXf7SXxVnrGimCngIzLgpjv7nbZZmAPtCZdcZyyUPO0
         v6cA==
X-Gm-Message-State: APjAAAVxtWonn+P5qnzsEdP9XPR1i/4I8GSRds93ivsSoEdWs1PXsZv/
        VtCVZGxpe8TlPsUAxuIOpapxR8Rlf22IYtNm9Vw=
X-Google-Smtp-Source: APXvYqyFSfO7D1LsVjFdIbFX2l91CgiE+7ScRGoZg+ePV/KywnJUrx+DLArQ0H5lh59rrOIqxBjqMhLkedAESDnBzy8=
X-Received: by 2002:aed:2202:: with SMTP id n2mr64426374qtc.4.1578019301966;
 Thu, 02 Jan 2020 18:41:41 -0800 (PST)
MIME-Version: 1.0
References: <1577426348-31227-1-git-send-email-peter.chen@nxp.com>
 <878smqksjo.fsf@kernel.org> <VI1PR04MB532770282A2C0701BD2A0EBA8B230@VI1PR04MB5327.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB532770282A2C0701BD2A0EBA8B230@VI1PR04MB5327.eurprd04.prod.outlook.com>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Fri, 3 Jan 2020 10:41:30 +0800
Message-ID: <CADBw62roaEi6UWV3X2NtqQ55w_SONactEn=JxrPShMV7oj98vQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: cdns3: add NXP imx8qm glue layer
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On Fri, Jan 3, 2020 at 10:33 AM Peter Chen <peter.chen@nxp.com> wrote:
>
>
> > > ++++++++++++++++++++++++++++++++++
> > >  3 files changed, 231 insertions(+)
> > >  create mode 100644 drivers/usb/cdns3/cdns3-imx.c
> > >
> > > diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
> > > index 2a1e89d12ed9..b1f526d20f03 100644
> > > --- a/drivers/usb/cdns3/Kconfig
> > > +++ b/drivers/usb/cdns3/Kconfig
> > > @@ -53,4 +53,14 @@ config USB_CDNS3_TI
> > >
> > >       e.g. J721e.
> > >
> > > +config USB_CDNS3_IMX
> > > +   tristate "Cadence USB3 support on NXP i.MX platforms"
> > > +   depends on ARCH_MXC
> >
> > I want to be able to compile this in any arch. Please add COMPILE_TEST and
> > make sure it works
> >
>
> Hi Felipe,
>
> How to make sure it works? Except for enabling CONFIG_COMPLIE_TEST, what else
> I need to do? Thanks.

Felipe's suggestion is you should change your config dependency as:
depends on ARCH_MXC || COMPILE_TEST

Then user can compile your driver to find warning or something else
though the ARCH_MXC config is not enabled.
