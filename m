Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 908034DDBBF
	for <lists+linux-usb@lfdr.de>; Fri, 18 Mar 2022 15:35:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237341AbiCROgV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Mar 2022 10:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237329AbiCROgT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Mar 2022 10:36:19 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82BAF2D41FD
        for <linux-usb@vger.kernel.org>; Fri, 18 Mar 2022 07:35:00 -0700 (PDT)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 93BA23F1A4
        for <linux-usb@vger.kernel.org>; Fri, 18 Mar 2022 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647614092;
        bh=G59MB2rKDZvvgy8UDYIpU7naKS/ynlgqMNWbSSznKgc=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=TQyKbKABJbden6rgW2+Uo9l9Fi9ajSswIZmnIr3eKkLrHf3CIoFR9BkHdloQ3aJ0z
         nTmoth71LQUt9lpNdovAY0KSl+znjgm9ZHjy5IZpUwk/IL6mJIqimMS9J17Mk7qCX7
         1bxltTzvMVo5eisG7vn6Op+llnUrKhfH/5SB4PZMhHZkdnF04hsXtkJjIKmLJ5+ZTN
         pd8Tk/C9VkFpDQcBmd7UykHDmSL0JaBRhwLbmpnfvQTFJXwNfj3NLPMAM8fBpJG75v
         +5ZmkKppz5zFRT8cndiI+Xc1Eu+oecgEjtMUDpeGoI9DInz8S4HBMCVx2nIypzOFut
         KRqyrKnqRQ/9g==
Received: by mail-lj1-f197.google.com with SMTP id x3-20020a05651c104300b00247ebe980b7so3503414ljm.11
        for <linux-usb@vger.kernel.org>; Fri, 18 Mar 2022 07:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G59MB2rKDZvvgy8UDYIpU7naKS/ynlgqMNWbSSznKgc=;
        b=AFH+0CS7tSAOpee5wMyVDNJG8lB+1XyHlkS4smD2Zlfxsbad2iazabhOm61EZRS0Rm
         WwlonPRJBlo5LTzlLXM4xFkf55LkJX9PPNIoi6mEACqS4Q5eulRQqVVrcKfhtisbhA/V
         QlT9z9CACsPPZIWfUoAUZ7qLjR5V+pkey69lU2cbDorcCw6mh1ynQ6UMlb+glTlFtBIE
         hK0bomiZA50TTcf7rfP8Epfp4MhkE2rBAwJ2TL9cmjQ8TsYQWagnr30YUz7MbjiasFjv
         hxD3Urf7b7PrgAbpx10RgdSC2KDQF191plyk8pi6FcImaNAptxVZwfkNBEaCPr6VJEeP
         frXQ==
X-Gm-Message-State: AOAM5330KFzY6tG95JLjWsaJeLkJ4VaZNV5JSS1wQwvt/fX+OAV6G0OQ
        DqvbsDmpQXzRGafk6ni7Wx3ZCm3NsMa7PDaWxnIoyf8PdFzvlPpQVP+D3PUUq/2dvvMJ7Md1w3w
        2x5zxV8jYdjaEfAe7SuT0h8ucyHkgfCTJYbn58g==
X-Received: by 2002:a2e:a7d3:0:b0:247:f21a:e0af with SMTP id x19-20020a2ea7d3000000b00247f21ae0afmr6261580ljp.221.1647614092019;
        Fri, 18 Mar 2022 07:34:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYgrUVMRThi856oDBUSvgPNA/pjNqABryHQzPgFXFCiJ70xVg0233APDMbHBSvluNFcVd+hw==
X-Received: by 2002:a2e:a7d3:0:b0:247:f21a:e0af with SMTP id x19-20020a2ea7d3000000b00247f21ae0afmr6261570ljp.221.1647614091815;
        Fri, 18 Mar 2022 07:34:51 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id bt22-20020a056512261600b00445be337da5sm878390lfb.60.2022.03.18.07.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 07:34:51 -0700 (PDT)
Date:   Fri, 18 Mar 2022 15:34:48 +0100
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     hminas@synopsys.com, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: agilex: use the compatible
 "intel,socfpga-agilex-hsotg"
Message-ID: <20220318143448.j5cqes46m3yq277r@krzk-bin>
References: <20220125161821.1951906-1-dinguyen@kernel.org>
 <20220125161821.1951906-3-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220125161821.1951906-3-dinguyen@kernel.org>
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 25, 2022 at 10:18:21AM -0600, Dinh Nguyen wrote:
> The DWC2 USB controller on the Agilex platform does not support clock
> gating, so use the chip specific "intel,socfpga-agilex-hsotg"
> compatible.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
> index 0dd2d2ee765a..f4270cf18996 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
> @@ -502,7 +502,7 @@ uart1: serial@ffc02100 {
>  		};
>  
>  		usb0: usb@ffb00000 {
> -			compatible = "snps,dwc2";
> +			compatible = "intel,socfpga-agilex-hsotg", "snps,dwc2";

In the same patchset you sent a bindings change which is contradictory
to this DTS change.

This is wrong here and dtbs_check will complain.
