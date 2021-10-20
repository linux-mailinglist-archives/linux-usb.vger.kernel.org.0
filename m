Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49D5434A9C
	for <lists+linux-usb@lfdr.de>; Wed, 20 Oct 2021 13:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhJTL5C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Oct 2021 07:57:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38512 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229548AbhJTL46 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Oct 2021 07:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634730883;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pMPkTaHW5bCtkhZOoqO+cQTMF8jZl1chpcvUj8rI5wo=;
        b=RkY2TtnMzW5tCMnZN0gIVfM/Uwy8asYzGWUvh9o/cYMUccZ64Ol740JDCWjJCNUdWle4S4
        p7lw69MUQZ+QHnSfqkhmv1Wo9r7PURKkdG2rWRBD3TE05R2uXSXOjLdtivRf9vHNb9X+r1
        jC1AEaR/Mjqe34n/SBKWo62a4gpQDYs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-uWnsbhw8MxycZyborId8vw-1; Wed, 20 Oct 2021 07:54:42 -0400
X-MC-Unique: uWnsbhw8MxycZyborId8vw-1
Received: by mail-ed1-f69.google.com with SMTP id f4-20020a50e084000000b003db585bc274so20693850edl.17
        for <linux-usb@vger.kernel.org>; Wed, 20 Oct 2021 04:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pMPkTaHW5bCtkhZOoqO+cQTMF8jZl1chpcvUj8rI5wo=;
        b=062LoLTx4iNAwWjufQ0ANseSEbKUTE7ibyUDx5nRBDG+njY6fxGObZsO/VDLumOG9j
         3u9x/UpSHl1j2TwpfYbO/5oz6O0l2jvnlcY+u97OazqkfxHfMuIBU8/zHsBJAGgMlpzu
         +az8Tv2d8s8jasfDGY6ToOgiuXLaxGdadtwAGcmdBQoB99mn/9BPZqX5qkGcRMC3Wgdd
         dfwQDV1t+TW6hA0lkXmMRrCMPFht0dYn3q0IzVKmlcW0djjzQ59B/WVhqnZIxM1STleQ
         ha/YSyo455BWAFnuf8JANe8mW0mUFcKaEwFPA7UnRv+pIMUfSILoE0jGROQUeD6aKQ3B
         cohQ==
X-Gm-Message-State: AOAM531r4IytkQ9iNYyDD+zptXvxlxxhrPABgSMMHwSFloKQA5zxSyu6
        h0b1a0jjAiHVnmstVofbxPQjt33tv/wH6Nm08LMThg6tnU3xCjdw+v7lh6PDuF8JUeIUscCug0Q
        fMt3cvH3DdesFN6yyXGy9
X-Received: by 2002:a17:906:a2c9:: with SMTP id by9mr46968080ejb.305.1634730881307;
        Wed, 20 Oct 2021 04:54:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUY9dBzGie/3EueyY3a2sBRsn6aRCWkWOCujY4GT80+H1oILSQ25tohVu2GCWxvDPSLmF9wQ==
X-Received: by 2002:a17:906:a2c9:: with SMTP id by9mr46968034ejb.305.1634730881072;
        Wed, 20 Oct 2021 04:54:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id lm14sm930803ejb.24.2021.10.20.04.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 04:54:40 -0700 (PDT)
Message-ID: <5d717e4a-f859-da28-8cf0-7bca373161c9@redhat.com>
Date:   Wed, 20 Oct 2021 13:54:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/2] Fix IRQ flood issue in TI PD controller
Content-Language: en-US
To:     Saranya Gopal <saranya.gopal@intel.com>, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc:     heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        rajaram.regupathy@intel.com
References: <20211020022620.21012-1-saranya.gopal@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211020022620.21012-1-saranya.gopal@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 10/20/21 04:26, Saranya Gopal wrote:
> Hi,
> 
> There was an issue reported that the TI PD controller driver is causing 
> high CPU load due to a flood of interrupts. So, a patch was added in 
> the i2c-multi-instantiate driver to stop the TI PD driver from loading 
> in devices with INT3515 ACPI nodes.
> We identified that required event interrupts are not being set in the interrupt 
> mask register from the driver to the register of the controller.
> We enabled only the necessary events like data status update, power status update 
> and plug events in the interrupt mask register of the TI PD controller. 
> After enabling these events in the interrupt mask register, there is no interrupt flood.
> This patch series contains the fix for the interrupt flood issue 
> in the TI PD driver and another patch to re-enable the INT3515 platform device.
> I prefer this patch series to be taken through usb tree since the fix is in 
> the TI USB PD driver and the second patch is just a revert patch.
> 
> Hi Hans,
> Could I get your Ack to take this series through the usb tree?

Since Heikki has reviewed the revert, I'm fine with this and I'm
also fine with taking this upstream through the usb tree:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> 
> Saranya Gopal (2):
>   usb: typec: tipd: Enable event interrupts by default
>   Revert "platform/x86: i2c-multi-instantiate: Don't create platform
>     device for INT3515 ACPI nodes"
> 
>  drivers/platform/x86/i2c-multi-instantiate.c | 31 +++++---------------
>  drivers/usb/typec/tipd/core.c                |  8 +++++
>  2 files changed, 16 insertions(+), 23 deletions(-)
> 

