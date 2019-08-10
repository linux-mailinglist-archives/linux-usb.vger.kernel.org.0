Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80E308870B
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2019 02:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfHJACx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 20:02:53 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39442 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfHJACx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Aug 2019 20:02:53 -0400
Received: by mail-lf1-f66.google.com with SMTP id x3so16918334lfn.6
        for <linux-usb@vger.kernel.org>; Fri, 09 Aug 2019 17:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=AA9v8dxfCCblJqMoNCF+8j4H1UmYH/D+RZS5ewmEe+s=;
        b=lx/LC+eKE3aevRot99Bn/5gxXD1PF/y9WkfcmZd3f3ET2dEEk+HweSEA0bsc8IpmT0
         qtj8YUCMcGSg39e5oOXJekABpAMlf3jPn5eyVzW1aZ6CJmOUzr9TCV/owN+SmffqAkqC
         TBt//U6YgoctpCOJbmL6c1NrZNcwEv4hDQauH8PnxmLFPeJ1y3gtP03nK0xm1kxezkmK
         DfN36RuJ0G6M5X8NiZlkNg0sPmSFY36Afs4moLgQ8+4PzB/kJ8oZvYOSxaRP1hPhrLsi
         o7e/8G9R6ZrozwFN23L9+4HwnQYbTdPB3xrV1MCtI7TCEcWS/uGReKDD+WjOGOGmO6qL
         LKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=AA9v8dxfCCblJqMoNCF+8j4H1UmYH/D+RZS5ewmEe+s=;
        b=QXkaGMpnpcqn06ETVBHuidcUzrSO1w4ATqWrRIYRqnBwxbFbN3TXZuwnF1NAvoQLj5
         s8eiR5Whuxl+f63wqyqTVffI1irS1vxbJlno4kA+8QWRKFCK8Z6zO7IF26gNeH/MrWMD
         PkQF7XmhbAITUBj0CLorFlGQ/CBOr9y79rD//tARtnbQVenxptraKLJuKGPP8a/4KmBh
         sNoncgqbTKF8ucQvPIJ3oLbG2dzmDY6HQHQlyK16I4VhnNLtkoRnGGxd48+f0+mtM1gp
         IuyDKwWgRuOiYDVlXNDz92jFvoduSJqcUXmjyANyqaFjsfNNLT63/minE+PeWO0GG4an
         D0Ww==
X-Gm-Message-State: APjAAAXf+jShFW2dpamUP+DL5GZiUfzuILSOoZl1BKD9DCVOeEo03m5e
        mfWpdIeg5IVA7yA/Hn37jmqbNw==
X-Google-Smtp-Source: APXvYqzYg17dNbQ7istBhfp2oTQBSDWS4a2fNxYBL5FMm/Pqvn+OsRUwnLTP04cgqMppoLXqBOh4SA==
X-Received: by 2002:a19:7006:: with SMTP id h6mr14109459lfc.5.1565395371056;
        Fri, 09 Aug 2019 17:02:51 -0700 (PDT)
Received: from localhost (h-177-236.A463.priv.bahnhof.se. [217.31.177.236])
        by smtp.gmail.com with ESMTPSA id y5sm19545824ljj.5.2019.08.09.17.02.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 17:02:50 -0700 (PDT)
Date:   Sat, 10 Aug 2019 02:02:49 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file to reflect IP block
Message-ID: <20190810000249.GB28494@bigcity.dyn.berto.se>
References: <20190809213710.31783-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190809213710.31783-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Simon,

Thanks for your work.

On 2019-08-09 14:37:10 -0700, Simon Horman wrote:
> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> documentation file from renesas,usb3.txt to renesas,usb3-peri.txt
> 
> This refines a recent rename from renesas_usb3.txt to renesas-usb3.txt.
> The motivation is to more accurately reflect the IP block documented in
> this file.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> * Based on v5.3-rc1
> 
> v2
> * Add review tag
> * Correct changelog
> ---
>  .../devicetree/bindings/usb/{renesas,usb3.txt => renesas,usb3-peri.txt}   | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/usb/{renesas,usb3.txt => renesas,usb3-peri.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3.txt b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/usb/renesas,usb3.txt
> rename to Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas Söderlund
