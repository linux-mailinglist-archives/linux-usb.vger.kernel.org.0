Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE9A51A23DC
	for <lists+linux-usb@lfdr.de>; Wed,  8 Apr 2020 16:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbgDHOQB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Apr 2020 10:16:01 -0400
Received: from mout.web.de ([212.227.15.3]:41699 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728251AbgDHOQB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Apr 2020 10:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1586355341;
        bh=85sfTPl91r42gPzKHwrYVTni8G8W4+JolWotW+5GcBw=;
        h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
        b=aAXfCd9MHdnjK+TFa7IiUFlywgg3EFwKRU6rY6XS7WJg8mz6tS9PNlBGlwpEhuZwf
         zoLDCKAIXmjYb+6tx0FbhpMCAViKJrGqNqLBZ1fJbE9NnVZYA8ELF+1QplRlsox/Z6
         kZ9Jlh9KXTfw7vqk5avIV2irYKfWrbdld/AXtvls=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.170.28]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MDjw6-1jWdl520YI-00HABm; Wed, 08
 Apr 2020 16:15:41 +0200
To:     linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: usb: gadget: fsl_udc_core: Checking for a failed platform_get_irq()
 call in fsl_udc_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Li Yang <leoyang.li@nxp.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <36341bb1-1e00-5eb1-d032-60dcc614ddaf@web.de>
Date:   Wed, 8 Apr 2020 16:15:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xMLNsMDMoExXtk8amTMSXj6iXJlTM2/l7c0JjHImfUB5Tv8qxJI
 gt7yljcivfjY6Rft8MkIsFGyPR52oX6eE4hjr020W46qjBXAuY5Bx0L6ynVeEetQDdJ6ieI
 Nlicjda5qjNSizJvf0ZF1ISlGIHw2MwGckWV1nArvBiZH5F9lNT27RudR5x2Bvvayb+5FBr
 67AYCBZ51eHYtjG9T226w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:z4R07IFe6KU=:lG/PZ3d0D5fuq6qVUuouyQ
 KIuNlRzaPHNPSXthjxSGzkMyuB4CttKZ4cnESESigle8l/VAOYKNNX8S/qMN3b0CQvybknQAS
 vdhE3DvNhtfl3dIbZ5xUivz8bALNGdsLEtsCgqCkxb5VPr5uxRVXhEXrkrwf7WZN8KGRJCRTG
 MZf3MuUBIu6XRX8yls7rzE3VltjmJwxpvicEZZZEbcbTdlzKdJtsBH84n6SDVaKOEoJDtoLPE
 wn5KuLEOxq4D8eXngxuG35f9WnqVav0XlRgQN2VIAxEDTcCqGZDE+uLFOnlsim6sQlQirTlHQ
 NAwY8TszyzzuGGnPnU4V/3ewtNP9oKPtm6eZDDoLlhwBBYGTBD16MudXc6MzoQW1cFziiixAn
 usckauUWljv1qulmN8NxA8uXlmnjacJVyERUg0cJIwaoLrO8dMTtpy6yw0XMMXuoWxh6ciN6V
 sbOQhoUmllQTxMv6fIxSw376tUPjPuBm0LGsJ550UfuVZI83aCd9YZ5sMcYq7KXSyqjexMcty
 l0ctWGeIKmTzhz1W0XHMCeyTgDscQ6KOYSsC1Bl62/2bK4jRd6Ionb7eMlnmkRWD1FAY/A+hu
 +C4bN+4++gT/aZ3BC+FD5KfCGyq9xyeuzKRgESyCXQf2F82IJ2+HsaA8eDYaFKkADVebD/4Zv
 XeCEuc6+csuSMazCv5pO0FDBWdhpKawz40sL9X4japr9X8+cZhSFGsfdfuc4c6eNKYSS12MJm
 jl2XOpB+pnZjhELB5wwVPuZwnoZ1G/iXRJzfnaG6h56hnRlhEJt+ywwEmlLD+m2lGC/8ApV4A
 ZlT3ShSyw+roEsOlqxptnkrAzxIzyrqGtwqIOwT/KKGG7HSAlJtmgSYI6bszIoDCZ2UKDK+wp
 DZg9+pvX8sWRTHjCAf1OaIOaNNIh0BR/0VfHa1UngZoFB0uq+VVYmPt118jEek60S5Lpe8G/t
 yzgK6j3JhL6ttDDMGDMICWw0wdVrr4kWQoFXEzi2XRB2D9zWmIQlwOHhNTtL+/3cow4F9DAAn
 KGr2Gup6g1lW6Na88dqWrgU68hss4f+PcIfGD3Kji5mB14p5Ko+PmGTL/l5C8gMasbbJAb34n
 0SlxOL/2nAFJ2i2T5lQLCa6fM90BJ6kFOyq0TUouu/LAKYEodyoVndALnsITbuZd+XYE9nCqB
 SonsifY+g8Gwv+etoJRfYtTkjJeRzUgvVMEd7UtWAhpqjccJwwlwOtM6tpOxIWVhcQnhMgYdu
 0J6eITdNmhSpECsE0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I have taken another look at the implementation of the function =E2=80=9Cf=
sl_udc_probe=E2=80=9D.
A software analysis approach points the following source code out for
further development considerations.
https://elixir.bootlin.com/linux/v5.6.2/source/drivers/usb/gadget/udc/fsl_=
udc_core.c#L2443
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/usb/gadget/udc/fsl_udc_core.c?id=3Df5e94d10e4c468357019e5c28d48499f6=
77b284f#n2442

 	udc_controller->irq =3D platform_get_irq(pdev, 0);
 	if (!udc_controller->irq) {
 		ret =3D -ENODEV;
 		goto err_iounmap;
 	}


The software documentation is providing the following information
for the used programming interface.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/base/platform.c?id=3Df5e94d10e4c468357019e5c28d48499f677b284f#n221
https://elixir.bootlin.com/linux/v5.6.2/source/drivers/base/platform.c#L20=
2

=E2=80=9C=E2=80=A6
 * Return: IRQ number on success, negative error number on failure.
=E2=80=A6=E2=80=9D

Would you like to reconsider the shown condition check?

Regards,
Markus
