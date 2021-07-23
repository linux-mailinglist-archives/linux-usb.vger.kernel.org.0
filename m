Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD6E93D42BD
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jul 2021 00:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232761AbhGWVfc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 17:35:32 -0400
Received: from mail-il1-f175.google.com ([209.85.166.175]:42948 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbhGWVfc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jul 2021 17:35:32 -0400
Received: by mail-il1-f175.google.com with SMTP id q18so2871598ile.9;
        Fri, 23 Jul 2021 15:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZAgxabqS2ZBDgqZufNAgyVlWlaBEnmkeoAt8keunxi4=;
        b=qf3wKhuyzxAVaQ/ETZC7eAktUPPnBXqWo549pJO6CXKiSl8cE1UCN8kiQALQcljRmZ
         ShcZH8qUjhuM4t4cRBlHriVzOOtEyZp9YSzJKBACMLD3zxoQqeObjbgzcbFhqNat2sB2
         iPSc2iMkREH48AK9BlebzMfonSN44fFEvAbunKwoO/vrhT3kmHwbsGd712Sj6SgLcY08
         fg3j5xJwa3a/iyoInGqp3/Bu81OyBaMrupoy/t2v6M47+cPPV1JcMvZ9wduWps0Zkjo0
         taJWQG0SoNmLyZ/GRYgyvEVp5xUy6Z9boLMb7bnIrVjJ2BNPsSEmdupwh4yifwlAgCFD
         +ExQ==
X-Gm-Message-State: AOAM5308jO9c3QseNVcLH9eDMHVY6U2jW+Evm3q4VPc8wjdfK/g5mxKN
        HqpAukv/PYCR9+CFzBu9TQ==
X-Google-Smtp-Source: ABdhPJxYb9hYjU/eRgG2WSnUQMe+Ftsy6grSXmJtPW+V1VtL/Dwa89FBUc5tZvZJH7PyJ90flRYWGA==
X-Received: by 2002:a92:d451:: with SMTP id r17mr4919596ilm.109.1627078564245;
        Fri, 23 Jul 2021 15:16:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a3sm2442168ilj.39.2021.07.23.15.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 15:16:03 -0700 (PDT)
Received: (nullmailer pid 2694119 invoked by uid 1000);
        Fri, 23 Jul 2021 22:16:00 -0000
Date:   Fri, 23 Jul 2021 16:16:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 37/54] dt-bindings: usb: ohci: Add Allwinner A83t
 compatible
Message-ID: <20210723221600.GA2694090@robh.at.kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-38-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721140424.725744-38-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 21 Jul 2021 16:04:07 +0200, Maxime Ripard wrote:
> The A83t OHCI compatible was introduced in device trees, but it was
> never documented.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/usb/generic-ohci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
