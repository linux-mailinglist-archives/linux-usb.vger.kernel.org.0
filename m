Return-Path: <linux-usb+bounces-3709-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D721803E64
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 20:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 761641C20AD2
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 19:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25B131745;
	Mon,  4 Dec 2023 19:29:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622EFB4;
	Mon,  4 Dec 2023 11:29:20 -0800 (PST)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6d8162ca490so1650953a34.0;
        Mon, 04 Dec 2023 11:29:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701718159; x=1702322959;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dopADZSIY9NvRsKkblZeS2auQY53LOm32GMeI4jM0II=;
        b=Ls+YgdG2FgVFE9omgBravK7YNQ9whf4Iot7itEgO60G08W0twQDRCp3t2rdVqAfBre
         o4T9NUcbIZiQ/7HjaEaI3sZZoc0LexCT+S+e8NJ9T40SGX1aMxCu2Ssi+gfHkyeAThfc
         NfEzCcEX7LwAbn4C5aGl55tviH70J5+DzhGapkxsy7KNQN3b9ob7mTrl4jkWDvYwPKEF
         2br8l1DXr9pVjnTmMDB8ZSa3ITX1CgUTAHQihDDXhcGPs9ymiwU4UotsR8P2su0dzlWL
         AF8kVZ6nEiIXXHeRxtK+7YuU8vEcaoz/anIzKJZPx1M4mFT9YqC0R3+9qJJPnxyBgkmc
         MTjA==
X-Gm-Message-State: AOJu0Yw0BMfGM+IXWoEhivZJpYlz9qR89VrifleswXuqoM8brEF1xOrf
	Kt1W3RoJzYnEVG835+jMHA==
X-Google-Smtp-Source: AGHT+IFJY72gUYcS57mGE/6He5HTLRBqBfyrpRzdJyeRee5n4J2NROwezV41UeMAeby2CsBlJJbTIQ==
X-Received: by 2002:a9d:6f8e:0:b0:6d9:a17c:b1cc with SMTP id h14-20020a9d6f8e000000b006d9a17cb1ccmr106853otq.34.1701718159643;
        Mon, 04 Dec 2023 11:29:19 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ba29-20020a056830461d00b006d99dd7492csm752390otb.42.2023.12.04.11.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 11:29:18 -0800 (PST)
Received: (nullmailer pid 4304 invoked by uid 1000);
	Mon, 04 Dec 2023 19:29:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Kyle Tso <kyletso@google.com>
Cc: linux-kernel@vger.kernel.org, heikki.krogerus@linux.intel.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, badhri@google.com, linux@roeck-us.net, linux-usb@vger.kernel.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
In-Reply-To: <20231204172247.1087152-2-kyletso@google.com>
References: <20231204172247.1087152-1-kyletso@google.com>
 <20231204172247.1087152-2-kyletso@google.com>
Message-Id: <170171811110.4161.7711100964649237649.robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: connector: Add child nodes for
 multiple PD capabilities
Date: Mon, 04 Dec 2023 13:29:17 -0600


On Tue, 05 Dec 2023 01:22:46 +0800, Kyle Tso wrote:
> The realtime Power Delivery capabilities of a port may not be always the
> same under different hardware status such as the port usage of a
> multiple port system or the status of the battery pack. Define the PD
> capability sets in DT for better configurability in Type-C/PD port
> drivers.
> 
> Define an optional child node "capabilities" to contain multiple USB
> Power Delivery capabilities.
> 
> Define child nodes with pattern (e.g. caps-0, caps-1) under
> "capabilities". Each node contains PDO data of a selectable Power
> Delivery capability.
> 
> Also define common properties for source-pdos, sink-pdos, and
> op-sink-microwatt that can be referenced.
> 
> Signed-off-by: Kyle Tso <kyletso@google.com>
> ---
> v3 -> v4
>  - modified the structure of the bindings as corrected in v2
>  - modified the commit message to better describe the reason of this
>    change
> 
> .../bindings/connector/usb-connector.yaml     | 78 ++++++++++++-------
>  1 file changed, 49 insertions(+), 29 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/usb-connector.yaml: $defs:capabilities: 'anyOf' conditional failed, one must be fixed:
	'sink-pdos' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	hint: $defs entries must contain schemas
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/usb-connector.yaml: $defs:capabilities: 'anyOf' conditional failed, one must be fixed:
	'op-sink-microwatt' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	hint: $defs entries must contain schemas
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: tcpc:connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6370.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: tcpc:connector: Unevaluated properties are not allowed ('op-sink-microwatt', 'sink-pdos' were unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6370.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: tcpc: connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mt6370-tcpc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: tcpc: connector: Unevaluated properties are not allowed ('op-sink-microwatt', 'sink-pdos' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mt6370-tcpc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6360.example.dtb: pmic@34: tcpc:connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6360.example.dtb: tcpc: connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mt6360-tcpc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6360.example.dtb: connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.example.dtb: mt6360@34: tcpc:connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.example.dtb: tcpc: connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mt6360-tcpc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.example.dtb: connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/nxp,ptn5110.example.dtb: tcpci@50: connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/nxp,ptn5110.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/nxp,ptn5110.example.dtb: tcpci@50: connector: Unevaluated properties are not allowed ('op-sink-microwatt', 'sink-pdos' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/nxp,ptn5110.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/nxp,ptn5110.example.dtb: connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/maxim,max33359.example.dtb: maxtcpc@25: connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/maxim,max33359.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/maxim,max33359.example.dtb: connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/richtek,rt1711h.example.dtb: rt1711h@4e: connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/richtek,rt1711h.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/richtek,rt1711h.example.dtb: connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,pmic-typec.example.dtb: typec@1500: connector: 'source-pdos' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/qcom,pmic-typec.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,pmic-typec.example.dtb: connector: 'source-pdos' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/fcs,fusb302.example.dtb: typec-portc@54: connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/fcs,fusb302.example.dtb: typec-portc@54: connector: Unevaluated properties are not allowed ('op-sink-microwatt', 'sink-pdos' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/fcs,fusb302.example.dtb: connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/usb-connector.example.dtb: connector: 'op-sink-microwatt', 'sink-pdos', 'source-pdos' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231204172247.1087152-2-kyletso@google.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


