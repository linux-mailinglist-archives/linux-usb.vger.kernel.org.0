Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA23372B76
	for <lists+linux-usb@lfdr.de>; Tue,  4 May 2021 15:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbhEDN4h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 May 2021 09:56:37 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:43613 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbhEDN4g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 May 2021 09:56:36 -0400
Received: by mail-oi1-f180.google.com with SMTP id j75so3082388oih.10;
        Tue, 04 May 2021 06:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=rQFhCZYzph1mceFaGalojF2yLBMlfUBMUhT1foehHNQ=;
        b=eLLlgRAxVoEaWzWDHbxzqH8gBhU517rblXuQ97cS0fQLEX2jUx8aRckI1Fvbs3MFvW
         ds/GUOKMIIn27jYCXBi+0qXVseZAib20vs4kAJr2gT/r0R16UJskEQboAZQmW68AwwNl
         Y8L6pUlFigBuqCX/bfhlO9le2HKauPN8IURVLqz7YkqMDmXEOcrDQq7G9gu5S4zTrk0E
         9XLOd2tf6CViqVYsZcwVDAPpsDAaE++coK3MbL83jRZ+SfT/y0tys99zeHst6AeJE/8u
         CfHJNaRz/LeSTrwr51r+uRDtKLz/ywyaZYIPSyMV0oFhhiYzkiHQu++WX+czcpaRb9ek
         HlVw==
X-Gm-Message-State: AOAM533PUcXbCYJauLzCetNlXM4T6A+yoMw8GvYH3uvyxwhlTyM/wV7B
        W0LpbQ2s0duPDEaC0DP0Nw==
X-Google-Smtp-Source: ABdhPJwignls2NPcOmlRV7U4yQ6VJWDOA5xFv92/Je0QP+cKNJIathAuEiFyp/BLzgi4MyBo2cyTyQ==
X-Received: by 2002:aca:4acf:: with SMTP id x198mr11097354oia.111.1620136541101;
        Tue, 04 May 2021 06:55:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g26sm291616otr.37.2021.05.04.06.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 06:55:40 -0700 (PDT)
Received: (nullmailer pid 4044733 invoked by uid 1000);
        Tue, 04 May 2021 13:55:37 -0000
From:   Rob Herring <robh@kernel.org>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
In-Reply-To: <20210504101910.18619-7-rui.silva@linaro.org>
References: <20210504101910.18619-1-rui.silva@linaro.org> <20210504101910.18619-7-rui.silva@linaro.org>
Subject: Re: [PATCH 6/7] dt-bindings: usb: nxp,isp1760: add bindings
Date:   Tue, 04 May 2021 08:55:37 -0500
Message-Id: <1620136537.094458.4044732.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 04 May 2021 11:19:09 +0100, Rui Miguel Silva wrote:
> The nxp,isp1760 driver is old in the tree, but did not had a bindings
> entry, since I am extend it to support isp1763 in the same family, use
> this to add a proper yaml bindings file.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  .../devicetree/bindings/usb/nxp,isp1760.yaml  | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/usb/nxp,isp1760.example.dt.yaml:0:0: /example-0/usb@40200000: failed to match any schema with compatible: ['nxp,usb-isp1763']

See https://patchwork.ozlabs.org/patch/1473757

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

