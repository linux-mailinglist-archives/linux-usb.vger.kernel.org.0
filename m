Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8185122364E
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jul 2020 09:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgGQHyz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 03:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbgGQHyy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jul 2020 03:54:54 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F71C08C5C0
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2020 00:54:54 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a14so5023975pfi.2
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2020 00:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uEOtVzALEOybmeb84SvDv2op2z0MYD8oWExMgtzeNfE=;
        b=KTA86zJnJDb4rjNHx0BQ/XeZrGINJUf7tpXs3v+tsbOyPUPV2FGjOkgwhg63KLfVSX
         xujyoPR46+x5mE9ZFEOQFZFj8RjvXNF+18LAg6w7lSDgILZiAjltXi5D59eBI27Rru1e
         eI8CS03LIVGPmEvBJWawxCE4fugAdqSbEjhQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uEOtVzALEOybmeb84SvDv2op2z0MYD8oWExMgtzeNfE=;
        b=dI0Y0CaFwRWbZgoN3t3CXkA3zr59HONfDehLYCMi+0VEAh3VYdiSyHW44Azxf4WWRF
         MQSb/jtynxBlj4yPJpWUm/1dRslqNab++fAuGhGdvlZa/Z4fmXlvNBA1hewJxco4HGtG
         iFTOUGs4Ja69XXPLe7wUtS0FYk0NS0UPtynY38RSJaosmp20GU8zQrKE9LQF3tFkfanc
         2Lz2SZ5VzXgiGMFcIHTeWbxhBvSMZwEZNu4bGsenldMmMWzyP6Nn1byejfqDKD6QjqQc
         pi0G+djXVnKZ80ueCFALnD8g/k8r+A3/5Bbzp2ko96mby2Dl7R/qkvE2fS1uI8/7y9Mb
         u+gQ==
X-Gm-Message-State: AOAM5307j2IyFfDA2MTeryKq7f86b6qv8UgGZBY1gPKqvOsMHH8Xiirw
        u9vap9GYe3wTqT9jSl6RwzQCHw==
X-Google-Smtp-Source: ABdhPJzk3ngbL+pgOeNTy5qxHQ1CNLPdpQwLSIrwagxwUcc1Om1v/gP5ZoR/qxuiZeTIq2HwMXVo7A==
X-Received: by 2002:a05:6a00:4c:: with SMTP id i12mr6783536pfk.71.1594972493663;
        Fri, 17 Jul 2020 00:54:53 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id m22sm7505577pfk.216.2020.07.17.00.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 00:54:53 -0700 (PDT)
Date:   Fri, 17 Jul 2020 00:54:52 -0700
From:   Prashant Malani <pmalani@chromium.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <treding@nvidia.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: update usb-c-connector required property
Message-ID: <20200717075452.GD68629@google.com>
References: <1594971274-48027-1-git-send-email-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594971274-48027-1-git-send-email-biju.das.jz@bp.renesas.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Biju,

On Fri, Jul 17, 2020 at 08:34:33AM +0100, Biju Das wrote:
> Some boards have a single SS capable connector. Update usb-c-connector
> bindings to list port@1 as at least one of the required property.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Ref: https://patchwork.kernel.org/patch/11129567/
> ---
>  Documentation/devicetree/bindings/connector/usb-connector.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 9bd52e6..41e0685 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -139,8 +139,11 @@ properties:
>          description: Sideband Use (SBU), present in USB-C. This describes the
>            alternate mode connection of which SBU is a part.
>  
> -    required:
> -      - port@0
> +    anyOf:
> +      - required:
> +        - port@0
> +      - required:
> +        - port@1

So the connector[1] doesn't have any High Speed (D+/D-) lanes? Those are
supposed to be present on all Type C connectors.

[1] : https://patchwork.kernel.org/patch/11129567/

Regards,

-Prashant
>  
>  required:
>    - compatible
> -- 
> 2.7.4
> 
