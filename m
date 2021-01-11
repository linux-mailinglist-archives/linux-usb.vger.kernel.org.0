Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5FF2F1CB4
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 18:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389706AbhAKRlw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 12:41:52 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:44300 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387515AbhAKRlw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 12:41:52 -0500
Received: by mail-oi1-f175.google.com with SMTP id d189so114805oig.11;
        Mon, 11 Jan 2021 09:41:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=NrJ0x/AGrMcXXrck2Rvzbb1jDWMqSZzFStoZ2toCiOw=;
        b=ft+9J7P7PMCpmKT530hiKmPlBzjPx8itXGsDFL2jxhBPBAjO4D5IvCARi6pU2+9vRD
         Wng6d2RppDzUxcFpLHsCoe3C/+ZaJPDmIPmknd5mNlpxmKNvJOnoEhbsKkf+yOKH9sVe
         sIv2FXcmBsVLmDttpa0UeLzQqn/veoglztf88lCc3JKvkVAjPrDsU8xxrmxBvGy6/Wkk
         74NhV89caFP8cKVCGK421aRjupILG69XKjD78gFiy3MiSmo0PxpDYJsScUFZzpnXQaEx
         uKtFN2yoDMtSgeAYK4BXCncdF22ZnLQeQObwctdyNTnUsHWktLPMbBtB0cQiJ6lD8QTT
         Y38Q==
X-Gm-Message-State: AOAM530oC+cFLtywT/A3FboLIEeuYkwCX5Mi5q5K28Rk2t1IaQrdcMx+
        sp7Rm6z1GQsfQHGpg0Y42w==
X-Google-Smtp-Source: ABdhPJzmJ1Be331ZHyQyTPvnWp3f9WF7yrDuRybQKhWKiKKxit9hJYoA0AVWNvs5xVnI+mTtMvTgzQ==
X-Received: by 2002:aca:53ca:: with SMTP id h193mr323974oib.122.1610386871786;
        Mon, 11 Jan 2021 09:41:11 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 126sm32398oop.30.2021.01.11.09.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 09:41:10 -0800 (PST)
Received: (nullmailer pid 2784733 invoked by uid 1000);
        Mon, 11 Jan 2021 17:41:09 -0000
From:   Rob Herring <robh@kernel.org>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Minas Harutyunyan <hminas@synopsys.com>
In-Reply-To: <20210111151337.5643-2-s.hauer@pengutronix.de>
References: <20210111151337.5643-1-s.hauer@pengutronix.de> <20210111151337.5643-2-s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: usb: dwc2: Add support for additional clock
Date:   Mon, 11 Jan 2021 11:41:09 -0600
Message-Id: <1610386869.406608.2784732.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 11 Jan 2021 16:13:36 +0100, Sascha Hauer wrote:
> This adds support for an additional clock for the dwc2 core in case
> there is another clock to the phy which must be enabled.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ff400000: clocks: [[4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/dwc2.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ff400000: clock-names: ['otg'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/dwc2.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/dwc2.example.dt.yaml: usb@101c0000: clocks: [[4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/dwc2.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/dwc2.example.dt.yaml: usb@101c0000: clock-names: ['otg'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/dwc2.yaml

See https://patchwork.ozlabs.org/patch/1424674

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

