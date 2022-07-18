Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D62C5789EE
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jul 2022 20:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbiGRS6Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jul 2022 14:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232882AbiGRS6P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jul 2022 14:58:15 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587B52F391
        for <linux-usb@vger.kernel.org>; Mon, 18 Jul 2022 11:58:14 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-31c89653790so117245117b3.13
        for <linux-usb@vger.kernel.org>; Mon, 18 Jul 2022 11:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=osBLY7pWKf4zzjIUgrcUY5WBHpct5ScokcNbQfqR2hQ=;
        b=P6dRuy7rne1mioRFiNj6i9XgkdJCqrxJ6MH88oJTxDggLWxYM7VLzBCuFmUo3KZwMZ
         RbaAvDffal/7ijOMLPy8aPIi4zAzviylE+YpjOJg8WpzRLjZ01hZSGPZL+0ZIoOAKy4w
         Jlq6WRAkpYKMHGf3ls/lVfeZzliEAgNf1G+lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=osBLY7pWKf4zzjIUgrcUY5WBHpct5ScokcNbQfqR2hQ=;
        b=531LtsthpFInPNCufRbfQ2Zbtsl+RQK7tz3H7c2FjRJ6V0Mh7aqBZRBbAWYZHWFA5O
         zNc8m/KpZbYdHWionFkZ5yXBlGbWERALUeWLsSNG2mv5au9NnCePKr09CO7ezVOzcf3g
         zKRLQtmzZhkCfk7/VricJ4TuNLBnZVSpqEdxSc6DBvzRYDnHToOKr7aUd7VVsx2nTbwC
         N+gOSZHrxyQs7qgdMqo98QZVEWuTGWJfntcOnxmIXcDjIjhSqew3ND8xyf7Dq5WzIZEP
         iZCtVZK2wm3ciUCIshutCgIM9Vz4AKeOwe55TGp52B5MgJkQuc+8Q87OUXosWhWBfGGk
         bGTg==
X-Gm-Message-State: AJIora/fgKG75MDg58b9G7nmGyTsIsPJulDHlBkjLGd2sBX3kyMsrC5q
        nc4rDcE6Xg7Bh78NoNeIJqZOs526TTny/ZrlVqkaUQ==
X-Google-Smtp-Source: AGRyM1szq8owamsB9PCWQy97R44KLI8X1kFziZ9xNt3caREOjwAMSrwEC2vVtD1bAz4wKznqzzRFGTD1oTeUFAtS+dE=
X-Received: by 2002:a81:c0f:0:b0:31c:f619:b02c with SMTP id
 15-20020a810c0f000000b0031cf619b02cmr30759932ywm.311.1658170693594; Mon, 18
 Jul 2022 11:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <202207170614.2HHvAplN-lkp@intel.com>
In-Reply-To: <202207170614.2HHvAplN-lkp@intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Mon, 18 Jul 2022 11:58:00 -0700
Message-ID: <CACeCKacewJbE4u-v0KMUTcjEV674MLgQZwU5vgtfY6MNZpfTww@mail.gmail.com>
Subject: Re: [usb:usb-testing 50/55] drivers/platform/chrome/cros_typec_switch.c:93:9:
 error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and later
 do not support implicit function declarations
To:     kernel test robot <lkp@intel.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 16, 2022 at 3:20 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git us=
b-testing
> head:   c76d09da77d69d7f737540985912ad2bca654713
> commit: e54369058f3da181fcc4c893f224a0c5a8a526b6 [50/55] platform/chrome:=
 cros_typec_switch: Add switch driver
> config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/202=
20717/202207170614.2HHvAplN-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0702=
2e6cf9b5b3baa642be53d0b3c3f1c403dbfd)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/=
commit/?id=3De54369058f3da181fcc4c893f224a0c5a8a526b6
>         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/gi=
t/gregkh/usb.git
>         git fetch --no-tags usb usb-testing
>         git checkout e54369058f3da181fcc4c893f224a0c5a8a526b6
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash drivers/block/ drivers/=
iio/light/ drivers/media/i2c/ drivers/net/pcs/ drivers/pinctrl/nuvoton/ dri=
vers/platform/chrome/ drivers/spmi/ kernel/trace/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/platform/chrome/cros_typec_switch.c:93:9: error: call to undec=
lared function 'acpi_evaluate_integer'; ISO C99 and later do not support im=
plicit function declarations [-Wimplicit-function-declaration]
>                    ret =3D acpi_evaluate_integer(adev->handle, "_ADR", NU=
LL, &index);
>                          ^
>    drivers/platform/chrome/cros_typec_switch.c:93:9: note: did you mean '=
acpi_evaluate_object'?
>    include/acpi/acpixf.h:550:8: note: 'acpi_evaluate_object' declared her=
e
>                                acpi_evaluate_object(acpi_handle object,
>                                ^
>    include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI=
_EXTERNAL_RETURN_STATUS'
>            static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
>                               ^
> >> drivers/platform/chrome/cros_typec_switch.c:93:35: error: incomplete d=
efinition of type 'struct acpi_device'
>                    ret =3D acpi_evaluate_integer(adev->handle, "_ADR", NU=
LL, &index);
>                                                ~~~~^
>    include/linux/acpi.h:790:8: note: forward declaration of 'struct acpi_=
device'
>    struct acpi_device;
>           ^
>    2 errors generated.
>

Sorry about this, fixed here:
https://lore.kernel.org/linux-usb/20220718185551.1025288-1-pmalani@chromium=
.org/
