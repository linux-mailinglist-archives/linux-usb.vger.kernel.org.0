Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D071B37602C
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 08:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbhEGGYJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 May 2021 02:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhEGGYI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 May 2021 02:24:08 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0296C061574
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 23:23:06 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id x3-20020a170902fe83b02900ed392de0bfso3567460plm.22
        for <linux-usb@vger.kernel.org>; Thu, 06 May 2021 23:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Rdh0vRzSHWi0umCQDgHyPw54MZmqXW1urreOABEWOo0=;
        b=s7OXqMysxV0wyGqiHPyAopSoFuw1ZvUiirjHDE8W3YBKQmrdXCngfhxd+vOgSpdzAH
         tuk8Ag7Of06D4jXZLzchte5WrLVCOgYd5sEbL3RM/CoJEFgLlWs7FOzQzvtODxVraBwx
         2OZ63utQ5CNxVVtj9nEDt+g5j4m2nAjEVuJNIw6U4SDlivu/bKj6iH6yA9LG7Pofz2q+
         /UHPS4UTpO2asuJbw7wLpnG2N8e9wrW/j6tDRg+OCYmjIZEhTm1/7byjz6JftmlFGAd0
         lkvWw/oA5w6OeiX6j7G6MSRiJRlr2SVfDMjDrgTi5UVLIZE3Oo9alR1JdPBuDfZ3Fpvf
         To7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Rdh0vRzSHWi0umCQDgHyPw54MZmqXW1urreOABEWOo0=;
        b=SD1rPsCsmT88IZMxXaR0Qt6uKCO9vYVvm/hRWzSzgJdHxHj/KotFHSS0HsassnJoCf
         w7LefqMVVliwWG5wNAIkRXPGOcen854jgyeLQC7JVFe+M8OwtmnFt/e0UGiqzUV1WCUD
         hciI4O2Wxo39URkSkXZ07df7NHHco+dyWamr1Xsa90vjER7apL0Wz393Pn2PIO6yznv4
         fMUK1KrK+I3/ZiYGEcF5ZOwORNwrEPzJPkfQsx3bK8YXZupIqYDo9mayPlUJDrqFm7AF
         zju4GJjeIWLL2Aoo0JIgylAXkFWZ2XU0D9RHcQ0f2WF5c6aVBxh1aZzDldfYbMUQzRx0
         yZ4g==
X-Gm-Message-State: AOAM531V8cgJtaxlS+NdRdh6+yCwlyVr5+li4/jIGU/sTo5wlEm1M+c1
        a9HlZujjpC6PF926ZHUWZOxKGqevbBT6
X-Google-Smtp-Source: ABdhPJxwn6YciE5u4JFCfq3pvH6+NmzwfobwWNdT5QoOJQU3JbPCMO+80b2ndzXZQgld5pvoWuCX1TTYemBp
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:9a5c:8de0:4c79:ba52])
 (user=kyletso job=sendgmr) by 2002:a62:4e87:0:b029:29e:ea03:6343 with SMTP id
 c129-20020a624e870000b029029eea036343mr6065411pfb.2.1620368586270; Thu, 06
 May 2021 23:23:06 -0700 (PDT)
Date:   Fri,  7 May 2021 14:22:58 +0800
Message-Id: <20210507062300.1945009-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
Subject: [PATCH v3 0/2] VDM management improvement and some bug fixes
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No changes since v2 except for "Reviewed-by:" and "Acked-by:"

--
v2 cover letter:

usb: typec: tcpm: Send DISCOVER_IDENTITY from dedicated work
- nothing changed since v1
- Hi, Greg, do I need to add "Reviewed-by:" and "Acked-by:" ?

usb: typec: tcpm: Fix wrong handling for Not_Supported in VDM AMS
- I stacked these two patches because they are somewhat relevant.
- This patch solved 3 bugs
  1. Not_Supported should be acceptable in VDM AMS. Previous design will
     send Soft_Reset after receiving Not_Supported
  2. vdm_sm_running flag should be cleared in some VDM states
  3. If port partner responds Busy, the VDM AMS should finish.

Kyle Tso (2):
  usb: typec: tcpm: Send DISCOVER_IDENTITY from dedicated work
  usb: typec: tcpm: Fix wrong handling for Not_Supported in VDM AMS

 drivers/usb/typec/tcpm/tcpm.c | 99 ++++++++++++++++++++++++++++++-----
 1 file changed, 87 insertions(+), 12 deletions(-)

-- 
2.31.1.527.g47e6f16901-goog

