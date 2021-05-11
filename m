Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6A0379CDE
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 04:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbhEKCVy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 22:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhEKCVx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 May 2021 22:21:53 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280BBC061574
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 19:20:47 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id g65so10213072wmg.2
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 19:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Y97etY7Y7kudZrD7M143SKsPqzdCVvd8at3ShCPO90=;
        b=J+chcAuB+bHf0jMOuHdpZ10itHPAsGsnfOedTeFaAsC7/WnUeGylQmPM6lW+9JGuVn
         VE4wIy98SAPHmtYujngAUVQQi9ZQWUKd94KomgGRYuBIczCeaEQsg8P4pWpjeO3dj0D5
         gTbOaZTO7WpAkC2lsZOUOfFnGahDb7UBJ1R0NSjVyA0P2WZwYUp47gj6+jEnQoRbswAc
         bhHANDwHZyxcDJRLkv0RcYuL9ey8/v7RNgNaAt1R0trL/CwyqgB6YNsX0/3vwZyiQkvh
         uw1Eb4tj5OxlZ6i5XE55a2TYK4tZihSqNxrn0t64krkGTdnNibPm1OT/LSP05nfevDqB
         WVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Y97etY7Y7kudZrD7M143SKsPqzdCVvd8at3ShCPO90=;
        b=VGEKhaKJJcOGLgeLiEbp9C/rXUKmlcAjek97GlWxWzBCymYcbf2HQc3r7PWbUJzsja
         lv2AdT581U+nZpSQ0xbXnpnJELIP8LED8vicH3psdLObQStrv/9Y7fnF2Cr7AD05gO1/
         vSJ6HsceNyaesnmGkXcLNPZobiQCoQppKAuEYjAnqivwOk9rYB0roDPg89wnLrGU1Dqk
         9oq4FPUi26jIWqo9JvJqoL2Kg8FVEDtX/7OODM+lY0bhxKKYz2mv8CBOdPzyqT3xHuOi
         SJdZCUGRCBmprtDaY2MtgBY2ZyZCxiIypRy+V8sz/hUANxYTqSlBwhuuhot1BCMhlgCL
         INfQ==
X-Gm-Message-State: AOAM532aMi9FfUkotGUR90mEYL8ltZLzX4511rzKVZyr4QVyUSeNB+Ef
        Y5/F7dSh6BXBwZpgGZ/O6/8chw==
X-Google-Smtp-Source: ABdhPJzwh4Ov/imJDn7XQUsTzocyLoCBRkwkSMmkCOxLwztgU3jkrNqSOMAcYm6gMX/ndXMH0AbLfA==
X-Received: by 2002:a05:600c:1994:: with SMTP id t20mr29641926wmq.177.1620699645910;
        Mon, 10 May 2021 19:20:45 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t18sm11792981wmq.19.2021.05.10.19.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 19:20:44 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 0/2] usb: typec: tcpm: Fix logic and documentation of tcpc_dev->init
Date:   Tue, 11 May 2021 03:22:22 +0100
Message-Id: <20210511022224.1309077-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The tcpm code treats the init callback as optional when registering a port
but as required when doing a tcpm_init(). In addition we uniquely don't
document init in struct tcpc_dev {}.

This series fixes both situations calling tcpc_dev->init() only if the
implementing driver provides an init and documenting init in the tcpc_dev
data-structure for consistency.

Bryan O'Donoghue (2):
  usb: typec: tcpm: Call init callback only when provided
  usb: typec: tcpm: Add a description for the init callback

 drivers/usb/typec/tcpm/tcpm.c | 3 ++-
 include/linux/usb/tcpm.h      | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.30.1

