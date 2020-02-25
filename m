Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8FF16BFBA
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2020 12:38:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730172AbgBYLi1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Feb 2020 06:38:27 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40199 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730153AbgBYLi0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Feb 2020 06:38:26 -0500
Received: by mail-wm1-f65.google.com with SMTP id t14so2791529wmi.5
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2020 03:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vWNd4dO9rM0Zn6N45+ujni9L7yvp+AVlxZygsZuZiUk=;
        b=e0xw1Pqeb1tdU2Rqpqe16SGK7lLTGnDR6ly2V1DQ1l6sUygGKmnIgwkEWEX0+aTNZQ
         Q6qfr55Nc1fi9R2ab8zy1Kw0UB+GDYv/ufui4KBNJbO4XGu4b5uV2/Fh5GiymEgOMXyE
         c3xc8W4oC3Zat68vWtvw/vfp2/6mAxEc34SGMtTqrSCgpXw5i7sWkkXiHfinfaX3hlK+
         0QbWdOIGroVyF1xE06P8DT8pAkA/MgMzkIf7648HJzs+Feyw1FPv7/jLEfbV8ABNg4oA
         DZRVmTNGuoSXNr3saqqnqFEBJj1HNaOtF80QqMYmJjf99hrTGLJalG3rKKZXhvTbXjQH
         c7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vWNd4dO9rM0Zn6N45+ujni9L7yvp+AVlxZygsZuZiUk=;
        b=k9mzbehHZRN8g6k+iM2Ik0KpzwSs55ZkgFsfrEgJWHWYDc2d02xTowjuPZN3I4QDa4
         JDj5LZ6OjBll/Q4777c8CRSE7i0c74/IWtE97q1L4PSeROJDPVs32XRtBOBJ7y2Jwe0G
         U5tmrldwYAxgOC1/VGYSMhvNpiVY5mPePh5XQ0rnqEDut/o84O0xV66Aw4tYmRWYQM8h
         sfMfEi4luL9SFsyswtEf0i29lOyjgUQSfAxpn7Sl5lAUb84xCDNklKuZNIhJfkFJ2qh/
         XBh0NxBZZ02jFCY80DzhfWx2hirrE2Z4lMFDoQxSmOW4P8iXixsNpvGK8quTZe/h0VSK
         Ntlg==
X-Gm-Message-State: APjAAAV4/45/t9g3lO8gMjkFmbFZQeB++cBPDu7WFBt2AxAJyTKT3KWq
        GvoX8mej57CI+G50BpzZ+R9MqFQOu9PDK7YzQ/qSdA==
X-Google-Smtp-Source: APXvYqxJYb6X2aa8QKMNaCwxTid7DjpjeMWf5aBxYWn0sHuWlTKcUUjVqeGbRB80+4k5vma2rEZLtius03fqLOsmxBE=
X-Received: by 2002:a1c:7919:: with SMTP id l25mr4739099wme.135.1582630703752;
 Tue, 25 Feb 2020 03:38:23 -0800 (PST)
MIME-Version: 1.0
References: <c753b529bdcdfdd40a3cf69121527ec8c63775cb.1581505183.git.michal.simek@xilinx.com>
In-Reply-To: <c753b529bdcdfdd40a3cf69121527ec8c63775cb.1581505183.git.michal.simek@xilinx.com>
From:   Michal Simek <monstr@monstr.eu>
Date:   Tue, 25 Feb 2020 12:38:12 +0100
Message-ID: <CAHTX3dJN5No9wUSDnmcMQXsGRKXKcLrDx_OhP-MF2yL+dXFu7w@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: udc-xilinx: Fix xudc_stop() kernel-doc format
To:     LKML <linux-kernel@vger.kernel.org>,
        Michal Simek <monstr@monstr.eu>, git <git@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Felipe Balbi <balbi@ti.com>, Peter Chen <peter.chen@freescale.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm <linux-arm-kernel@lists.infradead.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

st 12. 2. 2020 v 11:59 odes=C3=ADlatel Michal Simek <michal.simek@xilinx.co=
m> napsal:
>
> The patch removes "driver" parameter which has been removed without
> updating kernel-doc format.
>
> Fixes: 22835b807e7c ("usb: gadget: remove unnecessary 'driver' argument")
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>
>  drivers/usb/gadget/udc/udc-xilinx.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc=
/udc-xilinx.c
> index 29d8e5f8bb58..b1cfc8279c3d 100644
> --- a/drivers/usb/gadget/udc/udc-xilinx.c
> +++ b/drivers/usb/gadget/udc/udc-xilinx.c
> @@ -1399,7 +1399,6 @@ static int xudc_start(struct usb_gadget *gadget,
>  /**
>   * xudc_stop - stops the device.
>   * @gadget: pointer to the usb gadget structure
> - * @driver: pointer to usb gadget driver structure
>   *
>   * Return: zero always
>   */
> --
> 2.25.0
>

Can someone take a look at this patch?

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
