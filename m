Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 956BBE1759
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 12:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390945AbfJWKG5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 06:06:57 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37007 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390496AbfJWKG4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 06:06:56 -0400
Received: by mail-ed1-f66.google.com with SMTP id r4so15307104edy.4;
        Wed, 23 Oct 2019 03:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EBRXEMc7lMsrJ/hp7p+9t6+SuvDqUDCqV0bNi5LwlYI=;
        b=rJREtFFkSZJ6Vtjz97lcic52ot7qIp5qnd0U0BP8TUzumZV6C6TzF/4mBiQYIIpoCR
         KFKjLEmH0jCNttvMuU9e7xh16IsiBvqKOIonLIv1ePUPJjsEEIGUxOHea9rbgk01/MRD
         qn9eWmjldYsRS72TOwYj3LJfjG1opoYpVT2/gDRkKjNpZ+YMUzd+MvQWpWAluTMsblLc
         PAEqD3n8kOWoLdYrSquKXKs+l2kHpl+IJKJjjgg+hh7vj7kz+6AnRUpoiIQhCKA040Pm
         8HIgskAaR92DWo1pVTB5g5YNuIpy5KU+2igt7Dg75l8ky1qEQ3+9Wt+IDCnTiRbkxpyr
         /UwA==
X-Gm-Message-State: APjAAAXIm/Plf6YK8gj5xWrxN4JN0D3be43lzhZ25oy9fG6pnMRYLuqc
        y42ekP49jQ3QziIxo5uKjvA=
X-Google-Smtp-Source: APXvYqzmUyleea+kaoxwbwCps1piJlDZMPDxMUqgQmotfwkU5RMpq6RZ19BwwBOBQG+256tr0IQnzQ==
X-Received: by 2002:a50:ab10:: with SMTP id s16mr35925216edc.118.1571825214725;
        Wed, 23 Oct 2019 03:06:54 -0700 (PDT)
Received: from pi3 ([194.230.155.217])
        by smtp.googlemail.com with ESMTPSA id a26sm831024edm.45.2019.10.23.03.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 03:06:53 -0700 (PDT)
Date:   Wed, 23 Oct 2019 12:06:51 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 03/36] usb: gadget: s3c: use platform resources
Message-ID: <20191023100651.GA10630@pi3>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-3-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191010203043.1241612-3-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 10, 2019 at 10:29:47PM +0200, Arnd Bergmann wrote:
> The resources are correctly initialized, so just use them
> instead of relying on hardcoded data from platform headers.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/usb/gadget/udc/s3c2410_udc.c          | 31 +++++++------------
>  drivers/usb/gadget/udc/s3c2410_udc.h          |  1 +
>  .../usb/gadget/udc/s3c2410_udc_regs.h         |  0
>  3 files changed, 12 insertions(+), 20 deletions(-)
>  rename arch/arm/plat-samsung/include/plat/regs-udc.h => drivers/usb/gadget/udc/s3c2410_udc_regs.h (100%)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

