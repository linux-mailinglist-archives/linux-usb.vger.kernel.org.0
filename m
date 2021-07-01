Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6843B8BE6
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 04:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238579AbhGACIq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Jun 2021 22:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238578AbhGACIp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Jun 2021 22:08:45 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBCEC0617A8
        for <linux-usb@vger.kernel.org>; Wed, 30 Jun 2021 19:06:14 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id a13so6001756wrf.10
        for <linux-usb@vger.kernel.org>; Wed, 30 Jun 2021 19:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rCnIWuA91Y7q+in2ZETAzHkZMmw0aFfjdiM1y2bTeDU=;
        b=DUXJBxFkkLGQdSK6f+3sTLV79wMBKrls4BqbvHSBNyAXnwIIRiYEBJ8NvyPBeIbmEx
         QYvmb/iyMiBA23ePsuoeYv7G3ifc1ha5UhxIBSktTHx2lpJzWaAbQexZG2cX5SdXmCZf
         J/gw0HxsoMElbirfPdyWkAPnVE011460fc/QsQopgp9+Iz8vEunAQhW+W0iJpVQCoz0i
         3DxSKK2qyOiDefWGWyfR/QwlAxznrz6/I1T4Ghl36dCxedCscCSKpoHNE7qvziNZXK4X
         1Be0gIw3HMmda0kFWCMAd+bqWBku9b80XLnZwGbRtw2i98ugy2M0UiIGIt5E53UIWGsh
         AOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rCnIWuA91Y7q+in2ZETAzHkZMmw0aFfjdiM1y2bTeDU=;
        b=YFjUfqm1SjB3xXzw1oa8f7m7vmAZwLdPuweTBIH8ft9M9wf1H6fZj67bRL8Y0ACm8D
         0a6hj/CKZIL8KDwbEN3y9YqdmR2DmXSjVFzqmGAWQfNiqdSpLX0MywmXwY0FCIhAi+Un
         9Y0b3n8azhgVSBMAeHVbdKtjI53xpgRQAWSo6+CsMxMZmLTipALxf1iKI9zt1UkehAle
         TmmAtjiuWYFaSyO+eQk1E6t4hHV+wc2HiotB5ws6CGVPU+D/xc7iPEyiAEeMNCZvKTKl
         OXNc2c7RqGu5OHUjN7dfN+snWHm0rxeeNi4JEYJzSUicklZC40UotmilEKXmbhShMEjY
         0Dgg==
X-Gm-Message-State: AOAM531T5JYkLCrZtPohtlHsskr3P1Li/YdigvUD+Bu2G7Zfw/+qLF2v
        h8lJWCaqPI5xStLZHXrBH86PeA==
X-Google-Smtp-Source: ABdhPJwhcV1ryOgRLBPgEg4AVc9LbYT6OqexvPLdsJRbJqNgueaKc6LwLWgIOg2K7AHZnzYjUNaYLA==
X-Received: by 2002:a05:6000:18ab:: with SMTP id b11mr43332508wri.42.1625105172871;
        Wed, 30 Jun 2021 19:06:12 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u10sm22200257wmm.21.2021.06.30.19.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jun 2021 19:06:12 -0700 (PDT)
Subject: Re: [PATCH 1/2] usb: dwc3: dwc3-qcom: Find USB connector and register
 role switch
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, balbi@kernel.org,
        gregkh@linuxfoundation.org, agross@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        wcheng@codeaurora.org
References: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
 <20210629144449.2550737-2-bryan.odonoghue@linaro.org> <YNtAt3dCGGyj5DU/@yoga>
 <c63c286a-f7c0-0874-59ad-e9ee43660a33@linaro.org>
 <20210629200228.GE25299@jackp-linux.qualcomm.com> <YNuC0Njwr4B1Q1xZ@yoga>
 <0f112cf5-1f71-f189-5a3a-2ff4dbcaa8e8@linaro.org>
 <d8902c0d-ae51-644d-f33b-19f452308097@linaro.org>
 <20210701011153.GF25299@jackp-linux.qualcomm.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <85110545-0369-f7b3-724f-866d3ce1438b@linaro.org>
Date:   Thu, 1 Jul 2021 03:08:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210701011153.GF25299@jackp-linux.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 01/07/2021 02:12, Jack Pham wrote:
> I'm afraid I'm not too familiar with weak symbols. Would that still work
> if dwc3 & dwc3-qcom are built as modules? Also is it supported with
> Clang/LLVM?

__weak would work fine, until you tried to have two strong implementations.

Your linker should choke if dwc3-meson-g12a, dwc3-qcom and dwc3-drd 
linked together with both wrappers implementing normal linkage.

However, I do think its possible to use role switching to have dwc3-drd 
trigger dwc3-qcom.

The role switch code is resilient to deferral so we don't have to solve 
the problem we had with get_drvdata() in the notifier solution and it 
gets us out of the business of having dwc3-qcom relay the role-switch 
onto the core - or indeed care about what sort of connector is attached.

dwc3-qcom shouldn't have to know or care what sort of connector is 
attached to it, ecros, gpio-typec, tcpm or a raw type-c driver and like 
Bjorn said, it shouldn't be the case that the wrapper relays onto the core.

Anyway I'm playing with that prototype now
