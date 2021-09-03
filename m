Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0726040060F
	for <lists+linux-usb@lfdr.de>; Fri,  3 Sep 2021 21:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349516AbhICTs0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Sep 2021 15:48:26 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:37610 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhICTsZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Sep 2021 15:48:25 -0400
Received: by mail-ot1-f52.google.com with SMTP id i3-20020a056830210300b0051af5666070so366369otc.4;
        Fri, 03 Sep 2021 12:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=07KAWclyrje+6M7j3aAbAIOd4SS2KMhKwYrzm5BDuco=;
        b=P7z5c9ZPquqL6hNqBZEs30Z/PAyi7/J+X+tfzeSPcgRqM1zod+25IMj7lJkqpBG+04
         3JXqDsBTl8zueCy+A6SFsb18XxtoDainRQSdPJbbN6aYPKjk0Hlj59iqf9GwMWFSSu1t
         5hD3gJB/1vCKmGPrxd/z3wLkY/HyI45c8aP9bKKyy6Hhrn98qOM97/xb3RNtRIdhr8Fc
         a//J0EF7RHrFM2bonZpWJanWEQ7he4G38gk900qv0kVFEXN8V3SkYFJhvUv2APREWt47
         J7HeDPhA7XLBXcFWi45JHheFzp1HVy7ODCjPOVT18Su7AUjaoHCUbC1sjbQ/cgrsZ5Gd
         9B9w==
X-Gm-Message-State: AOAM533pXYrOMoiYEN1cnNFxjWeQsM3cVRTczf6Sv7ymjmiHLYshVHvy
        rMXbybjzF2cvOoaxlZg+cNkaVvtz7A==
X-Google-Smtp-Source: ABdhPJzOolETQqMqGylY5BEpdkIGwZEn+u2kDdqSBCUGchgizJzAul1x461BA9CgpPac9nP0bgUbrw==
X-Received: by 2002:a9d:450c:: with SMTP id w12mr628461ote.18.1630698444806;
        Fri, 03 Sep 2021 12:47:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v29sm30949ooe.31.2021.09.03.12.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:47:24 -0700 (PDT)
Received: (nullmailer pid 3342276 invoked by uid 1000);
        Fri, 03 Sep 2021 19:47:23 -0000
Date:   Fri, 3 Sep 2021 14:47:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Dongjin Kim <tobetter@gmail.com>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-sunxi@googlegroups.com,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 36/52] dt-bindings: usb: Convert SMSC USB3503 binding
 to a schema
Message-ID: <YTJ7y9dCERQu03/+@robh.at.kernel.org>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-37-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901091852.479202-37-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 01 Sep 2021 11:18:36 +0200, Maxime Ripard wrote:
> The SMSC USB3503 USB Hub Controller is supported by Linux thanks to
> its device tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Dongjin Kim <tobetter@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Added maximum number of items for clocks and gpios
>   - Fixed the example node name
> ---
>  .../devicetree/bindings/usb/smsc,usb3503.yaml | 108 ++++++++++++++++++
>  .../devicetree/bindings/usb/usb3503.txt       |  39 -------
>  2 files changed, 108 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/smsc,usb3503.yaml
>  delete mode 100644 Documentation/devicetree/bindings/usb/usb3503.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
