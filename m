Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBEDB23242C
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 20:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgG2SAI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 14:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbgG2SAH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jul 2020 14:00:07 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B63C061794
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2020 11:00:07 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t6so13095504ljk.9
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2020 11:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iMUjt1EbRHtnKcY3nbQgc+zcV96eLfRF8PiQIrzK55c=;
        b=Wi+q2t/anPOIDdVj0oYKM1C8KfZ3uh4jlKhII1zTCixBhgRyvBUWhHamthiAkL6vzL
         f6fobesV+6xZ0kR4g0fqeUVHXqP1f4FAhHkmV7qUMbQhne9YUXLs34zfWZbdyTt64Exg
         v0Zb73XoVD/IrsT/0YTPpeaTJ/CrtGcZFNaOaVQGUXAGP9Y5AaVUsE1gMkjD9WvGjvH7
         fD4m8gP7KKl4Fd5FCtpiA7q+m4PerFmgDcEocOJiCuHvL4aJVxQhZqnFKAV2PiMngUQi
         SMsDXQAjXEPVlHMSKeU7gQHa3on6KRkoybSrsg1142KsWrEUZYwyx2MTynl9xT0EzdjX
         6z0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iMUjt1EbRHtnKcY3nbQgc+zcV96eLfRF8PiQIrzK55c=;
        b=mbSafQ+ZrKJGlNCW5mfmV9aHwEXM8kFIkYt5bz1AhOZhok+ze42XO3A5Jc/OcQgiCv
         RLcv7urJ5ikASRXSt5IYx5TBnHTdtCEXY5u5uCOOR+ecNZv5ezZH2CQ6MEdcnf2R/7Nw
         fFyAJ7nMWsFhqPXSNbol1WlpZ+vnKwKToILDDDy8frIeYpphSvR4X3Rmi25Dh53c6yUU
         FXpXN6MAzcs8cRnOvVO94JiMFoag7D18OEZvehe3+oxmCLi258mKGtM6cOoQVSADp8Qj
         w4HJvmgU/4hANCNzLf20pyl8ttze1an7ceEZPibvGp9wlAesjaNeyrIScbyafTZ4qYTj
         /Guw==
X-Gm-Message-State: AOAM533gGiJXzorF/R6v0zsW1xmMuMhxBV9lYaHDor6IiLU7iDr/ySi+
        tlrMzZuAe2H956nwgKDh2vCoRItM
X-Google-Smtp-Source: ABdhPJyg0P88AsH/7rPcZcc1klrLotlGPgVj8l+SqdTLeQfVyFQ5sQZVy7KCxYHsBdMbUqV1fdbtLQ==
X-Received: by 2002:a2e:8ed2:: with SMTP id e18mr2688862ljl.366.1596045605664;
        Wed, 29 Jul 2020 11:00:05 -0700 (PDT)
Received: from wasted.omprussia.ru ([2a00:1fa0:609:47e:1634:9053:a274:2373])
        by smtp.gmail.com with ESMTPSA id x6sm604593lff.64.2020.07.29.11.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 11:00:05 -0700 (PDT)
Subject: Re: [PATCH] usb: ohci-nxp: add support for stotg04 phy
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Trevor Woerner <twoerner@gmail.com>
Cc:     jamesg@zaltys.org, linux-usb@vger.kernel.org
References: <20200729172829.GA3679@piout.net>
 <20200729174918.321615-1-alexandre.belloni@bootlin.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <b5389371-3d47-f046-4d34-3d329276cb35@gmail.com>
Date:   Wed, 29 Jul 2020 21:00:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729174918.321615-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 7/29/20 8:49 PM, Alexandre Belloni wrote:

> The STOTG04 phy is used as a drop-in replacement of the ISP1301 but some
> bits doesn't have exactly the same meaning and this can lead to issues.
> Detect the phy dynamically and avoid writing to reserved bits.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
> 
> Hi Trevor, this is totally untested but at least it builds ;)
> 
>  drivers/usb/host/ohci-nxp.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> index 85878e8ad331..36ab1501c28f 100644
> --- a/drivers/usb/host/ohci-nxp.c
> +++ b/drivers/usb/host/ohci-nxp.c
> @@ -55,6 +55,15 @@ static struct clk *usb_host_clk;
>  
>  static void isp1301_configure_lpc32xx(void)
>  {
> +	u8 value, atx_is_stotg = 0;

   Why the flag is not *bool*?

> +	s32 vendor, product;
> +
> +	vendor = i2c_smbus_read_word_data(isp1301_i2c_client, 0x00);
> +	product = i2c_smbus_read_word_data(isp1301_i2c_client, 0x02);
> +
> +	if (vendor == 0x0483 && product == 0xa0c4)
> +		atx_is_stotg = 1;
> +
>  	/* LPC32XX only supports DAT_SE0 USB mode */
>  	/* This sequence is important */
>  
[...]

MBR, Sergei
