Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0AAF309D68
	for <lists+linux-usb@lfdr.de>; Sun, 31 Jan 2021 16:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232360AbhAaPUC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 31 Jan 2021 10:20:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbhAaPTg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 31 Jan 2021 10:19:36 -0500
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65E3C061574
        for <linux-usb@vger.kernel.org>; Sun, 31 Jan 2021 07:18:55 -0800 (PST)
Received: by mail-pg1-x549.google.com with SMTP id 145so363766pgh.2
        for <linux-usb@vger.kernel.org>; Sun, 31 Jan 2021 07:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=pWaLe0rxHbHoPOLQnEvoezPzhzm6i0a3yIHNzO6Spxk=;
        b=mDzEma259JaxNYPUJkK9uxCS0LAAZ9LXdKSP3LVU12Vi8V7H6sp0T7rSJv7hryYsJG
         rwNH94ZeWqUo9blERZI9sZBbyOvPMsCJTLmWAq0TB10TvkpQgpS1do0PXiaAdObX3uh0
         ykGTav9EiPmQRgEjySssbVR/VdXnw1pKv6y7Xi/OMrCRQaep1RAqszstj7zrcImUntBk
         oXVqIHptfuWhlTCm3FDLebHEXCRW5OCCA/ft8yTUUVT/1YO8J8n63MV9Kfc8SKIoB48e
         xQH/QJan5fT3xDlbTzKJr6jMTm/0lbBf4Qcc5p5GbM4wvqd/UDR7cvO70clPJa+pakTC
         SFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=pWaLe0rxHbHoPOLQnEvoezPzhzm6i0a3yIHNzO6Spxk=;
        b=mqBK3HthjInft20ZHjG2yfzE9YnoWHgnLoYBYVHmB9lAvUjbTrP0wJ7QIqJHroiJmx
         PKZ2QMBncH2udQGv9KEf6l0X5Lvle5B7qWuDxTgpbsXAtf9BRTQLsamqvbOuwMQV+Zwl
         9kkWluyXD5mexhRc3v1vUi46to5nFwqZhD3kWWbmzW4VV3Q4Ai8CRQ9sZ74MLkBKJRow
         FCe5SC0pgmMjmsfjsaeWQIVrAfRoFVwBu5JdsAnuZBHqzR7LZyskCJJIs91x9ZyIHk3s
         feD9lRbXpp1CZe086l5cuzkqoPexdtty39trN/GYFnJI5Olj4YXkdD3eZhLDFsNDNUNM
         XPWQ==
X-Gm-Message-State: AOAM530kOfAhjCRWSgFy9epD8MeXlqr0spxBe4N6dAho2Hi2sI39uNQt
        ZNpxGfNAgEVcFPNRKYm+GtO3K5WIyRcy
X-Google-Smtp-Source: ABdhPJywFKKoP2bv0t61mkd7QNeIMNNNaNVtp5gAUYkkOnYtoFhNJw0USKf/elBk7HmgEQqF2OBoi4neN7bE
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:5d70:9e45:7deb:72a7])
 (user=kyletso job=sendgmr) by 2002:a17:902:26a:b029:da:af47:77c7 with SMTP id
 97-20020a170902026ab02900daaf4777c7mr14027694plc.10.1612106335130; Sun, 31
 Jan 2021 07:18:55 -0800 (PST)
Date:   Sun, 31 Jan 2021 23:18:29 +0800
Message-Id: <20210131151832.215931-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 0/3] common SVDM version and VDO from dt
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, hdegoede@redhat.com, robh+dt@kernel.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

patch v1 is here:                                                               
https://lore.kernel.org/linux-devicetree/20210126084544.682641-1-kyletso@google.com/
                                                                                
Changes from v1:                                                                
=================                                                               
usb: typec: Determine common SVDM Versions                                      
- removed the "local" variables (svdm_version) in tcpm.c and                    
  (altmodes/ucsi)/displayport.c                                                 
- added a member "svdm_version" in struct typec_capabilities indicating         
  the default SVDM version of the port                                          
- added a member "common_svdm_ver" in struct typec_port indicating the          
  common SVDM version between the port and the partner                          
- implemented the get/set API of the common_svdm_ver in typec/class.c so        
  that clients can read/update the common SVDM version                          
- added more definitions of Product Type VDOs                                   
                                                                                
dt-bindings: connector: Add SVDM VDO properties                                 
- updated the dt-bindings documentations                                        
- added more definitions of Product Type VDOs                                   
                                                                                
usb: typec: tcpm: Get Sink VDO from fwnode                                      
- updated the commit message

Kyle Tso (3):
  usb: typec: Determine common SVDM Versions
  dt-bindings: connector: Add SVDM VDO properties
  usb: typec: tcpm: Get Sink VDO from fwnode

 .../bindings/connector/usb-connector.yaml     |  11 +
 drivers/usb/typec/altmodes/displayport.c      |   5 +-
 drivers/usb/typec/class.c                     |  21 +-
 drivers/usb/typec/tcpm/tcpm.c                 |  61 +++-
 drivers/usb/typec/ucsi/displayport.c          |  10 +-
 drivers/usb/typec/ucsi/ucsi.c                 |   2 +
 include/dt-bindings/usb/pd.h                  | 311 ++++++++++++++++-
 include/linux/usb/pd_vdo.h                    | 315 ++++++++++++++----
 include/linux/usb/typec.h                     |  10 +
 9 files changed, 656 insertions(+), 90 deletions(-)

-- 
2.30.0.365.g02bc693789-goog

