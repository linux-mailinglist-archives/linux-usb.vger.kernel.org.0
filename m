Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1B79C94BC
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 01:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbfJBXQX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 19:16:23 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41857 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728521AbfJBXQX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 19:16:23 -0400
Received: by mail-pl1-f194.google.com with SMTP id t10so560424plr.8
        for <linux-usb@vger.kernel.org>; Wed, 02 Oct 2019 16:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ze/XvAAk8GBZMksPYjyDCpmqV8AGCwQH61JmBZ7VYXE=;
        b=XuU6hHtCbzgnLgj5xFdd29USBSRIe9zpmWPOLYUJB/YMxHldDaP1t3RdXqKU7+9qST
         CHAm4YD7iyFga95zzDWl2BjqU7MUMTB3jy4xz1GdTiRkdD5XgK9GOF16bc+n1vXBwFTs
         cMRj5LW+ej1CyJRz6V9q57XBmn+T6zAnJz5PabxfyCmUJVXoe9vngSvvZmpQ/kbUIbMa
         +htweaej41pOqioUGALldV5jmpQexr9STl2LcRl08StyUthb17t34BXsB6Y8avXbOWPG
         50XyAz92YjpfMHOFwtvoST77qm5oxCyFltxTEA2eGtbBN1yVvp8nGP7eMXXN+zGAZAp8
         6SEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ze/XvAAk8GBZMksPYjyDCpmqV8AGCwQH61JmBZ7VYXE=;
        b=m9pOPqpYyIiBXqKfDy+MTpDR4tn8F73/l5c4iE4PglT4/NbYIf/r8xpB7tHJplF+AF
         TXVBzwS2FpPATwvM/aNub9ghFGFkR+wWvYJmDa9jIRS6D1/6jjzNg6XGyrJo69hcJsze
         hYiUKKeFE6FKW9uwi0NiHQyIlI6Zj9x186aejMJZxCFYs1Ce4OG1Tn9AQQQikglxTxer
         kpUVflNHVBR1V/0mwkWmZyX3cmC/b5mOrbfySsCzZDsWZnkj93YyLBU84f9vR8Pw/CJx
         XfLVNq4gnJEmh1vQymX3MdzS5c4PxIKPWRW5p5Fgk3d/OgEeRt9RM5WJEbLIAOyKDrHT
         1xWg==
X-Gm-Message-State: APjAAAU3HSXX0czEP6luKgxYp9MaPRK1frp1nix3628nIZo9BGPsMCco
        48S6x4DnCmSRU8/gwV9Zsvca2w==
X-Google-Smtp-Source: APXvYqwKK+QsXsOrigPf5Vzcddlm1GWn4ouIdnrb8vXeJ7P0jW3FJ31myUBhJrIC1NEdFL3iiaRbbg==
X-Received: by 2002:a17:902:a40a:: with SMTP id p10mr6399376plq.149.1570058181824;
        Wed, 02 Oct 2019 16:16:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id l7sm288791pjy.12.2019.10.02.16.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 16:16:21 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>, Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC][PATCH 0/3] dwc3 role-switch handling for HiKey960
Date:   Wed,  2 Oct 2019 23:16:14 +0000
Message-Id: <20191002231617.3670-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I'm just trying to pick up parts of a patch previously by
Yu Chen to get HiKey960 dev-board's USB functionality working. 

The current full patchset can be found here:
 https://git.linaro.org/people/john.stultz/android-dev.git/log/?id=12289c95c89e0e3173f8da1ebd3a29e52fd50a44

I don't have any real knowledge of the hardware other then the
code, and what I can intuit from testing, but I tried to
document the previously undocumented bindings as best I could
and fixed up a few minor checkpatch issues.

I'd greatly appreciate feedback or thoughts!

thanks
-john

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org

John Stultz (1):
  dt-bindings: usb: generic: Add role-switch-default-host binding

Yu Chen (2):
  usb: roles: Add usb role switch notifier.
  usb: dwc3: Registering a role switch in the DRD code.

 .../devicetree/bindings/usb/generic.txt       |  5 ++
 drivers/usb/dwc3/Kconfig                      |  1 +
 drivers/usb/dwc3/core.h                       |  6 ++
 drivers/usb/dwc3/drd.c                        | 78 ++++++++++++++++++-
 drivers/usb/roles/class.c                     | 35 ++++++++-
 include/linux/usb/role.h                      | 16 ++++
 6 files changed, 139 insertions(+), 2 deletions(-)

-- 
2.17.1

