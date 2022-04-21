Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F362650A8B9
	for <lists+linux-usb@lfdr.de>; Thu, 21 Apr 2022 21:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386619AbiDUTGL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 15:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244316AbiDUTGK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 15:06:10 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0E34C422
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 12:03:20 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id f17so10397409ybj.10
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 12:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=unnM4fXSMJiSpgzSnbjZz/++wfkdNxCsxaJNQt54SI8=;
        b=yYOJAm4NGLIM7VhPfoM0A7UQlxtEAXOJ5Za+zj3E+xbN5syIkkj2m+fituMnbqpqbj
         MAiDcU2LdLTMxmLpV0AKC0h/NbvsMeDpzZgxGjbjWsKQPMZgaKP9BIJDVQd0zMPYF9po
         Vin2Od6SxsI63H8+mR9FZkeZAgbUt390qhzMJ9L9VZglAp21KMC75thGdhMQ1B/aHqYS
         JHgmzlaJBQfQHcw6bMyAtY2KogmKKIQN5yTLCjgmdRSeFobyeCCjcO+9mQ4aXUcqs74N
         9pdTeqIqkQGDgy1DRsyG6X3HORECTQ/njdqXVjfcy3maBanaXCuvlLBjXy9yoTbWWI7Y
         BNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=unnM4fXSMJiSpgzSnbjZz/++wfkdNxCsxaJNQt54SI8=;
        b=7Y7tz19o2AA3JXF5RNhiT5PD8bDgq0h7ehD3y/BwMe7EKLtqiYi1xq+T8m5HyoprPs
         0WlHthEb3CUShdaD2MMr30Nvmc6OwwFh9yY4fGfERfZPLhk0e1rPv5ZkBVUW4FOqiphp
         jUyZ8fiLIo44XXFWeBAsEnCU44lYKiEC5GmWJXbz6tQeN3u8MXW/6uYenw41x+DcIebl
         xbrmUOOrsRC4QRLaeOdZogcPIqeVdUZBn7xDaQsNPLBPinDwk9AScdb9D4FJP/sYFubR
         YvX5VgjEVjp6/ZzCfKppWa2MmLdE8cUcfVycvkaTPm4dMt5hJl/Kfa447R9/bpy6+Mo5
         n3zg==
X-Gm-Message-State: AOAM531KU30F0gtjWHsObI67WaPVlFchBzwVKnP4wa0APlaeOTNEKqtP
        4xfQ31hrLI6EBBjMoCTMh8nZH1L3ABWPtJqjdjFT9Q==
X-Google-Smtp-Source: ABdhPJyHzNIYg5C4PJ/cejBQRmSKW/dyS0OVtZsBDIZ2e0UwpSgBZ6Gk8wH3JAqmB8QausXlAat9W0SAdbIea4rEv4c=
X-Received: by 2002:a25:ae45:0:b0:641:ba5c:7745 with SMTP id
 g5-20020a25ae45000000b00641ba5c7745mr1147553ybe.537.1650567799668; Thu, 21
 Apr 2022 12:03:19 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 22 Apr 2022 00:33:08 +0530
Message-ID: <CA+G9fYvdfYBq+Q=-XUJcKHSYXdubdoqhExRpjrqCgf_N3pPpHQ@mail.gmail.com>
Subject: drivers/usb/typec/tcpm/tcpm.c:4724:3: error: case label does not
 reduce to an integer constant
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, linux-usb@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        heikki.krogerus@linux.intel.com, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Linux mainline and linux next arm64 builds failed with gcc-7.3.x.

drivers/usb/typec/tcpm/tcpm.c: In function 'run_state_machine':
drivers/usb/typec/tcpm/tcpm.c:4724:3: error: case label does not
reduce to an integer constant
   case BDO_MODE_TESTDATA:
   ^~~~
make[4]: *** [scripts/Makefile.build:288: drivers/usb/typec/tcpm/tcpm.o] Error 1
                                      ^
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org

https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-mainline/DISTRO=lkft,MACHINE=hikey,label=docker-buster-lkft/4259/consoleText
