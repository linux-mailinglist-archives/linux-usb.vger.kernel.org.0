Return-Path: <linux-usb+bounces-893-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 214047B4935
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 20:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 1AAC6281AA7
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 18:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF8BEED5;
	Sun,  1 Oct 2023 18:39:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C28944D
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 18:39:14 +0000 (UTC)
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7F7C6;
	Sun,  1 Oct 2023 11:39:12 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 8CA7D836E7;
	Sun,  1 Oct 2023 20:39:09 +0200 (CEST)
Message-ID: <8c101322-085b-451c-90b6-90d2799ef192@skole.hr>
Date: Sun, 1 Oct 2023 20:39:03 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 1/6] ARM: pxa: Convert Spitz OHCI to GPIO
 descriptors
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>, Alan Stern
 <stern@rowland.harvard.edu>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mark Brown
 <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-spi@vger.kernel.org
References: <20231001-pxa-gpio-v4-0-0f3b975e6ed5@skole.hr>
 <20231001-pxa-gpio-v4-1-0f3b975e6ed5@skole.hr>
 <CAHp75VcBY3W8aVEsRMPNMW9940yT+_=-w8J2uKfqvmUiAVjPhg@mail.gmail.com>
From: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
In-Reply-To: <CAHp75VcBY3W8aVEsRMPNMW9940yT+_=-w8J2uKfqvmUiAVjPhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 10/1/2023 4:32 PM, Andy Shevchenko wrote:
>> +       pxa_ohci->usb_host = gpiod_get_optional(&pdev->dev, "usb-host", GPIOD_OUT_LOW);
>> +       if (IS_ERR(pxa_ohci->usb_host))
>> +               dev_warn(&pdev->dev, "failed to get USB host GPIO with %pe\n",
>> +                               pxa_ohci->usb_host);
> 
> Since you are using _optional() API, you need to bail out on the error
> case and replace dev_warn() by dev_err(). I guess I already commented
> on this. What is the rationale to not follow my comment?

I must have missed it, sorry about that. I'll be sure to do so in v5.

Regards,
Duje


