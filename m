Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17AD89E6F8
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2019 13:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbfH0LpW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Aug 2019 07:45:22 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37539 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfH0LpV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Aug 2019 07:45:21 -0400
Received: by mail-wm1-f65.google.com with SMTP id d16so2681541wme.2
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2019 04:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:mime-version:message-id:in-reply-to
         :references:user-agent:content-transfer-encoding;
        bh=BBAQbvGI5m70IT7gwpTqMd9Zxn3yd9mTcRYoUs8xzbo=;
        b=onXy4iVllrd8c4tpFtOk7zTSpflQfzAmBza47ZPpMBD67DZVWF+bgwvur2nW8uV81m
         yl1frnPuQ2uV8k/J3BxTZO5onKpRKgKJpmx0VtxxjgZfh8RWg7Y3OS/iQRzllrVwtwUP
         J/PvrSfiQcIoAecJsZR6bg4I53j4x0xXH7l6qjIiiLG9fjtelD6VQoFnIYntnQAMW1FK
         oq2M0hEJgmdzWoYbjCZ7TAMvSPXceV6VvyXGqQhuap+F8030c4bCfS54LYchwHwABoEr
         xiDmS2AG+b4Ohu3XSLGdKibKcWsogYlWMP93JkX592MYkrTQcX+IrEDXzDrgPkk9FvO2
         ErEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:mime-version:message-id
         :in-reply-to:references:user-agent:content-transfer-encoding;
        bh=BBAQbvGI5m70IT7gwpTqMd9Zxn3yd9mTcRYoUs8xzbo=;
        b=txJ2byiqvYWsyGV/fJnm/Cm+Laj844rhwhCTZ11F2wCeYCGA26i1H6Z88z7LZdEnp/
         M4y9WzxRzFcui69iF71Jib/EmojBUCNf9nSutq6BLTlWoWboSbIcUu7pnI41F+uWV0eQ
         cZVSPyMo8gfCnWjMKhaaWsD48ZoWK///P0BVp3JqFWzgB60hT+VdKur2yIB0lFt1FLOd
         CRDzujEYxfJYnzEnFR0RLP6IxxoOAbgtx9cdxLef2EZIcZKQMOc1xSKnUVbtRCGuaEmn
         sy6kDKn8zCgL6nJ55mAHALrNdMtswqo4e0pH+v99baJ45CZswf78uDEwJx+uTGrJx4a3
         mcXw==
X-Gm-Message-State: APjAAAX94RgzNDi7Kn/ZFLRmHygyqIXIkAl6fEtNnSVk4cen8Jbgbz7Q
        8WNJN9nfqXsIbIQH6rCkTaI=
X-Google-Smtp-Source: APXvYqySe4Ye5opeQvHzGYvU2Vu8TM7L6knp50soVvwu97HlfmYY8RXSTSpUCe49OrrLZ0z616MefA==
X-Received: by 2002:a1c:9648:: with SMTP id y69mr26034632wmd.122.1566906319448;
        Tue, 27 Aug 2019 04:45:19 -0700 (PDT)
Received: from localhost ([92.59.185.54])
        by smtp.gmail.com with ESMTPSA id t8sm37020305wra.73.2019.08.27.04.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 04:45:18 -0700 (PDT)
From:   Vicente Bergas <vicencb@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Will Deacon <will.deacon@arm.com>,
        MarcZyngier <marc.zyngier@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] usb: dwc3: Add shutdown to =?iso-8859-1?Q?platform=5Fdriver?=
Date:   Tue, 27 Aug 2019 13:45:16 +0200
MIME-Version: 1.0
Message-ID: <8d48017a-64c5-4b25-8d85-113ffcf502c9@gmail.com>
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

Hi,
please, can you provide some feedback on this?

Regards,
  Vicen=C3=A7.

