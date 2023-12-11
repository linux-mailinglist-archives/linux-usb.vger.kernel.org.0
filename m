Return-Path: <linux-usb+bounces-3961-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2961580C2ED
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 09:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0D751F21049
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 08:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45A120DC1;
	Mon, 11 Dec 2023 08:20:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 669A5E5;
	Mon, 11 Dec 2023 00:20:19 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6d9f7af8918so1846548a34.0;
        Mon, 11 Dec 2023 00:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702282818; x=1702887618;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X70dnLMW4EGZmNUCbaymENDJWJzKWVaikH9lFWWn4e4=;
        b=Ds36Cgr9i94aXhL7BXK821wmGrZKwu7oHliIQaS7n5ydCEcffuJCMy4+az+dhrToDN
         sPEVM12L6p5gtfqPMZJNyV3AadizAXeU+GesRM86elr6MdmIFK99GurxHWIgNa5a1l7C
         A76u7P+M64dBXFvjEKXK6mN+koV0YXT+hcUwRv6GvHELEGp5BZyIVOCtLA6EZqb/3OWU
         +3uYsgDnwk5EdZ23I13bVT93hJF1/GzTevSPFAV5i8RNYmi+/AsLhxa0Wb5GxF6IhMgm
         gEizcPIP+d6CiFz28Y5h5FC71bdLJtVQMgyamqc50gNLL5B78Y/SwfN80XkM/4H2+3eb
         0plw==
X-Gm-Message-State: AOJu0YwuiweHUIqo9UYCEf7daqQcrp/qUXKy02gGxvr17mW0BZxHGzh4
	pj5TD/KRc7EeByjuYdODBw==
X-Google-Smtp-Source: AGHT+IEpHlX5EqpS08UtKaozsgHbMxD/r857ExlfYfeaTrWUPThkSeZY78lbRo8zxUU4fvhZVeNUug==
X-Received: by 2002:a9d:68c6:0:b0:6da:c0d:90fb with SMTP id i6-20020a9d68c6000000b006da0c0d90fbmr1630420oto.6.1702282818598;
        Mon, 11 Dec 2023 00:20:18 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id en12-20020a056830488c00b006d9fcb44e00sm1119600otb.32.2023.12.11.00.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 00:20:18 -0800 (PST)
Received: (nullmailer pid 1310035 invoked by uid 1000);
	Mon, 11 Dec 2023 08:20:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Xinhu Wu <xinhu.wu@unisoc.com>
Cc: surong.pang@unisoc.com, zhang.lyra@gmail.com, bruce.chen@unisoc.com, heikki.krogerus@linux.intel.com, orsonzhai@gmail.com, xinhuwu.unisoc@gmail.com, baolin.wang@linux.alibaba.com, zhiyong.liu@unisoc.com, krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, teng.zhang1@unisoc.com, devicetree@vger.kernel.org, peak.yang@unisoc.com, gregkh@linuxfoundation.org, xingxing.luo@unisoc.com, conor+dt@kernel.org, robh+dt@kernel.org
In-Reply-To: <20231211074120.27958-3-xinhu.wu@unisoc.com>
References: <20231211074120.27958-1-xinhu.wu@unisoc.com>
 <20231211074120.27958-3-xinhu.wu@unisoc.com>
Message-Id: <170228281685.1310019.14783806901713791242.robh@kernel.org>
Subject: Re: [PATCH V2 2/2] dt-bindings: usb: Add an Spreadtrum pmic typec
 yaml
Date: Mon, 11 Dec 2023 02:20:16 -0600


On Mon, 11 Dec 2023 15:41:20 +0800, Xinhu Wu wrote:
> Add device tree binding Documentation details for
> Spreadtrum pmic typec driver
> 
> Signed-off-by: Xinhu Wu <xinhu.wu@unisoc.com>
> ---
>  .../bindings/usb/sprd,pmic_typec.yaml         | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/sprd,pmic_typec.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/usb/sprd,pmic_typec.yaml:28:18: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/usb/sprd,pmic_typec.example.dts'
Documentation/devicetree/bindings/usb/sprd,pmic_typec.yaml:28:18: mapping values are not allowed in this context
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/usb/sprd,pmic_typec.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/usb/sprd,pmic_typec.yaml:28:18: mapping values are not allowed in this context
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/sprd,pmic_typec.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1424: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231211074120.27958-3-xinhu.wu@unisoc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


