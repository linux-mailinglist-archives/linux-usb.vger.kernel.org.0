Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E3BE9AB3
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 12:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbfJ3LXM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 07:23:12 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:55022 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfJ3LXM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Oct 2019 07:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1572434588; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DjB4iFUoYSWktvHsNLF8kVnWD4Jg24XecAhOTJ8u3tE=;
        b=ezAf+K1R07La615dGqctJMMI3yoIrBsPonied8/uMKzr3ese0kuDA2Qy8hgl8IAAHNobH5
        OD4jfE55CpzPLVPYW+xAN2cmT2ivUXiFAc2XtKMPmEgxUPxxdU1LgR35HM9c+PyaIZE8W5
        ItioO4nmCd0tH3/+T8Fr8VV0/PeL+PY=
Date:   Wed, 30 Oct 2019 12:23:02 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/6] usb: musb: dma: Correct parameter passed to IRQ
 handler
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        od@zcrc.me, Artur Rojek <contact@artur-rojek.eu>
Message-Id: <1572434582.3.0@crapouillou.net>
In-Reply-To: <20191025114710.13222-1-paul@crapouillou.net>
References: <20191025114710.13222-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,


Le ven., oct. 25, 2019 at 13:47, Paul Cercueil <paul@crapouillou.net> a=20
=E9crit :
> The IRQ handler was passed a pointer to a struct dma_controller, but=20
> the
> argument was then casted to a pointer to a struct musb_dma_controller.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> ---
>=20
> Notes:
>     v2: Rebase on 4.5-rc4

Typo in the changelog of this patch and the following ones: it was=20
rebased on 5.4-rc4, obviously.


>=20
>  drivers/usb/musb/musbhsdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/musb/musbhsdma.c=20
> b/drivers/usb/musb/musbhsdma.c
> index 5fc6825745f2..2d3751d885b4 100644
> --- a/drivers/usb/musb/musbhsdma.c
> +++ b/drivers/usb/musb/musbhsdma.c
> @@ -425,7 +425,7 @@ struct dma_controller=20
> *musbhs_dma_controller_create(struct musb *musb,
>  	controller->controller.channel_abort =3D dma_channel_abort;
>=20
>  	if (request_irq(irq, dma_controller_irq, 0,
> -			dev_name(musb->controller), &controller->controller)) {
> +			dev_name(musb->controller), controller)) {
>  		dev_err(dev, "request_irq %d failed!\n", irq);
>  		musb_dma_controller_destroy(&controller->controller);
>=20
> --
> 2.23.0
>=20

=

