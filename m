Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60D241CF7B
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 00:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345404AbhI2WwK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Sep 2021 18:52:10 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:41524 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244732AbhI2WwJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Sep 2021 18:52:09 -0400
Received: by mail-ot1-f41.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso4889191ota.8;
        Wed, 29 Sep 2021 15:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QH/AXasCl8Be/DWpAcMmLfT5A/imbzi/kLdY2zCq2uY=;
        b=pDlc10VIKQwwCx0REEjiq5zGWqgGiky9UuIYi6p47TimRUgn5A327HvyPC+PiyW8XG
         cclFlbZjdj0kQXBYsfsjVtLC50hMcJYrXiFK95IKddX7ZRY8tBXCD6QCYY8gF9JT0EMe
         RD/cXna+H291ZpPRe2n0AF7u0Vm1CuT/mqjAWFqVeicZlPFGQyoBxlm8Vz2AkRFrv4Mi
         5C8qvZcvkU+Tw77nU9e/kGywYq5ZwcKGhicxJSj9SdBKSq6dsjY69+kczRdqpVXB+7XT
         zscBKE8e3Vsrk18v7C/NWTfXb3fUVLTFQvIx4B+mWad/URUmZid1uWs98JGCWib4VrQD
         ch0A==
X-Gm-Message-State: AOAM5308kYrtRBTFmk64n/2Fwrlv2jXHryJQdwRpuhzLO4V3pDBsL+Xs
        q5I9v/d6SakbgnZqTp45eg==
X-Google-Smtp-Source: ABdhPJza/xZOeWNYFd4C79AA2TGsdctnG7cFbCVClJx9SflGiLQIt8gCQYV8EJ/aMv9bei8aVtwbug==
X-Received: by 2002:a9d:6396:: with SMTP id w22mr2234977otk.26.1632955827867;
        Wed, 29 Sep 2021 15:50:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a1sm233031otr.33.2021.09.29.15.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 15:50:27 -0700 (PDT)
Received: (nullmailer pid 374323 invoked by uid 1000);
        Wed, 29 Sep 2021 22:50:26 -0000
Date:   Wed, 29 Sep 2021 17:50:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-usb@vger.kernel.org, git-dev@xilinx.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-binding: usb: xilinx: Add clocking node
Message-ID: <YVTtspez3jU8mG7O@robh.at.kernel.org>
References: <cover.1632805672.git.shubhrajyoti.datta@xilinx.com>
 <30c7d87ab46a0ea2da2dd04d824f162a2e3da4c8.1632805672.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30c7d87ab46a0ea2da2dd04d824f162a2e3da4c8.1632805672.git.shubhrajyoti.datta@xilinx.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 28 Sep 2021 10:57:10 +0530, Shubhrajyoti Datta wrote:
> Add a clocking node for xilinx udc.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v3:
> update clock description and names
> 
>  Documentation/devicetree/bindings/usb/xlnx,usb2.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
