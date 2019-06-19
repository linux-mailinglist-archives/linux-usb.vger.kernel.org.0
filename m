Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0FD34B69B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 13:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbfFSLDR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 07:03:17 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45814 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfFSLDR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jun 2019 07:03:17 -0400
Received: by mail-lj1-f196.google.com with SMTP id m23so2768611lje.12
        for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2019 04:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Luu+5rYK+UBQnap9xN87KqCbR3KAr2ZJr7v5Aor7Sgw=;
        b=suXYxAMjz59lvhJQHLgFctHetXVze4fq6LJGfaHu6u7dSe6wuf8VLeA1vMnT0cU6rf
         Z9pxXFNyqsVWBeGLKWj8hm4bYSCwh3SRygkdWUtJZ4pXHbDi1x83/66f4loPVQRUtUdo
         X5RpmJ+T37cPHdZZ2syt9SQ8iMdI5qv4Ygyn8kmrVNopPOome4/wjVWlCoMw+e5ujuxp
         F70SQkw9/wHNU4Y7qJNWVd30IopBNYHLRey89xb8qieITXXlaBBns4l+ac3+c8G0wVEd
         reHNjtFKFKOlNoKOngYOc8Q0wNNwtQVfWG27aJHuhnhn7xLH/rHIbg/p+TDnt1GiPpnD
         +NCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Luu+5rYK+UBQnap9xN87KqCbR3KAr2ZJr7v5Aor7Sgw=;
        b=O63u/8Nbv/Eod9m3KNRNGWAg5HKYqZmhWJNHCWq8cIYQjWrbEFaDLrNCsmt0tdM1Cb
         5oy2nafo7ewUoSnsUTB0J/HD32ATBIW8ljx9sDnV6sCQazesGqEaPHbwJxJL6rT4ah79
         n+N1H8vHoerUe21/xhhlZadsgJas2c0u71Ffx+rbwHi3Apr+O3GI1l1zy3EXEs5OgqUy
         3V3g/SCwieWgrd+J+/G918NMROpYz2kLhvWG2bU8goPW+Tlzg5jna60PD1fxlUCuHdIx
         515sAdYfWu34r2/uwNW27dfmtSZWByUIw/UatcAxfnzY870Yso4Z97FFpsLIym9qTnHx
         kpAQ==
X-Gm-Message-State: APjAAAWkWH9bWrksVSxfBLkBr/O4lr53n+Lov8MslgX5r+y1MYcdxg/D
        MoZ1X8W7oImvLYgOzpy4ZMo5Mg==
X-Google-Smtp-Source: APXvYqxZ9IA0ppIbwUalwcRBMLFQVzuYiFSFtfCmTlzFHAB17QSbWvFXviSuBgZd2h5m1cAPIFzY6A==
X-Received: by 2002:a2e:9b84:: with SMTP id z4mr36740332lji.75.1560942195085;
        Wed, 19 Jun 2019 04:03:15 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id x19sm3062896ljb.6.2019.06.19.04.03.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 04:03:14 -0700 (PDT)
Date:   Wed, 19 Jun 2019 13:03:14 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] dt-bindings: usb: renease_{usbhs,gen3} Rename
 bindings documentation files
Message-ID: <20190619110314.GC18708@bigcity.dyn.berto.se>
References: <20190617090603.8449-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190617090603.8449-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Simon,

Thanks for your work.

On 2019-06-17 11:06:01 +0200, Simon Horman wrote:
> Hi,
> 
> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas USBHS and USB 3.0
> peripheral documentation files.

With Shimoda-sans comment on 2/2 fixed for the whole series,

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Simon Horman (2):
>   dt-bindings: usb: renesas_usbhs: Rename bindings documentation file
>   dt-bindings: usb: renesas_gen3: Rename bindings documentation file
> 
>  .../devicetree/bindings/usb/{renesas_usb3.txt => renesas,usb3.txt}        | 0
>  .../devicetree/bindings/usb/{renesas_usbhs.txt => renesas,usbhs.txt}      | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/usb/{renesas_usb3.txt => renesas,usb3.txt} (100%)
>  rename Documentation/devicetree/bindings/usb/{renesas_usbhs.txt => renesas,usbhs.txt} (100%)
> 
> -- 
> 2.11.0

-- 
Regards,
Niklas S�derlund
