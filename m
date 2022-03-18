Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8075D4DDBD2
	for <lists+linux-usb@lfdr.de>; Fri, 18 Mar 2022 15:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237320AbiCROl4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Mar 2022 10:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233187AbiCROlz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Mar 2022 10:41:55 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ADD572E1B
        for <linux-usb@vger.kernel.org>; Fri, 18 Mar 2022 07:40:37 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C46973F164
        for <linux-usb@vger.kernel.org>; Fri, 18 Mar 2022 14:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647614435;
        bh=gDon0BP3FzcU+qjKqb9PY/sKgV2QZa/bB8WMrT1T2lk=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=vZqDOVcU9oHKpC7mh0YmfA7OD79BUMjFzbFTacR3lU+XuVzn3Xfdb4YNxHiuZwcNu
         jZjER5ztdWAjS6vMwyxgM/n/F4FBYBDrKOBcpek2+PjcgRSvCfhDnZxpSxfVrxsIEM
         2Vz7z1TRW+9Rs63/FwRINH/QyOptpjAXXjzgZdYfTgIOJ4Tvx5RdiaUKKpQpCMR9+j
         FN5BAzAgdmG88GZD7UPLC4qTdDHJdbkUHCHn10BfZei1tBNL8TAqOZxTLjT2V0mpp4
         CZEzLvTRP/rXMwM1ffeKI4T5skLCQur/seOnLQioLFmmonsodff/Qv5UMuVnTpgVEs
         uSr5Y2AuAL5Jg==
Received: by mail-lj1-f198.google.com with SMTP id n9-20020a2e82c9000000b002435af2e8b9so3484531ljh.20
        for <linux-usb@vger.kernel.org>; Fri, 18 Mar 2022 07:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gDon0BP3FzcU+qjKqb9PY/sKgV2QZa/bB8WMrT1T2lk=;
        b=5+k13/6gaFUJyklBqv7ho55fnQCyQyRgERCnqXzzrahyGQv9EzRwSIymfO1b4Fkyr6
         BcvTF/HqrZYjUQbV6h2cMw43/GUoXLETvkrc8tMCIIBS/QqzLONo+HCZO5aiwTq+sIlW
         2dRan86edHHwXwg4bANngEr3cp+kYOz7cuGm6oP8RZ6fAIKpH2YNfFQd9d7dZoEFJnpJ
         u4tANgVjy0m6MHniZ4lf92+jSpfBB1VHxTmvGmvCLAPZaZGZoqr9uFPD0oR2jbGzcXMb
         /mdoOgce0DQ0x5tuWsZfnm7xa4kiHiPaVwHhzkb0Zh1FZx15pOQN8F9tVbhElz/6X5/j
         ro7A==
X-Gm-Message-State: AOAM53394ohoW0b0juXfmu/D6qJTbr4ATZFsUdBEKKDbb2jkroO65Vjk
        9SQbgAPQ6B/Ci0s7l19zBzAVDqfo/3YcvvhcEgHjH9i/Nofe3K2r6In/24V3+f/i9qhwx6sak8g
        Pnocf/MmTq261zIIwtNbpXsmdjXwUYbhZo3SzIA==
X-Received: by 2002:a05:6512:2610:b0:448:27fc:a6ab with SMTP id bt16-20020a056512261000b0044827fca6abmr6165522lfb.117.1647614435203;
        Fri, 18 Mar 2022 07:40:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzge1+OMU6oDjlVzk/K5ztKRa1o5Wtl86/+yFtWC5zCXPcuXzvKr5+rXPtTdCr+kyJEgBjKCw==
X-Received: by 2002:a05:6512:2610:b0:448:27fc:a6ab with SMTP id bt16-20020a056512261000b0044827fca6abmr6165518lfb.117.1647614435027;
        Fri, 18 Mar 2022 07:40:35 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id p41-20020a05651213a900b00443fac7d6ffsm876979lfa.108.2022.03.18.07.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 07:40:34 -0700 (PDT)
Date:   Fri, 18 Mar 2022 15:40:31 +0100
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     hminas@synopsys.com, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc2: add compatible
 "intel,socfpga-agilex-hsotg"
Message-ID: <20220318144031.ap75e5sjk5fa6ghv@krzk-bin>
References: <20220125161821.1951906-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220125161821.1951906-1-dinguyen@kernel.org>
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 25, 2022 at 10:18:19AM -0600, Dinh Nguyen wrote:
> Add the compatible "intel,socfpga-agilex-hsotg" to the DWC2
> implementation, because the Agilex DWC2 implementation does not support
> clock gating.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
> index f00867ebc147..481aaa09f3f2 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
> @@ -53,6 +53,7 @@ properties:
>            - const: st,stm32mp15-hsotg
>            - const: snps,dwc2
>        - const: samsung,s3c6400-hsotg
> +      - const: intel,socfpga-agilex-hsotg

This is confusing and wrong. Now the intel,socfpga-agilex-hsotg is
mentioned twice - with and without snps,dwc2. The DTS change in this
patchset added usage with snps,dwc2. The commit msg says it's
different, but is the difference incompatible?

Please clarify the AgileX HSOTG - is it compatible with snps,dwc2 or
not? Based on this the patch might need to be reverted (or changed).

Best regards,
Krzysztof

