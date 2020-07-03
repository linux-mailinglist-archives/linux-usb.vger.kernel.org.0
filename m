Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6368C214015
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 21:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgGCTo4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 15:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgGCTo4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 15:44:56 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078A7C061794
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 12:44:56 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id r12so33807997wrj.13
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 12:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=F3b2vOuE0IiTF4n5D1mX7a/OT5cq2aJSt3VlxRKtnS4=;
        b=IJg2Hr28t8MBlJ38XwGDbawIOS0VXTGu6C2fVNa2Cn4FxhLyOfZV4PRhmxLzkvhx1h
         h0KlcVDXfpcmRwS4Wnm5rvhXEKAP2m73t5UQLBNKGIeZF1id7D6A+2MmhfQVS9Jp/4ax
         n6MwmCFNOkrc8nsX5bf2pF0N6kzpfCI66jFn5yPzD9s5NlpVNUwkHD1/nIHhehfNS4yJ
         h69ic3rtWrhtmvUUVMMfCbASJKgvpAJeKnKDm6GCb3F8IuNMjb+JdEzQ5azKvaK9/nKd
         /r3OnvFHZFzXM7tu0Gb6YF7ouZMgYJnKMldGQDLvq2g4/0yb0FRFgJXG4vrfNZzi/y/y
         PEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=F3b2vOuE0IiTF4n5D1mX7a/OT5cq2aJSt3VlxRKtnS4=;
        b=GpMGjm7auYSrdbWOOu0ET0TgE7YeYD3NXMekl1rMmr2cTtGEG+Phet1qJe4tN/9Ji4
         4FTqKmqoaLzf9DxyoDESTxoOolo2kITSUwuop7RGLwfQayJlkvZGNDUfz7vHmSYBna1L
         4iOtkTZC+OVT+m/HIK+4HPx0cL8NlZ83bdQfROqA5Arod84TI0pG+FHW9/K77R8vcNjE
         HyeGWUgcKW0V20PbCgSOXpka82IXL/XwJS9ewsJKoet+xLUaZvTUG4mmZtGFqzRhSagG
         Z1bvp1w/xDVaCzvuWQ7rj/44C9eYOYWqfav6/N7mX9lY6qXhCe0OCtmJRBxEwTCx4M8Y
         OP/g==
X-Gm-Message-State: AOAM532iInQxjCq8Zrx8Xa38swA/5KVeY0ORnK400jZzyLnvZZXbzTU9
        im7o22jJaiqyhEj/4G1QFTRS9g==
X-Google-Smtp-Source: ABdhPJxmI5XKxMwwvm/6A65zIhp6cs4iNAqe7col6ivLMh3hoqJWKRSLujYTZrqKsS+LfOwNZ3AmcQ==
X-Received: by 2002:adf:f311:: with SMTP id i17mr39822583wro.237.1593805494725;
        Fri, 03 Jul 2020 12:44:54 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id f16sm14235349wmh.27.2020.07.03.12.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 12:44:54 -0700 (PDT)
Date:   Fri, 3 Jul 2020 20:44:52 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Joe Perches <joe@perches.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>
Subject: Re: [PATCH 04/30] usb: misc: sisusbvga: sisusb_init: Mark all
 'static const' arrays as __maybe_unused
Message-ID: <20200703194452.GF2743379@dell>
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

Potentially not by every consumer of this header file.

> I think these instead should be moved to where
> they are used instead of being declared in an
> #include file.

That works if they are being used by only one source file.

I'll look into it for this instance and get back to you.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
