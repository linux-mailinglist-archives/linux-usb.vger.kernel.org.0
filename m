Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00C6F131B34
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2020 23:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbgAFWSI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jan 2020 17:18:08 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41759 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbgAFWSH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jan 2020 17:18:07 -0500
Received: by mail-ot1-f67.google.com with SMTP id r27so73584665otc.8
        for <linux-usb@vger.kernel.org>; Mon, 06 Jan 2020 14:18:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qa6q9QR2d6sy+ufZnpcE6vi8U62kVIxetSaKdt5u+KI=;
        b=EeqGdVW+FbZZ3p1O4mEATkGBpA467I/9ABSVSzZEXkcAIRZPLRWpEbgdr1TCpuk8R7
         La4pvxCLQwV6sS6K+OQJm6ig0w8jEGQMdWFjqqAFZwWy5s30dwMpZZKoGS4VJR8HTrs5
         rZON8J1UX+jQ6Y7SpvKZToflQGFPuNOBfN7aHGgVPvuJaMoAReoTlqPjTp+efZawNXPL
         GOu2uKnc3PhQyTIfp/dCtx49hbOs60E87p6gX+8Wg0hPN/5dwj9Fw6ZCmJOpDN4gfpCq
         nyiqdAExOZmUFzSfRNCN1j1o13o5Pj7ZEQUbGeUhefugIniQNi5xI9943l/ZyZ27duc3
         VY6A==
X-Gm-Message-State: APjAAAXBbWEwSsUIILA7XDWGgw2Y+OeHZEUFTGpBbo17mkR0mQC/7CqS
        NT72aIU8mjjoXG7qg1yRIUih93A=
X-Google-Smtp-Source: APXvYqxp7ouIkxA5hfu3/Mxh99w93XC2pjyXyccsxtZktxMPEv5NUj1feWgBlATdz3mim2UpSoY3nQ==
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr18895850ots.250.1578349086323;
        Mon, 06 Jan 2020 14:18:06 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id r10sm24566127otn.37.2020.01.06.14.18.03
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:18:05 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22043f
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:18:03 -0600
Date:   Mon, 6 Jan 2020 16:18:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     jassisinghbrar@gmail.com
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: max3421-udc: add dt bindings for
 MAX3420 UDC
Message-ID: <20200106221803.GA1555@bogus>
References: <20200105225509.21590-1-jassisinghbrar@gmail.com>
 <20200105225547.21672-1-jassisinghbrar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200105225547.21672-1-jassisinghbrar@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun,  5 Jan 2020 16:55:47 -0600, jassisinghbrar@gmail.com wrote:
> From: Jassi Brar <jaswinder.singh@linaro.org>
> 
> Add YAML dt bindings for Maxim MAX3420 UDC controller.
> 
> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> ---
>  .../bindings/usb/maxim,max3420-udc.yaml       | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
