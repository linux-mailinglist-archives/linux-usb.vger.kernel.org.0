Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47B3857E400
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jul 2022 18:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbiGVQAL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jul 2022 12:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbiGVQAK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jul 2022 12:00:10 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A6962616
        for <linux-usb@vger.kernel.org>; Fri, 22 Jul 2022 09:00:09 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id o18so4763786pgu.9
        for <linux-usb@vger.kernel.org>; Fri, 22 Jul 2022 09:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J4ZhqBj8u5Lze6oGnxKkGLM9ZzOx9hvE2Nh2ZpNRSvs=;
        b=PNAs3OZ09qihfaX1VzQXYD1QM9ufbRcbZ0A7jLPsa8U0QP5IfyNo0NPx+uM8wVPe/7
         +gbJMpuWRyWDX+lLCV5IEmDU/J9OKGqvMFmXqU+lJzMJQbtCvVocYMCV6VsMdglmqnEn
         NSzwUcEX8HWL8I3rmxmr6Tqk8cQhAKLw7JZ5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J4ZhqBj8u5Lze6oGnxKkGLM9ZzOx9hvE2Nh2ZpNRSvs=;
        b=4gNmJnRd4GdS+Iw5VQLGBKt3eLamD3JQw/QCpP34Y9iCEH4M5dLSTPpGjnX1813beI
         Q97k9s2M2s9vVuQdJRIfUXdnm/dUA25fHIoqrIuvVoOyLNu/QMqDfakdFhsN9XMkAKbo
         /6Kxhx7y4dIWZ+Nhz7xbuwN73TWAGhh0LTjRZo7zH07fzHKvFaeI4RPgWgfr7IuMtzdj
         Zj4yoDf8yunUgEVJAjSbEkR6fwF4YtqyT6J+FUjKFfB6+jGHiYe/0PVayyHugJdaYJCi
         ws/xNWBxWd3bDKFAbglBL62eCmCdFc9aSWGX5E84QGBY0NFjTkU1f97JWydK2l9pJ/z4
         R8BA==
X-Gm-Message-State: AJIora/FyV+Ix2+GHClN8D8Zlmmh+2ogHAtrAuGwgWMMCmif3Doukdha
        E8xJaRILs8rKf5eQ0hqZCUmMDA==
X-Google-Smtp-Source: AGRyM1tgKqIrMyj2L4X/1T63jTUda2P7qFegf2dygZBc2HK52m3PF385tbAOmbv7b8/r5kyI3xdmcg==
X-Received: by 2002:a05:6a00:1703:b0:52b:39a4:4632 with SMTP id h3-20020a056a00170300b0052b39a44632mr450427pfc.29.1658505607778;
        Fri, 22 Jul 2022 09:00:07 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:42b0:2897:3725:985a])
        by smtp.gmail.com with UTF8SMTPSA id j13-20020a170902da8d00b0015e8d4eb285sm3995951plx.207.2022.07.22.09.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 09:00:07 -0700 (PDT)
Date:   Fri, 22 Jul 2022 09:00:05 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, alexandre.torgue@foss.st.com,
        arnd@arndb.de, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, amelie.delaunay@foss.st.com
Subject: Re: [PATCH 2/4] usb: misc: onboard-hub: add support for Microchip
 USB2514B USB 2.0 hub
Message-ID: <YtrJhQD2FbqhS+5e@google.com>
References: <20220722130554.236925-1-fabrice.gasnier@foss.st.com>
 <20220722130554.236925-3-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220722130554.236925-3-fabrice.gasnier@foss.st.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Fabrice

On Fri, Jul 22, 2022 at 03:05:52PM +0200, Fabrice Gasnier wrote:
> Add support for Microchip USB2514B USB 2.0 hub to the onboard usb hub
> driver. Adopt the generic usb-device compatible ("usbVID,PID") as
> discussed with Matthias in [1].

The reference isn't really relevant in the commit message.

> Some STM32MP1 boards have this hub on-board, with a supply that needs to
> be enabled for proper operation.
> 
> [1] https://lore.kernel.org/lkml/YW9CUabfA0HrtTAq@google.com/
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/usb/misc/onboard_usb_hub.c | 2 ++
>  drivers/usb/misc/onboard_usb_hub.h | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index 6b9b949d17d30..929a4e724ec12 100644
> --- a/drivers/usb/misc/onboard_usb_hub.c
> +++ b/drivers/usb/misc/onboard_usb_hub.c
> @@ -310,6 +310,7 @@ static struct platform_driver onboard_hub_driver = {
>  /************************** USB driver **************************/
>  
>  #define VENDOR_ID_REALTEK	0x0bda
> +#define VENDOR_ID_MICROCHIP	0x0424

nit: let's sort the vendor ids alphabetically

>  
>  /*
>   * Returns the onboard_hub platform device that is associated with the USB
> @@ -387,6 +388,7 @@ static const struct usb_device_id onboard_hub_id_table[] = {
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 */
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
> +	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */

ditto

>  	{}
>  };
>  MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
> diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> index d3a5b6938582e..43d6af4230dfd 100644
> --- a/drivers/usb/misc/onboard_usb_hub.h
> +++ b/drivers/usb/misc/onboard_usb_hub.h
> @@ -11,6 +11,7 @@ static const struct of_device_id onboard_hub_match[] = {
>  	{ .compatible = "usbbda,5411" },
>  	{ .compatible = "usbbda,414" },
>  	{ .compatible = "usbbda,5414" },
> +	{ .compatible = "usb424,2514" },

Let's also sort the vendor ids alphanumerically (not necessarily applicable for
the product ids, here it makes sense to group the PIDs of the same hub chip
together).
