Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93A80737073
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jun 2023 17:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233706AbjFTP3e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jun 2023 11:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbjFTP3d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jun 2023 11:29:33 -0400
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EDB7A4;
        Tue, 20 Jun 2023 08:29:32 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-77e3a44dae3so106771139f.0;
        Tue, 20 Jun 2023 08:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687274972; x=1689866972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0Y4AXdrYa1tkgcQ1lVa5CHskB21PJWROqJlqjkg++Q=;
        b=K3CYPdblkstvpm6MhyMIETvSyU9G2ulAsG8Ee5Xcaxjy21DWqkTkPCkJOKWFXzy1ZK
         6JvBQnEaMFTjnfmPXB5fIFCJy0rVq4RG+LaRIg20AXrevH2FIc1bKPoQ7gZjPe+Baaz/
         EjXrIY4pOegQjJxzBlAJjx5S8Cg2LCo2tdG+xwa5ENPlPKm310qDtSYySddEQPbgDOCw
         Cd7Z5kIi/Hh9tktWRhz203m8aLH/LqiP6i8BJ9+/9BAQl5pAx4lWuHOVEbillXyl1iMz
         ltKCkrLkE8N9TNh3/l2XK5NRtPYrpFJRqmJkZuywb+wIhnKQyIqukdcnTGEqcFB4Qx87
         ld5A==
X-Gm-Message-State: AC+VfDy/oV9Y7FqWYE4FIXLDdcHwwpPY126A++7CbmS7ZjlWeykLQg+K
        YgGT++T6A6rlIaHmGhbO2g==
X-Google-Smtp-Source: ACHHUZ6gL073MhTgHznwvctgz7PH4XlTinCnhA+7jX2RzyBmntUSv1zhLIRGmqsTRuxbxCTVrW57kA==
X-Received: by 2002:a92:c14c:0:b0:342:299c:a2b7 with SMTP id b12-20020a92c14c000000b00342299ca2b7mr11147650ilh.23.1687274971825;
        Tue, 20 Jun 2023 08:29:31 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k17-20020a92c9d1000000b003317ebbc426sm671325ilq.47.2023.06.20.08.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:29:31 -0700 (PDT)
Received: (nullmailer pid 3628956 invoked by uid 1000);
        Tue, 20 Jun 2023 15:29:29 -0000
Date:   Tue, 20 Jun 2023 09:29:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        s.hauer@pengutronix.de, jun.li@nxp.com, conor+dt@kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, shawnguo@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        festevam@gmail.com, robh+dt@kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 2/2] dt-bindings: phy: mxs-usb-phy: add imx8ulp and
 imx8qm compatible
Message-ID: <168727496867.3628901.18310366051743547060.robh@kernel.org>
References: <20230613083445.1129137-1-xu.yang_2@nxp.com>
 <20230613083445.1129137-2-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613083445.1129137-2-xu.yang_2@nxp.com>
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


On Tue, 13 Jun 2023 16:34:45 +0800, Xu Yang wrote:
> The imx8ulp and imx8qm are compatible with imx8dxl. This will add such
> compatible.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - no change
> Changes in v3:
>  - no change
> Changes in v4:
>  - no change
> ---
>  Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

