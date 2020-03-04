Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBC68179622
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 18:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388485AbgCDRAu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 12:00:50 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39044 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388477AbgCDRAt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Mar 2020 12:00:49 -0500
Received: by mail-oi1-f194.google.com with SMTP id r16so2793000oie.6;
        Wed, 04 Mar 2020 09:00:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bvUO0xB3VGYu4Z2CRkBy08hE9OAN6dg9T4shXkHV/8s=;
        b=A45c3U47ZW3now/2ZVwmZXpzGco2DOd/CWWr2oS3DpOET+s1212dpJ/0Qm0fAMoJiI
         2ivwZoxFcwdBbxLJf898S8BG+K5Mq8iBtyoLodw7Gsf25vByH1Yih5N2wGc+J4HJv7MY
         GTz3cUdPIfPDKUSb3uBC4Pz+SVxyopxrIqmkjzLoAQMz7sfOuDhykrtTMdihIUG5khov
         X56d8/vmDxNmYhYrU6CdjxyAr7JIQScJv7Wf0nILd8UwWHPLqkwrCZi/J7fNkgkE/FiD
         z4/WyQxCV0S5GwOsdvM4JWXtXSeTsNGqbplS0I/sl74+mpBhQQWBo5jePy8lzg0z9wYj
         MoVw==
X-Gm-Message-State: ANhLgQ130h/qa1yBBJWLPUfAu/08qiS7FS4lvliFKQBMERj1ADN681NG
        WAPP0hciaVwaxteTwR9heg==
X-Google-Smtp-Source: ADFU+vu5jR7LujK8P5X0FKafcLM7pYgZwcvHPs+Vyd8d91tSDJ6u0F2ruymgkLi6GWrxyPaChe9Qsg==
X-Received: by 2002:aca:4a4b:: with SMTP id x72mr1141376oia.86.1583341247943;
        Wed, 04 Mar 2020 09:00:47 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t20sm8895859oij.19.2020.03.04.09.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 09:00:47 -0800 (PST)
Received: (nullmailer pid 25284 invoked by uid 1000);
        Wed, 04 Mar 2020 17:00:46 -0000
Date:   Wed, 4 Mar 2020 11:00:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 1/3] devicetree: bindings: exynos: Add new compatible
 for Exynos5420 dwc3 clocks support
Message-ID: <20200304170046.GA25246@bogus>
References: <20200301212019.2248-1-linux.amoon@gmail.com>
 <20200301212019.2248-2-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200301212019.2248-2-linux.amoon@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun,  1 Mar 2020 21:20:16 +0000, Anand Moon wrote:
> This patch adds the new compatible string for Exynos5422 DWC3
> to support enable/disable of core and suspend clk by DWC3 driver.
> Also updated the clock names for compatible samsung,exynos5420-dwusb3.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Previous changes:
> 	Added the missing clock name for Exynos5420 complatible
> ---
>  Documentation/devicetree/bindings/usb/exynos-usb.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
