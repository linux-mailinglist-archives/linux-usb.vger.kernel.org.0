Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15F0612D418
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 20:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbfL3Tmy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 14:42:54 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38457 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfL3Tmy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Dec 2019 14:42:54 -0500
Received: by mail-ed1-f65.google.com with SMTP id i16so33685477edr.5;
        Mon, 30 Dec 2019 11:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k+mRwU7yM9otCy4QwokJTYZu23DgBGiqN1eFnTJfbXM=;
        b=UMoLIabg/qF8b5mFuffBxBr3QN2BhmPXZ/LRQxwNW7Tfa4GAeUz7dV4l0eBlT6AsFZ
         CRGd/oATizL2G7sZdFA/QzXDnHBB35onGLKHHGkHR5oy8duRiBhc9Cwd2p2sA8yGm05q
         IC4XWEmT50YBbepNXlVZsq8uOkdwq5Wj2lvegpMDpAMUrMx9HZ7DOVlR7kXx0QTcRQqe
         UKoBJqdLXQPYXlv8Z/pFCoAp3ehusVVIxfu+yOmLe6d8jmPm9Dp7w3rnc3lHmC2maesf
         sCISG4Xk6JRle+y72fzPyw62TyD9hLbB01rbJ8kyRxfsrue3Gv9ANOcaNlO0tDkpv9nR
         1RQQ==
X-Gm-Message-State: APjAAAXhJvlwda4EuWPoVVi8egeQ7wVw2dW5SQGdPRbn+EPKs52LP/2d
        UYcjcsrxLWEKpbWJnaMQj8M=
X-Google-Smtp-Source: APXvYqy4DAH08CdNCFU4rPeGGz0OWKuSIqcTJ2CUvx6b9yp8f8h4wrqnjpaShPoSj2WeR0kaUA8ovA==
X-Received: by 2002:a17:906:5448:: with SMTP id d8mr40456790ejp.254.1577734972285;
        Mon, 30 Dec 2019 11:42:52 -0800 (PST)
Received: from kozik-lap ([194.230.155.138])
        by smtp.googlemail.com with ESMTPSA id x10sm5767647ejf.77.2019.12.30.11.42.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2019 11:42:51 -0800 (PST)
Date:   Mon, 30 Dec 2019 20:42:49 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: host: Enable compile testing for some of drivers
Message-ID: <20191230194249.GA26581@kozik-lap>
References: <20191230172215.17370-1-krzk@kernel.org>
 <20191230192956.GA1844196@kroah.com>
 <20191230193621.GA1856526@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191230193621.GA1856526@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 30, 2019 at 08:36:21PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Dec 30, 2019 at 08:29:56PM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Dec 30, 2019 at 06:22:14PM +0100, Krzysztof Kozlowski wrote:
> > > Some of the USB host drivers can be compile tested to increase build
> > > coverage.  Add 'if' conditional to 'default y' so they will not get
> > > enabled by default on all other architectures.
> > > 
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > ---
> > >  drivers/usb/host/Kconfig | 54 ++++++++++++++++++++--------------------
> > >  1 file changed, 27 insertions(+), 27 deletions(-)
> > 
> > Nice, thanks for these, they should help out a lot with development.
> 
> And now I get this build warning with this patch:
> 
> WARNING: unmet direct dependencies detected for PHY_DA8XX_USB
>   Depends on [n]: ARCH_DAVINCI_DA8XX
>   Selected by [m]:
>   - USB_OHCI_HCD_DAVINCI [=m] && USB_SUPPORT [=y] && USB [=m] && (ARCH_DAVINCI_DA8XX || COMPILE_TEST [=y]) && USB_OHCI_HCD [=m]
> 
> 
> Care to provide a fix?

That's my fault. I was testing entire patchset which includes also other
trees. I sent patch for PHY here:
https://lore.kernel.org/lkml/20191230172449.17648-2-krzk@kernel.org/T/#u

Probably they should go together or we could ignore the error as it is
only for build testing.

Best regards,
Krzysztof

> 
> thanks,
> 
> greg k-h
