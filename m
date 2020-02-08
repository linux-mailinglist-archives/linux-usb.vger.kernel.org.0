Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEC415619C
	for <lists+linux-usb@lfdr.de>; Sat,  8 Feb 2020 00:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgBGXtu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Feb 2020 18:49:50 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37941 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbgBGXtu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Feb 2020 18:49:50 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so849646wrh.5
        for <linux-usb@vger.kernel.org>; Fri, 07 Feb 2020 15:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KfDASmZsnfGOH8NUUmiKPl3PBbXCb2LGn10+n0ncVHA=;
        b=wtVdWw5Um8em6bZABj9trIml1d9jnPfQQwbNchYwkCuu5B/1w0+CA7CIAWyzlVKZRz
         yyHm6nKo7sL7zCLRH62eCvwBgQo/8X7U6W6RcLZyP0IuPXnj2LH82wV5SD0nNMHA58Ny
         KGwn6gmTmpdPr4QArp7Q89S3JNtQ5ODHlNjitPKvnXmLhxKSAxWYldLCXewQWkTQNj98
         SGZyVDKQXPLdALdTT87Xd2FwCxMiYzjgZppRmLMljtIewnjlvqQT2qaZPpZa6oWsUEGo
         wbmGvEs+qLLDNx30pq6Nk4VYc4yi0DEgH6yr6eXyieVmo5wOTmzntZshKj/TRjFt1Nb2
         FQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KfDASmZsnfGOH8NUUmiKPl3PBbXCb2LGn10+n0ncVHA=;
        b=l+spB5eNuKMClVI5K4CXK1fc4sz3TpdTClmvNm+pCIRgpcN6bQnO1Kg/SfZI50lfvm
         X99T1OUV2+nXsT1BAK/G1k7Ba5z8ZJN219/XokplUi1ROifcCe0MWsFW3t7t8J5FVsEV
         K67Jz48IIECtksPb8YZd7XjQdwHy8gvghqohwPwZkkE4uKT3RbydI7wGNCIEPBqOOknK
         asNWHWo/iF9S0KVShNvWaHC70cm+8dTrEfQQEMJHFNZmyvUVSx1cTgv7wwAgQr2Cpmde
         hYYTLYdO43LBM73NKC9v8xelw27ekyRmL+C+OdThXXf3UH9wb7lcTz9W9T0xe2eYRdkR
         etbQ==
X-Gm-Message-State: APjAAAVo1WlD7d/PstJ3eCJBopQpXSFIP0CXNYPdKKzIL8m/4uFN1YZO
        wHsShaWnxIuWyT6TEHkNreq/fw==
X-Google-Smtp-Source: APXvYqzTspi8f0hdsjZLazh9HFZc9VWwl0L0B3CqmgqqmchS7DnHA0IA+4HzYnMXOFF2Rf1kby3KXQ==
X-Received: by 2002:a5d:5647:: with SMTP id j7mr1398932wrw.265.1581119388067;
        Fri, 07 Feb 2020 15:49:48 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id t9sm5117292wmj.28.2020.02.07.15.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2020 15:49:47 -0800 (PST)
Subject: Re: [PATCH v5 10/18] usb: dwc3: Add support for usb-conn-gpio
 connectors
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        devicetree@vger.kernel.org
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
 <20200207201654.641525-11-bryan.odonoghue@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <18f8d6ab-e17f-390a-9160-2b67716e4cf9@linaro.org>
Date:   Fri, 7 Feb 2020 23:49:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200207201654.641525-11-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07/02/2020 20:16, Bryan O'Donoghue wrote:
> A device node label gpio_usb_connector is used to identify
> a usb-conn-gpio as a child of the USB interface.

This bit of the git log is stale now.

Needs updating
