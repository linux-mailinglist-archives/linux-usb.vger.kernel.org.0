Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02BD66E40B
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jul 2019 12:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbfGSKNp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jul 2019 06:13:45 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45095 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbfGSKNp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jul 2019 06:13:45 -0400
Received: by mail-lf1-f65.google.com with SMTP id u10so21333537lfm.12;
        Fri, 19 Jul 2019 03:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3eOaO8b46JVTY5BQCoiJlQXWtXkQ1FuDZwjZs+dnrSE=;
        b=fVTwkkvUcKmAaGMXV+0Bw9Tx2O3qdbx0VpC4XtuBZd/xJCCkwCCx0vxwZpitrRd2tb
         V/3zqJm9wl3taTtQKXDEHfynJpD/YWdjNSiXhpDYSIY+zd4SJsUowpxvhO9vwypG+GWI
         xYP0jK/BFetXvukiubrs8JtkLTx5wV57vqPVzEtI/CvmvEYZ96ST/CSIvIIlm08Piq3B
         YRd7vc++VMBSL6s9XZ7sLMSeLouC3K2iJVcv2OW3+BHcI2qQrH3C6BoE+iQArUbOVMd7
         lq8H13jLVYv2/7DTS71M8djby1Fi5oiLSogF0z1V5tIyTU0bvtRuyIVF98Del3zS64N9
         JHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3eOaO8b46JVTY5BQCoiJlQXWtXkQ1FuDZwjZs+dnrSE=;
        b=YKhawQWWG4j5AH5t467Vxyl4eeHGa81fS6Og1K7Gc+FOG22fpNJl3EpqxTDmPOSJW6
         souZadeWl+7rhAP/1ymSwrlkKQyy15zBSRf4ayYDqS71qX0yMFtm6vkCCQsH6ryRcQCo
         3xFezgfZ/1KtuMSBfHm+pWkW8+Ure/9U7ynHeGIsp2LABCEfzATGp15j61cKEUiZ9v7k
         0UXyPzFCMFePUaebmqOrqZxvy3sI2R8MftJgaVLmIq0y2DGMfzFC0WHHTZoMxU5t7T1T
         6wsUcS/Jab7WSgTuwlwJmUL1HAdnZj5MOFvqhKllMloIzDcGWEyvb1BdnIur2AvGT1vh
         IUeg==
X-Gm-Message-State: APjAAAUORqrUpqaj4H5pZgGtXmGjZq2q1Rm65wb16eW/5XLGCZCmv3Ef
        gbf5xmK99BnT85xhSv6SUt8=
X-Google-Smtp-Source: APXvYqz6fxz8kMOMNTnqsp+GWMT2ojNUCsxyACj+rcg5U8T+DweWwo9ij02NCg9I9X4LEnqU1Dileg==
X-Received: by 2002:a19:a83:: with SMTP id 125mr2088900lfk.150.1563531220977;
        Fri, 19 Jul 2019 03:13:40 -0700 (PDT)
Received: from mobilestation ([5.164.204.238])
        by smtp.gmail.com with ESMTPSA id h4sm5619925ljj.31.2019.07.19.03.13.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 19 Jul 2019 03:13:40 -0700 (PDT)
Date:   Fri, 19 Jul 2019 13:13:38 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Richard Leitner <richard.leitner@skidata.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH 1/3] Revert "usb: usb251xb: Add US lanes inversion
 dts-bindings"
Message-ID: <20190719101337.36omwmqc4lbtw6do@mobilestation>
References: <20190719084407.28041-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719084407.28041-1-l.stach@pengutronix.de>
User-Agent: NeoMutt/20180716
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Lucas

On Fri, Jul 19, 2019 at 10:44:05AM +0200, Lucas Stach wrote:
> This reverts commit 3342ce35a1, as there is no need for this separate
> property and it breaks compatibility with existing devicetree files
> (arch/arm64/boot/dts/freescale/imx8mq.dtsi).
> 

Hmm, didn't know there had been anything staged to merge and touching this
property before submitting the update. We must have done it nearly at the same
time, or your patch hasn't been merged at the time I prepared mine.

Anyway why would you prefer to change the interface again instead of
following the existing way? Firstly It is much easier to fix the dts-file
than to revert the interface back and break dts-files of possible other users.
Secondly the chip documentation doesn't have anything regarding port 0.
It states to swap the Ports from 1 to 4 (usb2514) corresponding to the bits
1 - 4 of the 'PORT SWAP' register, while bit 0 is connected with explicitly
named Upstream Port (without any numbering). Thirdly having a separate
property for US port makes the driver bindings interface a bit better
readable/logical, since in current implementation there is no implicit/unspoken/hidden
rule that port 0 corresponds to the Upstream Port, Port 0 just doesn't exists
(following the chip datasheet text), and the other port-related properties are
only applicable for downstream ports. So the driver code rejects them being
utilized for a port with 0 identifier. The only port-related setting being
exposed by the interface is the swap-port-one and it has a separately bound
property 'swap-us-lanes' for the Upstream port.

As for me, all of this makes more sense than having an implicit Port 0 - Upstream
port binding (as you suggest). Although the final decision of which solution is
better is after the subsystem maintainer after all.

Regards,
-Sergey

> CC: stable@vger.kernel.org #5.2
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
> index bc7945e9dbfe..17915f64b8ee 100644
> --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
> +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
> @@ -64,10 +64,8 @@ Optional properties :
>   - power-on-time-ms : Specifies the time it takes from the time the host
>  	initiates the power-on sequence to a port until the port has adequate
>  	power. The value is given in ms in a 0 - 510 range (default is 100ms).
> - - swap-dx-lanes : Specifies the downstream ports which will swap the
> -	differential-pair (D+/D-), default is not-swapped.
> - - swap-us-lanes : Selects the upstream port differential-pair (D+/D-)
> -	swapping (boolean, default is not-swapped)
> + - swap-dx-lanes : Specifies the ports which will swap the differential-pair
> +	(D+/D-), default is not-swapped.
>  
>  Examples:
>  	usb2512b@2c {
> -- 
> 2.20.1
> 
