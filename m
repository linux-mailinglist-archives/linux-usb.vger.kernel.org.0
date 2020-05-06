Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330261C7356
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 16:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbgEFOx6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 May 2020 10:53:58 -0400
Received: from mx01-sz.bfs.de ([194.94.69.67]:43891 "EHLO mx01-sz.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729078AbgEFOx6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 May 2020 10:53:58 -0400
Received: from SRVEX01-SZ.bfs.intern (exchange-sz.bfs.de [10.129.90.31])
        by mx01-sz.bfs.de (Postfix) with ESMTPS id 2B88C20166;
        Wed,  6 May 2020 16:53:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1588776835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FQCzgC8bd7sflHUUTE5/dc64arDMOUnnznmg4wHNUXY=;
        b=1W8urJI3BPwDRVwTD1XxAczmpmwyDAxZehH7BLD/tGxUpWsNsNBh9qhEqPQvot2XEaYrn7
        QXuDazWV4qZbaiiC4K9vAJ36hCgjM0i6LiEI7RDgWaMEfqrs01zuyK8ABRT0GIv4NnJJqg
        D0g/BGnE8I0gWyWgqXvgDQ2NyF6w+6syeo2uDGELKdQgkswOnZmQ/Kq0d1QrYaD+mLvQMW
        RSt//c3loBz7P/43/2naCSkGIY3/9ZfkAnjvfVYWtA1dHcQKvgko8VH7IJ9kcFHp/lOPDN
        VK/Shxlz16BP0kkIoL7RogaHU4OX7/vwVAsOpfEJ8CW3jnSGc8iycmTu4RktyA==
Received: from SRVEX01-SZ.bfs.intern (10.129.90.31) by SRVEX01-SZ.bfs.intern
 (10.129.90.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Wed, 6 May 2020
 16:53:54 +0200
Received: from SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a]) by
 SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a%6]) with mapi id
 15.01.1913.005; Wed, 6 May 2020 16:53:54 +0200
From:   Walter Harms <wharms@bfs.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Wei Yongjun <weiyongjun1@huawei.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: AW: [PATCH -next] USB: ohci-sm501: fix error return code in
 ohci_hcd_sm501_drv_probe()
Thread-Topic: [PATCH -next] USB: ohci-sm501: fix error return code in
 ohci_hcd_sm501_drv_probe()
Thread-Index: AQHWI62X6+C5LP3Q6kC+zOKvNIYDj6ia98UAgAAspKE=
Date:   Wed, 6 May 2020 14:53:54 +0000
Message-ID: <8119f7d234a84440a0ca1082296fb59e@bfs.de>
References: <20200506135625.106910-1-weiyongjun1@huawei.com>,<Pine.LNX.4.44L0.2005061010480.13334-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2005061010480.13334-100000@netrider.rowland.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.137.16.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=-2.87
Authentication-Results: mx01-sz.bfs.de;
        none
X-Spamd-Result: default: False [-2.87 / 7.00];
         ARC_NA(0.00)[];
         TO_DN_EQ_ADDR_SOME(0.00)[];
         HAS_XOIP(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         RCPT_COUNT_FIVE(0.00)[6];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.984];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-2.87)[99.44%]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

while you are here ...
maybe you can give labels like err5 some meaningful names ?

re,
 wh
________________________________________
Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kern=
el.org> im Auftrag von Alan Stern <stern@rowland.harvard.edu>
Gesendet: Mittwoch, 6. Mai 2020 16:12:08
An: Wei Yongjun
Cc: Greg Kroah-Hartman; Laurentiu Tudor; linux-usb@vger.kernel.org; kernel-=
janitors@vger.kernel.org
Betreff: Re: [PATCH -next] USB: ohci-sm501: fix error return code in ohci_h=
cd_sm501_drv_probe()

On Wed, 6 May 2020, Wei Yongjun wrote:

> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: 7d9e6f5aebe8 ("usb: host: ohci-sm501: init genalloc for local memo=
ry")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/usb/host/ohci-sm501.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/host/ohci-sm501.c b/drivers/usb/host/ohci-sm501.=
c
> index c158cda9e4b9..cff965240327 100644
> --- a/drivers/usb/host/ohci-sm501.c
> +++ b/drivers/usb/host/ohci-sm501.c
> @@ -157,9 +157,10 @@ static int ohci_hcd_sm501_drv_probe(struct platform_=
device *pdev)
>        * the call to usb_hcd_setup_local_mem() below does just that.
>        */
>
> -     if (usb_hcd_setup_local_mem(hcd, mem->start,
> -                                 mem->start - mem->parent->start,
> -                                 resource_size(mem)) < 0)
> +     retval =3D usb_hcd_setup_local_mem(hcd, mem->start,
> +                                      mem->start - mem->parent->start,
> +                                      resource_size(mem));
> +     if (retval < 0)
>               goto err5;
>       retval =3D usb_add_hcd(hcd, irq, IRQF_SHARED);
>       if (retval)

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Thanks for noticing and fixing this.

Alan Stern

