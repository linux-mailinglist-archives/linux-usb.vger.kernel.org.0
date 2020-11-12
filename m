Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92E332AFCD3
	for <lists+linux-usb@lfdr.de>; Thu, 12 Nov 2020 02:48:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728752AbgKLBef (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 20:34:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbgKLBXy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Nov 2020 20:23:54 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0462C0613D1
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2020 17:23:53 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id z3so2951819pfb.10
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2020 17:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7Lf2zyWERPVdu1htC4rXtjvkvXPb9GfV1THCOYFuzQ=;
        b=XH00HgnQSvMCsYKU8m1dMFSTUu9rPajGK59TSV5XwegjFuF/OFM80jpJKt9b4w8HtO
         DAEoq/eI0pSDbHL5YiiGx87azE4m2Kcm+iXSVBeegTQIX3hxH1OdMUpggeVIy1J4BuoC
         Gns43J9xqLOkFd9XvKJIUMopKQO+xfIkJwLns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7Lf2zyWERPVdu1htC4rXtjvkvXPb9GfV1THCOYFuzQ=;
        b=QdIXGJLM0lHXX0+m1l6hNI9SanCxv0sKmu0m1/s9ZVgoMarg2C48E0LQVO+mlzwxbr
         fkdN39XwYgzQUseJBEs1QKgW+9XLrsuwSWCzrz5GAKDo6SOfKT+aU/A6fqSz7WCnnqiZ
         sM0a7/MPWsfDQxJcjhMcoChnBdOa+GO8e6T93JXbAJTqSuDABXnbUK0wGfOpmvkGO9xB
         2Ati2oFIs58oEOVf8tCcOPFKilgmOuHjvtLCXIhUAg8cPwv+w8tgYHKawd7D1mnChFEg
         87QYvXBkMfvSF5s19fooMZkyJ0cz/l1IZ/S5nJqoLMMSwOv9JAnO0f0cfTZhM12x+WMP
         SX2A==
X-Gm-Message-State: AOAM5311xL/bMwznsoFeimGsg6OKtW+t0YDSVuuOgomA5p8xBji9WJgK
        hIs77Vhkf++JknnYZOhFEcKC7w==
X-Google-Smtp-Source: ABdhPJyUs9WS/doQQJOar3CjKqcIF17wYM/oOgMOnZUo3GYSHnoTc1p0MtsJCj1qhMZAS7qduYBywg==
X-Received: by 2002:a65:508a:: with SMTP id r10mr24784979pgp.307.1605144233091;
        Wed, 11 Nov 2020 17:23:53 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id k25sm4057227pfi.42.2020.11.11.17.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 17:23:52 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
        enric.balletbo@collabora.com
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>
Subject: [PATCH 0/3] platform/chrome: cros_ec_typec: Add plug and plug altmodes
Date:   Wed, 11 Nov 2020 17:23:25 -0800
Message-Id: <20201112012329.1364975-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series add plug registration support to the cros-ec-typec
driver. It also adds support for registering alternate modes for the
registered plug. These features utilize the API provided by the Type C
connector class framework.

The first patch adds support to the connector class framework for the
number_of_alternate_modes attribute (along with the relevant ABI
documentation).

The next two patches add plug registration, and then altmode
registration for the plugs. The latter of these two patches utilizes the
new function for plug number_of_alternate_modes introduced in the first patch.

This series is based on top of the following branch and other patch
series (applied in the order specified):
- Branch: chrome-platform for-next [1], which is currently set to the
  "Linux 5.10-rc1" tag.
- cros-ec-typec: Patch series to register PD identity information + partner altmodes[2]
- cros-ec-typec: Patch series to register cable[3]
- cros-ec-typec: Patch series to add partner number_of_altmodes[4]

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git/log/?h=for-next
[2]: https://lore.kernel.org/lkml/20201029222738.482366-1-pmalani@chromium.org/
[3]: https://lore.kernel.org/lkml/20201106184104.939284-1-pmalani@chromium.org/
[4]: https://lore.kernel.org/lkml/20201110061535.2163599-1-pmalani@chromium.org/

Prashant Malani (3):
  usb: typec: Add plug num_altmodes sysfs attr
  platform/chrome: cros_ec_typec: Register SOP' cable plug
  platform/chrome: cros_ec_typec: Register plug altmodes

 Documentation/ABI/testing/sysfs-class-typec |  9 +++
 drivers/platform/chrome/cros_ec_typec.c     | 85 ++++++++++++++++-----
 drivers/usb/typec/class.c                   | 77 ++++++++++++++++++-
 include/linux/usb/typec.h                   |  1 +
 4 files changed, 151 insertions(+), 21 deletions(-)

-- 
2.29.2.222.g5d2a92d10f8-goog

