Return-Path: <linux-usb+bounces-2587-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D087E276C
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 15:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3625BB20F2D
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 14:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57D828DB4;
	Mon,  6 Nov 2023 14:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF2419BA3;
	Mon,  6 Nov 2023 14:45:00 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50702D47;
	Mon,  6 Nov 2023 06:44:59 -0800 (PST)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6ce29d1db6eso2637789a34.1;
        Mon, 06 Nov 2023 06:44:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699281898; x=1699886698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzTeypYavg43CGGqc/gvMHs0xlS4mmNzFQv4Nkw8p9U=;
        b=xGJAYEr4+93MJzvoyXLOxKjlKW60Rpw0qeyOewGTTRUFbmTGPO+OkTce/92jLLMVub
         v07E+c5Cb7JfjokUxOeDNL2BwmjCNaozjvvzDa1UiKojsDAaU6kCnbj6t7iaIxhhKEnx
         a7qE3tIM9m8ub8a84YdvOmSkEP6Ogrgg38Gm4tzKzLBDC1qxior2V0qgQSkaj4OiXLT4
         vyABCUih9YEeuYLqqh+T1feRd/sGYnsyjM4LO54OX3nKy7/Yt4UOcg4yLqJpHTyasXch
         ZSgmgRxG3/C98zT+3VKyST1XS4O9RXlCGzsb1aTEt7i6Od2doqDsHzVIFle6ydm6okh2
         vuEQ==
X-Gm-Message-State: AOJu0Yyo1I9NxTr3C6jRYdsj3zMla2sQDfb32bgiz/rEYP9hpWLCJXLZ
	qM2guu9QD7fd1C521PdLDA==
X-Google-Smtp-Source: AGHT+IE7RvtxWIISIJToFQ9Z9MXswEDAfriM8yXPO4Qhgdi8XwAPJJQ49Eh7JOWDsy32b9kuz6ye3A==
X-Received: by 2002:a9d:6e81:0:b0:6cd:a4a:181f with SMTP id a1-20020a9d6e81000000b006cd0a4a181fmr5663889otr.17.1699281898505;
        Mon, 06 Nov 2023 06:44:58 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bo7-20020a0568300c0700b006ce28044207sm1295906otb.58.2023.11.06.06.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 06:44:57 -0800 (PST)
Received: (nullmailer pid 317716 invoked by uid 1000);
	Mon, 06 Nov 2023 14:44:56 -0000
Date: Mon, 6 Nov 2023 08:44:56 -0600
From: Rob Herring <robh@kernel.org>
To: Naveen Kumar <mnkumar@google.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, royluo@google.com, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 2/2] dt-bindings: usb: add no-64-bit-support
 property
Message-ID: <20231106144456.GA315331-robh@kernel.org>
References: <20231101101625.4151442-1-mnkumar@google.com>
 <20231101101625.4151442-3-mnkumar@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101101625.4151442-3-mnkumar@google.com>

On Wed, Nov 01, 2023 at 10:16:25AM +0000, Naveen Kumar wrote:
> From: Naveen Kumar M <mnkumar@google.com>
> 
> Add a new DT option to specify whether a host controller is able to
> support 64-bit DMA memory pointers
> 
> Signed-off-by: Naveen Kumar M <mnkumar@google.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> index 180a261c3e8f..20dc134004f3 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> @@ -25,6 +25,10 @@ properties:
>      description: Set if the controller has broken port disable mechanism
>      type: boolean
>  
> +  quirk-no-64-bit-support:
> +    description: Set if the xHC doesn't support 64-bit DMA memory pointers
> +    type: boolean

To add on to this, you can handle this with dma-ranges if you need to 
limit DMA addresses to less than 32-bits.

Rob


