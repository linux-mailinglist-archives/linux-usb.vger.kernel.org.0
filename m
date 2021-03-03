Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A1432C606
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 02:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238782AbhCDA1V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 19:27:21 -0500
Received: from mail-lf1-f48.google.com ([209.85.167.48]:42190 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348332AbhCCNxK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Mar 2021 08:53:10 -0500
Received: by mail-lf1-f48.google.com with SMTP id z11so37131463lfb.9
        for <linux-usb@vger.kernel.org>; Wed, 03 Mar 2021 05:52:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cv7yop+MH/pcb+ZTj8CZR295gKxQmKKGTTugXuaxqmU=;
        b=b8sklvi3KXoPgujVJd8uQDNnChX5KL7jePO9Z8gANNVe9l3js2rvSHE6MORp+uc+2d
         Mg6Naw62uQhoDngBR69zO8605yhn3IL8fF/XJW3lVvDEHL2Ol9s36roln6X42LywkGaZ
         LbG/9otWDYg1FFpqimbQhMxaLAkddzU0ShoBGXkpfpau6uLI9r6bHWJSIIXXZ+LzEkhO
         U560ezt9/srpQ4pPd9Uem7U/7stfS3g7TowuxFowRAxCA7DZN0DfyHu32y08q6F3t3/s
         b1O1tmStJc5CbtVuwwYZDWvJkjl+hTlt1O1SgCf2Aw4oNxybhxwLBnRy+2WybxizpBl6
         MPRA==
X-Gm-Message-State: AOAM530W8Wds2v10q6WFQaqtW02rYfwSlSe0EJ/cN924PFxtPPSHnX0I
        USiS42xNyZKsaGuaGbxBKAeHYPgDXLw=
X-Google-Smtp-Source: ABdhPJy7iNAD4EeScpTnHX4oNG0rw82jKbdnMXQ+oEWihpvZbniwdSwv6Z3RJvO7WJcYAkJ8YNMzog==
X-Received: by 2002:a17:907:7651:: with SMTP id kj17mr17873190ejc.127.1614777339907;
        Wed, 03 Mar 2021 05:15:39 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id cb1sm19573848ejb.69.2021.03.03.05.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 05:15:38 -0800 (PST)
Subject: Re: [PATCH] usb: dwc3: make USB_DWC3_EXYNOS independent
To:     taehyun cho <taehyun.cho@samsung.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
References: <CGME20210303022537epcas2p1b85ab825ceca3a411a177cc1af8a2c7b@epcas2p1.samsung.com>
 <20210303022628.6540-1-taehyun.cho@samsung.com>
 <c9ac155c-56c2-4025-d1ae-d0c6c95533b8@kernel.org>
 <20210303131216.GA136468@rack03>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <15363ed7-73b0-1b0e-adc9-92a0ab68c13d@kernel.org>
Date:   Wed, 3 Mar 2021 14:15:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303131216.GA136468@rack03>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 03/03/2021 14:12, taehyun cho wrote:
> On Wed, Mar 03, 2021 at 11:24:01AM +0100, Krzysztof Kozlowski wrote:
>> On 03/03/2021 03:26, taehyun cho wrote:
>>> 'ARCH_EXYNOS' is not suitable for DWC3_EXYNOS config.
>>> 'USB_DWC3_EXYNOS' is glue layer which can be used with
>>> Synopsys DWC3 controller on Exynos SoCs. USB_DWC3_EXYNOS'
>>> can be used from Exynos5 to Exynos9.
>>>
>>> Signed-off-by: taehyun cho <taehyun.cho@samsung.com>
>>
>> NACK because you ignored comments from March. Please respond to them instead
>> of resending the same patch.
>>
>> Anyway, when resending you need to version your patches and explain the
>> differences. Please also Cc reviewers and other maintainers. I pointed out
>> this before:
>> scripts/get_maintainer.pl -f drivers/usb/dwc3/dwc3-exynos.c
>>
>> The driver - in current form - should not be available for other
>> architectures. It would clutter other platforms and kernel config selection.
>> If you want to change this, you need to provide rationale (usually by adding
>> support to new non-Exynos platform).
>>
>> Best regards,
>> Krzysztof
>>
> 
> Sorry for not answering the comments previously. I was confused with the policy.
> I couldn't use 'USB_DWC3_EXYNOS' when 'ARCH_EXYNOS' was not defined. That's why
> I changed 'ARCH_EXYNOS' to 'USB_DWC3'. I modified changelog text from previous
> commit. I saw some more discussion was done about 'ARCH_XX'. I will wait for
> the decision.

You removed most of other people from Cc-list, except Felipe and USB 
list. Don't. Reply to all of us.

You need to start working with upstream, otherwise your needs or use 
case won't be easy to understand. So far, for the mainline kernel there 
is no need to yse USB_DWC3_EXYNOS outside of ARCH_EXYNOS. There is no 
Exynos9 support. Start sending patches for these instead of customizing 
mainline to out-of-tree non-upstreamed kernel.

Mostly we follow the rule - if it is not in upstream, it does not exist. 
DTSes are exceptions. But your downstream work is not a reason to tweak 
upstream without any explanations.

Best regards,
Krzysztof

