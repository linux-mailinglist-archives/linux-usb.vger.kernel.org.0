Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D721E6ADD
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 21:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406502AbgE1T0e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 15:26:34 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33899 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406258AbgE1T0d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 15:26:33 -0400
Received: by mail-io1-f66.google.com with SMTP id f3so31427669ioj.1;
        Thu, 28 May 2020 12:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hPV9O47er4xNAMd5wglL6Z5Z1lhGUqlcSginv9j4tJY=;
        b=iKJZE1nlq6F6nJp+puvkmCfCYym1L+VVG+kmnaU1d4f62PhOg8U+V+8IbbvzXo8HDN
         78drb/ptOtpGReVqyjC4Z2LLcqgyLwbiPJ+2R6lcaQ9G3alZs+k/UimOzC3zbf61yOWB
         YQiR38Wc7/TSsda+qdCx94WiXfkyMyksqo0FpAeRNRnyOYuC+d1rpZBMptBT8yf68QcN
         MD8lMcpMoBU5r9XuXZG1kLVH1+ERVFtvDYawCdAgdOZT7HTKdolbJguCkIBb7TUBD4pG
         dMI89JOIF5C47sJAFCASJtQZPOjeQbUd/YF8h8O+9uIw/+lXd/1oebuWgL12DfE6ImeG
         r5+Q==
X-Gm-Message-State: AOAM531ahsT7rl0vdxByAVsabNGLIc8oNt1isUMqiIJkbR+z1MGq4qeF
        mnwJkUabddHTXv2P1QRSWg==
X-Google-Smtp-Source: ABdhPJzCyFeUg7Z9IIEN+Krc+e5kutkL4mnELlbgP88jXAg66vChno/VzYMMvtVbSJ8HNuZC5aYN2w==
X-Received: by 2002:a02:9f90:: with SMTP id a16mr3987752jam.65.1590693992020;
        Thu, 28 May 2020 12:26:32 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id g19sm2933855iom.21.2020.05.28.12.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 12:26:31 -0700 (PDT)
Received: (nullmailer pid 539224 invoked by uid 1000);
        Thu, 28 May 2020 19:26:29 -0000
Date:   Thu, 28 May 2020 13:26:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     cristian.birsan@microchip.com
Cc:     linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com,
        alexandre.belloni@bootlin.com,
        linux-arm-kernel@lists.infradead.org, balbi@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH v2 2/7] dt-bindings: usb: atmel: Update DT bindings
 documentation for sam9x60
Message-ID: <20200528192629.GA539191@bogus>
References: <20200515111631.31210-1-cristian.birsan@microchip.com>
 <20200515111631.31210-3-cristian.birsan@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515111631.31210-3-cristian.birsan@microchip.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 15 May 2020 14:16:26 +0300, cristian.birsan@microchip.com wrote:
> From: Cristian Birsan <cristian.birsan@microchip.com>
> 
> Add sam9x60 binding.
> 
> Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
> ---
>  Documentation/devicetree/bindings/usb/atmel-usb.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
