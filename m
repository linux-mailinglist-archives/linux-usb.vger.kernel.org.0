Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA5022EB056
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 17:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729696AbhAEQkl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 11:40:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbhAEQkk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jan 2021 11:40:40 -0500
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517E8C061795
        for <linux-usb@vger.kernel.org>; Tue,  5 Jan 2021 08:40:00 -0800 (PST)
Received: by mail-pf1-x44a.google.com with SMTP id v138so11075008pfc.10
        for <linux-usb@vger.kernel.org>; Tue, 05 Jan 2021 08:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=7yaUY+fT2h6mjlE+twZW/BVnXmuD8QXlKCB+chmPYA0=;
        b=CBQEJX4R75tkPVINcEEqUCZ14l9KgBBPCQCKkdaBY6GtMpeueA6gxHfgVRHjKyvliW
         TbQMf5+N2fiztx9Zty/bLoRJWXgJk9BtWtNmLHob0H4I6zs89oQx5/iPA0/LE73tZDOd
         XmA32zsmIhU6BOL5taah/rIh4P2nBO+jfLZ8N6rVAYvgw91LwIuHYWaQk2GhrW72mi4X
         LozMH++FLT9VaQ1+6R5dY2AiWmXoH3Vj628EVwTWe5bDK9kN9blen0AZZrugoqu7yNfN
         rDQ4nElXWQW40ms0LJPqJTUnz3NYkXiiUupKySRtCTWfXZLpB1hquwFg8UNN1BWHsiqW
         4Aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=7yaUY+fT2h6mjlE+twZW/BVnXmuD8QXlKCB+chmPYA0=;
        b=i8a2M8M4YaJA/UoAvldRWziJuCPyVFfPpLy9jRgmOXMR69ddjD8fcqQISITbIh/yj9
         b2182T43I9P37n4BOAsjuhlA3Bo0Mhl87Br5jCuE1pQkKD4KBEuBFV1YY5VvJXH/mNUH
         SBhwJEaCMWbThnXlhSCNqssWOXqkrLept9/vi87QvHAof/kzmC+/lMdG4KgMA1jdpMwH
         fB+xPhjTtfDD0rs1RwbTyJ8B4cwpbtwQSChpcXtoWxuNjJyJHVU8urGk4KXW79/1diU5
         yQs3dkCTTUpExq8TPc24AgR6H1+JZWJCVEA1j9gcHchZ0qM5305iA5gEk9jAtDP+bbD1
         n1pQ==
X-Gm-Message-State: AOAM530Uzc967rO5YNFeolWUmzPekJZaYensqkL0D1arqqL1dvg0ZqPD
        eAInfUIi+W6WVVRNqGkF7Z+PAgqJGrFO
X-Google-Smtp-Source: ABdhPJzpO+y903fp1AqT/70A8Eld/UOHe4aLQEvcCAxOZdk+q495vMVUrlXo9BCvHvYDbr2M/PRBRNuxWP2y
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:3e52:82ff:fe5b:30db])
 (user=kyletso job=sendgmr) by 2002:a17:90a:8b94:: with SMTP id
 z20mr483885pjn.1.1609864799630; Tue, 05 Jan 2021 08:39:59 -0800 (PST)
Date:   Wed,  6 Jan 2021 00:39:24 +0800
Message-Id: <20210105163927.1376770-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v5 0/3] AMS, Collision Avoidance, and Protocol Error
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, hdegoede@redhat.com
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series include previous patch "[v4] AMS and Collision Avoidance"
https://lore.kernel.org/r/20201217030632.903718-1-kyletso@google.com
and two more patches "Protocol Error handling" and "Respond Wait if...".

The patch "AMS and Collision Avoidance" in [v5] is the same as the one
in [v4] (only rebased to ToT).

The patch "Protocol Error handling" is based on PD3 6.8.1 to fix the
wrong handling.

The patch "Respond Wait if..." is to fix a conflict when 
DR/PR/VCONN_SWAP occurs just after the state machine enters Ready State.

Kyle Tso (3):
  usb: typec: tcpm: AMS and Collision Avoidance
  usb: typec: tcpm: Protocol Error handling
  usb: typec: tcpm: Respond Wait if VDM state machine is running

 drivers/usb/typec/tcpm/tcpm.c | 925 +++++++++++++++++++++++++++++-----
 include/linux/usb/pd.h        |   2 +
 include/linux/usb/tcpm.h      |   4 +
 3 files changed, 792 insertions(+), 139 deletions(-)

-- 
2.29.2.729.g45daf8777d-goog

