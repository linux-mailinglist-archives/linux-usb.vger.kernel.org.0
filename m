Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60C07227713
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 05:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgGUDjL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 23:39:11 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45611 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgGUDjK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jul 2020 23:39:10 -0400
Received: by mail-io1-f68.google.com with SMTP id e64so19893695iof.12;
        Mon, 20 Jul 2020 20:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=isWASpPxb2Gc0cCo3Yx4OshrmKHzj/OHrWNXRjmdTlw=;
        b=kw+CfmPgSri3CClHflLJ0cSHP+uz+esTY5q6/Eref3JJzJ7H4656BMSxwQxA5Ht0pj
         a0tHaN7Yi9PF3tJxKaP476sgiB2DYw/RVFSkAyBcSbIln6da7Im879yHTQegKx65MKRc
         d+tcJn2p6ZZSH5HiDoKZLE2AhvVG5ddK4DEOyrWqNki37COFXfcLa9NfQ7KO2wVCa8rq
         nLh8Lne5SF2VSw+eb1fdDBRsspdVvuCx5BAcyq6t2mftZJTTy2dRFF8kfVNtdtxosJHF
         WDItNuGJ2RBITAlTvJ+UKpHBP5eNNGzH/Y6B4bNJ+WfyN1gHNblAcuJuCgCaX0Wh2nqP
         HkZQ==
X-Gm-Message-State: AOAM531mgEbFg9ao6dxkiVEfvZ5feO9lxpkTeyhN/0nLy3dBoR81H30O
        z8arSmWgh9rAQ2JlEr7m8NAHPjQ/JQ==
X-Google-Smtp-Source: ABdhPJywzeMgJUQygmP/cq9Cz4DEcV5KEkAC/BVWTR6wX7OJx9CmZ1mHPmXSHaVaUser2Ls6KhFBBQ==
X-Received: by 2002:a6b:5813:: with SMTP id m19mr25793678iob.29.1595302749588;
        Mon, 20 Jul 2020 20:39:09 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c25sm9896217ioi.13.2020.07.20.20.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 20:39:08 -0700 (PDT)
Received: (nullmailer pid 3510955 invoked by uid 1000);
        Tue, 21 Jul 2020 03:39:08 -0000
Date:   Mon, 20 Jul 2020 21:39:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 06/11] usb: devicetree: dwc3: Introduce num-lanes and lsm
Message-ID: <20200721033908.GA3508628@bogus>
References: <cover.1594935978.git.thinhn@synopsys.com>
 <9684a2b2adb01b6b1a8c513928ea49b4a6436184.1594935978.git.thinhn@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9684a2b2adb01b6b1a8c513928ea49b4a6436184.1594935978.git.thinhn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 16, 2020 at 02:59:08PM -0700, Thinh Nguyen wrote:
> Introduce num-lanes and lane-speed-mantissa-gbps for devices operating
> in super-speed-plus. DWC_usb32 IP supports multiple lanes and can
> operate in different sublink speeds. Currently the device controller
> does not have the information of the phy's number of lanes supported. As
> a result, the user can specify them through these properties if they are
> different than the default setting.
> 
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index d03edf9d3935..4eba0615562f 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -86,6 +86,15 @@ Optional properties:
>   - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
>  	register for post-silicon frame length adjustment when the
>  	fladj_30mhz_sdbnd signal is invalid or incorrect.
> + - snps,num-lanes: set to specify the number of lanes to use. Valid inputs are
> +			1 or 2. Apply if the maximum-speed is super-speed-plus
> +			only. Default value is 2 for DWC_usb32. For DWC_usb31,
> +			it is always 1 at super-speed-plus.
> + - snps,lane-speed-mantissa-gbps: set to specify the symmetric lane speed
> +			mantissa in Gbps. Valid inputs are 5 or 10. Apply if
> +			the maximum-speed is super-speed-plus only. Default
> +			value is 10. For DWC_usb31, it's always 10 at
> +			super-speed-plus.

This is all common USB things and should be common properties (which we 
may already have).

Rob
