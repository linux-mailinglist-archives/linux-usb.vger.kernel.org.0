Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D9B2167B9
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 09:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgGGHtH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 03:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgGGHtH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 03:49:07 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B57C08C5DB
        for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2020 00:49:06 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id g10so1136381wmc.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2020 00:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=W6+Y6r86ImCcZkb8aCBe4d7KrulRrBvaqwJn2RJAx2I=;
        b=tcaw/YUxKfebdDxQAgl2sSg95mNElUbe0CpVC/1QaHP6xpMsX7cyHGHPdZx3l8sTkB
         oTfpYuQfn/DPl9VW3f0ntYe0Nx2eefJqSklbScz6DfSIUDv9WLjm9gBosIbBgvEx9lmd
         4b+d6fQ6ft2nXKX4rDYtmPp940l71i6aaz4Oa6HdRy0QrwBd/AouJdvI7zEMCLgEMqEX
         6xkbNHlL3MM2OouSgN/+IIWdrU8R2qyqDGOB1Ao/QJJ1QK8NKGTfQPf7fell7AWWXpbz
         ++grSOp6Smmt/NommWyiTeDtG06M7kyq1nO9LKrITHABgmPedfLWDwLly+y1XlVIe1a0
         padg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=W6+Y6r86ImCcZkb8aCBe4d7KrulRrBvaqwJn2RJAx2I=;
        b=NgGIGwYuLYircgz8+/gTXMDgDD9MwnJ8z9o0CQD8Vu1yXKeB8QlFT+IvS8PDgkqsFh
         mjuGYoI+UaHeBfKFk6DnTX9OoPhJCNUDisUYQaG0reu7tw0glj4L3/TQf3mFn8rSDgHo
         BS3Qzi+SUm2RAs+llic1nud2IUMxXuTBbcKYsCv/Vv52vBEZ8hAUE8e9jBT2X/VI/IA2
         je1ZzFDpAfwo1QTtXGZK+VXdRlJ9RSPz1s0kq08b1ZFPYonFy7p9yVLMPkYR5WFWzqv8
         BzoxCkSD7DJP9A4ctLkCnQwnAIx7M/4IRn1diiWPacAdy/Bjciy/EB8eOSoscEt3jxZx
         6zjw==
X-Gm-Message-State: AOAM531u6RB2a+5PSfz4Ny8BhviwFuXCM28PC+NNqw+1ZinXMLQ/go7a
        G9wBl22+cspBiLd19SQk84M9mmbKhAw=
X-Google-Smtp-Source: ABdhPJxlTAnK74t7RP9hVg3Y0wreglxIGiI5qQ2LKCzjT+MV3zeWcXMYNEwuQNr0MbBQZgl0t+b1GQ==
X-Received: by 2002:a05:600c:2050:: with SMTP id p16mr2684476wmg.44.1594108145512;
        Tue, 07 Jul 2020 00:49:05 -0700 (PDT)
Received: from dell ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id j16sm27308528wrt.7.2020.07.07.00.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 00:49:04 -0700 (PDT)
Date:   Tue, 7 Jul 2020 08:49:02 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>
Subject: Re: [PATCH 04/30] usb: misc: sisusbvga: sisusb_init: Mark all
 'static const' arrays as __maybe_unused
Message-ID: <20200707074902.GD3500@dell>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
 <20200703174148.2749969-5-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200703174148.2749969-5-lee.jones@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 03 Jul 2020, Lee Jones wrote:

> drivers/usb/misc/sisusbvga/sisusb_init.h is included by a few
> source files.  Most of which do not use the majority of the
> shared static const arrays which have been declared.  This
> causes the build system to spew 100's of warnings.
> 
> Fixes the following W=1 kernel build warning(s) - and a whole lot more:
> 
>  In file included from drivers/usb/misc/sisusbvga/sisusb.c:54:
>  drivers/usb/misc/sisusbvga/sisusb_init.h:695:34: warning: ‘SiSUSB_VCLKData’ defined but not used [-Wunused-const-variable=]
>  695 | static const struct SiS_VCLKData SiSUSB_VCLKData[] = {
>  | ^~~~~~~~~~~~~~~
> [10's of lines snipped]
>  drivers/usb/misc/sisusbvga/sisusb_init.h:206:28: warning: ‘SiS_VGA_DAC’ defined but not used [-Wunused-const-variable=]
>  206 | static const unsigned char SiS_VGA_DAC[] = {
>  | ^~~~~~~~~~~
> [10's of lines snipped]
>  drivers/usb/misc/sisusbvga/sisusb_init.h:171:29: warning: ‘ModeIndex_1280x1024’ defined but not used [-Wunused-const-variable=]
>  171 | static const unsigned short ModeIndex_1280x1024[] = { 0x3a, 0x4d, 0x00, 0x65 };
>  | ^~~~~~~~~~~~~~~~~~~
> [10's of lines snipped]
> 
> Cc: Thomas Winischhofer <thomas@winischhofer.net>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/usb/misc/sisusbvga/sisusb_init.h | 66 ++++++++++++------------
>  1 file changed, 33 insertions(+), 33 deletions(-)

Greg,

Please drop this patch.  I have a new solution.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
