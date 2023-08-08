Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97BF577459C
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 20:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233449AbjHHSoH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 14:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232775AbjHHSnf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 14:43:35 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5568638E79
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 09:38:25 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d13e0bfbbcfso52196276.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Aug 2023 09:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512704; x=1692117504;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y6sSetytOmUwyBC8vzBUgi7mxtEE0jfVhWzzVyZzcSg=;
        b=nFCbdCn9SHME+W7DhX6rsDA90KNTL8Q74PXQ9vF4RLQvMr/kVKBOlWXnzdKgGpJxV+
         /4qbWq5FTyIBvHN8OD7Vt3GaL2IxvjRfLR0xdLg12Ctd0KBBrzSJQFgid0red4t7+h/D
         lXH3vY0XYdIGRELYN0RgxKew4W+9PIlQZ8IAeUakNXE0QUyad5BMW6jY8X22O+lkoNTQ
         xf+elpWve7BzX9dBzBQJpYUZmSgDr3zeeghDuXLZqRGT3CmJ3U5NaWnk8G1OX1M185PO
         84FTALgp5MLpAi/TbRd57MDRAkoN7wC4kmPe0LE90zLS8SAIlDgwiQD5Yeh6kVQpJPtJ
         BDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512704; x=1692117504;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y6sSetytOmUwyBC8vzBUgi7mxtEE0jfVhWzzVyZzcSg=;
        b=Bb9EsVkz5XvUgH2J5DgOfAEn2B5n+epi2Sw1WQAJ7pAnhv9LZ2rC50bXVkkYeE7/+e
         oyUrVjDkggUUJx56n/9vo7MLf4nDs3SFKTmgwXxdsi8nsRGQful0h8YeYj/i0d6dmH67
         Jk8bLGUr50e9jQYVBAjre8eqpx8SWU9wRaNrBznNb2eUgeV33JhfjZOcdccQNjToFcU5
         toCVPk3bEzdcDdJX3AMNUV0BQetxZJguRZ+OZPN5rHX+Gvq0yOgtAWym3vVHTGoy/bUW
         E0WcHBGkljrPgMUh9SFa6WxtYFMWfGM/6cXTRXqkiYm1HbZX9hnahe7mIpdZaaENeHOK
         zepg==
X-Gm-Message-State: AOJu0YzOBHRS2alw9yxV3ALe9kLGn8xhAwK5u4rsuupsEy9Z2n6r5UJD
        W40NI5jpmkBtJX0W8oRYwkbVrGDZCniQ2EXFK/skRluBI3qASCfHEv8=
X-Google-Smtp-Source: AGHT+IHtywQ8e8sdcBJ4nEsVchvTc5SRUSLKPPN/CcX+znemohbI6SJix20yoRk10mpcbIo22CBF5AHYdgr0wG7ZGcU=
X-Received: by 2002:a05:6102:11f8:b0:43f:3426:9e35 with SMTP id
 e24-20020a05610211f800b0043f34269e35mr3147137vsg.12.1691478715881; Tue, 08
 Aug 2023 00:11:55 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 8 Aug 2023 12:41:44 +0530
Message-ID: <CA+G9fYspyEdT9wmVpL04J-p0CwqA+_v_L4H+ihY9VYqpCMmQ1Q@mail.gmail.com>
Subject: next: mips: cavium_octeon_defconfig: gcc-8 - dwc3-octeon.c:502:8:
 include/linux/compiler_types.h:397:38: error: call to '__compiletime_assert_335'
 declared with attribute error: FIELD_PREP: value too large for the field _compiletime_assert
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        lkft-triage@lists.linaro.org
Cc:     Ladislav Michl <ladis@linux-mips.org>, Thinh.Nguyen@synopsys.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[My two cents]

While building Linux next-20230808 mips cavium_octeon_defconfig with gcc-8
failed with below warnings and errors.

Build log:
----------

In function 'dwc3_octeon_setup.isra.4',
    inlined from 'dwc3_octeon_probe' at drivers/usb/dwc3/dwc3-octeon.c:502:8:
include/linux/compiler_types.h:397:38: error: call to
'__compiletime_assert_335' declared with attribute error: FIELD_PREP:
value too large for the field
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^
include/linux/compiler_types.h:378:4: note: in definition of macro
'__compiletime_assert'
    prefix ## suffix();    \
    ^~~~~~

  Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Links:
-----
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230808/testrun/18882876/suite/build/test/gcc-8-cavium_octeon_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230808/testrun/18882876/suite/build/test/gcc-8-cavium_octeon_defconfig/history/

Steps to reproduce:
------------
  tuxmake --runtime podman --target-arch mips --toolchain gcc-8
--kconfig cavium_octeon_defconfig
   - https://storage.tuxsuite.com/public/linaro/lkft/builds/2TgoAZwerJ28UWHyqfQUiaYYhrl/tuxmake_reproducer.sh

--
Linaro LKFT
https://lkft.linaro.org
