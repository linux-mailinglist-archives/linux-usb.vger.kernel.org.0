Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53EA7727619
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 06:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234052AbjFHE04 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 00:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233860AbjFHE0x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 00:26:53 -0400
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 820B42704;
        Wed,  7 Jun 2023 21:26:50 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-33d37cc9d12so279695ab.2;
        Wed, 07 Jun 2023 21:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686198409; x=1688790409;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h+tB5ELcsjPnXMUJmycfD3kXBY74Sh5XYnDuw2D5xms=;
        b=b42mPbbzmdtK6RrA1OjXiVySVinjGuxmrjlDgF4paGQ7h5WqfB/pMkgNWE4/hf4Cl/
         sZ9LGQlOnGLksg03Ylwvxruf5gHoxcBpAJjWrVUexT1iMqz1i+Po+t1EU92qcKa3KKWt
         isLEZ4Ov9c9tZL0LTpVSA+ZL0YT0fZrujdLVmNcbkv6COctc5eXTAqM42LVbFKy58nOX
         b01k+tRb6wfpKqmmVzeiE7cuBP9wbFXdri1Zj2P4RzCf4VWcEhJUUbCY9C6eejRHhb5Z
         o/OwxQaPmDFx7Mb9PUArhE48CvLsRpcE1u+AVct45D33LMnw+bQDbo5nZu+X67LSrPIl
         WRWQ==
X-Gm-Message-State: AC+VfDwWrwz04Tasnem0DrkUb+nYM/0gzM5ySsC9EO25h2Fxfkl20lGg
        trVcTbN6frKacjj7d4DIUK67dJ1VDA==
X-Google-Smtp-Source: ACHHUZ6gA4SFsH3efdQTd7uj0JEG0W3GLfWPRCgaw9JidNmOXDlGHa56kVdQDQvb95Ji1SF4m8O2tA==
X-Received: by 2002:a92:c52d:0:b0:338:bcd8:933c with SMTP id m13-20020a92c52d000000b00338bcd8933cmr6943773ili.21.1686198409647;
        Wed, 07 Jun 2023 21:26:49 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id t14-20020a922c0e000000b0032c999af7ecsm179802ile.7.2023.06.07.21.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 21:26:48 -0700 (PDT)
Received: (nullmailer pid 769516 invoked by uid 1000);
        Thu, 08 Jun 2023 04:26:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     festevam@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        s.hauer@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, linux-arm-kernel@lists.infradead.org,
        shawnguo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <20230608033642.4097956-1-xu.yang_2@nxp.com>
References: <20230608033642.4097956-1-xu.yang_2@nxp.com>
Message-Id: <168619840676.769499.9945623918727485916.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: mxs-usb-phy: convert to DT
 schema format
Date:   Wed, 07 Jun 2023 22:26:46 -0600
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


On Thu, 08 Jun 2023 11:36:41 +0800, Xu Yang wrote:
> Convert the binding to DT schema format. Besides, this also add other
> optional properties not contained in txt file.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - change filename to fsl,mxs-usbphy.yaml
>  - add other optional properties
>  - narrow fsl,anatop to imx6
>  - use additionalProperties
> ---
>  .../bindings/phy/fsl,mxs-usbphy.yaml          | 128 ++++++++++++++++++
>  .../devicetree/bindings/phy/mxs-usb-phy.txt   |  33 -----
>  2 files changed, 128 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml:103:15: [warning] wrong indentation: expected 16 but found 14 (indentation)
./Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml:109:15: [warning] wrong indentation: expected 16 but found 14 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.example.dtb: usb-phy@20c9000: 'clocks' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230608033642.4097956-1-xu.yang_2@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

