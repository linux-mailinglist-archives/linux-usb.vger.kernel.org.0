Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45EA12167F1
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 10:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbgGGIDP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 04:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbgGGIDP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 04:03:15 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D30C061755
        for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2020 01:03:14 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r12so44060629wrj.13
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2020 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mMZpUKfqpJCdbAhsZp+bXjqEnQ4z2yPe16N+eOasptM=;
        b=CfqqS+lWIiN0P+noAXvDnsJP+vvKJH1pGpe6wR/eDn+gDpTDB6XlzvA1O82fWtEMno
         Ki7iRep7tGg2zVXbSxW27Q950XkwGmY2uQBXwEAsbViVMf/cldEOS2mX30FrDp8KTKyK
         a57MleK0nWcnTlQ/TsoFxGTvUHatmaqb65XI6F4BpZ6d7Nv0cK9fzhJ2V7pnYfq6iKc7
         M8qAuVUB4WjUSdt97tDmgEZY4HpyexXnpJPOTG4mLJF/fQcIIuqeHasmLXgoAaea2Luu
         AITsf8jPhP0+M1Jx3eP3yAP/AE4ZG5UxcPnSH8Y5idwstO/Dc9K2lFQ74GY1Aynb17LO
         gC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mMZpUKfqpJCdbAhsZp+bXjqEnQ4z2yPe16N+eOasptM=;
        b=f6P0GQrkSft5zRpz3PErCYU0V0qRwtEcRHtnleMPr1NbrBOKMJQCLnaJ5XhMA1Gs1I
         qRnrUc//b5KuZwT0lsl1M6SYMcINmInvq8LBSLHPiwbMryBxmibGYYC6tCIdoMoUAid3
         LNJqWzA56Z3A1FrZh1JqTS4mYEyok0fNjJuS/mLgd5j4pLl0JewRk6IocwH8nO3uei9Y
         ZtX193tdepuDswIwPXKl4wvG8ha9xf5HeO/SyoDKwE4G/Y9M8MkMoZeX2f0rNmdxq/Sc
         B3lFob6e9xHbaVRhx7f/vOmQRtZynlj0cnXQDSAB7qpjuhPWcqr8a7ODEofpLxdwNT3Y
         KdlQ==
X-Gm-Message-State: AOAM531ZRwMmXkK3XWQYV3gKel780IE7lsYjSl2TWgpU8I+YaPbR47zd
        WqFOcbTHxEASexCKkdugrlLegLWxEbg=
X-Google-Smtp-Source: ABdhPJwcpPtoD7n14Ffrr43fIwA5zL6dutKmKygss05H+0o2d5I4bzNNKViRKd4dKqbjeRyRASpwzw==
X-Received: by 2002:a05:6000:1283:: with SMTP id f3mr53367032wrx.106.1594108993639;
        Tue, 07 Jul 2020 01:03:13 -0700 (PDT)
Received: from dell ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id 12sm2340143wmg.6.2020.07.07.01.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 01:03:12 -0700 (PDT)
Date:   Tue, 7 Jul 2020 09:03:11 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Joe Perches <joe@perches.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>
Subject: Re: [PATCH 04/30] usb: misc: sisusbvga: sisusb_init: Mark all
 'static const' arrays as __maybe_unused
Message-ID: <20200707080311.GE3500@dell>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
 <20200703174148.2749969-5-lee.jones@linaro.org>
 <af66b6e94a26ebd500c1376631891b0bdd0912f0.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af66b6e94a26ebd500c1376631891b0bdd0912f0.camel@perches.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 03 Jul 2020, Joe Perches wrote:

> On Fri, 2020-07-03 at 18:41 +0100, Lee Jones wrote:
> > drivers/usb/misc/sisusbvga/sisusb_init.h is included by a few
> > source files.  Most of which do not use the majority of the
> > shared static const arrays which have been declared.  This
> > causes the build system to spew 100's of warnings.
> > 
> > Fixes the following W=1 kernel build warning(s) - and a whole lot more:
> > 
> >  In file included from drivers/usb/misc/sisusbvga/sisusb.c:54:
> >  drivers/usb/misc/sisusbvga/sisusb_init.h:695:34: warning: ‘SiSUSB_VCLKData’ defined but not used [-Wunused-const-variable=]
> >  695 | static const struct SiS_VCLKData SiSUSB_VCLKData[] = {
> >  | ^~~~~~~~~~~~~~~
> > [10's of lines snipped]
> >  drivers/usb/misc/sisusbvga/sisusb_init.h:206:28: warning: ‘SiS_VGA_DAC’ defined but not used [-Wunused-const-variable=]
> >  206 | static const unsigned char SiS_VGA_DAC[] = {
> >  | ^~~~~~~~~~~
> > [10's of lines snipped]
> >  drivers/usb/misc/sisusbvga/sisusb_init.h:171:29: warning: ‘ModeIndex_1280x1024’ defined but not used [-Wunused-const-variable=]
> >  171 | static const unsigned short ModeIndex_1280x1024[] = { 0x3a, 0x4d, 0x00, 0x65 };
> >  | ^~~~~~~~~~~~~~~~~~~
> > [10's of lines snipped]
> 
> They are not __maybe_unused, they _are_ used.

Actually, it looks like all of the ModeIndex_* table are *not* used,
so those will be removed.

> I think these instead should be moved to where
> they are used instead of being declared in an
> #include file.

The remaining tables are many and large, so stuffing them into the
source file does not seem like the correct thing to do.  Instead I
shall move them to their own "sisusb_tables.h" include file where they
can be referenced only by the file(s) which make use of them.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
