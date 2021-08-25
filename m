Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF5AD3F7BDA
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 19:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234784AbhHYR6h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 13:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhHYR6h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Aug 2021 13:58:37 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 391DAC061757
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 10:57:51 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id b6so495180wrh.10
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7HJBCsy/2e+8vsjPLqtpvDX5toDV2JyAqCmGyQypeaw=;
        b=hvkNt8z3rBE522DXHa6d0kkR9rTK4r5uIwm/1xFzfXbuLbMLm8RIZ0g/qupOb1movf
         O1ZG7sXtWsWiWVNiYzTMfd5hQjo5UVFaMXc0NsQMLxffZuTE5sx78I7a3Fi7lzjdvgMV
         hoAZtplGtpJkyYTAtYcVilbzS+/yL+Zwv7jzdlOWIpXRbosmI+w0XT3CtbtU8zgKEH8r
         FNS50TiyZUlk/OK7KKKug1wbdK7V7RY4y/bw7Lprj0VSjs1rKP3xz0+ezLV1SSTPyLRi
         n9g8a3T6fg8Htag1ifOFD3y0sJ8c9rjChqtP3rtY9ZgGB1qfMuu8NJZlP+BURIjEoU5w
         PHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7HJBCsy/2e+8vsjPLqtpvDX5toDV2JyAqCmGyQypeaw=;
        b=CibnOqSuUG1vRyUm2JZUoxypAEMn8rX4bfUH1HweWMO0TLHciL6o0KmBFqL6KuTvnF
         cmWprEyZyBG9qmIPmtEBj3zhgyDIlQ4/RHqmfDGVBlfFydn4R+gzGvWjFfqLxUVqC2/a
         rqqS0ZVC7d8U2CWVQAdzLDb9vTFjz1DV1zcgQ7kePZYTj7RN6Rou+tlJZcGOmEpgcpme
         XRdhyqJO7SVdM4+C0BzhgaavUi+mylpvCUgUvzalBJz27VREN2rahpEk6x/4tZh+liOz
         cY1QV868ZX6W5Z0zGgNfWlRZz0nQfuIXSyTkSjHhi5RPfxziJaawXpKpgTa8H70T1ki6
         iCOw==
X-Gm-Message-State: AOAM5315mJeYCkWKYHoZ3P6gp4m3Lp1p4vxEl2oPHQOGPB9iayvIy/Au
        IFUsvSjkTTcRl20s0lu91tBKDg==
X-Google-Smtp-Source: ABdhPJyKPhVnc2tnXS2eXCHWuVHjv+XELlwxThJ5sphgUEk8gd+6S/1OZhItx3GZU1jUeKngA2jnlA==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr27932649wrn.66.1629914269753;
        Wed, 25 Aug 2021 10:57:49 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o34sm6172398wms.10.2021.08.25.10.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 10:57:49 -0700 (PDT)
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Peter Chen <peter.chen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, agross@kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        wcheng@codeaurora.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen> <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen> <YSWCnsZDdp57KBqB@ripper>
 <87zgt65avm.fsf@kernel.org> <ce5f12dd-ddc1-6a9c-3dfb-aa44ea166828@linaro.org>
 <YSZned9v1+ajzVx0@ripper>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <90d17c95-1cf3-89aa-94ad-920e4781f866@linaro.org>
Date:   Wed, 25 Aug 2021 18:59:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YSZned9v1+ajzVx0@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25/08/2021 16:53, Bjorn Andersson wrote:
> But in the case of Type-C altmode several of our boards have either an
> external gpio-based SBU-pin-swapper or some redriver on I2C with this
> functionality, so we need a way to tell both the PHY and this external
> contraption about the orientation.

Its a very similar problem to orientation switch

As an example

- redriver may need to fix up signal integrity for
   lane switching

- PHY needs to toggle lanes from one IP block to another

I don't think off the top of my head a USB controller or DPU cares much 
about the orientation switch but for argument sake you could add one to 
that list.

I _think_ the type-c mux layer handles this though, as in what we did on 
RB5 has PHY and redriver receiving and reacting to a type-c orientation 
switch both with the existing type-c port driver and the new tcpm.

+ Dmitry - he did the mux work on the PHY and the redriver

Seems to me that the type-c mux way of diseminating to more than one 
place might fight role-switching well too.




