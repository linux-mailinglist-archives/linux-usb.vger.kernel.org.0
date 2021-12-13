Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35731472A19
	for <lists+linux-usb@lfdr.de>; Mon, 13 Dec 2021 11:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238500AbhLMKaX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Dec 2021 05:30:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238136AbhLMK2c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Dec 2021 05:28:32 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A734EC0698E2
        for <linux-usb@vger.kernel.org>; Mon, 13 Dec 2021 02:02:44 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id e24so4051321lfc.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Dec 2021 02:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norrbonn-se.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=z9Y+0MQBNJa7E1NUrpMrgnA/65sAH6lltqkX3sabL4Q=;
        b=f89MwTghTJh9xbVPHJdv540k3aXAkGCfcioJ1cQnA5kHN9HtsbIyANxPgCctJx0mV7
         g59KgJAqTfrchFS1X3VGigVI7/Cub26LytiqX54rR+XOvsBMZwUsPG9zzzgujpZc+m9I
         I7S2iL9plaDH1oWB5ifL4Ti6TNj+FWOv9X3axEhWJqsGiC9+Ck/1SvWMdfZm/Ccb8gY1
         3u+41v9b6rAP7bbtleLtZQj+AKktsFlUZntHXgGIfxKBO4bkxWvpNLhGsDZay8ekREn3
         GPNTDuHkZFoEgYVZBzRWLSxLlvDIzghPxbVNLIRn5szpPTDggqF7ANBEz3TuLsD07cpZ
         Zu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=z9Y+0MQBNJa7E1NUrpMrgnA/65sAH6lltqkX3sabL4Q=;
        b=kxEtTl8xrftZmSuZ0n1VXRX2HYPRsbtht1+3rIURtFREAmjnkplnE0iMzIOZgJKIM9
         gz0klinOEtkvmcRLIQ6UEMe5qKjYfZ5DBFVDbeenBsy03vNf6MXcJFlvV4K1mYpkItfB
         APka2ZUt+v9MGFL/3br+OG7w53sOrvpg83V8HY+YdCJ1H4VRUweJyJXD0wgf2Y00dWbf
         ZzLOsE2sS/h+kWQx4ZnzZYD4t9J1sqBdwcVzxxfz9rA/zJdv4PABgRn0I/xX4KKYBOl9
         b64Vy2vJitMHgDwyZHH8KGuXVYiFqXuBJrxz+6o/w2GlVIfE2JrVROT/W9DZdleS1Yrf
         Qoqg==
X-Gm-Message-State: AOAM531faNAeef+MdFWmpQfN1Wqlyk6hTjsg7O59U8Wd1gzAVo7fNQHd
        RtyLfENcoJyvXIgiqsRve6ZApJKGk3GVGg==
X-Google-Smtp-Source: ABdhPJyRno5RK5s08wWaHd5Dlbpb6OS4BxDton/NtNfoeLI5iA0SZgJHiOiuiSplmDdwNz5rZ4xZXA==
X-Received: by 2002:ac2:5a48:: with SMTP id r8mr27638822lfn.100.1639389762961;
        Mon, 13 Dec 2021 02:02:42 -0800 (PST)
Received: from [192.168.1.211] (h-81-170-137-65.A159.priv.bahnhof.se. [81.170.137.65])
        by smtp.gmail.com with ESMTPSA id c2sm1394607lfb.270.2021.12.13.02.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 02:02:42 -0800 (PST)
Message-ID: <d406fd08-39d9-42db-f01c-2eccf5b0be00@norrbonn.se>
Date:   Mon, 13 Dec 2021 11:02:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] usb: gadget: atmel: Revert regression in USB Gadget
 (atmel_usba_udc)
Content-Language: en-US
To:     Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>,
        regressions@lists.linux.dev,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Cristian Birsan <cristian.birsan@microchip.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
References: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
From:   Jonas Bonn <jonas@norrbonn.se>
In-Reply-To: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Marcelo,

On 11/12/2021 19:36, Marcelo Roberto Jimenez wrote:
> The regression occurs on the second time a self powered gadget is
> connected to the host. In this situation, the gadget no loger accepts
> an address in the USB enumeration phase.
> 
> The regression has been introduced in
> commit 70a7f8be8598 ("usb: gadget: atmel: support USB suspend")
> 
> Signed-off-by: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
> ---
> 
> Hi,
> 
> I have been using an ACME Arietta board (Microchip AT91SAM9G25 MPU, ARM9@400Mhz) for some years, and from time to time I need to do a kernel upgrade to fix issues or introduce new required features.
> 
> I have recently noticed a regression in the ethernet over USB Gadget. The system boots fine and when the device is first connected to a host it is recognized. But upon disconnection, the second time the device is connected to the host, it is no longer recognized. Of course, the gadget is self powered.
> 
> I did a "git bisect" and found that the patch introducing the regression is this:
> 
> commit 70a7f8be85986a3c2ffc7274c41b89552dfe2ad0
> Author: Jonas Bonn <jonas@norrbonn.se>
> Date:   Wed Feb 20 13:20:00 2019 +0100
>      usb: gadget: atmel: support USB suspend
>      This patch adds support for USB suspend to the Atmel UDC.

Given that the patch that you want to revert is almost 3 years old, it's 
a bit of a stretch to call this a regression.  I suspect that a cleaner 
way forward is to introduce some kind of quirk for your board.

I have a self-powered board where the USB suspend sequence works and 
device add/remove works fine.  So fundamentally, I suspect that the 
driver is ok.

With all that said, I'm not immediately in a position to run tests on my 
SAMA5D2 board right now and the kernel on that board is 5.2.  I'm not 
sure when we we would notice that USB suspend stopped working because 
there is no kernel maintenance planned for that board, as far as I know; 
someday, however, that work might happen and the lack of working USB 
suspend will be a regression in and of itself.

Thanks,
Jonas
