Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6802833EB2E
	for <lists+linux-usb@lfdr.de>; Wed, 17 Mar 2021 09:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhCQIQn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Mar 2021 04:16:43 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:46916 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhCQIQN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Mar 2021 04:16:13 -0400
Received: from mail-ej1-f69.google.com ([209.85.218.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lMRLg-0000CD-6U
        for linux-usb@vger.kernel.org; Wed, 17 Mar 2021 08:16:12 +0000
Received: by mail-ej1-f69.google.com with SMTP id fy8so14821036ejb.19
        for <linux-usb@vger.kernel.org>; Wed, 17 Mar 2021 01:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h7RuThKGVeD8HpXasnQO91ZFAcbdaCJWKNu1ufXCr2w=;
        b=ejJP2f8vVHO4+x+bNAJ/cbgqMPpR4NiGJrtm6hhO5mvaMQByEbpdjtemnYtCSU6prU
         DIpZ6uKu698fIqk6LI9RqyIw7iYe9uXS8FX6gttu8yVMhKQfsL4lG6ZXMCT5PrTnIbhx
         XAZnL8Yb+e3NXbmdr2IlTVrGmVKV+Y+0pWeN1m2eM3jDJ+OoXaJDP9iecVIrdxlipH9s
         LweRI6ewDoo2N3aAI5d5NOt1Z8K9AWgCs5C7dI45LIMdE/pZgtsJQP+C+a0m9KETc5fV
         +4dnJeT7UxzrR0DfhJeeNDWUfggF7ggn6nGSc3svCzdTfcRu/5gUkew1FjtpwGcEaanV
         g2lw==
X-Gm-Message-State: AOAM532Cyxqqjj+LE/ch5SwV1RdJKJ9KyQKa72sjvQjY+1MlrJ2Hl9do
        rSdztVKkk/7F1JTp/gITiVYHWiQkNAdRCXcpOMGLEfgZtM2Jt+E8yNlPI3GdNsIfrVJikbHs2tp
        KbfKlaGq69CQAPzfj5hHS7upk/oPwXY4Y0J/Eog==
X-Received: by 2002:a17:906:75a:: with SMTP id z26mr33965988ejb.22.1615968971921;
        Wed, 17 Mar 2021 01:16:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPcCO5sSi1eo5a3askTdA/AAtRTlKM87h4YwdmFP5QiRbC3VpupLgHfc3JdAdM/y1VwLMscA==
X-Received: by 2002:a17:906:75a:: with SMTP id z26mr33965971ejb.22.1615968971762;
        Wed, 17 Mar 2021 01:16:11 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id jv19sm10845827ejc.74.2021.03.17.01.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 01:16:11 -0700 (PDT)
Subject: Re: [PATCH] MIPS: ralink: define stubs for clk_set_parent to fix
 compile testing
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org, balbi@kernel.org,
        linux-usb@vger.kernel.org, digetx@gmail.com,
        kernel test robot <lkp@intel.com>
References: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
 <20210316215820.GA18064@alpha.franken.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <804bb73f-7de0-e91b-ed57-a3b26de78fce@canonical.com>
Date:   Wed, 17 Mar 2021 09:16:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210316215820.GA18064@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16/03/2021 22:58, Thomas Bogendoerfer wrote:
> On Tue, Mar 16, 2021 at 06:57:25PM +0100, Krzysztof Kozlowski wrote:
>> The Ralink MIPS platform does not use Common Clock Framework and does
>> not define certain clock operations leading to compile test failures:
>>
>>     /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
>>     phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
> 
> hmm, why not make it use common clock framework ? And shouldn't 
> include/linux/clk.h provide what you need, if CONFIG_HAVE_CLK is not set ?

Converting entire Ralink machine to the CCF is quite a task requiring
testing and basic knowledge about this platform. I am just trying to
plug the build failure reported some months ago [1][2]. The CCF does not
provide stubs if platform provides its own clocks.

[1] https://lore.kernel.org/lkml/202102170017.MgPVy7aZ-lkp@intel.com/
[2]
https://lore.kernel.org/lkml/20210316075551.10259-1-krzysztof.kozlowski@canonical.com/

Best regards,
Krzysztof
