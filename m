Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00D3E425A37
	for <lists+linux-usb@lfdr.de>; Thu,  7 Oct 2021 20:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243432AbhJGSD3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Oct 2021 14:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243414AbhJGSD2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Oct 2021 14:03:28 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C94EC061755
        for <linux-usb@vger.kernel.org>; Thu,  7 Oct 2021 11:01:34 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id y201so10164895oie.3
        for <linux-usb@vger.kernel.org>; Thu, 07 Oct 2021 11:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=l/jHmdsNTaCbqb/3iY1ubX++haNMV1LDyfyVcpuyCNU=;
        b=gMIpgNRcHWiBlfWidWRVcnFOODsqVojhqfmUWh0slCQPAeHdEEyceqbZIIIsxB2zNy
         nccHjL2bqqStmVVkYH72v8oJq3DyIFrAbUvhQ8DIsHfAIuKPJiHZmmFfVqmQ37R+Szpx
         TmXiymP/d//qpRYSvYziMFjajCB3JhlIy0sxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=l/jHmdsNTaCbqb/3iY1ubX++haNMV1LDyfyVcpuyCNU=;
        b=5DkhDm2pxKqL/LeR7SWJ0yFghcyRSgVecsGyXx4DL0QBhvcByzcLUxsfw7Y68x4Nss
         tbG14AoTUP+g268aJoHf+pZmiwbVxpX6y2n917RrDUnKxhpsqaUnmf0dhu6+SSgTSYLH
         uVzR+Ope1SyweAnIJB2J1cN+qiEhRmKMpWKK/YcD9g8Z3AWcBC4qW7oHjPFFfJD8EIPp
         VnnIN22XR4266xKT7RR406DIzoqWEIOYnFuaqW5jKoD/wD9c4rbGruy7KoyA8dIvC005
         San2jsvexicXLoe9YRjE+14+63WFyVUkm2atHZZ53WlAN6UQDpq7CkmT5rj1Oi3uXQts
         AgoA==
X-Gm-Message-State: AOAM533boyMHymmpL40Gp1Z5cq0rzUfEHJOvBgYaKnOZN8BA15IxwbAO
        t8jo6gbJ7i5lowuL+NX5WB0GqLBeUoqxX0sF0vyusA==
X-Google-Smtp-Source: ABdhPJzyJhAIMwWYX0j+dskBijdHRK2EqFvl+pGpjSoNbQ0EmOLi/qyKR7XkJBsTAK1+izQUXcpyDHtFQSZNmCiRpHE=
X-Received: by 2002:aca:f02:: with SMTP id 2mr4350822oip.64.1633629693863;
 Thu, 07 Oct 2021 11:01:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 14:01:33 -0400
MIME-Version: 1.0
In-Reply-To: <1633628923-25047-4-git-send-email-pmaliset@codeaurora.org>
References: <1633628923-25047-1-git-send-email-pmaliset@codeaurora.org> <1633628923-25047-4-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 7 Oct 2021 14:01:33 -0400
Message-ID: <CAE-0n53kd+eZpX1jv2U_uQe3res+s69uDnw0862yOqYzWO_JvA@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] arm64: dts: qcom: sc7280: Add PCIe nodes for IDP board
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org, svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org,
        linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Prasad Malisetty (2021-10-07 10:48:41)
> Enable PCIe controller and PHY for sc7280 IDP board.
> Add specific NVMe GPIO entries for SKU1 and SKU2 support.
>
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
