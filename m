Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA74E199F8A
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 21:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729941AbgCaT6h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 15:58:37 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:35936 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbgCaT6g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 15:58:36 -0400
Received: by mail-il1-f195.google.com with SMTP id p13so20681309ilp.3;
        Tue, 31 Mar 2020 12:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nqeAJUtOtJijTj0sgAPusrPwg7HunH4vQhom+AKuF6M=;
        b=WH5oRxAvIpC9ufu7J+IzLeeffVDlT8hVvbvJMdLHCU9WPMa5OZvUjEYP9S3OXM7weN
         AChx3ThLomlo005LiuSFtfaCY2bSGZnH2S6th0pL5nayIlnpTPlwrSO1E8kUVA5qAt4k
         YNzWjwsPNHNsH70LZNAJmyiLySPo8CfJwsSwUmINXLlVWJpZRbL4RodL9mqLMynM9yY9
         vNF3v3Wy//n+8kZxBLF/s4fMo4+lF8NXu8fTvme8eIghPEXIutSxippwF6/0ZmugzpY/
         HJjoLTtR+6B9FxlIZtGBBUFf0wK5H4wsq1Pyn0yFZ/fFX3XxZAI26D5BKVfycfi5Y3OM
         ovfA==
X-Gm-Message-State: ANhLgQ0vYQV3Vi1pEYDZgOUAKE3LVZRFe/noens7zbCH9/MYw4PpVlQD
        omeecfFLWLcJ3akL9oZyMw==
X-Google-Smtp-Source: ADFU+vvScuJWyJByk9tGznU4ABrVRM+QGd4p+cYDLCyHzSV2GjkxegyexD9XgClwA0WcmvmzB/uk2g==
X-Received: by 2002:a92:8659:: with SMTP id g86mr18829453ild.267.1585684715873;
        Tue, 31 Mar 2020 12:58:35 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id l25sm6209580ild.61.2020.03.31.12.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 12:58:35 -0700 (PDT)
Received: (nullmailer pid 1867 invoked by uid 1000);
        Tue, 31 Mar 2020 19:58:33 -0000
Date:   Tue, 31 Mar 2020 13:58:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/13] dt-bindings: usb: dwc3: remove amlogic compatible
 entries
Message-ID: <20200331195833.GA1800@bogus>
References: <20200324102030.31000-1-narmstrong@baylibre.com>
 <20200324102030.31000-13-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324102030.31000-13-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 24 Mar 2020 11:20:29 +0100, Neil Armstrong wrote:
> There is now a dedicated driver for these SoCs making the old compatible
> obsolete.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 --
>  1 file changed, 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
