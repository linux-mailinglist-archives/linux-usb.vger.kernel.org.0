Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344D643BE80
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 02:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235511AbhJ0Ahl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 20:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233673AbhJ0Ahk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Oct 2021 20:37:40 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F232C061745
        for <linux-usb@vger.kernel.org>; Tue, 26 Oct 2021 17:35:16 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id r4-20020a4aa2c4000000b002b6f374cac9so345900ool.6
        for <linux-usb@vger.kernel.org>; Tue, 26 Oct 2021 17:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=4FClTT0c0lvTH4JvJKAi1wapScSyCR6IqIG1AROPiHc=;
        b=ZWTciEqzi5wtqjaGi+5y7xUDXMKQhz0uBfuDli4XelI0LC9YGT5GThcMlpmcVvaFr4
         nH7c7q8qIZcHfnQO5ZTwDF3FvO6x3kx660lAU0L2KZRWkJwI68GBUhURPzZGJIMcMZw5
         2TaLjLeSKlNwxzlEnOEgOC4M335FgM6rd4Yew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=4FClTT0c0lvTH4JvJKAi1wapScSyCR6IqIG1AROPiHc=;
        b=LhJdkyVGmMMVYRj5nJplCkBdfIV8VIMJbi6fMtYFdp1/eCD4hAlwThVlAnuweQmgT9
         WmxgEI1BELLlQ39qMkW5Dyb9nSloDu+rmHHc5Qm0QnftLN+dbhGdn7DRCHUGP0/5otdM
         R1laVfWjSX10Omv1MsjRsU611b4G0eQL7bxDmPhHqBEuFjaTOmuHEtS6PrrFiWBPy9Qp
         B4YeW9Gug8uHkfyM18NU65KlhXAs3iVLlizUg+woOiSYQ+hhORtQZTuH+aKwRBB7kbXa
         KXBIfxviKQPtGL+CuLavBi8farca8LhNqaJo8r0crjTPMpTfhq3B/6H0yaLFb8dTGFhK
         5IGw==
X-Gm-Message-State: AOAM530xT8BHb+OC4GVNCEHiQeMyoXJxOPHr74lbqqkUtwE9cE+Gq0GA
        fFznNABGBuX9xrmv0Rn3gcgwAfdrtNdsjxrPERixUaG9CAg=
X-Google-Smtp-Source: ABdhPJy6mMGiH/4mhV1zeYiLkU0FjIaPiTalCzJfDsWWHTrffDxp2XcIfSQ7in9s5qQrHRg8AfC/WoHwHRiEm5krydE=
X-Received: by 2002:a4a:e75a:: with SMTP id n26mr19787082oov.1.1635294914676;
 Tue, 26 Oct 2021 17:35:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Oct 2021 17:35:14 -0700
MIME-Version: 1.0
In-Reply-To: <1635272372-9982-2-git-send-email-quic_c_sanm@quicinc.com>
References: <1635272372-9982-1-git-send-email-quic_c_sanm@quicinc.com> <1635272372-9982-2-git-send-email-quic_c_sanm@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 26 Oct 2021 17:35:14 -0700
Message-ID: <CAE-0n50oV7rV1+9yoxciOpcB1FrtmC07Fp1U=QktxrOwtLtL7g@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: usb-xhci: Add bindings for
 usb-skip-phy-init property
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Sandeep Maheswaram (2021-10-26 11:19:30)
> Adding bindings for usb-skip-phy-init property.

Yes, but why?

>
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> index 965f87f..69a757b 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> @@ -25,6 +25,10 @@ properties:
>      description: Set if the controller has broken port disable mechanism
>      type: boolean
>
> +  usb-skip-phy-init:
> +    description: Set if the phy initiazation is managed by controller

s/initiazation/initialization/

> +    type: boolean
> +
>    imod-interval-ns:
>      description: Interrupt moderation interval
>      default: 5000
