Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C75BE3B7A24
	for <lists+linux-usb@lfdr.de>; Tue, 29 Jun 2021 23:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235209AbhF2V6W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Jun 2021 17:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232997AbhF2V6V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Jun 2021 17:58:21 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 692D7C061766
        for <linux-usb@vger.kernel.org>; Tue, 29 Jun 2021 14:55:53 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id u6so916702wrs.5
        for <linux-usb@vger.kernel.org>; Tue, 29 Jun 2021 14:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F+tHr9nTZPsP/L41LDDEeXiY0HeubYowRUu2DqE1fyw=;
        b=pcQR2h7Jed2UG/FMm0+KicDSHQp1wQnG4gT3Cw429cEttDeFVP4vxP8XNPTvt8TmCm
         3/HrFR2/8V7MezHIZ64l2jcko73d2P2qQlkglgn8J2vfGI4nV1Opy85ZJYwlMJZGWnNZ
         gk2r6zIfgYVMYC40u0WuuQ2ADhaknYdgVSC6irQaLgB+4re64i7dc1YTcKV3SW/1uNX9
         K25HYwN938KnKITeYRSqrQ+7B5FrsRF4s0Vhxh37oNY1J3xmpiTXL7s98VKVDN1O66tb
         AMq58x98lGE3wtZtWllBAcG+6k7wVqXkk5eGFi6jxDh8U1p8SlGsrvKrKGGkKcvMSj10
         aTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F+tHr9nTZPsP/L41LDDEeXiY0HeubYowRUu2DqE1fyw=;
        b=KBnWPM4cs3g8DYVSSz4aVa/N/EWoVM62MIh+Fum9WxcAbPK3BSG9EqmpGYl8BH17pm
         SgftBs6Jq047DhAPuw7/dmqOdpbLJ2GCHw/M3KQPcLdbXBHdVO3EFHwd0eIz6P5BshGh
         LYBatUlLFdTixZNne/d3Vh46HhsHYGXDux12OspT0Hr6X1obfV3EA6x1g2+efopBvAWO
         J1CrbRQMjUGiO9aS9Y+ZmHuzypf4oDkQgpjEp3FITQN0Wkwzlcb8NOsAZUHP1tOwkSFy
         MpHApjyHdz/RWprBoA2Wfyyx0Dyr99CFbnvieBl13/bgxwahaZnGNhQ1KoBxsdEy26Zw
         XymQ==
X-Gm-Message-State: AOAM531lLM2MyoCu1q2XzEOGG4BrZsZIWOcYLeFL/A0oB+7tmEBzXkC1
        iThh+p3llpdH3MSSlFlv+7vBNw==
X-Google-Smtp-Source: ABdhPJyugJMxao8ifmhKqSukK7m4MpSBZ4JJN1rKdHb5/H2Q6QsGd3+0ZAuIxvmTOtfSwwrHDUjokw==
X-Received: by 2002:a5d:5586:: with SMTP id i6mr16021895wrv.195.1625003751963;
        Tue, 29 Jun 2021 14:55:51 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j11sm17830318wms.6.2021.06.29.14.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jun 2021 14:55:51 -0700 (PDT)
Subject: Re: [PATCH 1/2] usb: dwc3: dwc3-qcom: Find USB connector and register
 role switch
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jack Pham <jackp@codeaurora.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        wcheng@codeaurora.org
References: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
 <20210629144449.2550737-2-bryan.odonoghue@linaro.org> <YNtAt3dCGGyj5DU/@yoga>
 <c63c286a-f7c0-0874-59ad-e9ee43660a33@linaro.org>
 <20210629200228.GE25299@jackp-linux.qualcomm.com> <YNuC0Njwr4B1Q1xZ@yoga>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <0f112cf5-1f71-f189-5a3a-2ff4dbcaa8e8@linaro.org>
Date:   Tue, 29 Jun 2021 22:57:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YNuC0Njwr4B1Q1xZ@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 29/06/2021 21:30, Bjorn Andersson wrote:
> I liked this, and it worked when I tested it, but iirc it suffered from
> the problem that the core's probe may or may not have finished
> successfully at the time that of_platform_populate() returns.
> 
> But fixing this problem would save us quite a bit of headache.

OK.

I will take a look at resurrecting the old patches either fixing the 
probe order - or perhaps using something like Wesley's role-switch to 
have dwc3 core optionally trigger dwc3-qcom

Binding tcpm into &usb_1_dwc3 instead of &usb_1

---
bod
