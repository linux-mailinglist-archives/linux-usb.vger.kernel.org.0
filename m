Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD763CBC84
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jul 2021 21:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbhGPTau (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Jul 2021 15:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbhGPTat (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Jul 2021 15:30:49 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFCDC061760
        for <linux-usb@vger.kernel.org>; Fri, 16 Jul 2021 12:27:54 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id s2-20020a0568301e02b02904ce2c1a843eso462666otr.13
        for <linux-usb@vger.kernel.org>; Fri, 16 Jul 2021 12:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=WvfR1EWSjDcJ24IvuaATgTh4IU7RndSDBvf6tZ6dESk=;
        b=ZGYrMn2K0Zen2/chitsaSiJybVqzxLtV7eGnqeJEXBnSeiFR4Eoowli7W6TIDTjT66
         px1T2IThviECAxK3vJhbUqdEwZPgaFL4sVn43I6UeG9M4ILbA3leE+/BFILEKqjaXdH9
         Gb+9juv4u4OUVaWRtRpyeCOYSh7WA9v88d8C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=WvfR1EWSjDcJ24IvuaATgTh4IU7RndSDBvf6tZ6dESk=;
        b=Gjo+QT7QFRjVhfz7W5RlO0H7JFybfKXK9kBfb1HOIx9GvxNy4PyTpilG91MG6/eVhh
         n/4k+8bB8sKpdCku6DTmn9bIXdR1NafYWl0DrM0Ym5Z90mlpMPuSHXPYqP1Qhr3NObC0
         ffaAxLxTp4Qf3EagHJWSBfqHnM/wSdd00MQyeIFEHiy4C7gvx0s1BezKuP+90fsFEzmJ
         A1tX10kZgUaouiXh18A+DcCLHdCxcDdz4Q5A56EKYLLhnrGcqzAGfDlkoupX63ZIB043
         onI7n+E8qFgQcu59Zr8bHDaMUQzOVmgxYuShUFufBVRF6koz/QGCmBihzeW+obriZnlH
         7lZA==
X-Gm-Message-State: AOAM532arQQwMI8Bf4RYnwFMc3yB/IfAI45aLG1o7QXLEFTOqS6mhDhq
        SGzgCAbwbE1SfR6hfWTaGVSw34jD4I2X9mHfh5RlKw==
X-Google-Smtp-Source: ABdhPJybePdTQVheSU7I4BGrZN5KWLlkqMofOQCp3PADsNt5bK8OYflJN4jUdORZRMfwv2tvQMtdZYqRafi3L6wNdqA=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr9472592otf.25.1626463674176;
 Fri, 16 Jul 2021 12:27:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Jul 2021 21:27:53 +0200
MIME-Version: 1.0
In-Reply-To: <1626443927-32028-2-git-send-email-pmaliset@codeaurora.org>
References: <1626443927-32028-1-git-send-email-pmaliset@codeaurora.org> <1626443927-32028-2-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 16 Jul 2021 21:27:53 +0200
Message-ID: <CAE-0n51g66F7A7Kuz+GQwnYfEX_BXKQR7YD=4PhJAEGkBu6AsQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: pci: qcom: Document PCIe bindings for SC720
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org, svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Prasad Malisetty (2021-07-16 06:58:44)
> Document the PCIe DT bindings for SC7280 SoC.The PCIe IP is similar
> to the one used on SM8250. Add the compatible for SC7280.
>
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Any chance this file can be converted to YAML?
