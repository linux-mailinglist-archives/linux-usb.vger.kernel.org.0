Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E411E589432
	for <lists+linux-usb@lfdr.de>; Wed,  3 Aug 2022 23:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238350AbiHCV6j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Aug 2022 17:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238139AbiHCV6i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Aug 2022 17:58:38 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC95B5C34D
        for <linux-usb@vger.kernel.org>; Wed,  3 Aug 2022 14:58:36 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id f28so9424082pfk.1
        for <linux-usb@vger.kernel.org>; Wed, 03 Aug 2022 14:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SCTW2VGVCe70yjzOhwev7SpsmSsxdAFKcNcUxQ5cnTk=;
        b=QvmYegVWwxzQMt9s8BVNHqdrotBTolyCG/Brqb8N2NC5qkIEgQFxdpmLRxPp+hbh4S
         Pmc3cs1KKel2tDx+PfmPx+2gfU+Z29b0/yQYOhIXj4wPGlZYg9cp63doNcV0OlbH0C7D
         JNQn2LB8ONdwnRZWz9ufaT1pfS/qNuZgq9Dzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SCTW2VGVCe70yjzOhwev7SpsmSsxdAFKcNcUxQ5cnTk=;
        b=pnUIg+l9vUO8Fe1qdLVc5nOlam2nh/y/GQSE4igafv/fQw7bOKnkRETkxcgyLQSHTI
         zKyU7O+eioNkuIVgGDNomz6ob3nVGlgVUY+K5dEZ8qHjbZlmo/DZrW7dGR+nHMwWiBTx
         K6JOC5uUGMvuxJM2iPzxmk1s+eLgexun9zS1r6BAj9YNqf76T4Mg+34Dv1WnnfacRFwG
         QM3yDI8LIMn90izlK2xZkCfC5exkeshYQIfot3x5fL4dD93iv0fWM6Rg3RGm/5FpZrco
         FXIBmiNq4h1RndV71pK/jPecsCSB54e0HosygK8vciv8+4mOGXx/55BdO7KsnPKqh2jh
         6tgQ==
X-Gm-Message-State: AJIora+7uGTUZxzQ5ZNuS238aRLfC+76UWoycmmMqDlj8kLldHgi8yDj
        jBXLVmaZG224Y4Sxryu8aFfxwA==
X-Google-Smtp-Source: AGRyM1v7t6ywdISV+g82lYVUwLGYI/OHQiSZ7PwIQ4O0SpDyjUA11aPQKQKyGvDOsWyGYUJnoagBlg==
X-Received: by 2002:a05:6a00:1a44:b0:528:6af7:ff4a with SMTP id h4-20020a056a001a4400b005286af7ff4amr28142758pfv.78.1659563916450;
        Wed, 03 Aug 2022 14:58:36 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:238b:c074:f5f8:56d0])
        by smtp.gmail.com with UTF8SMTPSA id a8-20020a631a48000000b0040c9df2b060sm11384657pgm.30.2022.08.03.14.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 14:58:36 -0700 (PDT)
Date:   Wed, 3 Aug 2022 14:58:33 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] usb: dwc3: qcom: fix runtime PM wakeup
Message-ID: <YurviWfzut9sursr@google.com>
References: <20220802151404.1797-1-johan+linaro@kernel.org>
 <20220802151404.1797-5-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220802151404.1797-5-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 02, 2022 at 05:14:00PM +0200, Johan Hovold wrote:
> A device must enable wakeups during runtime suspend regardless of
> whether it is capable and allowed to wake the system up from system
> suspend.
> 
> Fixes: 2664deb09306 ("usb: dwc3: qcom: Honor wakeup enabled/disabled state")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Ah, I wasn't aware that the same wakeup mechanism is used in runtime suspend.

In how far is runtime PM actually supported/used by this driver? The device is
set 'active' in _probe(), and there are no other pm_runtime_* calls, except
in dwc3_qcom_remove() and qcom_dwc3_resume_irq(). How does the device get from
'active' into 'suspended'?
