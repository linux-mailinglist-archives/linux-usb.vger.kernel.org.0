Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9770548B093
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jan 2022 16:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245712AbiAKPOw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jan 2022 10:14:52 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:45763 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244280AbiAKPOv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jan 2022 10:14:51 -0500
Received: by mail-oi1-f169.google.com with SMTP id t9so1383053oie.12;
        Tue, 11 Jan 2022 07:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=bcGrFSAXxwfGskczkH6gijFMvEO0njTC3BOc/X7ZloM=;
        b=2UIbpzaPof71Mf/8aAB6c5A6pq/c43khv4JV8EpMAwBmzTEgxl+KYsUssp/lp3GHD6
         ApYg/Q5mAuyBu+3Bqk7mui0KTkhaJ2ZeTDtyTMhmfxJUXAB3CsH8m/Lrjf/wW2t4PG+O
         Yp3z9ileHW3L9ME2LrQNfBEoMDhJVMcGnz1vbxVo2aShlEbgPL7okpuW68Z/2fX7wT7i
         7vU6NJUkH1DzmaAxR0dT/qJp3SqpEzDsaCtUh8ua7AFUb07Xb8Z6DP80V2VjoO88VCKv
         1vPSVpHF2SBE/pX6F2z4q0pjZvQ3uC2jrsNYNcn9eLvtUFE3ZAGoz/MQEKjEatAn/76w
         aCQg==
X-Gm-Message-State: AOAM533B5pS1ZPSTJ8nhTBnW0YfPQz5VVaYW+Ivgkn4g6QtEdi3B87m2
        mBe1lGBuB9YiRwt5cLRx5A==
X-Google-Smtp-Source: ABdhPJyjFzVg80hKzYs1GmsS6KQ4z0VcuPctUq9N0K8v1CaG8wmL3iMqAqnyxCMXD0O1GlVPgq3W8Q==
X-Received: by 2002:a05:6808:1246:: with SMTP id o6mr2110324oiv.73.1641914090997;
        Tue, 11 Jan 2022 07:14:50 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z188sm222106ooa.8.2022.01.11.07.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 07:14:50 -0800 (PST)
Received: (nullmailer pid 2944753 invoked by uid 1000);
        Tue, 11 Jan 2022 15:14:49 -0000
From:   Rob Herring <robh@kernel.org>
To:     Robert Hancock <robert.hancock@calian.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        michal.simek@xilinx.com, Thinh.Nguyen@synopsys.com,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        balbi@kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
In-Reply-To: <20220110201936.1371891-4-robert.hancock@calian.com>
References: <20220110201936.1371891-1-robert.hancock@calian.com> <20220110201936.1371891-4-robert.hancock@calian.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: usb: dwc3: add reference clock period fractional adjustment
Date:   Tue, 11 Jan 2022 09:14:49 -0600
Message-Id: <1641914089.158670.2944752.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 10 Jan 2022 14:19:34 -0600, Robert Hancock wrote:
> Document the new snps,ref-clock-fladj property which can be used to set
> the fractional portion of the reference clock period.
> 
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
schemas/usb/snps,dwc3.yaml: ignoring, error in schema: properties: snps,ref-clock-fladj
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml: properties:snps,ref-clock-fladj: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('minimum', 'maximum' were unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml: properties:snps,ref-clock-fladj: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml: properties:snps,ref-clock-fladj: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml: ignoring, error in schema: properties: snps,ref-clock-fladj
make[1]: *** Deleting file 'Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml'
schemas/usb/snps,dwc3.yaml: ignoring, error in schema: properties: snps,ref-clock-fladj
Traceback (most recent call last):
  File "/usr/local/bin/dt-validate", line 170, in <module>
    sg.check_trees(filename, testtree)
  File "/usr/local/bin/dt-validate", line 119, in check_trees
    self.check_subtree(dt, subtree, False, "/", "/", filename)
  File "/usr/local/bin/dt-validate", line 110, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/bin/dt-validate", line 110, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/bin/dt-validate", line 110, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/bin/dt-validate", line 105, in check_subtree
    self.check_node(tree, subtree, disabled, nodename, fullname, filename)
  File "/usr/local/bin/dt-validate", line 49, in check_node
    errors = sorted(dtschema.DTValidator(schema).iter_errors(node), key=lambda e: e.linecol)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 768, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 226, in iter_errors
    for error in errors:
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/_validators.py", line 25, in patternProperties
    yield from validator.descend(
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 242, in descend
    for error in self.evolve(schema=schema).iter_errors(instance):
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 768, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 226, in iter_errors
    for error in errors:
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/_validators.py", line 298, in ref
    yield from validator.descend(instance, resolved)
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 242, in descend
    for error in self.evolve(schema=schema).iter_errors(instance):
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 768, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 216, in iter_errors
    scope = id_of(_schema)
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 93, in _id_of
    return schema.get("$id", "")
AttributeError: 'NoneType' object has no attribute 'get'
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** Deleting file 'Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.example.dt.yaml'
schemas/usb/snps,dwc3.yaml: ignoring, error in schema: properties: snps,ref-clock-fladj
Traceback (most recent call last):
  File "/usr/local/bin/dt-validate", line 170, in <module>
    sg.check_trees(filename, testtree)
  File "/usr/local/bin/dt-validate", line 119, in check_trees
    self.check_subtree(dt, subtree, False, "/", "/", filename)
  File "/usr/local/bin/dt-validate", line 110, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/bin/dt-validate", line 110, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/bin/dt-validate", line 105, in check_subtree
    self.check_node(tree, subtree, disabled, nodename, fullname, filename)
  File "/usr/local/bin/dt-validate", line 49, in check_node
    errors = sorted(dtschema.DTValidator(schema).iter_errors(node), key=lambda e: e.linecol)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 768, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 226, in iter_errors
    for error in errors:
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/_validators.py", line 25, in patternProperties
    yield from validator.descend(
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 242, in descend
    for error in self.evolve(schema=schema).iter_errors(instance):
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 768, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 226, in iter_errors
    for error in errors:
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/_validators.py", line 298, in ref
    yield from validator.descend(instance, resolved)
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 242, in descend
    for error in self.evolve(schema=schema).iter_errors(instance):
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 768, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 216, in iter_errors
    scope = id_of(_schema)
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 93, in _id_of
    return schema.get("$id", "")
AttributeError: 'NoneType' object has no attribute 'get'
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.example.dt.yaml] Error 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/usb/intel,keembay-dwc3.example.dt.yaml'
schemas/usb/snps,dwc3.yaml: ignoring, error in schema: properties: snps,ref-clock-fladj
Traceback (most recent call last):
  File "/usr/local/bin/dt-validate", line 170, in <module>
    sg.check_trees(filename, testtree)
  File "/usr/local/bin/dt-validate", line 119, in check_trees
    self.check_subtree(dt, subtree, False, "/", "/", filename)
  File "/usr/local/bin/dt-validate", line 110, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/bin/dt-validate", line 110, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/bin/dt-validate", line 105, in check_subtree
    self.check_node(tree, subtree, disabled, nodename, fullname, filename)
  File "/usr/local/bin/dt-validate", line 49, in check_node
    errors = sorted(dtschema.DTValidator(schema).iter_errors(node), key=lambda e: e.linecol)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 768, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 226, in iter_errors
    for error in errors:
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/_validators.py", line 25, in patternProperties
    yield from validator.descend(
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 242, in descend
    for error in self.evolve(schema=schema).iter_errors(instance):
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 768, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 226, in iter_errors
    for error in errors:
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/_validators.py", line 298, in ref
    yield from validator.descend(instance, resolved)
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 242, in descend
    for error in self.evolve(schema=schema).iter_errors(instance):
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 768, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 216, in iter_errors
    scope = id_of(_schema)
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 93, in _id_of
    return schema.get("$id", "")
AttributeError: 'NoneType' object has no attribute 'get'
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/usb/intel,keembay-dwc3.example.dt.yaml] Error 1
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1578106

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

