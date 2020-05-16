Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3CA91D619D
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2020 16:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgEPOsa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 May 2020 10:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726416AbgEPOsa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 16 May 2020 10:48:30 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20022C061A0C
        for <linux-usb@vger.kernel.org>; Sat, 16 May 2020 07:48:29 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id be9so469701edb.2
        for <linux-usb@vger.kernel.org>; Sat, 16 May 2020 07:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QaFBaflpXjNvVIml+hiilPMh8MrtNz4rVVeOwS5CwGE=;
        b=OTayr52UBK3yGGAs7YiVska0+bMF5K3Kt85B5q3sKNT03v5K6+1DH2QxtqtQsHhn1i
         VuSLiKlouCZBOnqsxz7/MYPMcu1J2HugXPaMo0Yvqcaaeen66129ramYVUzdhMjga0iO
         Llm6Z6iMDjQm+1Arx5pBo5h6Kkgrt/HHLiBmZLOFW3CkOWBGrYm+JZrKptasbnJc90rW
         BtZlReqUKti22sDOfFvsuGrqcEf8uaC1bUK3tlE0KbXk9wuwW1+6fVfrSpnwG0sXL7ZX
         4cIgdJZRHU/bhfVXHJiQyCw/KNwt09BGRwL5TYrAJw91qvP/VuJqy9+gAGopbD9MCISP
         Hmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QaFBaflpXjNvVIml+hiilPMh8MrtNz4rVVeOwS5CwGE=;
        b=ZZaoHNGXP+ZodQqGCoaHPx/rApon0y9XIDH7wQV0T+6XrCQnyTUmb1fuzrMNlgBlsf
         7sDg6lwz6DbGeh0C/csWMzaQqo41H7Wu3k5Ez7YiPXgCKp93ucCjmkCP11JyiaKiQ1Jq
         dTCo04/O/R7pB5ApUxKrx4tDwAsl79RFnKZr/q7S/moD3VyPFdhLqSFTynN+N28h9/3A
         d64IBEWuwPjLnHUlVl3Y2NoMoBG5oMOxFba70a7SZqB6/ad+hXWhPNQ/uj3O/N0/7As8
         OMi4dsFsTeRoxqg+y0m0SQdZRScF+m9rFP62ftEcFEGk/7a7oaxni8MoGjZFkbGMLuE3
         0oKg==
X-Gm-Message-State: AOAM531CewOpiWPh4e7KSOH6n9wVS013kJ3l9V2cJdk3aeh6jpDX8fsg
        934WFbQeDEFSw4nBxZrD5jVGEkH4O7dHGVgcTO7wSA==
X-Google-Smtp-Source: ABdhPJx4eiM0My9jE4zA6rqs2UHViabbTex6vHE0YMU7TxCo9Cn/CuhXi2qwzHv14WOiM2AGgm3qjeXvwKeBoqwzuw4=
X-Received: by 2002:a50:b202:: with SMTP id o2mr6841947edd.251.1589640507492;
 Sat, 16 May 2020 07:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <202005161756.KxL7u2ha%lkp@intel.com> <20200516112846.GB133224@kroah.com>
In-Reply-To: <20200516112846.GB133224@kroah.com>
From:   Vinod Koul <vinod.koul@linaro.org>
Date:   Sat, 16 May 2020 20:18:16 +0530
Message-ID: <CAEaK=Bwo0-8JEw-C1pBO4=JfyoybEwd3tuM74_i4-nFL3m57Kg@mail.gmail.com>
Subject: Re: [usb:usb-next 56/58] include/linux/unaligned/access_ok.h:8:28:
 error: redefinition of 'get_unaligned_le16'
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kbuild test robot <lkp@intel.com>, Vinod Koul <vkoul@kernel.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 16 May 2020 at 16:58, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, May 16, 2020 at 05:01:16PM +0800, kbuild test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
> > head:   2478be82de44bee4346eb1f48d4cfa28cd99d2d0
> > commit: 8bd5741e3145e40c1e4f422fa5f1b9d7fe0644b3 [56/58] usb: renesas-xhci: Add the renesas xhci driver
> > config: ia64-allmodconfig (attached as .config)
> > compiler: ia64-linux-gcc (GCC) 9.3.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git checkout 8bd5741e3145e40c1e4f422fa5f1b9d7fe0644b3
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=ia64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > In file included from drivers/usb/host/xhci-pci-renesas.c:9:
> > >> include/linux/unaligned/access_ok.h:8:28: error: redefinition of 'get_unaligned_le16'
> > 8 | static __always_inline u16 get_unaligned_le16(const void *p)
> > |                            ^~~~~~~~~~~~~~~~~~
> > In file included from arch/ia64/include/asm/unaligned.h:5,
>
>
> Vinod, you need to include another .h file for this file to properly
> define this function.
>
> Can you make up a patch for that?

Sure thing, I will get the compiler for ia64 and send the patch soon.

~Vinod
