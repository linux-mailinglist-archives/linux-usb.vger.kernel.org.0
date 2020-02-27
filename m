Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCA4172496
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 18:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbgB0RIM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 12:08:12 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46829 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729454AbgB0RIM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 12:08:12 -0500
Received: by mail-ot1-f65.google.com with SMTP id g96so3562268otb.13;
        Thu, 27 Feb 2020 09:08:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1XTjsA0ASfNQEFhGu0O7kHTBI6P5RguINl9U2HZcxW0=;
        b=Cm8UXzQyOSfkXZCiQ4iVcS9DnDvB7jSS90CBKdhh3PRoGiIxhiE+U6oitpG4LcHO8J
         PFAVDOMvNAFUhqQF5/zkE7KtjZcxYE36/rkuUJsUfS0njFfq9e5ccnADlzzmCLRCx/gc
         8fPBY3jwjv6AxD+IXzqJNym0Wpw+jP5rUcb0/B8nxgZ5kzNfauVogvKKoVsiR6ZL7kwX
         Pjj307qQ9TuwuHIBpUGT3Idig1lDOIavZeIEqMgMIQvZfUjowLNd+GmrH74kEsRh/nbX
         t/M1eh9Z6vsSDJLCMIFQVeiHF6IqpJH+sO9NHETCip0n/CR2y47d/ZGjz2e4etttBk+T
         26Fg==
X-Gm-Message-State: APjAAAV4AmKcQpaMMueuuo2hxjkpS0Xeb2wZyL+F5jx85oCiBcqgsQba
        vQeGL9y9Ph/QVy3r3ipeZA==
X-Google-Smtp-Source: APXvYqxShkeM63PaOZgnFeANa9efNVNK+qM+YZ4yLmXpRT6PBGbC2E1hyCTWdmsquXhxbyq+ozA2Qw==
X-Received: by 2002:a05:6830:1db3:: with SMTP id z19mr609738oti.292.1582823291509;
        Thu, 27 Feb 2020 09:08:11 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v14sm2123691oto.16.2020.02.27.09.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 09:08:10 -0800 (PST)
Received: (nullmailer pid 2686 invoked by uid 1000);
        Thu, 27 Feb 2020 17:08:10 -0000
Date:   Thu, 27 Feb 2020 11:08:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     kishon@ti.com, robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, aniljoy@cadence.com, jun.li@nxp.com,
        devicetree@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Message-ID: <20200227170810.GA2318@bogus>
References: <20200227062754.19131-1-peter.chen@nxp.com>
 <20200227062754.19131-2-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227062754.19131-2-peter.chen@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 27 Feb 2020 14:27:54 +0800, Peter Chen wrote:
> Add Cadence SALVO PHY binding doc, this PHY is a lagacy module,
> and is only used for USB3 and USB2.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  .../bindings/phy/cdns,salvo-phy.yaml          | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

warning: no schema found in file: Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml: ignoring, error parsing file
Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml:  while scanning a block scalar
  in "<unicode string>", line 39, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 41, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1245562
Please check and re-submit.
