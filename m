Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F2A391A81
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 16:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234933AbhEZOoA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 10:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234632AbhEZOn7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 10:43:59 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3845EC061756
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 07:42:27 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id m18so1444277wrv.2
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 07:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ljH9mMUDK1DM0IEaCmogZoswTqlDL79fiiwslCag8I0=;
        b=S2mOFtu1doQsrdN4IovfMLMadWG2jFgpyD52zj/EDDoMHE3gxcOmNiinCmLK3cX99/
         GsB9BT9hLP9MzIYRgWd7aZiG6GnOUuzZcDpdEyUcMa+hkZ9Qqq1pxPEs6dwVplYa+XX5
         Pkm3t2Z0yGOwGt/AaDcksDvR8nu9k7kbGv77zQkZQrdhGDj7xEDmVXIqe4DZVYWL294n
         KHWa7/RjwdgWMLlAvzDFPEm7zSkBSvGMf8ey/t2DC/IFPiKMeRd3b8zcuFowWFsjgvqy
         INeeqMdVRibZ1uz8XBkOM2/4/7fG7CpYQBsX6ya9dA+Nq5qioghkFP0zBoaCWU9s05yf
         a/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ljH9mMUDK1DM0IEaCmogZoswTqlDL79fiiwslCag8I0=;
        b=Ymc9PNKtDKBo8GCpuT5deUGmtUuG6plQKWCekmkgv7JKUeMyX1EYkfcqBU8efUjnIY
         xox965fXekmhA+fseFlKuumZCl9kGWnU8KXm9w5IGXIY9sKxssz4i6oBrLjOWixbdliQ
         AB3trtXzkNIOITEk6jbuCHjf3t+wmCJajCRHUe/pK+G1iWzrBehsi5K3Mi6KZSiUu+/g
         Ta0GgcciyakFthTNdIMcetnJowSNB6y1Kq8qoecM35y6Fi8v+dErt2Lv6if1mxP74R4s
         A5WtfK8qmi0mqwIyJA7QhCi8XxZBIHbbmtj3aZBBedsEbguuKAwwHAa951zn4SgZU7w3
         KfQg==
X-Gm-Message-State: AOAM532Qxl5iShWOpaw1XOxhnYlapOBH0NxaMf7Qlwl+zPwOg9F7w9w8
        0EwmfQ0yjilorNFJnh4oT5cUoA==
X-Google-Smtp-Source: ABdhPJxs/KCYpLyVCz9xquqVVcpJeYGqsDQ5hmGDbae7Xyo5bq0tjWb9zPaUza1EMMWsvBEF0YYIpA==
X-Received: by 2002:a05:6000:1189:: with SMTP id g9mr32813090wrx.385.1622040145773;
        Wed, 26 May 2021 07:42:25 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id v127sm2258071wmb.46.2021.05.26.07.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 07:42:25 -0700 (PDT)
Date:   Wed, 26 May 2021 15:42:23 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        David Lopo <dlopo@chipidea.mips.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 13/24] usb: chipidea: core: Fix incorrectly documented
 function 'ci_usb_phy_exit()'
Message-ID: <20210526144223.GA543307@dell>
References: <20210526130037.856068-1-lee.jones@linaro.org>
 <20210526130037.856068-14-lee.jones@linaro.org>
 <16614428-45c7-06af-547a-dba9c493de67@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16614428-45c7-06af-547a-dba9c493de67@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 26 May 2021, Sergei Shtylyov wrote:

> On 5/26/21 4:00 PM, Lee Jones wrote:
> 
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/usb/chipidea/core.c:343: warning: expecting prototype for _ci_usb_phy_exit(). Prototype was for ci_usb_phy_exit() instead
> > 
> > Cc: Peter Chen <peter.chen@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: David Lopo <dlopo@chipidea.mips.com>
> > Cc: linux-usb@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/usb/chipidea/core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > index 3f6c21406dbd2..2b18f5088ae4a 100644
> > --- a/drivers/usb/chipidea/core.c
> > +++ b/drivers/usb/chipidea/core.c
> > @@ -335,7 +335,7 @@ static int _ci_usb_phy_init(struct ci_hdrc *ci)
> >  }
> >  
> >  /**
> > - * _ci_usb_phy_exit: deinitialize phy taking in account both phy and usb_phy
> > + * ci_usb_phy_exit: deinitialize phy taking in account both phy and usb_phy
> 
>    I thought - shoiuld've been used as a separator. Is : good here as well?

If I were drafting from scratch, I would *always* use '-', but
kernel-doc seems to work okay with ':' too, so I'm letting sleeping
dogs lie on this one.

> >   * interfaces
> >   * @ci: the controller
> >   */
> 
> MBR, Sergei

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
