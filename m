Return-Path: <linux-usb+bounces-3919-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8575E80A9C8
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 17:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B1F41F210D5
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 16:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343BF381CA;
	Fri,  8 Dec 2023 16:50:46 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9051419A5;
	Fri,  8 Dec 2023 08:50:42 -0800 (PST)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1fa37df6da8so1336962fac.2;
        Fri, 08 Dec 2023 08:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702054242; x=1702659042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zslPHJWELqvuPLVUnf5bfRnpwdPmFrFwYfLyXUQqu8g=;
        b=uvEijbN9IBz3v1SF8eFNgGdk2z8RXw+WUIu/KjreDrpGQl0tvDY87e6cRQZyDigSBK
         FVw6SYiacCjkNCysVMlyIg4awJR01lpFuFFJC1pQ9i24Z6QiTnP7hvFRsWiNko1ECSGL
         0BpyDKxCzef+79QKxPDk6ip0nEIfUS1xovJcSb9jtuC7Q2xXOYY2679P/hGZBpUC7Da7
         EuWoKWA2Ubh8odrIWuELr21IXMCAjsFxoITJO/63xgQtpShK8hr3nAtVUXg7mVicKf5G
         23Wb/CsWgSjKzFjhAk/H6GNzJrIPyoQSo4HLtSsG9qm8V9gibYNsLmNbQ5ugDcGktILA
         Qbfg==
X-Gm-Message-State: AOJu0Yxarc3co2GQcs9YOGv/SLJyO8lRD1/xePiIj8tUyaBoGujG7RxS
	WHIoRB1TlUSA+vRTHuHqVA==
X-Google-Smtp-Source: AGHT+IE12vKJJ+bpCT5H9fzYNV9g/TpHWr/tAvdxUzQ+u8CD6NZ2D3fh4RxMVFMYiwJ2fS9hPMCOXw==
X-Received: by 2002:a05:6871:54c:b0:1fb:14cb:c904 with SMTP id t12-20020a056871054c00b001fb14cbc904mr448029oal.3.1702054241804;
        Fri, 08 Dec 2023 08:50:41 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id gu11-20020a056870ab0b00b001fb3143cc0bsm462961oab.44.2023.12.08.08.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 08:50:41 -0800 (PST)
Received: (nullmailer pid 1766460 invoked by uid 1000);
	Fri, 08 Dec 2023 16:50:39 -0000
Date: Fri, 8 Dec 2023 10:50:39 -0600
From: Rob Herring <robh@kernel.org>
To: Kyle Tso <kyletso@google.com>
Cc: krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux@roeck-us.net, heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, badhri@google.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: connector: Add child nodes for
 multiple PD capabilities
Message-ID: <20231208165039.GA1756077-robh@kernel.org>
References: <20231205030114.1349089-1-kyletso@google.com>
 <20231205030114.1349089-2-kyletso@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205030114.1349089-2-kyletso@google.com>

On Tue, Dec 05, 2023 at 11:01:13AM +0800, Kyle Tso wrote:
> Commit 662a60102c12 ("usb: typec: Separate USB Power Delivery from USB
> Type-C") allows userspace to configure the PD of a port by selecting
> different set of predefined PD capabilities. Define the PD capability
> sets in DT for better configurability in device modules.
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
> v4 -> v5:
> - Fixed DT_CHECK errors
> 
>  .../bindings/connector/usb-connector.yaml     | 88 +++++++++++++------
>  1 file changed, 59 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 7c8a3e8430d3..7945d09d1f59 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -14,6 +14,8 @@ description:
>    of a USB interface controller or a separate node when it is attached to both
>    MUX and USB interface controller.
>  
> +$ref: "#/$defs/capabilities"
> +
>  properties:
>    compatible:
>      oneOf:
> @@ -67,6 +69,15 @@ properties:
>        model it as a regulator. See bindings/regulator/fixed-regulator.yaml
>  
>    # The following are optional properties for "usb-c-connector".
> +  source-pdos:
> +    $ref: "#/$defs/capabilities/properties/source-pdos"
> +
> +  sink-pdos:
> +    $ref: "#/$defs/capabilities/properties/sink-pdos"
> +
> +  op-sink-microwatt:
> +    $ref: "#/$defs/capabilities/properties/op-sink-microwatt"

With the $ref above, these aren't needed. But you have to use 
unevaluatedProperties instead of additionalProperties.

I fixed this up and applied.

Rob

