Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B13E49D515
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 23:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbiAZWLL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 17:11:11 -0500
Received: from mail-oo1-f45.google.com ([209.85.161.45]:34415 "EHLO
        mail-oo1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233015AbiAZWLD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 17:11:03 -0500
Received: by mail-oo1-f45.google.com with SMTP id k23-20020a4abd97000000b002ebc94445a0so243205oop.1;
        Wed, 26 Jan 2022 14:11:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=PyoxfZGTJHnSSgja7CgCHJDWwlWV6zGYhZibK9aIenY=;
        b=vRgSC0IrBjsmE9wdBFJYHGTmL264Az0Cm48CY5Aq695fy9rqRfZAab7kxJ/Kb28Roh
         Z5aWsLloNaA1XKWFBbuxH6pjjb+tw6MYX5IchaZK1MbuQSp693LulpUNhSbqMhUMduUX
         3bk7r2alcluFuCmIWaFjAZzKYEk2zd9RuCs4M5YTzRZB9cks+fqxYbrzqzji0RfBHC46
         nAWpnfpHDeBVaONZxEwSZ2W1malMfu9btxF0oZtsR5AUa7EFpla5ZBX8Fd0e+mGi8a+R
         yQFgMBGjLfGPLzcdYpulVJFWlcOUfHwytNJs/ScRF0rsUIdDyGPYGgxcgCpVN5+qlslO
         jY5A==
X-Gm-Message-State: AOAM531CCvxmEL3iFaYjP6bd91mW6r0AfScjkIA5CAEPwU6A+3gWjMtF
        HpkTAjReS3UyCDnz86EZzg==
X-Google-Smtp-Source: ABdhPJz/Dilkw/1wtEGnhJWvZgCXyXppDcjnrxL3IwFlEu/b4Xc7usNrXLHH6TbDkqFGOjkBI0aYSw==
X-Received: by 2002:a05:6820:353:: with SMTP id m19mr600954ooe.36.1643235063236;
        Wed, 26 Jan 2022 14:11:03 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s12sm3808628ooi.46.2022.01.26.14.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 14:11:02 -0800 (PST)
Received: (nullmailer pid 1535104 invoked by uid 1000);
        Wed, 26 Jan 2022 22:10:52 -0000
From:   Rob Herring <robh@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-usb@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20220126141340.234125-3-alexander.stein@ew.tq-group.com>
References: <20220126141340.234125-1-alexander.stein@ew.tq-group.com> <20220126141340.234125-3-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: usb: dwc3-imx8mp: Add imx8mp specific flags
Date:   Wed, 26 Jan 2022 16:10:52 -0600
Message-Id: <1643235052.902207.1535103.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 26 Jan 2022 15:13:38 +0100, Alexander Stein wrote:
> This adds bindings for features in the USB glue block. They allow
> setting polarity of PWR and OC as well as disabling port power control.
> Also permanently attached can be annotated as well.
> Additional IO address and clock are needed.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../bindings/usb/fsl,imx8mp-dwc3.yaml         | 31 ++++++++++++++++---
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1584490


usb@32f10100: reg: [[854655232, 8]] is too short
	arch/arm64/boot/dts/freescale/imx8mp-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dt.yaml

usb@32f10108: reg: [[854655240, 8]] is too short
	arch/arm64/boot/dts/freescale/imx8mp-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dt.yaml

