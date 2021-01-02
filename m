Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B70C92E803D
	for <lists+linux-usb@lfdr.de>; Thu, 31 Dec 2020 14:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgLaNsw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Dec 2020 08:48:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgLaNsw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Dec 2020 08:48:52 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB79C061575
        for <linux-usb@vger.kernel.org>; Thu, 31 Dec 2020 05:48:11 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id d9so17215984iob.6
        for <linux-usb@vger.kernel.org>; Thu, 31 Dec 2020 05:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DkV9Lf6E0lr2zdysE52RUMdfYzKcT2Yxx2vWr/fG4+g=;
        b=HJcBD31EAGi2EzS15TmcUcrytynNAIuxR57xyrydS9ulF3KXej5npjPk3zv7not59m
         EN/YyfAQ/o3tNKMe91Mj3mBWjA/hZSsYXiiua5iGkJrCgE2U80vbpPyVEW4HeUqzfYym
         w159HvC9VPsyKswHKmJb2Rm/bpYCX0ciToBrh6HszanqpWGSq6VCH029sqwVskvTnqDB
         i6GqcmBoVqay3FGaUJVGtOrqyK5WNAR12rmLmKfBwoFUEMxFn3sVLCJZXUai3Nnl2VXa
         5fsGmfB6US8S9e9Zh6+XW/htlG+Zxb8yQKK8TTFY9iN9M6YJHqvYBKAjKF382X1tzVJh
         n+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DkV9Lf6E0lr2zdysE52RUMdfYzKcT2Yxx2vWr/fG4+g=;
        b=LPshqOtCEgvY3QKjzRYVW7lExFZGJdSRHuQUkSHGI1NNV/GHzW8GDRdpidNpmoknMH
         hF9vBPdkhSgXu+0CXGPfT0DHfcu73+Oag1+ONjwJlF8JC9D5KojJJKjoLJJzweFkghnC
         KCjhnU4+Oko3DgdRqgHiK8PAUmHjtc+n7gWPnKDocqe545lxGotxUFKwsa3KudJX5Ge4
         bTfGUc2ejnahJ8dOQ/P6p8JwCAQMfcArLu46tSKn4p6yj2pLYazhJsDqoxN24XAw+yZp
         ZgbSH96TLcAGjcQak79ZKJmbrCdppTBw9IW7WtvVed2lofO74/AGnZVFZ2JQdklfnHw8
         Nqyg==
X-Gm-Message-State: AOAM531ZhgVbwOpdn89kDZw97trszoJivzhrUWRJFYy1mLkBguZjsZa+
        3ldEC+QP0D1uwqvmuIJXI/SRDULvTXtHSv0hs7LMzw==
X-Google-Smtp-Source: ABdhPJy8Xd+N4sLXexhCMHdnb/XIt24asDCeLsMzLDOZjhQzVwc29RC5tlmXdBoDESMSAKq/aEw76KwRfyyqGDO3mxc=
X-Received: by 2002:a5e:c111:: with SMTP id v17mr46607975iol.29.1609422490100;
 Thu, 31 Dec 2020 05:48:10 -0800 (PST)
MIME-Version: 1.0
References: <20201230124925.19260-1-shawn.guo@linaro.org> <202012302301.ml5wrf97-lkp@intel.com>
In-Reply-To: <202012302301.ml5wrf97-lkp@intel.com>
From:   Shawn Guo <shawn.guo@linaro.org>
Date:   Thu, 31 Dec 2020 21:47:59 +0800
Message-ID: <CAAQ0ZWT3pV=TNSX9XZCQ1=cgxAGjCOjPch3Xzjgr008Kg6SkAw@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: qcom: add URS Host support for sdm845 ACPI boot
To:     kernel test robot <lkp@intel.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, kbuild-all@lists.01.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 31, 2020 at 12:01 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Shawn,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on balbi-usb/testing/next]
> [also build test WARNING on v5.11-rc1 next-20201223]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Shawn-Guo/usb-dwc3-qcom-add-URS-Host-support-for-sdm845-ACPI-boot/20201230-205430
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testing/next
> config: xtensa-allyesconfig (attached as .config)
> compiler: xtensa-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/c3faeb501efb31e035beca1c0fee1cca6ec16392
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Shawn-Guo/usb-dwc3-qcom-add-URS-Host-support-for-sdm845-ACPI-boot/20201230-205430
>         git checkout c3faeb501efb31e035beca1c0fee1cca6ec16392
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=xtensa
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    drivers/usb/dwc3/dwc3-qcom.c: In function 'dwc3_qcom_create_urs_usb_platdev':
>    drivers/usb/dwc3/dwc3-qcom.c:675:9: error: implicit declaration of function 'acpi_create_platform_device' [-Werror=implicit-function-declaration]
>      675 |  return acpi_create_platform_device(adev, NULL);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/usb/dwc3/dwc3-qcom.c:675:9: warning: returning 'int' from a function with return type 'struct platform_device *' makes pointer from integer without a cast [-Wint-conversion]
>      675 |  return acpi_create_platform_device(adev, NULL);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

Just sent out a patch [1] to address the problem in ACPI core.

Shawn

[1] https://lkml.org/lkml/2020/12/31/60
