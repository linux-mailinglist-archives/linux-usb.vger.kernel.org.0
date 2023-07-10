Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCA974C955
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jul 2023 02:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjGJAte (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jul 2023 20:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjGJAtd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Jul 2023 20:49:33 -0400
X-Greylist: delayed 61 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 09 Jul 2023 17:49:30 PDT
Received: from mx-lax3-3.ucr.edu (mx-lax3-3.ucr.edu [169.235.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7C4FE
        for <linux-usb@vger.kernel.org>; Sun,  9 Jul 2023 17:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1688950171; x=1720486171;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:to:cc:content-transfer-encoding;
  bh=th7GSjcH0mVMigTTb+zNmiXfnwvpUHHXzJpPYfFO42Q=;
  b=FzntEl7MBFK8NONA6Mz8egSkoCD7Za/xdA20YOD7ws34YSjapWIHm8jy
   MFVThFWONoivB1cHGYF8vvdilRgiL1C56pVJmPGnbZ74BI54fr8daxrus
   5qPq3I+K/tW3hJxXZfDylRhGZ9PTlIpTE4YtdpkKHbdYVevXvSWg1wc/Z
   MXcJ1q8umvxkLl6glhJJCKXA0R/ab6/jiWNC6QjL7yozS3jLhop3MzdvJ
   SeyEZby3izi0WQjgmLUcVqsJWnPZg24z2Qeg7Bg8ScXdaYsSDj6ZwF16B
   bUOdYvdsAIm8EHNTMU/S6nNSjpmibF/7UGetZ1j2dTPgts8nPdYOMkg7e
   w==;
Received: from mail-wr1-f69.google.com ([209.85.221.69])
  by smtp-lax3-3.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jul 2023 17:48:29 -0700
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-2f2981b8364so2163856f8f.1
        for <linux-usb@vger.kernel.org>; Sun, 09 Jul 2023 17:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1688950107; x=1691542107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MijvoflT0Dtq/ZeXcCS3BgET99hji2sxV55TlAWqxs=;
        b=gU2O2AYACfuKmd2gpp2EPO4SlS7tf/658NycMOL2gwLTu/teSH2iPbFyXZ3PAVT1ov
         lTvZDTe5lyhP66oZYz9G8mtDLAy/9poyVaDKEPD6jYer1UW6klLi7iGLyhbvtF7UtaCI
         JJFiy60vOiCsmnJNvOgeY0j/5dGPkCVPHUMUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688950107; x=1691542107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MijvoflT0Dtq/ZeXcCS3BgET99hji2sxV55TlAWqxs=;
        b=H0aBF/V+b0cFZloZ5oaK5ZTOgfp004skHwZ7Q+uMipBn+3C+Stl75SmhhqhHaZ+Hn0
         qfBv9/XMJJjKWTu7FE4vBzGn+QrdC+e5dMvwD11MydFNJQcJLI0z/riaLv3KFIOI+xOg
         QmDa/OZGgejmkjwY43U6aqpd/RTo25v2rHAsvPlv0va/cDva1BXWy2CYwNkuPtvcyW0K
         6xCfjW4GoH0Ynu8uvtYtzVAjtap5U80rnK4uxoPNpS//shcFhI2x5dQ6ZS6mEG8KejD9
         lShw1qdJn774Ndr0po69SYhOk9ws/NfQl3MwoAIvO1wBEYwokOupVy9+ffFcIrn0Dn+b
         otMg==
X-Gm-Message-State: ABy/qLbIh6MS45CX7klxs7THzUFbWkbSx+D/0cx9G5Pic07rCj4x3SzC
        9gpHxDV2n+Q9mGeFbWVOfyHeNiuNCFZEHgsFjKUUBgymhiCzl+43/KDpRiGieFajLsqI8TiGC2+
        osBsTfElGktKEkkyJOdPrEm6mgTiggDzA9328Qw==
X-Received: by 2002:a5d:428b:0:b0:315:94ea:31ad with SMTP id k11-20020a5d428b000000b0031594ea31admr3610794wrq.66.1688950106801;
        Sun, 09 Jul 2023 17:48:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHBZAuOciiBsmSRDr0cO0dz/Q88ySmcmH8vOjd474VLkUORc1RjF+j/z3yBnSYVd0lU7CqFovE+D1ABd70fcDw=
X-Received: by 2002:a5d:428b:0:b0:315:94ea:31ad with SMTP id
 k11-20020a5d428b000000b0031594ea31admr3610777wrq.66.1688950106478; Sun, 09
 Jul 2023 17:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <CA+UBctDxfb6+70+hzuXJ-gwb65E0uoNzXYEhpJT92sXr2CE7OA@mail.gmail.com>
 <20230705080625.02b2bac5@bootlin.com>
In-Reply-To: <20230705080625.02b2bac5@bootlin.com>
From:   Yu Hao <yhao016@ucr.edu>
Date:   Sun, 9 Jul 2023 17:48:15 -0700
Message-ID: <CA+UBctBqtSvyBWf9ZwKbecTrh9_6sCDm_TyU-ncb+6h5y19K5g@mail.gmail.com>
Subject: Re: [PATCH] usb: mtu3: Fix possible use-before-initialization bug
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Herv=C3=A9,

Thanks for the comments. How about this patch?
---
 drivers/usb/mtu3/mtu3_gadget_ep0.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c
b/drivers/usb/mtu3/mtu3_gadget_ep0.c
index e4fd1bb14a55..af2884943c2a 100644
--- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
+++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
@@ -600,7 +600,7 @@ static void ep0_tx_state(struct mtu3 *mtu)
        mtu3_readl(mtu->mac_base, U3D_EP0CSR));
 }

-static void ep0_read_setup(struct mtu3 *mtu, struct usb_ctrlrequest *setup=
)
+static int ep0_read_setup(struct mtu3 *mtu, struct usb_ctrlrequest *setup)
 {
    struct mtu3_request *mreq;
    u32 count;
@@ -608,6 +608,8 @@ static void ep0_read_setup(struct mtu3 *mtu,
struct usb_ctrlrequest *setup)

    csr =3D mtu3_readl(mtu->mac_base, U3D_EP0CSR) & EP0_W1C_BITS;
    count =3D mtu3_readl(mtu->mac_base, U3D_RXCOUNT0);
+   if (count =3D=3D 0)
+       return -EINVAL;

    ep0_read_fifo(mtu->ep0, (u8 *)setup, count);

@@ -642,7 +644,8 @@ __acquires(mtu->lock)
    struct mtu3_request *mreq;
    int handled =3D 0;

-   ep0_read_setup(mtu, &setup);
+   if (ep0_read_setup(mtu, &setup))
+       return -EINVAL;
    trace_mtu3_handle_setup(&setup);

    if ((setup.bRequestType & USB_TYPE_MASK) =3D=3D USB_TYPE_STANDARD)
@@ -764,7 +767,9 @@ irqreturn_t mtu3_ep0_isr(struct mtu3 *mtu)
            break;
        }

-       ep0_handle_setup(mtu);
+       if (ep0_handle_setup(mtu))
+           break;
+
        ret =3D IRQ_HANDLED;
        break;
    default:
--=20
2.34.1

Yu Hao

On Tue, Jul 4, 2023 at 11:06=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Hi Yu,
>
> On Tue, 4 Jul 2023 16:25:50 -0700
> Yu Hao <yhao016@ucr.edu> wrote:
>
> > The struct usb_ctrlrequest setup should be initialized in the function
> > ep0_read_setup(mtu, &setup). However, inside that function,
> > the variable count could be 0 and the struct usb_ctrlrequest setup
> > is not initialized. But there is a read for setup.bRequestType.
> >
> > Signed-off-by: Yu Hao <yhao016@ucr.edu>
> > ---
> >  drivers/usb/mtu3/mtu3_gadget_ep0.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> > b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> > index e4fd1bb14a55..67034fa515d0 100644
> > --- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> > +++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> > @@ -638,7 +638,7 @@ static int ep0_handle_setup(struct mtu3 *mtu)
> >  __releases(mtu->lock)
> >  __acquires(mtu->lock)
> >  {
> > -   struct usb_ctrlrequest setup;
> > +   struct usb_ctrlrequest setup =3D {};
> >     struct mtu3_request *mreq;
> >     int handled =3D 0;
> >
>
> Looks strange to me because, if ep0_read_setup() cannot read the setup da=
ta
> why don't we simply abort the operation ?
>
> With setup =3D {}, the following test is true:
>   if ((setup.bRequestType & USB_TYPE_MASK) =3D=3D USB_TYPE_STANDARD)
>         handled =3D handle_standard_request(mtu, &setup);
>
> handle_standard_request() is called and supposes an USB_REQ_GET_STATUS
> (0x00) request:
>    case USB_REQ_GET_STATUS:
>         handled =3D ep0_get_status(mtu, setup);
>         break;
>
> Then ep0_get_status() supposes USB_RECIP_DEVICE (0x00) and performs some
> operation sending the data related to the GET_STATUS.
>
> All of these are not correct as the setup data that triggered this sequen=
ce
> was never received.
> Aborting the operation if ep0_read_setup() cannot read the setup data see=
ms
> better to me.
>
> Best regards,
> Herv=C3=A9
>
> --
> Herv=C3=A9 Codina, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
