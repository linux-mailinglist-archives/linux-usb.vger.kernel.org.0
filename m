Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9976D421304
	for <lists+linux-usb@lfdr.de>; Mon,  4 Oct 2021 17:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235787AbhJDPud (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Oct 2021 11:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235771AbhJDPuc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Oct 2021 11:50:32 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A0AC06174E
        for <linux-usb@vger.kernel.org>; Mon,  4 Oct 2021 08:48:43 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id d12-20020a05683025cc00b0054d8486c6b8so22126867otu.0
        for <linux-usb@vger.kernel.org>; Mon, 04 Oct 2021 08:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3XFgmwQ1hEJzqwqEAg7wvAfnSR1sFfJzAaBRc9FMDKs=;
        b=o07qS99kYatIMjEySAiYnYcqpDLh5KBSm6q9+gwD1qp7AI1FPnWH29sWhZvpBmTSGh
         DVDfXw5oA8LL5ogMzCe/Z2fuKZEeDKm6yJEPE0Xdg6Ugjwo4bmQQ4vLacInWDR1W+Kyv
         JMxm7D4nXz1MhfvT8JNqF6Php2ryKZRUwZR+wQVBoJM9U+nMRRd4YS+R9Uu6AZW4bPJy
         oO9SepEwSbBJ/ow65/iZR7qDBGW9OCl6RnGIk1t32wxOnItKFzpSoYjkoBkobq4cwZbB
         dW6FSXPQl2DlmhxYg/tC0pQz6Wv0P+ebuoSJnzCh0VeHcCj+/9Ev1bvwZ8l65h7q2pVo
         AnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3XFgmwQ1hEJzqwqEAg7wvAfnSR1sFfJzAaBRc9FMDKs=;
        b=hgNsB7+kbqo6acjBXTKZboccA8r9lIalt1xtVlInFjRXp7dbYVD0/Df3KIQHXjil4S
         N2BuyCCDOp5NhMzKnfewGZy+rvD+n1SjXuSbWJF3ins6TUCS9n6+RJ46JyAg0XwY50RY
         +LyP8ujjKVSy/IJ+1Cj5C5dhdk2HPhenWOFYb/z/XsDGKvLK/XobQiPGFimgAK95UrgQ
         NxGa1fx9lQfgyJY89VUj13MuwZCogdU6rIh7mbw0+E/LazbnhsxAB1gyQyghFFxFErEI
         bgj5cVv62qlazr8EdXmI3RosgYANvQv9XWglw0kYCwxopQn+kUUuk4l+GmS/xFq5oNtg
         dBpQ==
X-Gm-Message-State: AOAM531WsTz8sTDOLbEZGHQCzl2cW/QwAGit4t6G0b16nbPkCttpWnzR
        xwYneh5O+hPT+CsNBSgFg4gmFQ==
X-Google-Smtp-Source: ABdhPJwV90rWzKbQLCaoiR/lcJoWO35cpCznSnAV6td25c5rirNv+mBDtZTpS+7MmtPJcXQaprbK6w==
X-Received: by 2002:a05:6830:1da6:: with SMTP id z6mr10378498oti.234.1633362523183;
        Mon, 04 Oct 2021 08:48:43 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id bl23sm1065584oib.40.2021.10.04.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 08:48:42 -0700 (PDT)
Date:   Mon, 4 Oct 2021 08:50:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        satyap@codeaurora.org, pheragu@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH V0 2/7] dt-bindings: usb: dwc3: Update dwc3 properties
 for EUD connector
Message-ID: <YVsiwsemiCEmRkJ0@ripper>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
 <d4c9d60e8960968ad77a4a2c6c119a8e9cebc22d.1633343547.git.schowdhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4c9d60e8960968ad77a4a2c6c119a8e9cebc22d.1633343547.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon 04 Oct 04:16 PDT 2021, Souradeep Chowdhury wrote:

> Adding the address size,cell size and ranges property for EUD connector.
> Adding the connector property for EUD which is child of dwc3 node.
> 

When we have a Type-C controller involved, the connector is described
using of_graph, so will we not then have two different connectors
described, in two different ways?

Regards,
Bjorn

> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index 078fb78..3e71205 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -36,6 +36,14 @@ properties:
>          - const: synopsys,dwc3
>            deprecated: true
>  
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
> +
> +  ranges: true
> +
>    interrupts:
>      description:
>        It's either a single common DWC3 interrupt (dwc_usb3) or individual
> @@ -318,6 +326,13 @@ properties:
>      items:
>        enum: [1, 4, 8, 16, 32, 64, 128, 256]
>  
> +  connector:
> +    type: object
> +    $ref: /connector/usb-connector.yaml#
> +    description:
> +      Connector for dual role switch, especially for "eud-usb-c-connector"
> +
> +
>  unevaluatedProperties: false
>  
>  required:
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
