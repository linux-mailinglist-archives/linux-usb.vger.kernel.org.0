Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35BFF3CB3D6
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jul 2021 10:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237055AbhGPINZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Jul 2021 04:13:25 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:44028
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236404AbhGPINY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Jul 2021 04:13:24 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 6432C4060A
        for <linux-usb@vger.kernel.org>; Fri, 16 Jul 2021 08:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1626423028;
        bh=L9MMsFB01bcQBMZVUM6ptUTgFJGG6LHutssCGH4WjNE=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=BOb1JXVNoeQHxLX+AApfY7QvRonNRhhQK+hksMIbgzCKwHW9GVPEnpnAwy/hsA95O
         IWFbmomLfXLTkwfDbMKpI8sY99/eSdGKar7kqoC6t/VngjOv/tqcTQ2JIdSUJwWndo
         5rLCbz6rpYaMvEHf9P2zk+u68n08LXNgOFKuUJDNgoyNg7NrWo2tGMpHcZFWCY9nZq
         +1uGmNsy42icCd00noM+0PN3yeGaFTMHYnTy4HC/fkjs4F7NYR77ly/wAJxjVOvmil
         YJVzIixb+EnHX6ueNUCWPprvdcPDPdeWJPUnl6j3nGzQ5zpGPiuLAtG/LddOin4sTu
         gOoi6v4vQ5LmA==
Received: by mail-ed1-f69.google.com with SMTP id e1-20020a0564021481b02903a66550f6f4so4377497edv.21
        for <linux-usb@vger.kernel.org>; Fri, 16 Jul 2021 01:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L9MMsFB01bcQBMZVUM6ptUTgFJGG6LHutssCGH4WjNE=;
        b=mC/geaLKoEonRwwFl3Muy09lsEm7HaylgoZ2b/pVOr6kP3mv3B9arChsOB6KF8BC6L
         /X2UcKjO8cDi4pbDoelTZMPZO+Y9EneHYBWsj/oJz7jUpnrvKmVwTIHFK8S+pWDpcFXJ
         IJ8mDPRAc20mVNigfi3oVnmR/l2PZ05xQf6kRvw4PcJ/+Gg0RQxJAUPjf/rnXDJuRUkX
         m5BTjtywFVb6mQ+2+iCVmy+uyL5uyBvArqserWVWQiVpRu6alUMoskehQPdgtoDq6Z4W
         u57oZgoPC6b3ZDqycJhtnpffs40pSNNdHIoForvR7qje+XZK4VbXrYdIYbimJrcx5FDD
         b1mg==
X-Gm-Message-State: AOAM531D8EVMNB1C0DspMatKUddWeRpsssQCNYBcS5I5Thu7fi4gD0sQ
        uzyeupJ6d9lGgYfUsCnnV+TcHG54dhs/+chy5k6+CKVT2qNMAv+bXMkFOLbe9IUwYSQLknBZuCr
        R0BTK6MDtXswrYzvCHscal2EAyv+t82wc8Sg/VQ==
X-Received: by 2002:a17:907:77ca:: with SMTP id kz10mr10488443ejc.22.1626423028176;
        Fri, 16 Jul 2021 01:10:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxjykeWe9vyc/3sLe4sx4pnV+k2NBj2Kfu2VFp/4SK6C+oDeK2r1lq6xyv7AHM0fcA9kQiIg==
X-Received: by 2002:a17:907:77ca:: with SMTP id kz10mr10488428ejc.22.1626423028024;
        Fri, 16 Jul 2021 01:10:28 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id m26sm1274584edf.4.2021.07.16.01.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jul 2021 01:10:27 -0700 (PDT)
Subject: Re: [PATCH] usb: dwc2: Skip clock gating on Samsung SoCs
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <CGME20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23@eucas1p2.samsung.com>
 <20210716050127.4406-1-m.szyprowski@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <e2fc4d3f-2f64-1d7e-5816-0275da23d6fa@canonical.com>
Date:   Fri, 16 Jul 2021 10:10:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716050127.4406-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16/07/2021 07:01, Marek Szyprowski wrote:
> Commit 0112b7ce68ea ("usb: dwc2: Update dwc2_handle_usb_suspend_intr
> function.") changed the way the driver handles power down modes in a such
> way that it uses clock gating when no other power down mode is available.
> 
> This however doesn't work well on the DWC2 implementation used on the
> Samsung SoCs. When a clock gating is enabled, system hangs. It looks that
> the proper clock gating requires some additional glue code in the shared
> USB2 PHY and/or Samsung glue code for the DWC2. To restore driver
> operation on the Samsung SoCs simply skip enabling clock gating mode
> until one finds what is really needed to make it working reliably.
> 
> Fixes: 0112b7ce68ea ("usb: dwc2: Update dwc2_handle_usb_suspend_intr function.")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/dwc2/core.h      | 4 ++++
>  drivers/usb/dwc2/core_intr.c | 3 ++-
>  drivers/usb/dwc2/hcd.c       | 6 ++++--
>  drivers/usb/dwc2/params.c    | 1 +
>  4 files changed, 11 insertions(+), 3 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
