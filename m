Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A52C3DF52B
	for <lists+linux-usb@lfdr.de>; Tue,  3 Aug 2021 21:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239458AbhHCTN6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Aug 2021 15:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239447AbhHCTN5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Aug 2021 15:13:57 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A03C061764
        for <linux-usb@vger.kernel.org>; Tue,  3 Aug 2021 12:13:45 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id dw2-20020a17090b0942b0290177cb475142so5305643pjb.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Aug 2021 12:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=51jbt1FVT8IlO6u6Cwrs29BEgDlHbe6XQ3u3nFa/JfM=;
        b=ad2Yhve4zPtnMlQA1kQYZvgF/VOj4cc3VR6lgNzpoTCOSNd8h91YOig3aVFrlNOlba
         dQD4tBLo15gSXN6IpWWIGkJh+xMc947AR/PbIe6sv+qGLnv8n0DwTiQsNfgHeVdGTxYj
         dn/MeQ1UbBT14RiwYG82GP70rlJwO7Y54T0Xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=51jbt1FVT8IlO6u6Cwrs29BEgDlHbe6XQ3u3nFa/JfM=;
        b=pIkwbSpqs4jbo3tXKe2w5Ixt0YrqyCmspfhKtgplIksD8DcbaE8ZQHq/S9pIWxHO1K
         CLf4OfbEv/2EIJ0x3Onu2Wc9nhY0faibCDOYUJpYqMnNX9N5MnKPuo1O3k6fLeaaoL8J
         CHevAZYqqJgT9u4YIneZowcIRmoDsC898oGnh7z6KhaeXCIv4IEIvijGH9XCmsroni/y
         bXieO/3Yw76HJ6QGKuo3A+N95Iit+zO3DwrzNMw95AamBnqLBIJh7CgAFyZyDkk0+8bt
         BJKYax0Jjy95C5UgHY3TtfBBXmXssqMDC772ytxHLzvJ6CAnB1+zbsHb4fe/ScVGTyL3
         TeKg==
X-Gm-Message-State: AOAM531p8wcXizy/yirFUDp4qjHPJ9kS8q9eyYNQPrDnhLKKT7HBu4/g
        BZyIMaZJRdt3FLIgnxroQpfZ0w==
X-Google-Smtp-Source: ABdhPJwEEsxEiREkDX7Q13hRVmVm5y2g4E2WGMU7w7iJxiCZoPqfwWG/qUn0MjYFfkB6dhrzfE2h7A==
X-Received: by 2002:a63:d104:: with SMTP id k4mr1253803pgg.196.1628018024608;
        Tue, 03 Aug 2021 12:13:44 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:9afe:3b52:1da2:825d])
        by smtp.gmail.com with UTF8SMTPSA id q14sm16600910pfn.73.2021.08.03.12.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Aug 2021 12:13:44 -0700 (PDT)
Date:   Tue, 3 Aug 2021 12:13:42 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add interconnect properties
 for USB
Message-ID: <YQmVZk42Fq+7GMST@google.com>
References: <1627880576-22391-1-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1627880576-22391-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 02, 2021 at 10:32:56AM +0530, Sandeep Maheswaram wrote:
> Add interconnect properties in USB DT nodes for sc7280.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
