Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31D28E3209
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 14:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439628AbfJXMPJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 08:15:09 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50904 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbfJXMPJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Oct 2019 08:15:09 -0400
Received: by mail-wm1-f67.google.com with SMTP id q13so2591459wmj.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2019 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:mime-version:message-id:in-reply-to
         :references:user-agent:content-transfer-encoding;
        bh=1HdoKxCH13MhX+wY4v0MQbEUNC0dud5C0FawbOHFKJk=;
        b=V6MrqlY9ozevW1R6YKVE0uuFqoLoW7t+JHkyA8dCCZbmTOR9wYzXhGRsh/4JV3TwVy
         OMlPAsTXhu9CsRLv5KPWjzJgV240XROTbnRLiz5zZ4gBShXdydMG9InpeypRiq5amT5D
         5uG1iNdk4xPL9iNh53hLcRjMdN/helK4HcI7rWe6SHZiliQz5z9ibMe5XIFdzYbiIF0z
         O9cisVIeE9MXGi4ZbICOC776EclnlOhJ57GpafrIBWM+6yEtPEevYANt2deXx+O0Aeti
         i8soDpRzthnXF1h3+FCRd7v8XMH9eC/v8yDvd61SPUbNHy1U+7QIv8Sx1aCMIhwfPnbU
         QEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:mime-version:message-id
         :in-reply-to:references:user-agent:content-transfer-encoding;
        bh=1HdoKxCH13MhX+wY4v0MQbEUNC0dud5C0FawbOHFKJk=;
        b=rNxYp+VtNoHiUSYOwJmxfYVIIT2LkdNUO0HZ7dSlh81d9BbwIbQ7aQQbcQFeGjgkFV
         k1ZZfLU96KIgvvp49zPnYqErMIPKpNVYiuiRA6T/SiKBUOwNDrputdnfgUIZxyT62DQd
         WE6fPL+sh2FlsAa6pfa3CucdDHuinRNjnVFw+MI/+VVBGMH4ls0ntTNCHnzEpFo/1pHa
         0Mic1d5gpyxKYVzxvlnDKXvkk4H6e2GQ9jukbNxzOvtLb3erFZemqhe2iTgV4NcLffGl
         T3CPGZNui3rQv+4UyPDg7RRAUIcg9UxNL29dWeuQkbCzDO5E4vhKg8DYwLH8dryFK4j5
         rsFg==
X-Gm-Message-State: APjAAAW6ZbVePyG/3lriRrHejw3LAEVYfOJ3bGfFRYX3D2ZUfezXS/di
        V6G8jQASQ7UjKOytp/YZ8hQ=
X-Google-Smtp-Source: APXvYqxBcd8BLvHSAVN5kLuTz06g4yJEi0VLnAey0to6tDb8lIPP461HYyv2PaCFermlz+dFvhIOBw==
X-Received: by 2002:a7b:c7d9:: with SMTP id z25mr4950200wmk.127.1571919306799;
        Thu, 24 Oct 2019 05:15:06 -0700 (PDT)
Received: from localhost ([94.73.41.211])
        by smtp.gmail.com with ESMTPSA id i1sm2679073wmb.19.2019.10.24.05.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 05:15:05 -0700 (PDT)
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
Date:   Thu, 24 Oct 2019 14:15:04 +0200
MIME-Version: 1.0
Message-ID: <fcddc3d9-f36a-4b7b-be3f-ee720fbacb05@gmail.com>
In-Reply-To: <877e4wj7ly.fsf@gmail.com>
References: <4d18d4f7-a00e-bd60-6361-51054eba3bca@arm.com>
 <20190817174140.6394-1-vicencb@gmail.com>
 <8d48017a-64c5-4b25-8d85-113ffcf502c9@gmail.com> <87v9uix1sv.fsf@gmail.com>
 <645526b8-bfed-4cc6-9500-1843c5fe0da9@gmail.com>
 <0edb55d4-3bad-47ac-9d29-8d994d182e67@gmail.com> <877e4wj7ly.fsf@gmail.com>
User-Agent: Trojita
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wednesday, October 23, 2019 8:31:21 AM CEST, Felipe Balbi wrote:
> Hi,
>
> (sorry for the long delay)
>
> Vicente Bergas <vicencb@gmail.com> writes:
>
>> On Tuesday, August 27, 2019 2:16:20 PM CEST, Vicente Bergas wrote: ...
>
> I meant something like this:
>
> diff --git a/drivers/usb/dwc3/dwc3-of-simple.c=20
> b/drivers/usb/dwc3/dwc3-of-simple.c
> index bdac3e7d7b18..e64754be47b4 100644
> --- a/drivers/usb/dwc3/dwc3-of-simple.c
> +++ b/drivers/usb/dwc3/dwc3-of-simple.c
> @@ -110,12 +110,9 @@ static int dwc3_of_simple_probe(struct=20
> platform_device *pdev)
>  =09return ret;
>  }
> =20
> -static int dwc3_of_simple_remove(struct platform_device *pdev)
> +static void __dwc3_of_simple_teardown(struct dwc3_of_simple *simple)
>  {
> -=09struct dwc3_of_simple=09*simple =3D platform_get_drvdata(pdev);
> -=09struct device=09=09*dev =3D &pdev->dev;
> -
> -=09of_platform_depopulate(dev);
> +=09of_platform_depopulate(simple->dev);
> =20
>  =09clk_bulk_disable_unprepare(simple->num_clocks, simple->clks);
>  =09clk_bulk_put_all(simple->num_clocks, simple->clks);
> @@ -126,13 +123,27 @@ static int dwc3_of_simple_remove(struct=20
> platform_device *pdev)
> =20
>  =09reset_control_put(simple->resets);
> =20
> -=09pm_runtime_disable(dev);
> -=09pm_runtime_put_noidle(dev);
> -=09pm_runtime_set_suspended(dev);
> +=09pm_runtime_disable(simple->dev);
> +=09pm_runtime_put_noidle(simple->dev);
> +=09pm_runtime_set_suspended(simple->dev);
> +}
> +
> +static int dwc3_of_simple_remove(struct platform_device *pdev)
> +{
> +=09struct dwc3_of_simple=09*simple =3D platform_get_drvdata(pdev);
> +
> +=09__dwc3_of_simple_teardown(simple);
> =20
>  =09return 0;
>  }
> =20
> +static void dwc3_of_simple_shutdown(struct platform_device *pdev)
> +{
> +=09struct dwc3_of_simple=09*simple =3D platform_get_drvdata(pdev);
> +
> +=09__dwc3_of_simple_teardown(simple);
> +}
> +
>  static int __maybe_unused=20
> dwc3_of_simple_runtime_suspend(struct device *dev)
>  {
>  =09struct dwc3_of_simple=09*simple =3D dev_get_drvdata(dev);
> @@ -190,6 +201,7 @@ MODULE_DEVICE_TABLE(of, of_dwc3_simple_match);
>  static struct platform_driver dwc3_of_simple_driver =3D {
>  =09.probe=09=09=3D dwc3_of_simple_probe,
>  =09.remove=09=09=3D dwc3_of_simple_remove,
> +=09.shutdown=09=3D dwc3_of_simple_shutdown,
>  =09.driver=09=09=3D {
>  =09=09.name=09=3D "dwc3-of-simple",
>  =09=09.of_match_table =3D of_dwc3_simple_match,
>
> Can you make sure it works as you intended?

Hi Felipe,
just applied your approach to v5.3.7 and it is working properly.

Thanks,
  Vicente.

