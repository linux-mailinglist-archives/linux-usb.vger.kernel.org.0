Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C135D33ED9A
	for <lists+linux-usb@lfdr.de>; Wed, 17 Mar 2021 10:57:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhCQJ42 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Mar 2021 05:56:28 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49484 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbhCQJ4O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Mar 2021 05:56:14 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lMSuT-0006e3-8W
        for linux-usb@vger.kernel.org; Wed, 17 Mar 2021 09:56:13 +0000
Received: by mail-ed1-f72.google.com with SMTP id t27so19039355edi.2
        for <linux-usb@vger.kernel.org>; Wed, 17 Mar 2021 02:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0OR+NA5iXYs5Hx3O1xYcQ4bDsjPq6HwTw7iNrWZV+1U=;
        b=E2l9qoQiBV+kIg09lls3StZ2JmrXNA7oukKyw9vc5/0jFSFcaBfush8x9bex5ET9h+
         0EBYcNCMekqlET1DQcI7dNSY5eKspCczJiweDioz/20uXBbN28DPCYSmDOpa4R1CoBuB
         tBNuEymCKdkeU3/EeNvNaC8HT2pMUL1KlFqTL8rMQzA42LwppVIlnncus61PKyLpYMuZ
         Df8wADNEWWsrAHgtdZBiR502NGBlO0j+hBpHVi0eVqaWJahTfbe0fLvKt97+dogBbgul
         mN9mldW0kFOeazqPDO9KPR3qNusNTcRqNL2atozvh3xxszhUxDPGjSrfUYboE5P5Icb6
         nzlQ==
X-Gm-Message-State: AOAM531VQwDomTwpXclTK+V5W+BVlS5sESMBqXI0KMW9d6AZaqOWF16T
        VHC+rKzZ9iZqwUpaj/fFJyD14yTs6snlbCVyBXibyqEpioQ5w4Rc1/CW1wnAP+BpyEXYhJ1oY0S
        ObnkHhFwZLhWvI0djgXvwCz1DLxcJfyL0Bgd4gA==
X-Received: by 2002:aa7:c957:: with SMTP id h23mr35930038edt.301.1615974973040;
        Wed, 17 Mar 2021 02:56:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKNRjNZyBOhnwv1azPBEsuZfI4Rho3JZRbmen39IJTtWFb2ddjWUNbr9EawFm5lmsC0A830w==
X-Received: by 2002:aa7:c957:: with SMTP id h23mr35930023edt.301.1615974972870;
        Wed, 17 Mar 2021 02:56:12 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id r17sm11873586edt.70.2021.03.17.02.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 02:56:12 -0700 (PDT)
Subject: Re: [PATCH] MIPS: ralink: define stubs for clk_set_parent to fix
 compile testing
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
        balbi@kernel.org, linux-usb@vger.kernel.org, digetx@gmail.com,
        kernel test robot <lkp@intel.com>
References: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
 <880d5e61-fec5-e7d6-7403-b1823c77b3c1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <856fbd45-67ae-fed2-97c4-b555993d5ae9@canonical.com>
Date:   Wed, 17 Mar 2021 10:56:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <880d5e61-fec5-e7d6-7403-b1823c77b3c1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17/03/2021 10:52, Sergei Shtylyov wrote:
> Hello!
> 
> On 16.03.2021 20:57, Krzysztof Kozlowski wrote:
> 
>> The Ralink MIPS platform does not use Common Clock Framework and does
>> not define certain clock operations leading to compile test failures:
>>
>>      /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
>>      phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>   arch/mips/ralink/clk.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
>> index 2f9d5acb38ea..8387177a47ef 100644
>> --- a/arch/mips/ralink/clk.c
>> +++ b/arch/mips/ralink/clk.c
>> @@ -70,6 +70,20 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
>>   }
>>   EXPORT_SYMBOL_GPL(clk_round_rate);
>>   
>> +int clk_set_parent(struct clk *clk, struct clk *parent)
>> +{
>> +	WARN_ON(clk);
>> +	return -1;
> 
>     Shouldn't this be a proepr error code (-1 corresponds to -EPRERM)?

Could be ENODEV or EINVAL but all other stubs here and in ar7/clock.c
use -1. Do you prefer it then to have it inconsistent with others?

Best regards,
Krzysztof
