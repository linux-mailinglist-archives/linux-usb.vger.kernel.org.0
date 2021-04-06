Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A67C1354A23
	for <lists+linux-usb@lfdr.de>; Tue,  6 Apr 2021 03:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243142AbhDFBg6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Apr 2021 21:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243135AbhDFBg5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Apr 2021 21:36:57 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178FAC06174A
        for <linux-usb@vger.kernel.org>; Mon,  5 Apr 2021 18:36:49 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id fb10so9465717qvb.20
        for <linux-usb@vger.kernel.org>; Mon, 05 Apr 2021 18:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=F6RFq19GrARDqIU8oQ/2cAl1QQQCKUpg/f4wX1jMwdc=;
        b=qYvFm8EDAPU9Wmq0N07jK0WWJqxF5h5F6BbmsYZkG/CiVvl56NscvHZl2bkeUk7vTO
         HIbjLhQ7NxGUmp/Dqmgv9NZpgx7djcHUI2252v/ow9SxAfOJSm53NRbU7NzB6akDfw+9
         QGRshzesgFjYYYiQijUrK7YvyL/y5OjwOfPk2m4epxmhJuJKuINT7w1T4Ewih2vJU38D
         o1fWwP4/v6Tmazfk49foULmAQT7nh+FMpmk+8W4/ReRGBy5/fzvNE5SXaUXJWRVCthNr
         /qr7S+46ly1HpYIyuvHIiN12RqrloykxiOzg4ZEDkJROkOuB57azIvqIr3DEGC+gAqGw
         XFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=F6RFq19GrARDqIU8oQ/2cAl1QQQCKUpg/f4wX1jMwdc=;
        b=NlMz/Vjv7MPw5PAyglgYb4nBllNU7bEE2C1b5CxrY0EZZCTdOgJ+/xN+FdF7PyY5+t
         rWQg7s/KPVxaP4VFZS2+QeobEybfsPBglTh+YzgopEIpMlhruOyrBE3+VLOizqxUQ/5b
         0UGCwBC5j8D0KQxuToFcbhnpW7BhTgQESIbI07ReVlykO4rTzQ48yYYLABwOvdJ8Fklh
         KitEsskO6MsGJgFUZlegVLHu+4RwjW+ZS9ybEGAEgbxGdhF9vgs/GqTvSVKGpdIrO7Zx
         23+Mx2JAvpIY+gVqMxz4LRf+dmfnn68TV/HEM7dnujZExc3sZTuQKTLPbwjIywFZ4Y6Q
         pRcA==
X-Gm-Message-State: AOAM530NdwkepbSMpBMBst38i34Fj1VKVL/0dyUd4XP/sLkgpObrb2+1
        BRahqnSHRDFZlnd5kyylZp3439USw1E=
X-Google-Smtp-Source: ABdhPJx6btg2lOSc7ssHQc7YXYjwqYiOPESoGRwvRIVGgWT1FcfPoQNzNSJqMgYsJFdD3SC0hGyGyurOE5Y=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:7080:32f9:cd15:6178])
 (user=badhri job=sendgmr) by 2002:ad4:58a1:: with SMTP id ea1mr624318qvb.11.1617673008244;
 Mon, 05 Apr 2021 18:36:48 -0700 (PDT)
Date:   Mon,  5 Apr 2021 18:36:37 -0700
Message-Id: <20210406013643.3280369-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
Subject: [PATCH v1 0/6] Fixes for tcpm-source-psy- and pSnkStby
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Kyle Tso <kyletso@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

(1) and (2) in the series addresses the problem that Adam Thomson
had pointed out in:
https://lore.kernel.org/linux-usb/PR3PR10MB4142450638A8E07A33E475B080689@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM/

(3) updates the power_supply_changed based on changes
made through (1) and (2)

(4) (5) (6) makes TCPM comply pSnkStby requirement for both fast
and slow charging loops. This was also previously sent as part
of https://lore.kernel.org/patchwork/patch/1283928/

Since the patches were dependent on each other sending them this
way.

Badhri Jagan Sridharan (6):
  usb: typec: tcpm: Address incorrect values of tcpm psy for fixed
    supply
  usb: typec: tcpm: Address incorrect values of tcpm psy for pps supply
  usb: typec: tcpm: update power supply once partner accepts
  usb: typec: tcpm: Honour pSnkStdby requirement during negotiation
  usb: typec: tcpm: Allow slow charging loops to comply to pSnkStby
  Documentation: connector: Add slow-charger-loop definition

 .../bindings/connector/usb-connector.yaml     |   7 +
 drivers/usb/typec/tcpm/tcpm.c                 | 136 ++++++++++++------
 include/linux/usb/pd.h                        |   2 +
 3 files changed, 99 insertions(+), 46 deletions(-)

-- 
2.31.0.208.g409f899ff0-goog

