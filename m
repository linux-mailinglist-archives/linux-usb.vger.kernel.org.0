Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A9A3F1484
	for <lists+linux-usb@lfdr.de>; Thu, 19 Aug 2021 09:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235729AbhHSHsR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Aug 2021 03:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbhHSHsQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Aug 2021 03:48:16 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75AA6C061575
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 00:47:40 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id q6so7576552wrv.6
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 00:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=FudC1LQQgorqgCvY4YmEWsg2a7D4yTzNn6OmCaRWFF8=;
        b=Pw+AR7aFnCB/NxicuD/fwMeE4+N7gDJ9/3LTsu1r235fWnS9ep8cWZ4eITjwE1jE1E
         /G7w+E9milSqPxgnhvuVcO0/u1yPGT+frOj2zrlsS17MN3EZNhQPVn++s9u1JSRVsf+o
         JJK1zUUvVHkni/T2feOlwJTVf6WYpf7j2KO2atv1S2c+8ycl8wKRhDhqC9572w0SHiH7
         udk4qOzw0se5w24vQgvUQhwZ7/JDF5ZV92B1Ge667cN4577mrAMOaF8X09HH+TgRwQ6i
         asYgekL2HrG3ws2/xXYDKL3DCdyn4rBG/ixF653f1tcA8L8rdkW3U7ycNcNhXFphqKf8
         qd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=FudC1LQQgorqgCvY4YmEWsg2a7D4yTzNn6OmCaRWFF8=;
        b=bc2mzvRuSeAjWoEZy9PBLs5+qmwGhDTb1Ipzo191bBnWeKl40kdES0TZinkK0xEzb0
         qrPDufXy9ZJDv2idNFxb5hYE25rp/VgeD9EzyH50Lwsx5fyP4g9vQ3UGwIP/nudmr1K2
         VVh/54ZKTKFsBA3+ZIeYm2kWhd3mStpC9JD5SV3LOYYpm+CcHny5+kvY7wVBdoQ1wb9F
         A4TkPmZQLuypGxmRUDdjJBLhI4dQ6HJhtpk4nde4Cqcf/EnR6uajTP/AVztdW6WW2sDi
         sXw5vSQbpghcBAuFkPgjlMcId12vXfbBgEbs3O/AKrMoLpWq7A7YO/NT9xwPmSxSoywO
         Kepw==
X-Gm-Message-State: AOAM533uSU/Nm0KQuVhq6lx53STBfYPKZ1CmZM4bUyEYg+Lmf3gURUdX
        eWwBcTNpFPzv0Lc0GNxB2nHtvA==
X-Google-Smtp-Source: ABdhPJyHPw1JbRQaWS4yW670LGqA408UI20FnIvo6ERH2XLCsItkmMTozTqL5eKEc4IViyJ32T5CPw==
X-Received: by 2002:adf:fb8d:: with SMTP id a13mr2150945wrr.164.1629359258835;
        Thu, 19 Aug 2021 00:47:38 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id 2sm1802717wmo.38.2021.08.19.00.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 00:47:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 19 Aug 2021 08:47:37 +0100
Message-Id: <CDNBNHH65Z6Z.3P3H9W04XAHDB@arch-thunder>
Cc:     <clang-built-linux@googlegroups.com>, <kbuild-all@lists.01.org>,
        <linux-usb@vger.kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Re: [usb:usb-testing 54/97]
 drivers/usb/isp1760/isp1760-hcd.c:735:2: warning: Value stored to 'scratch'
 is never read [clang-analyzer-deadcode.DeadStores]
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
To:     "kernel test robot" <lkp@intel.com>
References: <202108190619.wLK5u4fO-lkp@intel.com>
In-Reply-To: <202108190619.wLK5u4fO-lkp@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
On Wed Aug 18, 2021 at 11:09 PM WEST, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git us=
b-testing
> head:   e4788edc730a0d2b26e1ae1f08fbb3f635b92dbb
> commit: 7de14c88272c05d86fce83a5cead36832ce3a424 [54/97] usb: isp1760: re=
move debug message as error
> config: riscv-randconfig-c006-20210818 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d2b5=
74a4dea5b718e4386bf2e26af0126e5978ce)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/=
commit/?id=3D7de14c88272c05d86fce83a5cead36832ce3a424
>         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/gi=
t/gregkh/usb.git
>         git fetch --no-tags usb usb-testing
>         git checkout 7de14c88272c05d86fce83a5cead36832ce3a424
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Driscv clang-analyzer=20
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> clang-analyzer warnings: (new ones prefixed by >>)
>                    ^      ~
>    drivers/target/target_core_configfs.c:2627:23: warning: Value stored t=
o 'alua_lu_gp_cg' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
>            struct config_group *alua_lu_gp_cg =3D &lu_gp->lu_gp_group;
>                                 ^~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~
>    drivers/target/target_core_configfs.c:2627:23: note: Value stored to '=
alua_lu_gp_cg' during its initialization is never read
>            struct config_group *alua_lu_gp_cg =3D &lu_gp->lu_gp_group;
>                                 ^~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~
>    drivers/target/target_core_configfs.c:2731:2: warning: Value stored to=
 'alua_lu_gp_ci' is never read [clang-analyzer-deadcode.DeadStores]
>            alua_lu_gp_ci =3D &alua_lu_gp_cg->cg_item;
>            ^               ~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/target/target_core_configfs.c:2731:2: note: Value stored to 'a=
lua_lu_gp_ci' is never read
>            alua_lu_gp_ci =3D &alua_lu_gp_cg->cg_item;
>            ^               ~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/target/target_core_configfs.c:2748:25: warning: Value stored t=
o 'lu_gp' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
>            struct t10_alua_lu_gp *lu_gp =3D container_of(to_config_group(=
item),
>                                   ^~~~~
>    drivers/target/target_core_configfs.c:2748:25: note: Value stored to '=
lu_gp' during its initialization is never read
>            struct t10_alua_lu_gp *lu_gp =3D container_of(to_config_group(=
item),
>                                   ^~~~~
>    drivers/target/target_core_configfs.c:3026:23: warning: Value stored t=
o 'alua_tg_pt_gp_cg' during its initialization is never read [clang-analyze=
r-deadcode.DeadStores]
>            struct config_group *alua_tg_pt_gp_cg =3D &tg_pt_gp->tg_pt_gp_=
group;
>                                 ^~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~=
~~~
>    drivers/target/target_core_configfs.c:3026:23: note: Value stored to '=
alua_tg_pt_gp_cg' during its initialization is never read
>            struct config_group *alua_tg_pt_gp_cg =3D &tg_pt_gp->tg_pt_gp_=
group;
>                                 ^~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~=
~~~
>    drivers/target/target_core_configfs.c:3163:2: warning: Value stored to=
 'alua_tg_pt_gp_ci' is never read [clang-analyzer-deadcode.DeadStores]
>            alua_tg_pt_gp_ci =3D &alua_tg_pt_gp_cg->cg_item;
>            ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/target/target_core_configfs.c:3163:2: note: Value stored to 'a=
lua_tg_pt_gp_ci' is never read
>            alua_tg_pt_gp_ci =3D &alua_tg_pt_gp_cg->cg_item;
>            ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/target/target_core_configfs.c:3179:28: warning: Value stored t=
o 'tg_pt_gp' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
>            struct t10_alua_tg_pt_gp *tg_pt_gp =3D container_of(to_config_=
group(item),
>                                      ^~~~~~~~
>    drivers/target/target_core_configfs.c:3179:28: note: Value stored to '=
tg_pt_gp' during its initialization is never read
>            struct t10_alua_tg_pt_gp *tg_pt_gp =3D container_of(to_config_=
group(item),
>                                      ^~~~~~~~
>    Suppressed 4 warnings (4 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    6 warnings generated.
>    drivers/misc/eeprom/at24.c:334:2: warning: Value stored to 'client' is=
 never read [clang-analyzer-deadcode.DeadStores]
>            client =3D at24_client->client;
>            ^        ~~~~~~~~~~~~~~~~~~~
>    drivers/misc/eeprom/at24.c:334:2: note: Value stored to 'client' is ne=
ver read
>            client =3D at24_client->client;
>            ^        ~~~~~~~~~~~~~~~~~~~
>    drivers/misc/eeprom/at24.c:397:2: warning: Value stored to 'client' is=
 never read [clang-analyzer-deadcode.DeadStores]
>            client =3D at24_client->client;
>            ^        ~~~~~~~~~~~~~~~~~~~
>    drivers/misc/eeprom/at24.c:397:2: note: Value stored to 'client' is ne=
ver read
>            client =3D at24_client->client;
>            ^        ~~~~~~~~~~~~~~~~~~~
>    Suppressed 4 warnings (4 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    4 warnings generated.
>    Suppressed 4 warnings (4 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    4 warnings generated.
>    Suppressed 4 warnings (4 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    4 warnings generated.
>    Suppressed 4 warnings (4 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    4 warnings generated.
>    Suppressed 4 warnings (4 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    4 warnings generated.
>    Suppressed 4 warnings (4 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    4 warnings generated.
>    Suppressed 4 warnings (4 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    4 warnings generated.
>    Suppressed 4 warnings (4 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    4 warnings generated.
>    Suppressed 4 warnings (4 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    4 warnings generated.
>    Suppressed 4 warnings (4 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    4 warnings generated.
>    Suppressed 4 warnings (4 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    4 warnings generated.
>    Suppressed 4 warnings (4 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    5 warnings generated.
>    drivers/usb/isp1760/isp1760-core.c:490:2: warning: Value stored to 'ud=
c_enabled' is never read [clang-analyzer-deadcode.DeadStores]
>            udc_enabled =3D ((devflags & ISP1760_FLAG_ISP1763) ||
>            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/usb/isp1760/isp1760-core.c:490:2: note: Value stored to 'udc_e=
nabled' is never read
>            udc_enabled =3D ((devflags & ISP1760_FLAG_ISP1763) ||
>            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    Suppressed 4 warnings (4 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    4 warnings generated.
>    Suppressed 4 warnings (4 in non-user code).
>    Use -header-filter=3D.* to display errors from all non-system headers.=
 Use -system-headers to display errors from system headers as well.
>    9 warnings generated.
> >> drivers/usb/isp1760/isp1760-hcd.c:735:2: warning: Value stored to 'scr=
atch' is never read [clang-analyzer-deadcode.DeadStores]
>            scratch =3D isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
>            ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

yeah, this is desired behaviour, this read is only to make sure  that
we make something different than the pattern to test go over the bus.
However I will take a look to this warning and other clang warnings
that I am seeing in this report.

------
Cheers,
     Rui
