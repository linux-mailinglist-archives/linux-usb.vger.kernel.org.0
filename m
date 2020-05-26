Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B021CBAE4
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2020 00:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgEHWu6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 May 2020 18:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727774AbgEHWu6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 May 2020 18:50:58 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A472FC061A0C;
        Fri,  8 May 2020 15:50:57 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s8so3744559wrt.9;
        Fri, 08 May 2020 15:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V3nc4NBSeZ0B9rUqgxGAX48Rma2M/iKEjSutkviGE4Q=;
        b=Rbdz2xcrk8vpCyPDyAgfbsmQ8rl7ctSx/u0Q/RXDgSP+qyWCYVkMEEA5FGk1FFHlMu
         0rG/+L7W3uqMRXEtCtPcoq0/VFYPz3BjOoM6ArXS4d4GVxmFIUhmCb4371XIeKm3TbNn
         jmQ/Hz1FEOMOV/gkqny9GJ9Y0UDgRhrnVsuzsCEMpSYX1Xm7fJKtaAZhOZW182ssoRhM
         vsqEtUjrKKqYGptTR+2Sk5lkS9Tz6Zi045IQCRGDjRu7SuV/us7o+kbop7E5cGyz45dS
         3OXpIP9pqSEJjdmekc5kpnvljSQmOlq9Mggx/Zfkc1BWcRDZG7LBJLr6LrP57IyCv5xG
         7TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V3nc4NBSeZ0B9rUqgxGAX48Rma2M/iKEjSutkviGE4Q=;
        b=JxXp3UsiJsMbGtIPl7IxkFHA+BX0YdlMmwQZafROpKBsqbo5r4mf4D7NhzyY1DR7lI
         4pcP6xLUlj/s83p8n22AOArhpXP1av4TGu1jsrj8BRwjnz1ljevB9GGT3LiYVTNvMRUU
         lkpVi+e/8LU0mLlyB9/ztrN6+bTj1VFX0WAbCYjm0zuKFyZUvYvreX98frgbLV2HO4zB
         TirTKfICf2600f5SHtn/WMzC0gCvLhWvQflPfbRRPlGEpGIe+dZS7MRgNPyIOFYTmix+
         oGfVUpElDcQUsiaBh0Gz0gfH9jFZ1AJ+Cpp59PAcQPLZyV3zoeySdGHZKcfVkJMuGrMN
         5D7w==
X-Gm-Message-State: AGi0PuY8uTdZH4+4VInLuC34LwgcQ9uHiMZrdFNVhQ/q8ND/MYXBk+GQ
        MMvN6Vk1f3VWNcRJREO1Gf0=
X-Google-Smtp-Source: APiQypLI4Byv5T7Lmh2uWKQSyxmalzDJUkuVIv6YUIt/fdFeuVoSLcHQsePCIMB8Z0kKMP4AhIDcKg==
X-Received: by 2002:adf:ea44:: with SMTP id j4mr5797953wrn.38.1588978256310;
        Fri, 08 May 2020 15:50:56 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u67sm3429631wmu.3.2020.05.08.15.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 15:50:55 -0700 (PDT)
Subject: Re: [PATCH v8 1/5] usb: xhci: Change the XHCI link order in the
 Makefile
To:     Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200508211929.39020-1-alcooperx@gmail.com>
 <20200508211929.39020-2-alcooperx@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <39262358-9ba5-20f7-656b-63825da369d6@gmail.com>
Date:   Fri, 8 May 2020 15:50:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508211929.39020-2-alcooperx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 5/8/2020 2:19 PM, Al Cooper wrote:
> Some BRCMSTB USB chips have an XHCI, EHCI and OHCI controller
> on the same port where XHCI handles 3.0 devices, EHCI handles 2.0
> devices and OHCI handles <2.0 devices. Currently the Makefile
> has XHCI linking at the bottom which will result in the XHIC driver
> initalizing after the EHCI and OHCI drivers and any installed 3.0
> device will be seen as a 2.0 device. Moving the XHCI linking
> above the EHCI and OHCI linking fixes the issue.
> 
> Signed-off-by: Al Cooper <alcooperx@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
