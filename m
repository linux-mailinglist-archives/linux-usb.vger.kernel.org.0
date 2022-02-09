Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E104AE81A
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 05:07:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344203AbiBIEHi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 23:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345815AbiBIDT2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 22:19:28 -0500
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6101C0613CC;
        Tue,  8 Feb 2022 19:19:27 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id t199so1171378oie.10;
        Tue, 08 Feb 2022 19:19:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zEfWeTyIrXF6K6f3t0M7dKD502/QviWAkBZ2fePAE1g=;
        b=7bRR2ht8TBUaZcnJIyOQajS9cYO84nUaofCaL1t/Sy6ohREhOrpReabrf+EmOhl+Ty
         Dh1MBE7J+qWNf4PisK2V0HjdYH4c6qRfMOREGbvYqfJY9sfZUFkvgUNKixNnp5XWRmc7
         brjN4hvzkEBX5r3fhev43HByXsv2QRa6lwA2fCosaur7Btp+MlhCvaQwdMNozIDUfsbz
         qv3dtufigNAFmukTXcfccSI/jyGJHO359B0PHJ8FadTrB5zZDo6K5HtBNV+aVDOqjxM5
         A9oQDyGkQ63fYFlpYKR/ByS9t/vm/UpDJQh92mU8JG50YEQNKuslHY1BgtA62gGsGZ2D
         JTGQ==
X-Gm-Message-State: AOAM531E6dcSGZdxaq0tnRby56vLezwDqyKtWko8sX/e0vwNEIHWPrmo
        8rpaiFOV5Xk+pCmvSuZodw==
X-Google-Smtp-Source: ABdhPJx71nDfhbS6hPDqxJhnakyvaFctVvW4u7U91Mo9AgRmLk1TRWztpmSkVr0ptEcINukK1HHM1w==
X-Received: by 2002:a05:6808:a09:: with SMTP id n9mr467379oij.10.1644376766981;
        Tue, 08 Feb 2022 19:19:26 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n24sm6955027oao.40.2022.02.08.19.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 19:19:26 -0800 (PST)
Received: (nullmailer pid 3566021 invoked by uid 1000);
        Wed, 09 Feb 2022 03:19:25 -0000
Date:   Tue, 8 Feb 2022 21:19:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     hminas@synopsys.com, linux-usb@vger.kernel.org, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc2: add compatible
 "intel,socfpga-agilex-hsotg"
Message-ID: <YgMyvUdlNd1J7J6R@robh.at.kernel.org>
References: <20220125161821.1951906-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125161821.1951906-1-dinguyen@kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 25 Jan 2022 10:18:19 -0600, Dinh Nguyen wrote:
> Add the compatible "intel,socfpga-agilex-hsotg" to the DWC2
> implementation, because the Agilex DWC2 implementation does not support
> clock gating.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
