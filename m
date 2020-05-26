Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E23C1B11B2
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2020 18:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgDTQh0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Apr 2020 12:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725897AbgDTQhZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Apr 2020 12:37:25 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68B3CC025492
        for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2020 09:37:25 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t40so82475pjb.3
        for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2020 09:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jbyBhtQXovOuohU3c8+wtKegG5T8ke0e4KECHuLLxNg=;
        b=CBIXMZhV6/MqDLrkiTD2GE+TJSt1fsk24nuP9MV9qjvnAraII1VF7DYlCrx3h2TuG7
         VfI3zfk/34XS5OjeWqDdx5Kga+Rreu8fligEIWu7tKkWdlS6lfOhhpCl0P6iKYTO7Zr/
         /VrV7/pHtUuR2LuvlD9Go2eAAv/M7BJoDZlSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jbyBhtQXovOuohU3c8+wtKegG5T8ke0e4KECHuLLxNg=;
        b=BDPMrRj9ZIXXAoyVkIVkxLWMEgh7RlBTSsxmyFAt7woEqIv0GDUZumdHuwB8NreHyY
         ANp8jIFCJ3Z7k1Q2ac9MmkjqC64VmDTfcyv3NglMPQTYeUoBHMyXA8sL829EO46fmAoF
         3/0Nbd5fN7/wdU7YZypXp2VJBkN09yDq4eY8Body8/A4I9mb1XNVdL+NXC6WwRjdqr7b
         olC8a/kPraNmgXTzDWa+veZNTz2iRm6Hz0vWaDeILkJ5o2rCRUWFhhcVfpMYL/HD1Wl1
         LxOjf3z//t7CJJ4QNvZWgqB0NAT5X1aCOauAr282+S3e7P7ps41glpzEEtm0Q1toSYSw
         5phA==
X-Gm-Message-State: AGi0PuauClCGDIhihZHRiMmYH7hcFOyuGQ8itEe8xx1BGiXQKqnHTVDg
        dTPPMBz9jseLQ2+ibgdYKmyABQ==
X-Google-Smtp-Source: APiQypLd5N1x6fRFN6a9H3PYT0ahd3JGW2wCx3SWRBf4T62ZoB1Za2xgPLKjku41zG8TUnQwNptRsQ==
X-Received: by 2002:a17:90a:6782:: with SMTP id o2mr286694pjj.122.1587400644979;
        Mon, 20 Apr 2020 09:37:24 -0700 (PDT)
Received: from mathewk1.lan ([161.97.192.125])
        by smtp.gmail.com with ESMTPSA id cp22sm98109pjb.28.2020.04.20.09.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 09:37:24 -0700 (PDT)
From:   Mathew King <mathewk@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Mathew King <mathewk@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Benson Leung <bleung@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v0 0/2] Type-C charger support using power_supply
Date:   Mon, 20 Apr 2020 10:36:55 -0600
Message-Id: <20200420163657.60650-1-mathewk@chromium.org>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I am looking to expose Type-C charging ports using a power_supply class. In this
patch series I have done this by creating a config option to enable this by
adding support directly into the typec driver. I would like some feedback on
this general approach.

I have been testing on a system that uses an ACPI implementation of UCSI and
things are working as expected.

Mathew King (2):
  typec: Move typec class structs into a header file
  typec: Add Type-C charger

 drivers/usb/typec/Kconfig   |  11 ++
 drivers/usb/typec/Makefile  |   1 +
 drivers/usb/typec/charger.c | 204 ++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/charger.h |  33 ++++++
 drivers/usb/typec/class.c   | 108 ++++++++-----------
 drivers/usb/typec/class.h   |  63 +++++++++++
 6 files changed, 356 insertions(+), 64 deletions(-)
 create mode 100644 drivers/usb/typec/charger.c
 create mode 100644 drivers/usb/typec/charger.h
 create mode 100644 drivers/usb/typec/class.h

-- 
2.26.1.301.g55bc3eb7cb9-goog

