Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5B092A8C10
	for <lists+linux-usb@lfdr.de>; Fri,  6 Nov 2020 02:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732220AbgKFB2P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Nov 2020 20:28:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731060AbgKFB2P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Nov 2020 20:28:15 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21ABAC0613CF
        for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2020 17:28:15 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id x13so2668868pgp.7
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2020 17:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VvTyEH/5OPHkuR2uQBZQ7iKaDkYMP3ddbHbrnIA3UKs=;
        b=kexnuPe3sGqmGRossbXOUjkF7rcCGE7Rm/bT3CPgCE9rmTCIpnkXmw6izKxcBrU4VC
         4CyXFd0ajo1teg24dRKCnchR+gJG27gqnwv0ld35PV57gErZl/w0GF3s1nKSCEhOIsPg
         9vX1+HbL5fHlIFG5S3AHjEcErmlzekput1gjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VvTyEH/5OPHkuR2uQBZQ7iKaDkYMP3ddbHbrnIA3UKs=;
        b=GBTv6RhEAjEnR26gDf7YlG7dHorUnP5UsX/tdjWqYhypGBODF1crqCKKuLIQgwaJCa
         pcxV8s7ALmTEHbgPLfwzs1yHyFKpzzgE+Whfxl4syDF60cfTh+7bg/qhHDIS7u4mWSOV
         ikyT6kP5JolU+opXLk6i5ccv4Hgkp1BNIKfV11ddEr7HMEni6ZWa8LwEleYyIm0Hepty
         9YQJb3WWXpbAplKVtUmPqflPw5T8d1EC1USWOOExT5BVLDX7qZa3aeB8Sy/PUbtMzxg/
         STphzAwx6diTqFObNb36IiUo2N2wHk71LP1LjpRvujqgBPU7qJCnOIQBiuCAD1UgNOv7
         Am0w==
X-Gm-Message-State: AOAM530hzbkWdN1cTkHJDdt+VewP/Y7UWRcYbBs90WcdJ7eET5RyODyL
        KYTpbinWgT8X0CaB2vZZIRG5aw==
X-Google-Smtp-Source: ABdhPJwpENg1xxH+jg6K0ihpMdjRM2t/OxkSOaVsYmQBHgSl3+yRx2+PTlWixQRUz5ScplL1e5EZdQ==
X-Received: by 2002:a62:1603:0:b029:160:98fc:ad23 with SMTP id 3-20020a6216030000b029016098fcad23mr5180310pfw.47.1604626094618;
        Thu, 05 Nov 2020 17:28:14 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id e2sm3567887pgd.27.2020.11.05.17.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 17:28:14 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, dzigterman@chromium.org,
        alevkoy@chromium.org, Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 0/6] platform/chrome: cros_ec_typec: Add cable registration
Date:   Thu,  5 Nov 2020 17:27:51 -0800
Message-Id: <20201106012758.525472-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following series adds Type C cable registration to the cros-ec-typec
driver. The first few patches perform a few minor re-organizations to
prepare for the cable registration patch.

The last couple of CLs update the USB PD VDO header file to add a
captive cable connector for the Type C cable plug field, and then use
the added macro to add the corresponding field of the Type C cable
descriptor in the cros-ec-typec driver.

Prashant Malani (6):
  platform/chrome: cros_ec_typec: Make disc_done flag partner-only
  platform/chrome: cros_ec_typec: Factor out PD identity parsing
  platform/chrome: cros_ec_typec: Rename discovery struct
  platform/chrome: cros_ec_typec: Register cable
  usb: pd: Add captive Type C cable type
  platform/chrome: cros_ec_typec: Store cable plug type

 drivers/platform/chrome/cros_ec_typec.c | 148 +++++++++++++++++++-----
 include/linux/usb/pd_vdo.h              |   4 +-
 2 files changed, 123 insertions(+), 29 deletions(-)

-- 
2.29.1.341.ge80a0c044ae-goog

