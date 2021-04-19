Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2933364AAB
	for <lists+linux-usb@lfdr.de>; Mon, 19 Apr 2021 21:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241751AbhDSTh5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Apr 2021 15:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235013AbhDSTh5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Apr 2021 15:37:57 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17D5C06174A
        for <linux-usb@vger.kernel.org>; Mon, 19 Apr 2021 12:37:26 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id q10so24979182pgj.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Apr 2021 12:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cRX2PnENKrp+Sre4G8DjBQEvzpPHZjO6ro3yvF7N1w8=;
        b=FBireDUg9KAmKpls9A6Odw22Pn3dekJN9WQwfIu2Jz4ovycZv5q7bTV6LRdhhNRPWz
         6kpInnms/P+Y9TpBcM+c8zD9rwK6S5gpI3RAxE9gfr77TpWqtRLKLAFtxdsDBrssKYnx
         8JZh0NqTqYR3wlfErrGlK4GNier3AV3ggMF9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cRX2PnENKrp+Sre4G8DjBQEvzpPHZjO6ro3yvF7N1w8=;
        b=qe+V+PpmD77PwvnfgPekQ1H9vkGSm6vWTswy6Yat/8hnQup+hw7nLJwsecberxoX9f
         fyNdQGMNumfdm3w3Kk6wSOLDfWT3yMurjk0K78TxQC0fW2LjNdop4Nb2BeXPCNRjpMB7
         e18vPzyxulZTb3z1lZyZXBVQbZTjDcjut5XPsK4UW/E+aOrCwzlbkWZNO4UOQN4JHFZ5
         wHzQ2ZBKMVdsw8Gi3F1dd0dcs7MPwrz5OqGmMXxdExp/Taj7rxnWNm8Vq9c1mUyVMiHi
         3DWYwhWhT/4/fsUGQ7tiIVUKxT1Nf/V/3P7slORQE9iN+dsgMr+hTBzrH+SS2XB757a1
         nLMg==
X-Gm-Message-State: AOAM530t7li2y+gG9nSBFwLVYgxjDerhDGGL135LKAR/hwSg8Uqwb+Lt
        EpuDDd6ce0ti4WkUhuNd3pus+g==
X-Google-Smtp-Source: ABdhPJz1Cq0t9hO02D3ZpKTW0FoURJAAOaUJ3pOIpMOk3nbB57RoSTKg6VWVjbjLaoyYY77inJAiLA==
X-Received: by 2002:a63:2ec7:: with SMTP id u190mr13372245pgu.18.1618861046232;
        Mon, 19 Apr 2021 12:37:26 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7401:678f:e510:6700])
        by smtp.gmail.com with UTF8SMTPSA id fw24sm233421pjb.21.2021.04.19.12.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 12:37:25 -0700 (PDT)
Date:   Mon, 19 Apr 2021 12:37:24 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v6 3/5] usb: dwc3: qcom: Add helper functions to
 enable,disable wake irqs
Message-ID: <YH3b9J4Pl+4+wygb@google.com>
References: <1618567313-25373-1-git-send-email-sanm@codeaurora.org>
 <1618567313-25373-4-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1618567313-25373-4-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 16, 2021 at 03:31:51PM +0530, Sandeep Maheswaram wrote:
> Adding helper functions to enable,disable wake irqs to make
> the code simple and readable.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
