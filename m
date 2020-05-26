Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAEFA1A1A5D
	for <lists+linux-usb@lfdr.de>; Wed,  8 Apr 2020 05:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgDHDom (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Apr 2020 23:44:42 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:40869 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgDHDom (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Apr 2020 23:44:42 -0400
Received: by mail-pj1-f67.google.com with SMTP id kx8so621633pjb.5
        for <linux-usb@vger.kernel.org>; Tue, 07 Apr 2020 20:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=BzBmeI/2TnvgURdgTABEkjKL9/ialW7wsv/kuNaKakA=;
        b=cGdfvCYsVTYxdFyvtiXyIUlrFfObaztauRe3y/MycYs1/0a4yzZQkvLj2gMGO/oJLG
         cI5tiz9wX1t32F8YZrUnWcyRbc/VAAS6A3lqm0h4AgqfKIXkwGrQDBXWh24nWgD2H8MT
         crVAMDTZV6iegCwW+7mGbWAKqIisl+TZMYfY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=BzBmeI/2TnvgURdgTABEkjKL9/ialW7wsv/kuNaKakA=;
        b=oNYMBVhorzAuy50yL7GOpFjO50svlaa+RM9Hu7z9JouWfB1OTSFWcyFTFo0FqO0yGm
         7J7ucjOUeBeCSGbNZcvdinJoEjMCkYvDTy7Vb+vsrmDHxDnRUR0FWm3MEAbdg8DCcg3H
         9gVVPaP5gymaW1RNfBSUhhT8uv8EdRNYkkJ3VoV4AufUFZ0OJhZ1+HlHWi+//CV7aJaB
         Vi0d62YGYy8bgwpdgjqAp/XIfLl32BzSzeG6p1shDzV7mW375kdz9WMQtj/Uj8E3QA3R
         q+xhakJkhmduKYlUTYmfHubV9gcBxBusm3Y/E2jTPzkCA44Wmzn872L+3p/JMKLJppE5
         CZ4A==
X-Gm-Message-State: AGi0PuazwLGJPxZsRNVSdAL+vkIB7zhSKESPzP/GOTQR1WRQJfMBQedH
        mm8uTfMEvJKWy1QYXhe1D6LPMw==
X-Google-Smtp-Source: APiQypKVwi323LzTzw+HouaYR3BrsPsn1TvXuEQQpUiatRIng2+CnAZh9u5B5FgbMx5pGkeVKVZMdg==
X-Received: by 2002:a17:90a:fa08:: with SMTP id cm8mr2893321pjb.144.1586317481187;
        Tue, 07 Apr 2020 20:44:41 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 25sm3001948pjg.35.2020.04.07.20.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 20:44:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585206368-685-2-git-send-email-sanm@codeaurora.org>
References: <1585206368-685-1-git-send-email-sanm@codeaurora.org> <1585206368-685-2-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Tue, 07 Apr 2020 20:44:39 -0700
Message-ID: <158631747937.216820.504748426462367724@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Sandeep Maheswaram (2020-03-26 00:06:07)
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Docum=
entation/devicetree/bindings/usb/qcom,dwc3.yaml
> new file mode 100644
> index 0000000..0f69475
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
[...]
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: The interrupt that is asserted
> +          when a wakeup event is received on USB2 bus.
> +      - description: The interrupt that is asserted
> +          when a wakeup event is received on USB3 bus.
> +      - description: Wakeup event on DM line.
> +      - description: Wakeup event on DP line.

I can see that it was optional before but that still doesn't make sense
to me. The glue hardware from qcom always has interrupts so I'd expect
it to be required in the binding.
