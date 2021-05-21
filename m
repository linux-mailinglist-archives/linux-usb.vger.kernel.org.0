Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDD5F38BB95
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 03:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236687AbhEUBcS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 21:32:18 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:37704 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236147AbhEUBcS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 21:32:18 -0400
Received: by mail-oi1-f176.google.com with SMTP id h9so18264552oih.4;
        Thu, 20 May 2021 18:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4FBI89K5NawSI4OT9bivk8hkv5t+Um74esUIt6g2b24=;
        b=ponWau8u+oRf2HQn1n8ABB0QEhKdT9C3o3ZrNffyze9s9f2tH2jCniFFLb2axTCIFe
         jp3Xa70jd6dPSAoLPowx4IqxYqXDv4Aiu7Goymjh7tQNpA/kFqNST/zMyEbnyXH22mK4
         Wc7jq+RJOGoMIIn7HhfqNtJkvL8jOMbGS/f/9vz0x8OD0o6BFEO6gTtuja7dTpBq8bs7
         AGG92XiV+h3A6b3SmDiBxmYemxDohqlGFVhxIIaXIkxuRnB1m4Hes6DglyA5s3mNumOs
         5OSYJLV0db8a27Rjrpwti7q5OySARhG26zji1M28nbiVC0meBknXFva2Ete+xvWcwveh
         5iyQ==
X-Gm-Message-State: AOAM532zOzcq5kuvtQypzqMAxlmx5ZX8dTcuIFszEc66UgCWtHkVsNPw
        fwKgusC5eQnyY7328gjqzA==
X-Google-Smtp-Source: ABdhPJwrF47rCELYVEQid4jA1dmVyceMmOOxteTur32icInmDQsmtIJdDbuDCs7XiAZnLbKd04cYgg==
X-Received: by 2002:a54:4385:: with SMTP id u5mr252500oiv.30.1621560654966;
        Thu, 20 May 2021 18:30:54 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a18sm650502oiy.24.2021.05.20.18.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 18:30:54 -0700 (PDT)
Received: (nullmailer pid 2443797 invoked by uid 1000);
        Fri, 21 May 2021 01:30:53 -0000
Date:   Thu, 20 May 2021 20:30:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     heikki.krogerus@linux.intel.com, shawnguo@kernel.org,
        gregkh@linuxfoundation.org, linux@roeck-us.net,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: connector: Add typec orientation switch
 properties
Message-ID: <20210521013053.GA2430162@robh.at.kernel.org>
References: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
 <1621408490-23811-2-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621408490-23811-2-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 19, 2021 at 03:14:47PM +0800, Li Jun wrote:
> Typec orientation switch can be implementaed as a consumer of mux
> controller, with this way, mux-control-name must be provided with
> name "typec-orientation-switch", along with its 3 states value array
> for none(high impedance), cc1, cc2.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  .../bindings/connector/usb-connector.yaml     | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 32509b98142e..567183e199a3 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -111,6 +111,24 @@ properties:
>        - 1.5A
>        - 3.0A
>  
> +  mux-controls:
> +    description:
> +      mux controller node to use for orientation switch selection.
> +    maxItems: 1
> +
> +  mux-control-name:
> +    items:
> +      - const: typec-orientation-switch

Don't really need a name with only 1 entry.

> +
> +  mux-control-switch-states:

Not really part of the 'mux-control' binding, but part of the connector. 
So 'typec-orientation-switch-states' or something.

> +    description: |
> +      An ordered u32 array describing the mux state value for each typec
> +      orientations: NONE(high impedance), CC1, CC2, if there is no HW mux
> +      state for NONE, use value of CC1 or CC2 for it,
> +    minItems: 3
> +    maxItems: 3
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
>    # The following are optional properties for "usb-c-connector" with power
>    # delivery support.
>    source-pdos:
> @@ -301,6 +319,9 @@ examples:
>          sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
>                       PDO_VAR(5000, 12000, 2000)>;
>          op-sink-microwatt = <10000000>;
> +        mux-controls = <&mux>;
> +        mux-control-names = "typec-orientation-switch";
> +        mux-control-switch-states = <2>, <0>, <1>;
>        };
>      };
>  
> -- 
> 2.25.1
> 
