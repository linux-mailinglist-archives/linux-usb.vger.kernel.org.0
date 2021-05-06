Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED913758F6
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 19:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236124AbhEFRLi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 13:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236042AbhEFRLh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 May 2021 13:11:37 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C00C061761
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 10:10:39 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id j3-20020ac874c30000b02901bab5879d6aso4011797qtr.0
        for <linux-usb@vger.kernel.org>; Thu, 06 May 2021 10:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=i5hbcI2b08ctJKsV+uyax41mbRV5yx+2PLw98oS0cyA=;
        b=cYpbRdAInq0ahsOxhhQDHOVzl2EHq7QVAlu3VoOnoHoPM6dHTEedg7JrMLWcyLuzPm
         zlccXnYyNnRJdTCctN9qIPMqNiLY6fAJ+nUlTZ0lebyuD/vF+pYur5RTcesMRk9OLfsM
         /3IrgJOi6R99I3LwrJ78YHoLKGs6fdUDCNdsDW3a4VyrASvdCsTrz1wTxbFbL5tWB4Tm
         INrtE2x+683XsreqXP5EE9uEaPq/d/8mxRHZqgX/AQrWb9UxCjYOmCw3Ez4JpoFbXKTj
         RPUOEUX1mgCDthTtab3HNoMvl8x2eFfFt0s/ZWLVRl/vbPbfzRAqfK4MV6WH8DqGnYLm
         +OtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=i5hbcI2b08ctJKsV+uyax41mbRV5yx+2PLw98oS0cyA=;
        b=DpFv9qoRUzZgmyOjVd/DkR6SLUW8uEEcoSKuF9+zmSAoVv2l79TXEobfa/bT5M1toW
         RKN16HUkcPDuKVXZH21SK/NUwwmFEl9UKfzgINyxP/PFoBlGu6Rm79fWavop0b42Btbo
         LWYw3tVCNu506gNhQl8+hrqZ3eus0TypLFonn+OYEqX4cmD0MrLE+0ifI2wUjNhDT/6r
         hnbFkigRJM+5ZfRnQn+LuzndhVu4sAeSyhnFt5mWMh8S05t3MAx2s+i4bohQiEGZ0dXM
         un63OCcgcXuY0xOzMK5YWZin504kaob26BBvSPBaYHwQsrWhRfENEigSLbhh5uOx/oM7
         T3sw==
X-Gm-Message-State: AOAM531w8u5BY8R15B1XIpWzPdRcZlTMibA2JzhKxDxqURoyz3TMQR2j
        42yVFBHorFPQfNiMF/eMaK6mZxbCKLjn
X-Google-Smtp-Source: ABdhPJx1Qh9ZnnpOXcw0rDlmx7IiVVSYANT+aJil6BYGXaRj01+yFGWnYY3Ec6O2jMqPdCop9rpd19kEvrlY
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:9a5c:8de0:4c79:ba52])
 (user=kyletso job=sendgmr) by 2002:a0c:e6c5:: with SMTP id
 l5mr5829060qvn.2.1620321038643; Thu, 06 May 2021 10:10:38 -0700 (PDT)
Date:   Fri,  7 May 2021 01:10:24 +0800
Message-Id: <20210506171026.1736828-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
Subject: [PATCH v2 0/2] VDM management improvement and some bug fixes
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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

