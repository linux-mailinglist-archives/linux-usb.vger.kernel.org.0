Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1402B788A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 13:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389928AbfISLgV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 07:36:21 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55348 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389926AbfISLgV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 07:36:21 -0400
Received: by mail-wm1-f66.google.com with SMTP id a6so4051147wma.5
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 04:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:mime-version:message-id:in-reply-to
         :references:user-agent:content-transfer-encoding;
        bh=D1vZLJBNdwLJcR15QNa7GnTaPz3ykDl4G6RRyeU9kl8=;
        b=o07Tyjqghx9bs4O1iIu8fJy1k1OGl9v1WCdYVPCjNq0JdKmP4e1MEo5wRiqhJ/8UL9
         RjiZGh+06tDYEH6Dw5NCv2qZRPOQLxH6bTSA8YX1B3ZH6X23poIDQP/AVDqASyckDVHK
         4XLN2q/KKHJylC1wS3iSq9wmaCp+L+mVR9Rx476REzIRn6Uo+ug/edqZB/yHMa8StuoV
         tdX0Z5MJJIZk9o10FE6mfqdfKswwKzsQca40Yhm5xsqfIiTlwr9P46t1vpyumeccm2SS
         gzlwzeq+U6hSdQRsVsR0nRnc5EbJB2HlZL5Z/Uf7q0JGYkIW0XDPSE+NI8w/pQiKH8MA
         g8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:mime-version:message-id
         :in-reply-to:references:user-agent:content-transfer-encoding;
        bh=D1vZLJBNdwLJcR15QNa7GnTaPz3ykDl4G6RRyeU9kl8=;
        b=DCJ8JqXl2fSTU/AC6A0qrHEeIJpDFAwC47OjIE+hTGkbk/tlHemFdPFBVYHK/PJCqF
         j2dRsL1PraqWq0zw/4RUq6m7XhsSbO+/GDi8Q/hV2KclYaAbe8DH+JRjoSjqve6pwaja
         9bP5xvqLagkU7Z09RIwbtGl48n4TJklUFMSPzs7VD+VdTV9JHsIaenzYKn3O6HPtLqcJ
         OM3W1uCqvXvJ5Ad8gzY92mEbX5dk1V7nSkDRMNEdVndgo379e2iXV6ef3MNGcdFN9xWg
         /IbQ2AVWuFxK/5qJbGGP2xYaks64M4i1oFgQE41w8qONeXoqhxVAIaSZBXvGM7pi4019
         zcPw==
X-Gm-Message-State: APjAAAWGMWGGCfY7702e6JmKkWG0LLMAoorN+3fLjYE0MrRLWwc7tngJ
        JP+d4t7kLkt+J10ZNBU2PuI=
X-Google-Smtp-Source: APXvYqyAwy3PFFQNcIkSusblMU+xvYWCWWPwKHOT0G+F5vcXxm7WOivcwFDk2Osce2RwLCZRG4QFiw==
X-Received: by 2002:a1c:2d11:: with SMTP id t17mr2521207wmt.147.1568892979432;
        Thu, 19 Sep 2019 04:36:19 -0700 (PDT)
Received: from localhost ([92.59.185.54])
        by smtp.gmail.com with ESMTPSA id d193sm8701719wmd.0.2019.09.19.04.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 04:36:18 -0700 (PDT)
From:   Vicente Bergas <vicencb@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Will Deacon <will.deacon@arm.com>,
        MarcZyngier <marc.zyngier@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] usb: dwc3: Add shutdown to =?iso-8859-1?Q?platform=5Fdriver?=
Date:   Thu, 19 Sep 2019 13:36:17 +0200
MIME-Version: 1.0
Message-ID: <e226af9a-3719-4641-9f8c-402e8de7b058@gmail.com>
In-Reply-To: <20190817174140.6394-1-vicencb@gmail.com>
References: <4d18d4f7-a00e-bd60-6361-51054eba3bca@arm.com>
 <20190817174140.6394-1-vicencb@gmail.com>
User-Agent: Trojita
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ping?

On Saturday, August 17, 2019 7:41:40 PM CEST, Vicente Bergas wrote:
> Otherwise the device keeps writing to memory after kexec and disturbs
> the next kernel.
>
> Signed-off-by: Vicente Bergas <vicencb@gmail.com>
> ---
>  drivers/usb/dwc3/dwc3-of-simple.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> Hi Felipe, Robin,
> this version calls 'remove' from 'shutdown' instead of just asserting
> a reset because it looks like a cleaner way to stop the device.
>
> Calling remove from shutdown in core.c instead of dwc3-of-simple.c does not=

> fix the issue either.
>
> It has been tested on the sapphire board, a RK3399 platform.
>
> Regards,
>   Vicen=C3=A7.
>
> diff --git a/drivers/usb/dwc3/dwc3-of-simple.c=20
> b/drivers/usb/dwc3/dwc3-of-simple.c
> index bdac3e7d7b18..d5fd45c64901 100644
> --- a/drivers/usb/dwc3/dwc3-of-simple.c
> +++ b/drivers/usb/dwc3/dwc3-of-simple.c
> @@ -133,6 +133,11 @@ static int dwc3_of_simple_remove(struct=20
> platform_device *pdev)
>  =09return 0;
>  }
> =20
> +static void dwc3_of_simple_shutdown(struct platform_device *pdev)
> +{
> +=09dwc3_of_simple_remove(pdev);
> +}
> +
>  static int __maybe_unused=20
> dwc3_of_simple_runtime_suspend(struct device *dev)
>  {
>  =09struct dwc3_of_simple=09*simple =3D dev_get_drvdata(dev);
> @@ -190,6 +195,7 @@ MODULE_DEVICE_TABLE(of, of_dwc3_simple_match);
>  static struct platform_driver dwc3_of_simple_driver =3D {
>  =09.probe=09=09=3D dwc3_of_simple_probe,
>  =09.remove=09=09=3D dwc3_of_simple_remove,
> +=09.shutdown=09=3D dwc3_of_simple_shutdown,
>  =09.driver=09=09=3D {
>  =09=09.name=09=3D "dwc3-of-simple",
>  =09=09.of_match_table =3D of_dwc3_simple_match,

