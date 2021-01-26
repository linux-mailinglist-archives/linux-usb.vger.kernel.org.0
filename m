Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5C53044F1
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 18:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390355AbhAZRSa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jan 2021 12:18:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390382AbhAZIql (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jan 2021 03:46:41 -0500
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA616C061786
        for <linux-usb@vger.kernel.org>; Tue, 26 Jan 2021 00:45:53 -0800 (PST)
Received: by mail-pf1-x44a.google.com with SMTP id x206so7721158pfc.16
        for <linux-usb@vger.kernel.org>; Tue, 26 Jan 2021 00:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=TvDirtp33tQ52/+xfhxSiL9lDOUp03iq0TnEaNmWwQQ=;
        b=bo/qYJO/oWZGzk/RT0zMkXs3Ry7yVRr04zttXknovn8ZuFXa85/EcnqhgYLpg/kLbC
         ZWi25BKBWd+66y9XCGYfS6iWMVwQyMFbxQnPtFE8O4lfNB667xGyiY56IChHH5YB/1Nr
         xVMu7drtb+kPwQrKYh2Sw6cQ9XyZIw3C/RCMG0kob1M7vsf9ESRo+z08g+QqZ2eFABBj
         z/a75c12n1yZwUHSTUZm5dRT4imd4DyIWQZav4p6wRf1k7jP9DU2GkqN9z+2VY2meGig
         SYmGDNQNvt73YAgmYVacSqt671mlNnaohCuusHnX1z3PrqM7efAL/R9V5CEAK4bL1z52
         Mjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=TvDirtp33tQ52/+xfhxSiL9lDOUp03iq0TnEaNmWwQQ=;
        b=Ld7Ut6laLhmVhphz04454z5FDxsh9kXJWRxBOAbS7Nt3TfIomHShsPxkvnX+j8UkR0
         bse+ZW25GWOXq+BXlTGk7a19h0n2+VHHOZ9lsYEmGMsw95yOH97lN4adkVYrrQRhDxL2
         xUt7vFVs1ShUOjdRAn8FOo1SsAignPYnLHG6x3OpUEwRVLWWZDOMP5ron+CrMavTO1Xf
         zPlCFXPx9R81SVTyonJu3xQi91jsiI2vBK9tYdD3wbHJUGe7/wYo7wBhA+/oRct/HE+Q
         kAHkVMoLXTU6en42ZQl6Kxwt6nYvFVEgvqs/MGoMWX4USkFsTBC6ZkZkeOY3RUlCs02z
         tprg==
X-Gm-Message-State: AOAM532OA9Z0GT/Jj/ib56zlakKPrz3GRau2yx9wBwUBahN2gSrvsrLW
        s/AB35QOmz9/xxjpBHNDZI/Uyp/sFN0i
X-Google-Smtp-Source: ABdhPJwpx0HIv3y1JBgyuhRp7JMI+b0CQQDa80hg7y5P3WpuD9CFOIEDueuJD8x6PH4eP17R4/5Rq0r2uH0y
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:4430:c29c:1e76:3e65])
 (user=kyletso job=sendgmr) by 2002:a17:90b:3789:: with SMTP id
 mz9mr5203328pjb.4.1611650753479; Tue, 26 Jan 2021 00:45:53 -0800 (PST)
Date:   Tue, 26 Jan 2021 16:45:41 +0800
Message-Id: <20210126084544.682641-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH 0/3] common SVDM version and VDO from dt
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        hdegoede@redhat.com, badhri@google.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The correct SVDM version we should use is the lowest common version             
between the port partners (plug) as stated in the PD3 Spec 6.4.4.2.3.           
It is determined in the Discovery Identity command so cache it and set          
the value to the version field of the VDM header in every later SVDM.           
                                                                                
Like the previous patch "usb: typec: tcpm: Create legacy PDOs for PD2           
connection"                                                                     
(https://lore.kernel.org/linux-usb/20210115163311.391332-1-kyletso@google.com/) 
The field is changed before sending it out of the port. I know this is          
not a good idea but at least it works.                                          
                                                                                
The other two patches are about to get the VDO from fwnode so as to give         
more flexibility.

Kyle Tso (3):
  usb: typec: Determine common SVDM Versions
  dt-bindings: connector: Add SVDM VDO properties
  usb: typec: tcpm: Get Sink VDO from fwnode

 drivers/usb/typec/altmodes/displayport.c |  6 ++-
 drivers/usb/typec/class.c                |  8 ++--
 drivers/usb/typec/tcpm/tcpm.c            | 56 ++++++++++++++++++++----
 drivers/usb/typec/ucsi/displayport.c     | 12 +++--
 include/dt-bindings/usb/pd.h             | 53 +++++++++++++++++++++-
 include/linux/usb/pd_vdo.h               | 40 ++++++++++++-----
 6 files changed, 147 insertions(+), 28 deletions(-)

-- 
2.30.0.280.ga3ce27912f-goog

