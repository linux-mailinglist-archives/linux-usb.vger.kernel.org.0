Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30F0F17B00D
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 21:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgCEUxw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 15:53:52 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39730 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgCEUxw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Mar 2020 15:53:52 -0500
Received: by mail-lf1-f66.google.com with SMTP id j15so69025lfk.6;
        Thu, 05 Mar 2020 12:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2KasUeTov3Iw2HXiiprNA5ee9+CQCJKivm7obiFhEe0=;
        b=emYpPA3lwmagjxLQrN7hOshjMl8UIaFQhqWX7XThbP17if6K/RO0X+R8H2jyR0r94r
         kDWSwWrwjC16Djfg3KgorsGICCXTIQIY9z2ohUQAL/vwHP+wDjgw53/pdLuh09MunUYu
         KPHCSohREW/JxoSXJjX9n97t4TQ0UITizYa7P/MVRilYIAkNaL7Oix6mQ7cLaWYilh06
         gOMJjjTaDUx+u0SX64cuW5X5jB6Heh+j4BfTtvtGRkz0fL1hq9qU9RJ569QvT8/ON9FQ
         fiYifzMErQSw0ucg5XwHrC7KyuEYjG2vd7OZEfR412EKyaUSQ5crApolcxcmnLYgwsSX
         N0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2KasUeTov3Iw2HXiiprNA5ee9+CQCJKivm7obiFhEe0=;
        b=EUbYtjodsxVIZUSc7O+b8UboxpDCNU/VNKWlk6zF79vFvEobx+mNiX/YS1RLT7Htba
         btUP7h394QLU80pimUyD1aJO1fUzJm9Jf0HndK6JMam8Xex0cVK+p4Yh5MB3OMhpzNOE
         updE9UehPME5utg1rf5ukkqSokT6601GG07PrhlQOcolDh4EWGI35tMaXe/FeQ0h2AzI
         9OcORrkvrrhZG/mIT8S8DKWYogpMnGE7haY+0WvcdTXnmNTmj2jP3G0X2218H+Tx/ohu
         LIKedHxSZDiZlwvJWGoa0NgQhmI756HCWF+94vPlg3HtHgkQ8PncF6vA45JFWdZxEHrU
         4qCQ==
X-Gm-Message-State: ANhLgQ0shCDPVHuNvzmM+CyxX/lYo8/Wm35qzvQ0fk5npK2YcDuT1QHW
        zQRaTz00auYF4oBaAdP2xAg5ChVh
X-Google-Smtp-Source: ADFU+vvRMIiq4W1yOGnXxxBP538xqSv0pRQORtTGNjWwpqNqnxgYKDjHdvXnAf3ZftuR2c50ZGco9A==
X-Received: by 2002:a05:6512:1085:: with SMTP id j5mr245361lfg.183.1583441628100;
        Thu, 05 Mar 2020 12:53:48 -0800 (PST)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id b4sm10356716lfb.47.2020.03.05.12.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2020 12:53:47 -0800 (PST)
Subject: Re: usb: chipidea: udc: BUG: sleeping function called from invalid
 context
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <bfa5b2f7-cf52-0055-ffb2-2cb8278a1181@gmail.com>
 <20200305021226.GA12837@b29397-desktop>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7a142dd4-9ae8-2560-e5be-25648f88a864@gmail.com>
Date:   Thu, 5 Mar 2020 23:53:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305021226.GA12837@b29397-desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

05.03.2020 05:12, Peter Chen пишет:
> On 20-03-04 19:10:08, Dmitry Osipenko wrote:
>> Hello,
>>
>> I was trying out today's linux-next-20200304 and noticed this splat in KMSG:
>>
...
>> I haven't tried to figure out what change causes this problem, it didn't
>> happen using next-20200218. Please take a look, thanks in advance.
> 
> Dmitry, thanks for reporting. I haven't met that issue, it maybe I
> enable runtime pm, but you have not? So I don't trigger
> "dev->power.runtime_status != RPM_ACTIVE" condition below
> 
> 	might_sleep_if(!(rpmflags & RPM_ASYNC) && !dev->power.irq_safe &&
> 			dev->power.runtime_status != RPM_ACTIVE);

The runtime PM always presents on Tegra, do you have
CONFIG_DEBUG_ATOMIC_SLEEP=y in the kernel's config?

> I send the fix patch, but git send-email seems doesn't add auto cc
> according to reported-by tag, so you are not at cc list. Would you
> please have a test?

It fixes the problem, thanks!
