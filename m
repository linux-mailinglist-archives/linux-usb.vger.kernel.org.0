Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2FB2A89FA
	for <lists+linux-usb@lfdr.de>; Thu,  5 Nov 2020 23:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732046AbgKEWhC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Nov 2020 17:37:02 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33041 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgKEWhC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Nov 2020 17:37:02 -0500
Received: by mail-oi1-f195.google.com with SMTP id k26so3420105oiw.0;
        Thu, 05 Nov 2020 14:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c3C5XgJRHAT7v5YhunvUxIvvrDo4P+JprtJHnujvPNA=;
        b=KDy2QR+bHpviKioVB8JNVtUXsNJ8zcZ+KmvYrJ8PS/TClBRiR5g0LKEeihWten0lw5
         xjVDEha6EA0DZp8GPnSmNfPCAuYuqMylH1YjkvrR51y1d6gJN7wnnba+6kLAUNQo0pYZ
         gM7BuRI4N8Ohchn00m1wksyJCq/ItHazjV2eCgCnXSlKoW9zT211ERrcYDXTPZuRon/1
         mT2dKHSEdTcQJSlOB/UU5ZNvw7AE12BvXhUgf+yGA7sjns7GKWMGxDMLh98ncKXe5a1A
         xBcaYz63Sg/2BjPicpoIAJEKkrXvVrImURkpc/pMOZBHNL7AIbgdl13OQuOMyejDd/Qa
         tS8Q==
X-Gm-Message-State: AOAM532epUO9sd6590UCWMjkRm778ISUcZxE4iwPsVuX099jD05ZcMQc
        knwbH5SwMviOaVSN2UpGQFhbGgldGgv1
X-Google-Smtp-Source: ABdhPJwxq4RjY+Ng5QZd+7R7yaDhg1MuA9bc2erBAB7yVXrBvjdv24Bh3IG4EiVZF35X69h680KpaA==
X-Received: by 2002:aca:abc1:: with SMTP id u184mr980023oie.122.1604615821597;
        Thu, 05 Nov 2020 14:37:01 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f34sm644286otb.34.2020.11.05.14.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 14:37:01 -0800 (PST)
Received: (nullmailer pid 1927393 invoked by uid 1000);
        Thu, 05 Nov 2020 22:37:00 -0000
Date:   Thu, 5 Nov 2020 16:37:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     devicetree@vger.kernel.org, pawell@cadence.com,
        linux-usb@vger.kernel.org, rogerq@ti.com, jun.li@nxp.com,
        linux-imx@nxp.com, robh+dt@kernel.org
Subject: Re: [PATCH v3 1/1] doc: dt-binding: cdns,usb3: add wakeup-irq
Message-ID: <20201105223700.GA1927324@bogus>
References: <20201104080524.1821-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104080524.1821-1-peter.chen@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 04 Nov 2020 16:05:24 +0800, Peter Chen wrote:
> To support low power mode for controller, the driver needs wakeup-irq
> to reflect the signal changing after controller is stopped, and waking
> the controller up accordingly.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> Changes for v3:
> - Fix the dt_binding_check error
> 
> Changes for v2:
> - Add "minItems: 3" to make wakeup irq optional
> 
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
