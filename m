Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E677330BB07
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 10:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbhBBJe4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 04:34:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbhBBJeb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 04:34:31 -0500
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70EFFC061788
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 01:33:51 -0800 (PST)
Received: by mail-qk1-x74a.google.com with SMTP id s66so15458951qkh.10
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 01:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=a77I7DhRJQNYY3jb5qJsVHRL8/cRpl6u3SuuOOR6Vb0=;
        b=NXXJVim5+7KVLiKi9gkxZcd1xRLd+tjD8s7+bAvdmde9KDmFN4lTUGaelUuT4TtIJq
         rZ9AC7oxnEBkA8TumHuyiqbI2m2IOE2q8AjXstWZpPdvpzY5OWEcWQohCk7XVlObLsdt
         2UezUVCyqvVUrwbBc+fqEDxVz9vMVssmCiZ2Au9eKqnIJ/WjdEWkxRSO1LFM+PVYIx/J
         MMFYZEss0A3SJ4DSpIlUzG+bIsrBIEPBwKLFJAFR0jAoMfgPHhiatRXDLhYVJeJJZhxR
         CTsppq64F0L0Crt1uOBWXIEfo4mGZzyv3KF8mUJXpSsJmAy/SC1oK0DFgw3JEYZ/HRsG
         GLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=a77I7DhRJQNYY3jb5qJsVHRL8/cRpl6u3SuuOOR6Vb0=;
        b=p52onxQU9+RfZE51Ph1kN1sxY06RlNJ1IgDWdsvKt7kbQhVVFStpw+m3jQ1ix9h684
         6H1/5v5QRdXuB/XfJzJUjkNU8FYHwiYjYdqk5+NOEYEw0UvkU2SkWABbPathANbp+Boa
         XSB4K5J/nfX1bQkU6UuJEpb7M1+RGpD2MEUIWHPPU9D+T9e57RJ+71RfyXMRhm219QGt
         6LyNnSA3hHkdOKiCxpyI+ZPEcHhPH2jfL4uxOlBX2X8TVTfJi7tFjEC58roPatphpg3c
         5Pa29qQKO7o2wpxPGTbSHtB7aj4XEM+NAUpCezHGC1jQDzCqVyCz59fwqH3oeLn7lqu1
         ZiJw==
X-Gm-Message-State: AOAM531jnAal+NaNVeFMARUvTz9m8OG4izSle6E+JwGtT38JHybcsVfA
        YinXZdpZ+ZQzpptwTHXZw335/GtCDcly
X-Google-Smtp-Source: ABdhPJyEEXBPYlDd86IJsTbfBdsiMjI5Kd86ouTISlWZ9Sq5V22iEZwZikV7z9AwBr7DU0N/PiimTAPu53ET
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:dd94:c753:a81d:c855])
 (user=kyletso job=sendgmr) by 2002:a05:6214:9d3:: with SMTP id
 dp19mr18947783qvb.40.1612258430573; Tue, 02 Feb 2021 01:33:50 -0800 (PST)
Date:   Tue,  2 Feb 2021 17:33:34 +0800
Message-Id: <20210202093342.738691-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v4 0/8] common SVDM version and VDO from dt
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

v3 is here:
https://patchwork.kernel.org/project/linux-usb/cover/20210201133421.408508-1-kyletso@google.com/

no changes except for separating the patch 
"[v3,1/3] usb: typec: Determine common SVDM Versions"
into the first 6 patches in this patch set.

Kyle Tso (8):
  usb: typec: Manage SVDM version
  usb: pd: Update VDO definitions
  usb: pd: Make SVDM Version configurable in VDM header
  usb: typec: tcpm: Detemine common SVDM Version
  usb: typec: ucsi: Detemine common SVDM Version
  usb: typec: displayport: Fill the negotiated SVDM Version in the header
  dt-bindings: connector: Add SVDM VDO properties
  usb: typec: tcpm: Get Sink VDO from fwnode

 .../bindings/connector/usb-connector.yaml     |  11 +
 drivers/usb/typec/altmodes/displayport.c      |   8 +-
 drivers/usb/typec/class.c                     |  21 +-
 drivers/usb/typec/tcpm/tcpm.c                 |  61 +++-
 drivers/usb/typec/ucsi/displayport.c          |  12 +-
 drivers/usb/typec/ucsi/ucsi.c                 |   2 +
 include/dt-bindings/usb/pd.h                  | 311 ++++++++++++++++-
 include/linux/usb/pd_vdo.h                    | 315 ++++++++++++++----
 include/linux/usb/typec.h                     |  10 +
 9 files changed, 661 insertions(+), 90 deletions(-)

-- 
2.30.0.365.g02bc693789-goog

