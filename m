Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47879B42E5
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 23:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391750AbfIPVTW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 17:19:22 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46610 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391748AbfIPVTW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 17:19:22 -0400
Received: by mail-pl1-f195.google.com with SMTP id q24so442084plr.13
        for <linux-usb@vger.kernel.org>; Mon, 16 Sep 2019 14:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n9DWwnQ0ixlKY1Oo2OaNdw3j2Vk7LEuAjJrbkNy70qY=;
        b=Vd1pK291+OHogX7OInB9maJL2NL7xTJceMxLdzEMOvd9X/BphTLH/oLHJXDZXpudNN
         O4FqKTNjwwsYRKNm9OM/jMm8xdcLFg0E1sZmaNfZvZuRrq1Twf+yYsbtjMe4Lb125myL
         l2/wlT2eUnBIxWt4hIvPvUjKOunB/3cBoM7WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n9DWwnQ0ixlKY1Oo2OaNdw3j2Vk7LEuAjJrbkNy70qY=;
        b=FIgcq7hyqCQHOgjlpalkJJWf2lrLO8xCRSlVrPQP75fwwKhIoZ2H2PaaGLPp//acT5
         eFq05cUNYnKsReym1KkfWL9zI+zNZ/SBCEHd5HQgvhDcU9kTEQegW5s58Qi61jyZ0Gk6
         5uFupNICpu4MmmqezTjrETvxympNzZm+Zzhe/r/gUR6l00dMXL5t0mxKFsrc7qJymCjq
         Q9a2qqY/c+Q0DDY9xdqxoeviPgkG8XVp95fBhf8bfv0Sv+StdUalGXnWnW09z6q32Zd5
         T1PHjzeYdQ69QM6ZpBXLCIZEM164u8SVgWL2kM+BmvzRbeH8J763MUJxPdJiAdJSpjZw
         pjTw==
X-Gm-Message-State: APjAAAUhqYZh+tAdfMWSW3QrYUsZhDm0SRUn7R44HaQhbGyDjGvUNDy8
        HK39HPmpxZBvc1fiI3bB4fBPFw==
X-Google-Smtp-Source: APXvYqzl0TKYDbJDhgxBYLCK1OCnKhowcQ1bkpDHku6sChR8jXggCok0oUQel7bVgdkrIOSLK3Cqdg==
X-Received: by 2002:a17:902:9a0b:: with SMTP id v11mr169471plp.202.1568668761825;
        Mon, 16 Sep 2019 14:19:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id 193sm17804pfc.59.2019.09.16.14.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2019 14:19:21 -0700 (PDT)
Date:   Mon, 16 Sep 2019 14:19:14 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Cc:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: Introduce interconnect bindings for usb
Message-ID: <20190916211914.GF133864@google.com>
References: <1568177675-18764-1-git-send-email-cchiluve@codeaurora.org>
 <1568177675-18764-2-git-send-email-cchiluve@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1568177675-18764-2-git-send-email-cchiluve@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 11, 2019 at 10:24:33AM +0530, Chandana Kishori Chiluveru wrote:
> Add documentation for the interconnects and interconnect-names
> bindings for USB as detailed by bindings/interconnect/interconnect.txt.

This isn't a generic binding for USB, but for the qcom,dwc3, the
commit message (including subject) should reflect this.

nit: you might want to replace 'bindings' with 'properties'.

> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> index cb695aa..7e9cb97 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> @@ -33,6 +33,16 @@ Optional clocks:
>  
>  Optional properties:
>  - resets:		Phandle to reset control that resets core and wrapper.
> +- interconnects:	Pairs of phandles and interconnect provider specifier

consistency nit: should be either 'phandle' & 'specifier' or
'phandles' & 'specifiers'.
