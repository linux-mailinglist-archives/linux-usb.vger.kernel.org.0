Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D29F217FA0
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 08:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729320AbgGHGey (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 02:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgGHGex (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 02:34:53 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C229C061755
        for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2020 23:34:51 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r12so47535251wrj.13
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2020 23:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=N92QX9YZEEvlxOb5ijBkwhfWTJnn9g4c3VHtW0cFzH0=;
        b=dSLPGlUndLvy1fGVV0FNs8Fv2ovwK3vqMROgk9WEF3u8LkOnLKIMN12Eid0o19PdG/
         rqQnYwHjYJHt+u2Fn5hp0rHSitWEHOowmZeJJV4NKoK9RpK6Oeqq7R+g6CwVP4hWvAE6
         FLHkUuqx8bqAottPlNDoY9BthtA3ZHUv6aXqNQjWXbB1/pAeAaUcAtehz94KRe1QucCE
         W57aDxYoU88jAsahWwzunJOYWFE6ItZ8adLvaPtqS1NCF2jbbWGVA+SsN53rZDEBsr9R
         nqg3pNxxdTZE+/k7nCgv4wO0zF8HA9WeuqwZCzMayZ7ViqpAzxxtLaXoC7a3gkLjrD69
         JC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=N92QX9YZEEvlxOb5ijBkwhfWTJnn9g4c3VHtW0cFzH0=;
        b=BDAMTEDB+vF/KE5qVsJuTSNI70DQx1PfUQ/8436A3or9RUBJ/JKCzpRIpsQvGOzF8P
         G2Eho1FY8mhj03hTiluDyB7MS4ykZE9cptJTumKvFzTGD2Oo+rL+TbMdDV06QTWUK2cG
         BzekDo0b62NV1xUnt7SVKQV5+AOyDNe+D6muKpeQDjR/er2ZK4ULUL8fRei3Ci3XEMMR
         w5nALjHuIuVlIOvsSCXNK+Qqt53Qy87cFFNviqbmIEHIYxmiaX3PR5+chgG+Vg5FMYgQ
         xNRD46+lbm5sXf8ckCgol3i0ol1am5p726DToAEpsHgRBTIKm9Dngnv3T38sQmgCrGn2
         C3Bg==
X-Gm-Message-State: AOAM533WMsoPyWM4KrgPhURVLLU+9EtAbr9kNLGFkLs1dtIUEzvlGa8M
        QJcJAa7jF5iIpqBoLM7cFam5fw==
X-Google-Smtp-Source: ABdhPJz764DvGh/eCrVSAuXsmbNuLINUXpni7rvl11e9ky1g74tWCRJMsxjTH+J5eCJ8AK3AdOoT9A==
X-Received: by 2002:adf:e647:: with SMTP id b7mr60992159wrn.170.1594190089831;
        Tue, 07 Jul 2020 23:34:49 -0700 (PDT)
Received: from dell ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id a123sm4556077wmd.28.2020.07.07.23.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 23:34:48 -0700 (PDT)
Date:   Wed, 8 Jul 2020 07:34:47 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Joe Perches <joe@perches.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>
Subject: Re: [PATCH 04/30] usb: misc: sisusbvga: sisusb_init: Mark all
 'static const' arrays as __maybe_unused
Message-ID: <20200708063447.GI3500@dell>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
 <20200703174148.2749969-5-lee.jones@linaro.org>
 <af66b6e94a26ebd500c1376631891b0bdd0912f0.camel@perches.com>
 <20200707080311.GE3500@dell>
 <51eeed808ce61e0d7b7978b2dfd4fd80f315b3b1.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51eeed808ce61e0d7b7978b2dfd4fd80f315b3b1.camel@perches.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 07 Jul 2020, Joe Perches wrote:

> On Tue, 2020-07-07 at 09:03 +0100, Lee Jones wrote:
> > On Fri, 03 Jul 2020, Joe Perches wrote:
> > 
> > > On Fri, 2020-07-03 at 18:41 +0100, Lee Jones wrote:
> > > > drivers/usb/misc/sisusbvga/sisusb_init.h is included by a few
> > > > source files.  Most of which do not use the majority of the
> > > > shared static const arrays which have been declared.  This
> > > > causes the build system to spew 100's of warnings.
> > > > 
> > > > Fixes the following W=1 kernel build warning(s) - and a whole lot more:
> > > > 
> > > >  In file included from drivers/usb/misc/sisusbvga/sisusb.c:54:
> > > >  drivers/usb/misc/sisusbvga/sisusb_init.h:695:34: warning: ‘SiSUSB_VCLKData’ defined but not used [-Wunused-const-variable=]
> > > >  695 | static const struct SiS_VCLKData SiSUSB_VCLKData[] = {
> > > >  | ^~~~~~~~~~~~~~~
> > > > [10's of lines snipped]
> > > >  drivers/usb/misc/sisusbvga/sisusb_init.h:206:28: warning: ‘SiS_VGA_DAC’ defined but not used [-Wunused-const-variable=]
> > > >  206 | static const unsigned char SiS_VGA_DAC[] = {
> > > >  | ^~~~~~~~~~~
> > > > [10's of lines snipped]
> > > >  drivers/usb/misc/sisusbvga/sisusb_init.h:171:29: warning: ‘ModeIndex_1280x1024’ defined but not used [-Wunused-const-variable=]
> > > >  171 | static const unsigned short ModeIndex_1280x1024[] = { 0x3a, 0x4d, 0x00, 0x65 };
> > > >  | ^~~~~~~~~~~~~~~~~~~
> > > > [10's of lines snipped]
> > > 
> > > They are not __maybe_unused, they _are_ used.
> > 
> > Actually, it looks like all of the ModeIndex_* table are *not* used,
> > so those will be removed.
> > 
> > > I think these instead should be moved to where
> > > they are used instead of being declared in an
> > > #include file.
> > 
> > The remaining tables are many and large, so stuffing them into the
> > source file does not seem like the correct thing to do.
> 
> It the right thing to do is because otherwise they
> would be duplicated.  Either declare them only in
> the single file where use or declare them extern
> and define them only in one place.

I refuse to dump 700 lines of nonsensical cruft (data) into a
source file.  No one wants to parse through that in any C file they
maintain/operate on.

Not sure I understand why they would be duplicated.  The *-tables.h
header file will only be included by the 1 source file that makes use
of them.  Could you please elaborate?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
