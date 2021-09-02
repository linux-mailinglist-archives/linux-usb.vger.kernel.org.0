Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B563FF5A7
	for <lists+linux-usb@lfdr.de>; Thu,  2 Sep 2021 23:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347318AbhIBVgK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Sep 2021 17:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbhIBVgK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Sep 2021 17:36:10 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E62C061575
        for <linux-usb@vger.kernel.org>; Thu,  2 Sep 2021 14:35:11 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id d5so2309061pjx.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Sep 2021 14:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rZo8FGyq826/edgB5aTUTgdsaT4zxrIOEH1ImqabAS8=;
        b=TINlKxTdPyI2ka6gReNyKly27eHKKmVgGhCpWguOuckyckz76M4pHqdsmq/EV/oa6B
         Jwz/gGcg0BCPhIydGuMyhB0Zt59SGbQUzWAHptCxsv72HGUGEL14Rp7AvUUodNf/pnA4
         leuMJJ0nXG/zb1WX+1pAvQVBrtRjvxXMKxSHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rZo8FGyq826/edgB5aTUTgdsaT4zxrIOEH1ImqabAS8=;
        b=o/M7Hq2L2au+v8HKLcKGV0H7L6eXStJWfOucOVeCw5uEHO7g7atCfw06XOM+rpC87d
         ws1uEIgAjA1isU85PgJ2Xc7owkSB5+l9XcmrGwgwEpAGxSrXtMP7MeoBd/llMCEZOhjk
         dz3vWL+3U/j2+HZfHqNG2eud4bz9V41uw666YpiCvOlPx0i3qpEHAYHAZucq7jVQQq1q
         7xhno8eiV2BjFx55NyRIeLu6onIVSr1b3u3Pm78C8xXfs5wrt0ntDIiKpWgIh0KIeAm2
         jo5uQm+ZBpooP+Zww4KYWyBwEEjCpuAGRrfuQAW2m0IjfxIPlyrZIm6sAY6TPsurJFl7
         YH/g==
X-Gm-Message-State: AOAM531p5oSmT2Ect5lJjYO625G2YAuoz47zll9d7j+Sbe5UhnCmc1Ay
        tNzHZzGwi7DRFQxGOHI4DsMAbg==
X-Google-Smtp-Source: ABdhPJzQOvfTpzOq1ClKc1uXfPueFHStXXBbor891Tz5Yow77W7tNyj6y0uUOQtGpXTumjGt4NteMw==
X-Received: by 2002:a17:90a:1a0c:: with SMTP id 12mr6260318pjk.208.1630618511061;
        Thu, 02 Sep 2021 14:35:11 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:d082:352a:f346:411a])
        by smtp.gmail.com with ESMTPSA id c68sm3167872pfc.150.2021.09.02.14.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 14:35:10 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-pm@vger.kernel.org, bleung@chromium.org,
        heikki.krogerus@linux.intel.com, badhri@google.com
Cc:     Prashant Malani <pmalani@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Subject: [RFC PATCH 0/3] Type C partner power supply and PDO support.
Date:   Thu,  2 Sep 2021 14:34:56 -0700
Message-Id: <20210902213500.3795948-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

We'd like to expose the USB PD Power Source/Sink capabilities provided
by a partner (SOP) to userspace. Towards that end,
here is a short series which adds the capabilities to the power supply
class. We also add a function to the Type C connector class
to register a power supply device for a connected partner.

I'm sending this out as an RFC to get some initial feedback from the
relevant groups. Once we can settle on an approach, I can resend the
series with a sample implementation in the Chrome OS Type C port driver
(cros-ec-typec).

Thanks!

Prashant Malani (3):
  usb: pd: Increase max PDO objects to 13
  power: supply: Add support for PDOs props
  usb: typec: Add partner power registration call

 Documentation/ABI/testing/sysfs-class-power | 30 +++++++++++++++++++++
 drivers/power/supply/power_supply_sysfs.c   | 18 ++++++++++++-
 drivers/usb/typec/class.c                   | 18 ++++++++++++-
 drivers/usb/typec/class.h                   |  2 ++
 include/linux/power_supply.h                |  5 ++++
 include/linux/usb/pd.h                      |  8 +++++-
 include/linux/usb/typec.h                   |  5 ++++
 7 files changed, 83 insertions(+), 3 deletions(-)

-- 
2.33.0.153.gba50c8fa24-goog

