Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A612A310D
	for <lists+linux-usb@lfdr.de>; Mon,  2 Nov 2020 18:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbgKBRNj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Nov 2020 12:13:39 -0500
Received: from mail-oo1-f65.google.com ([209.85.161.65]:42008 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgKBRNj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Nov 2020 12:13:39 -0500
Received: by mail-oo1-f65.google.com with SMTP id l26so3520126oop.9;
        Mon, 02 Nov 2020 09:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i+30Ilqq3pmYLOSYWMPfKNer8N4KvZKxWGyZKD8fipQ=;
        b=HejEaO2A3/2ivhRNYie8DE1YAmDzPHAW8Xhz403Pc2Vk1rWY6OIbjzff0vqnFwAPdZ
         h97u7w6yysSnveQ9wH7OOm0Hd+7J8G+sgeQY998yaTgfX8hHw8NR6RVFFwHWjm+g+2nD
         VXNScC8QCcDggOMOgJWCaD7QbhexdV8Y3EJjHWlR2hOlleMh46IjMVHdiUu0rR0VZncI
         ZzKljjOZsfmmR4eCv6W0WJB+8Gi0YLgzEB+59CqbvPVoepFqY6UJe0p8kSOMELLCK4OP
         blfXSMtSwkpqgvGNfFGyAx2ENAemXHpxOIOL7uSfyKuiXv32BGDZrvfS7/8OtGtt7ea2
         u1zQ==
X-Gm-Message-State: AOAM531qRPeIbiIOYUQusvaCofpba4mjlgEnTS6q5QM9XplbpXaEMK2i
        z15Y9hsA6jKcXSjv8o9tEA==
X-Google-Smtp-Source: ABdhPJxMDoUhHq4EtyozCmMt0xRbdbn+OLQuLou42qEPlJ0+IydmMwVY5Xxyq3mGT6ue/q+4kVI1dg==
X-Received: by 2002:a4a:e40b:: with SMTP id t11mr12708294oov.43.1604337218677;
        Mon, 02 Nov 2020 09:13:38 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f18sm3574206oos.19.2020.11.02.09.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 09:13:37 -0800 (PST)
Received: (nullmailer pid 4062102 invoked by uid 1000);
        Mon, 02 Nov 2020 17:13:36 -0000
Date:   Mon, 2 Nov 2020 11:13:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        jun.li@nxp.com, robh+dt@kernel.org, pawell@cadence.com,
        linux-imx@nxp.com, rogerq@ti.com
Subject: Re: [PATCH v2 1/1] doc: dt-binding: cdns,usb3: add wakeup-irq
Message-ID: <20201102171336.GA4061592@bogus>
References: <20201030230752.2950-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030230752.2950-1-peter.chen@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 31 Oct 2020 07:07:52 +0800, Peter Chen wrote:
> To support low power mode for controller, the driver needs wakeup-irq
> to reflect the signal changing after controller is stopped, and waking
> the controller up accordingly.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> Changes for v2:
> - Add "minItems: 3" to make wakeup irq optional
> 
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/usb/cdns,usb3.yaml:34:56: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 850, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: mapping values are not allowed in this context
  in "<unicode string>", line 34, column 56
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/usb/cdns,usb3.example.dts] Error 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/usb/cdns,usb3.example.dts'
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1391361

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

