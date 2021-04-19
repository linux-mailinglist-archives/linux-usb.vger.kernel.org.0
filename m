Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2E1364E81
	for <lists+linux-usb@lfdr.de>; Tue, 20 Apr 2021 01:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhDSXRJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Apr 2021 19:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbhDSXRJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Apr 2021 19:17:09 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F0FC06174A
        for <linux-usb@vger.kernel.org>; Mon, 19 Apr 2021 16:16:37 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id h20so18625844plr.4
        for <linux-usb@vger.kernel.org>; Mon, 19 Apr 2021 16:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2Nn+bx3z3IH/fvn/wdBQFxz9EywfufvNV/uaVoGNRIs=;
        b=H/ehNs8JBaw6VgbwkwwqUfO7KAnsmnSe+T79rwAaqAy7lVvc+ugoSklGAn9LnOuRbR
         GItdwdDsjaFI0sxhBKzdl384oHBZ2yyyuxKTMlFd/LMopfTjJGjefwqZeWvKw+cEs18c
         jClmRszon64YIFYl3LkQ8tXvrJInJ03xZps1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2Nn+bx3z3IH/fvn/wdBQFxz9EywfufvNV/uaVoGNRIs=;
        b=GaRFrUJziId0FSiWhlBFCshwZFui/bw2sEGgfMAu9VKhDubaVp0IXn5tNNkt/Ql9qW
         haT2eEXbsxN94IJM0Ct6siTjz5xVVxQAseQCcmwmv1gOBKZZNj92B70mKexLYFKUySwD
         zySfFkM9EF38i4GAw2e9l+ra7p7BsZkGWDGVNLRbWzskrH8a/U4o8a7CiscWEQ/+qVYD
         CBD9W58/00I4Ti1keZW8+9rZyO5Ci48kjiXXy9Cp5yKgUvcVAcf+kHJpPqCST98d0tmx
         vyBtm9g6IdXyZD2xecfNREs6dGS2N17bYbYDZAzV63/Yo8rs6gMqqCEiEt+VPnYm2+AL
         8T2g==
X-Gm-Message-State: AOAM530iPK96TmS4kr67RmzHgLQyADQyaAGNAlnHZZ4zmpNJiiX8FE2J
        VHrj/PgrkxaQbybV8TFvZ9SfQw==
X-Google-Smtp-Source: ABdhPJy2CnJJSicWFXTdXMyqLIe+s0lBqamEvdEG3F0hrjwV4vfCNPKV37k1j8mvY/cJ3ks6pPR1/g==
X-Received: by 2002:a17:902:8202:b029:ec:b398:6d73 with SMTP id x2-20020a1709028202b02900ecb3986d73mr2322459pln.37.1618874197230;
        Mon, 19 Apr 2021 16:16:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7401:678f:e510:6700])
        by smtp.gmail.com with UTF8SMTPSA id n39sm10545601pfv.51.2021.04.19.16.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 16:16:36 -0700 (PDT)
Date:   Mon, 19 Apr 2021 16:16:35 -0700
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
Subject: Re: [PATCH v6 2/5] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <YH4PU6O+dlnF1y35@google.com>
References: <1618567313-25373-1-git-send-email-sanm@codeaurora.org>
 <1618567313-25373-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1618567313-25373-3-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 16, 2021 at 03:31:50PM +0530, Sandeep Maheswaram wrote:
> Avoiding phy powerdown when wakeup capable devices are connected
> by checking phy_power_off flag.
> Phy should be on to wake up the device from suspend using wakeup capable
> devices such as keyboard and mouse.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
