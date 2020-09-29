Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C443F27D676
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 21:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbgI2TJM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 15:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728210AbgI2TJM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 15:09:12 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66678C0613D0
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2020 12:09:12 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id l126so5542939pfd.5
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2020 12:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bgjd/B7KdoGPIMOIsXPxTUv6rCgIFOUt5UmLgFf58B0=;
        b=dQ3pMRX6HmaArThDUQARb24+Xjkm3nNSp0LQnhrkH6Q8VE0a/qS2n9MzFLRfLNmvOA
         UYkRtz/DV0vQeV88BnNct2Esl4yQ+YbNo9QCYNYX2j6ozt2VVH9Ecvs4926enaBsO7DU
         XHL08Vy0QLO5NSbOVSjZXVQixxmTN4VELBTnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bgjd/B7KdoGPIMOIsXPxTUv6rCgIFOUt5UmLgFf58B0=;
        b=swV4VgLuU0qJytn6wZ0WrR2Lw9j3ktlh7U2LuIpBAdNSf2eaC0XnX0s1UddmMclyyZ
         Xs8jKBi9EsJYbWIlV84PQIYyU934Nglg0rMOFRwkGWrNmaCufuwuuCxv+5eWjoAFyYWn
         fubqQn1iYCWULWuv1JNI3hlyiVaLeiIhEWQfFJxDZh23CZvkn5VzYNBZzKCqNgPpQmaC
         efBI4zMoFlR5QmQ1yQrHEbWYdN6yo00RBWFfKrZ1NtZEookYbxA0cNMo/NL1K9MdvjoV
         P2i3qiz+6qES/wDJS+uUNJMu1n3YqVH9HvwAgV8bTwPb5+/5RmGgmVzbp8zI/Y9L/FfV
         Z9Rg==
X-Gm-Message-State: AOAM533pGMBo7PVALKXOiKdjxlTHkd3BHhXIA7jpSCxMDvbDcEh+nthB
        S7e9HFYMkUiFFxtDK2bzhnj/cQ==
X-Google-Smtp-Source: ABdhPJx3wUAAoTGCE0/p7O5ml66HnFt41zubIJc2k9Hv2XO3LVJyfT1FoSHimEJRWNPzejOkyZ/F1A==
X-Received: by 2002:a62:92ce:0:b029:13b:88f6:3935 with SMTP id o197-20020a6292ce0000b029013b88f63935mr5110872pfd.2.1601406552006;
        Tue, 29 Sep 2020 12:09:12 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id n2sm5451462pja.41.2020.09.29.12.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 12:09:11 -0700 (PDT)
Date:   Tue, 29 Sep 2020 12:09:10 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sc7180: Add wakeup-source
 property for USB controller node
Message-ID: <20200929190910.GE1621304@google.com>
References: <1601376452-31839-1-git-send-email-sanm@codeaurora.org>
 <1601376452-31839-6-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1601376452-31839-6-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 29, 2020 at 04:17:32PM +0530, Sandeep Maheswaram wrote:
> Adding wakeup-source property for USB controller for SC7180 boards.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>

nit: it would be better to have two separate patches or at least mention
in the subject that this change is for the IDP and trogdor, not SC7180 in
general.

Besides that:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
