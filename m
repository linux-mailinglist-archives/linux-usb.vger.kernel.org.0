Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6654C779374
	for <lists+linux-usb@lfdr.de>; Fri, 11 Aug 2023 17:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235743AbjHKPrR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Aug 2023 11:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235703AbjHKPrR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Aug 2023 11:47:17 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 32A73270F
        for <linux-usb@vger.kernel.org>; Fri, 11 Aug 2023 08:47:15 -0700 (PDT)
Received: (qmail 285616 invoked by uid 1000); 11 Aug 2023 11:47:15 -0400
Date:   Fri, 11 Aug 2023 11:47:15 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org
Subject: [PATCH] USB: core: Fix unused variable warning in usb_alloc_dev()
Message-ID: <7223cc66-f006-42ae-9f30-a6c546bf97a7@rowland.harvard.edu>
References: <202308092350.HR4PVHUt-lkp@intel.com>
 <d814a834-de95-486b-9c97-2a4f673700f4@rowland.harvard.edu>
 <2023081032-launch-unrigged-2a4b@gregkh>
 <2023081034-nanny-repacking-3f26@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023081034-nanny-repacking-3f26@gregkh>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The kernel test robot reported that a recent commit caused a "variable
set but not used" warning.  As a result of that commit, the variable
no longer serves any purpose; it should be removed.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308092350.HR4PVHUt-lkp@intel.com/
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: 1e4c574225cc ("USB: Remove remnants of Wireless USB and UWB")

---

 drivers/usb/core/usb.c |    2 --
 1 file changed, 2 deletions(-)

Index: usb-devel/drivers/usb/core/usb.c
===================================================================
--- usb-devel.orig/drivers/usb/core/usb.c
+++ usb-devel/drivers/usb/core/usb.c
@@ -644,7 +644,6 @@ struct usb_device *usb_alloc_dev(struct
 {
 	struct usb_device *dev;
 	struct usb_hcd *usb_hcd = bus_to_hcd(bus);
-	unsigned root_hub = 0;
 	unsigned raw_port = port1;
 
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
@@ -694,7 +693,6 @@ struct usb_device *usb_alloc_dev(struct
 		dev->dev.parent = bus->controller;
 		device_set_of_node_from_dev(&dev->dev, bus->sysdev);
 		dev_set_name(&dev->dev, "usb%d", bus->busnum);
-		root_hub = 1;
 	} else {
 		/* match any labeling on the hubs; it's one-based */
 		if (parent->devpath[0] == '0') {
