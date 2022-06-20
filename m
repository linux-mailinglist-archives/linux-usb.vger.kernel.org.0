Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF895551FA3
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 17:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242326AbiFTPE1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 11:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242987AbiFTPDh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 11:03:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EC5E520BC6
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 07:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655735767;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sB5vA/PYt/B++hSiLWtw5RtdOSfa5Qtze5kAXPaq3gM=;
        b=UZeDKq5HlGoMaqgBe96TlN7+vANoX9WipiznFYwD3z5GgZtlLLTMDhuTzg/cKoVKUuxtTG
        P41wEN3J4pYReuanQ/Kh4G9Z2nnWwhUYujAA0iIp8ZFieAjycxbhfJ7HNjN5akstyxxjEv
        LF+7hKWbWilo2Ysi74YFBaqcgeL0/MY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-nlJ8E1NnP9ejhFwwwviQAQ-1; Mon, 20 Jun 2022 10:35:54 -0400
X-MC-Unique: nlJ8E1NnP9ejhFwwwviQAQ-1
Received: by mail-ej1-f69.google.com with SMTP id gn39-20020a1709070d2700b00722abe40a31so874945ejc.7
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 07:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sB5vA/PYt/B++hSiLWtw5RtdOSfa5Qtze5kAXPaq3gM=;
        b=0qoMcMCM2hiXGxi3EECfmY3VbP70WCeLlXcGugh1e/mkSI9Q99AqE7atmm5AfkHZA8
         xLXRlFdFGLVdLers/kvUH1JYD68/rglm0sPUR39NzuY5dDaB6AOqfCu8dikeqtfJua4v
         a1bCQhmNWGT1zd8rdOKitszSzII0145pNvqpBCfvnm5TFyBhI0dE//9KIA9VwD0dZ8yt
         lAz4ZkUvZL4BHo7lEsjZg4VNWJtg0uyFr3u2ivnzWf4/RWCxr2d6VHboBpTIgQbBbhUu
         /xEB1aqLghh8OFnjFcy7mPqbbryuQd1s5dCmYqbfLxIB34AQjHW8C2bLMkVXfFe0t/px
         7JDA==
X-Gm-Message-State: AJIora/xNO6ZQG+5kSIX0O0QIWNmyjgQtEGEWy0TO4yCFPGWQHkYlu8B
        f31lsGyacuaAsSuLddaSagdYB3NEjCblGae2y1tsAG7EMea9i8q3FBJQUUCbk7i3J00YHKKe31C
        sp55ww0Qbh8n/jE5VPzJN
X-Received: by 2002:a05:6402:f8d:b0:435:6df2:68a with SMTP id eh13-20020a0564020f8d00b004356df2068amr15504694edb.209.1655735753656;
        Mon, 20 Jun 2022 07:35:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vd1G5IDERU5ls3ZLMFPONjt/JzOY8kxQyAIF3O5ehuje2w68JMZlruTfRe1V2x9eaZ6rKddQ==
X-Received: by 2002:a05:6402:f8d:b0:435:6df2:68a with SMTP id eh13-20020a0564020f8d00b004356df2068amr15504675edb.209.1655735753508;
        Mon, 20 Jun 2022 07:35:53 -0700 (PDT)
Received: from [10.0.0.147] (D57D5A4B.static.ziggozakelijk.nl. [213.125.90.75])
        by smtp.gmail.com with ESMTPSA id rh17-20020a17090720f100b006fef5088792sm6001911ejb.108.2022.06.20.07.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 07:35:53 -0700 (PDT)
Message-ID: <738d00dd-f05b-9b31-5260-0158ee89e399@redhat.com>
Date:   Mon, 20 Jun 2022 16:35:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 1/1] usb: typec: wcove: Drop wrong dependency to
 INTEL_SOC_PMIC
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220620104316.57592-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220620104316.57592-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 6/20/22 12:43, Andy Shevchenko wrote:
> Intel SoC PMIC is a generic name for all PMICs that are used
> on Intel platforms. In particular, INTEL_SOC_PMIC kernel configuration
> option refers to Crystal Cove PMIC, which has never been a part
> of any Intel Broxton hardware. Drop wrong dependency from Kconfig.
> 
> Note, the correct dependency is satisfied via ACPI PMIC OpRegion driver,
> which the Type-C depends on.
> 
> Fixes: d2061f9cc32d ("usb: typec: add driver for Intel Whiskey Cove PMIC USB Type-C PHY")
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/usb/typec/tcpm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
> index 557f392fe24d..073fd2ea5e0b 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -56,7 +56,6 @@ config TYPEC_WCOVE
>  	tristate "Intel WhiskeyCove PMIC USB Type-C PHY driver"
>  	depends on ACPI
>  	depends on MFD_INTEL_PMC_BXT
> -	depends on INTEL_SOC_PMIC
>  	depends on BXT_WC_PMIC_OPREGION
>  	help
>  	  This driver adds support for USB Type-C on Intel Broxton platforms

