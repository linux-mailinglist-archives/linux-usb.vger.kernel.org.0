Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1701CE80C
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2020 00:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgEKWZv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 May 2020 18:25:51 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38460 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgEKWZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 May 2020 18:25:50 -0400
Received: by mail-oi1-f195.google.com with SMTP id r66so16564848oie.5;
        Mon, 11 May 2020 15:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7+5vSNb8IxUA2MM9e6x9N0FrIu+LoC01HvigV+gZqJo=;
        b=byuqLZKUXw3pzscmmFEWK5JNroInVneIarpHIwF72iHcgJ5QQsCT/l7hkd/UhyA/Ha
         de88o51t3qZfkE0u2F66l9anYBix5TIVqX2YRCUkKS68ywy7Nn6sthTXGxyjECxiARS6
         h58lnNI5WWBnX4pvdOSaicUWkZmG/ADCHy9mt461ZuUoNJBZxudFMjJmnrYRyReAW9A2
         /RCR6bnOLZ7slOzx7vYJ5k8xwTozw1n68w5/l9QEwhYF0q5qINe+b9iA9uZMEU4avSd3
         fqtMU63NXSotLLYbYeOzpPCukt5/FeJ1XScSsPRnC3kyQw2Fqa6wlidVjYuPGMgzsEq0
         2Y4Q==
X-Gm-Message-State: AGi0PubvvsWtA8NL0TVSicRVjM2eaa9qAsau0JeKIeFNF38S1cSTu6Of
        ciDYkS9giQoWXgc//O1BZA==
X-Google-Smtp-Source: APiQypJ9eQAYcH5jaLEtRYYyKWBWFhBc+JEnyD+r1v2xL8VlHzzA3LVNArk2SC8qvGZFebPkJp9VEQ==
X-Received: by 2002:aca:b2c2:: with SMTP id b185mr16208902oif.169.1589235949735;
        Mon, 11 May 2020 15:25:49 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m16sm3137413oop.40.2020.05.11.15.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 15:25:49 -0700 (PDT)
Received: (nullmailer pid 26457 invoked by uid 1000);
        Mon, 11 May 2020 22:25:48 -0000
Date:   Mon, 11 May 2020 17:25:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     heiko@sntech.de, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: usb: dwc2: add power-domains property
Message-ID: <20200511222548.GA26381@bogus>
References: <20200425170833.26718-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200425170833.26718-1-jbx6244@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 25 Apr 2020 19:08:33 +0200, Johan Jonker wrote:
> A test with the command below gives this error:
> 
> arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml: usb@ff300000:
> 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> With the conversion to yaml it also filters things
> in a node that are used by other drivers like
> 'power-domains' for Rockchip px30 usb nodes,
> so add them to 'dwc2.yaml'.
> 
> make ARCH=arm64 dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/usb/dwc2.yaml
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!
