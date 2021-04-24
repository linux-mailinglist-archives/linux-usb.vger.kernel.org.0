Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72227369DD1
	for <lists+linux-usb@lfdr.de>; Sat, 24 Apr 2021 02:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235744AbhDXAaP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Apr 2021 20:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232807AbhDXAaF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Apr 2021 20:30:05 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17020C061574
        for <linux-usb@vger.kernel.org>; Fri, 23 Apr 2021 17:29:27 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id e65-20020a25e7440000b02904ecfeff1ed8so14875675ybh.19
        for <linux-usb@vger.kernel.org>; Fri, 23 Apr 2021 17:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=t9E6AgM/NK1c0PjlCo7SjL7vvuTwSd4YtwEbnSzZpWc=;
        b=VtdIH68xM1pygyf08EF1RBtP6FuOKh1JQGkVtn4Oc2LNZkHX5CJaAK5cPokvcDPZTh
         R4LNvRXeyh1pnUzb7H2U44dvCQi2oF00eDmGW3gW6v4m8VrdQuIpzUNgGmJMO3Pzz6zm
         gpsWXHuZ2WSSPgmM/pcQPRP9L3ncwjkBLwZ/DG6X6EAusrwAWwInS7F9//fEgNK0IF0v
         BRcAUR2d/oJtodkeA+sg4222nkdiRyFgBJI6vJGSgRM5/saMkhJgZeNZXTOvTW15Kegd
         7w1v6hkSWmLHsWkJF8Bg6pJAkXw9RheLqpEXnOxGlYwuJYJXBrX6Ll1omJUMLWXmmdZO
         Ngzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=t9E6AgM/NK1c0PjlCo7SjL7vvuTwSd4YtwEbnSzZpWc=;
        b=MyrTwx9aXcKqggpDcWculuJ5HGsuVtz6+mY4Qv1jFhYB9g+DHbadH0VRcyixXsxWHv
         /+BVYssp07W2gnFSLt8krNX0B9EVz8593SgihJ9oxw7x4vQ+a4BgpSLszowSsHk7ZRXa
         KCeP93z253atAS59iUGzZ1ITm/IC0XhxvX3cOQ8aNEpnFZpuqYOo772cx91GppKlBUHv
         Qlo3QkCh3NWolaqexR2nRumilMOKwM/AQzi9FEGFcGqN8yoOEUkWMtdxyi5kA4TMwitY
         YHkXz5dLndLGEFtiEmObj6catgUlnrZxasJcngSpD8rSuHUlGCIAcrAdEQlHcv5vm2dj
         6d7g==
X-Gm-Message-State: AOAM532T4MmXTW6KHibvOy7KGztV/oh/O6ZbVrmTzpE5yjx/BpDsWR9p
        oH0CjQFWH/DBHVABvclEbNmQsjr6g0II
X-Google-Smtp-Source: ABdhPJxgHuhOM9o/WEZHSxdi1z6h7fPUHRs3VR53ulgXDShVIbg3nh9bpSIHkl+4N1TSDrbAKAy+hNyy+InK
X-Received: from rajat2.mtv.corp.google.com ([2620:15c:202:201:5cef:2faf:44cf:b69b])
 (user=rajatja job=sendgmr) by 2002:a25:310b:: with SMTP id
 x11mr9110518ybx.10.1619224166211; Fri, 23 Apr 2021 17:29:26 -0700 (PDT)
Date:   Fri, 23 Apr 2021 17:29:18 -0700
In-Reply-To: <20210424002918.1962649-1-rajatja@google.com>
Message-Id: <20210424002918.1962649-2-rajatja@google.com>
Mime-Version: 1.0
References: <20210424002918.1962649-1-rajatja@google.com>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
Subject: [PATCH 2/2] pci: Support "removable" attribute for PCI devices
From:   Rajat Jain <rajatja@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rajat Jain <rajatja@google.com>, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-usb@vger.kernel.org,
        helgaas@kernel.org
Cc:     rajatxjain@gmail.com, jsbarnes@google.com, dtor@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Export the already available info, to the userspace via the
device core, so that userspace can implement whatever policies it
wants to, for external removable devices.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
 drivers/pci/pci-sysfs.c |  1 +
 drivers/pci/probe.c     | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index f8afd54ca3e1..9302f0076e73 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1582,4 +1582,5 @@ static const struct attribute_group *pci_dev_attr_groups[] = {
 
 const struct device_type pci_dev_type = {
 	.groups = pci_dev_attr_groups,
+	.supports_removable = true,
 };
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 953f15abc850..d1cceee62e1b 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1575,6 +1575,16 @@ static void set_pcie_untrusted(struct pci_dev *dev)
 		dev->untrusted = true;
 }
 
+static void set_pci_dev_removable(struct pci_dev *dev)
+{
+	struct pci_dev *parent = pci_upstream_bridge(dev);
+	if (parent &&
+	    (parent->external_facing || dev_is_removable(&parent->dev)))
+		dev_set_removable(&dev->dev, DEVICE_REMOVABLE);
+	else
+		dev_set_removable(&dev->dev, DEVICE_FIXED);
+}
+
 /**
  * pci_ext_cfg_is_aliased - Is ext config space just an alias of std config?
  * @dev: PCI device
@@ -1819,6 +1829,8 @@ int pci_setup_device(struct pci_dev *dev)
 	/* "Unknown power state" */
 	dev->current_state = PCI_UNKNOWN;
 
+	set_pci_dev_removable(dev);
+
 	/* Early fixups, before probing the BARs */
 	pci_fixup_device(pci_fixup_early, dev);
 
-- 
2.31.1.498.g6c1eba8ee3d-goog

