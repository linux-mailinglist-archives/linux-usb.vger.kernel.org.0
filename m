Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C01392700
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 07:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234374AbhE0Ft6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 May 2021 01:49:58 -0400
Received: from mail-ed1-f43.google.com ([209.85.208.43]:45981 "EHLO
        mail-ed1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbhE0Ft5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 May 2021 01:49:57 -0400
Received: by mail-ed1-f43.google.com with SMTP id a25so4261513edr.12
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 22:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FSENTNS69xYs4su25wiolKPcGiosvKeWN8mFD7bl+RE=;
        b=h7pJ0F3uE2CG50yg8siy7SWRLJhl/XnMhYqDPs5dtenhRzpmQVtq5uYuCUo/JjhBLj
         XaagrJY9nPlLml4s1qtMuXr4vFjjQZAyTGF1ctETgBhZXvLCVqldahgbhf20DikIpqHs
         ZBZqS4VI4WL78Ny4Zl3RtsWWA6z5F/hVwyMNlkGDEwRBWPcHJoEwoJgAdWaVLYo/jglY
         JowvTlgOhC7AOuTkggCrdmCWH/yeRemAtz/hV6QOPBHBANRzmOMVgg5nbElgbEWg/q3i
         5QY8H4kgschrAS+iqSAe439kr55/0Xrz2a04J7Q8UGsl5oISis6anGeYhquw1qUdWujq
         blYg==
X-Gm-Message-State: AOAM532p1hUQc5XGNsbpcuGIz6KytxYoE+eFuNi97cI3MyHA0n4un34Q
        EU0fB7V/oU0Qjg5IAwCtigM=
X-Google-Smtp-Source: ABdhPJw8Yl6lJ0ioyNzA2VWD7Fg0bURZiL5yIg0ZpLdiaJuwtCqSAkqdFGHDQsjSElCO/ek9ArkLwg==
X-Received: by 2002:aa7:d3c8:: with SMTP id o8mr2164579edr.181.1622094503440;
        Wed, 26 May 2021 22:48:23 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id j7sm448509ejk.51.2021.05.26.22.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 22:48:22 -0700 (PDT)
Subject: Re: [PATCH v4] usb: pci-quirks: disable D3cold on xhci suspend for
 s2idle on AMD Renoire
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        Prike Liang <Prike.Liang@amd.com>
References: <20210505061606.22716-1-mario.limonciello@amd.com>
From:   Jiri Slaby <jirislaby@kernel.org>
Message-ID: <b10ad290-0569-99f1-efa7-7fc0bef59b5f@kernel.org>
Date:   Thu, 27 May 2021 07:48:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210505061606.22716-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05. 05. 21, 8:16, Mario Limonciello wrote:
> The XHCI controller is required to enter D3hot rather than D3cold for AMD
> s2idle on this hardware generation.
> 
> Otherwise, the 'Controller Not Ready' (CNR) bit is not being cleared by host
> in resume and eventually this results in xhci resume failures during the
> s2idle wakeup.
> 
> Suggested-by: Prike Liang <Prike.Liang@amd.com>
> Link: https://lore.kernel.org/linux-usb/1612527609-7053-1-git-send-email-Prike.Liang@amd.com/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/usb/host/xhci-pci.c | 7 ++++++-
>   drivers/usb/host/xhci.h     | 1 +
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> v1 -> v2: drop the XHCI_COMP_MODE_QUIRK quirk and create a new one for handling
> XHCI D3cold.
> 
> v2 -> v3: correct the quirk name typo XHCI_AMD_S2IDL_SUPPORT_QUIRK -> XHCI_AMD_S2IDLE_SUPPORT_QUIRK
> 
> v3 -> v4: Fix commit message to clarify and reference HW
>            Rename quirk to describe problem, not hardware
>            Add definition for the hardware to source
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 5bbccc9a0179..7930edf8ebd1 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -58,6 +58,7 @@
>   #define PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI		0x9a13
>   #define PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI		0x1138
>   
> +#define PCI_DEVICE_ID_AMD_RENOIRE_XHCI			0x1639

Isn't it RENOIR as the painter?

regards,
-- 
js
suse labs
