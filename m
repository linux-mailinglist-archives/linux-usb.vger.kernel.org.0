Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C38422F8CA
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 21:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728563AbgG0TRX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 15:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728562AbgG0TRW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 15:17:22 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE679C0619D2
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 12:17:21 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z188so1778150pfc.6
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 12:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nJD8ANcLO/VUZAQvdaY1B7X+QEC8ivatXB0HOFF0ZtY=;
        b=jYbLK+swZ7oxpeCHFmdwpZfHpXputie5W/EjIQUbE8weTwlTEepQhsfFuOurIFeN9B
         GswDdi46JYQ9aLEeP6SEQOpDHpVuNdXW4MZ/cG9ljtiIVjQct65sI7OUGEQKxmTnESOE
         4D9DRhVUAC18CbCTeCtF2sGDcMNnIaJjApsoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nJD8ANcLO/VUZAQvdaY1B7X+QEC8ivatXB0HOFF0ZtY=;
        b=jJFW2qNvc4uhLC7Au6HVLIgcS60skg9Ism80QHZCrRzloznR5bdQv71QrmLjyIDwX6
         WQ5SGuoVJt24O3W+at7AtM0PvugvWlWZ2SuSnoZO09buKvq3LzXVvDy/pWE78FiWDeLK
         sax88M26ZgvlWKhHdjZFBwk86EJrRcF8wSNMuq0Gvcg+T1XSiIjCyllaItzIohOVvF0y
         WejzxLJR/1nAsqvi74kUqMJGTgupxdY5iuFQfKwLFnf7EShKLIb75+8a+A2a0OIwSqPN
         ku9B/M767+e4Q91BXJ18f4qtz4RGAtMwYuPoYsOTaGprsg9Y+Cl6lpIQn1+U87+lD2wT
         bu6Q==
X-Gm-Message-State: AOAM53043N1l2kd5pI2teyfTO5rOi679ZcvrDd0t7Xmoviiuf23koPgN
        a0tKf6hWNi/VNBmRCY1We3uC2w==
X-Google-Smtp-Source: ABdhPJyxz8nTCcV4GFjF0/DzhCHEFEk9iyfb6jBZGO5755r2yYlLAHzxDMoJDgSbCpD92ecQxHBIqg==
X-Received: by 2002:a63:182:: with SMTP id 124mr19887757pgb.288.1595877441496;
        Mon, 27 Jul 2020 12:17:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id f18sm15177144pgv.84.2020.07.27.12.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 12:17:20 -0700 (PDT)
Date:   Mon, 27 Jul 2020 12:17:19 -0700
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
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v10 1/2] usb: dwc3: qcom: Add interconnect support in
 dwc3 driver
Message-ID: <20200727191719.GB3191083@google.com>
References: <1595528857-25357-1-git-send-email-sanm@codeaurora.org>
 <1595528857-25357-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1595528857-25357-2-git-send-email-sanm@codeaurora.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 23, 2020 at 11:57:36PM +0530, Sandeep Maheswaram wrote:
> Add interconnect support in dwc3-qcom driver to vote for bus
> bandwidth.
> 
> This requires for two different paths - from USB to
> DDR. The other is from APPS to USB.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
