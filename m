Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0121467536B
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jan 2023 12:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjATL3p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 06:29:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjATL3p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 06:29:45 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711E7E1
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 03:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674214183; x=1705750183;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hEhMLxEXikuiIYkOQb8uElMrW6BjefBIAP1pVBWL1W0=;
  b=mPOiD+NpjTe1XQ1u9TlhgtRrgWoQdOCZdzZPFGL9E7NGew4oQDb/r0ge
   1kSifymf4DHF9MW1IKRijG2oTBFOiMJkikP6yJNfLY8r9Ueff6JtuRPcg
   s3RfzovpWK5OjIMCaZRAEUO2NQiMBOIOvujJ15qZfoRFG9u7g+kSFQz/8
   mqRevxiWwe4gxgOyK70MbMBSFkpCKdHts9USPYbYsBbS5149VRDvuvAs/
   YWY3T5ZG7YSupj/1YF16GaWFiM0pg8/FjiGJJNh3IdLuCg9jNp1b+4o29
   fLuLpzJUYFMV/WlMm42sEmYRkqHPRa9Ew9nfPCj4lhnq8q+O+Uis6mCF4
   g==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28557946"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 12:29:41 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 12:29:41 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 12:29:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674214181; x=1705750181;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hEhMLxEXikuiIYkOQb8uElMrW6BjefBIAP1pVBWL1W0=;
  b=c7enzixg2VJE5j878HvvruCRTMiTr0hLzILHbWLY4YKyQFf22/RQ0ScF
   EFt7lr7IPUa1lV/VxRIAJdgHoDJ+W6OAM+pn0tqX48pykRc7HOcUcASB9
   ynWDH4C6Phtd+TkPOmcdY+8Ev+SfLBRMNfQ4KfZl7IepoYsmnso1XWn+J
   fPWwLc7qMVKhjkFimcZZZZfeg2A/LePopY1sWow2Q7xUg/oMWsKF6iYR8
   Ocz/u4KQUF+57pA6bZQZXufunQ0sUju1TQJEjc4GFxobQ5qMVizYl3u+k
   YE429ofquNrdi1lexzh29HPBjXZwvHdqs9Zc9dg6O6065Jg0J5kxeNpVn
   A==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28557945"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 12:29:41 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BE0F1280056;
        Fri, 20 Jan 2023 12:29:41 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-usb@vger.kernel.org
Cc:     Darren Stevens <darren@stevens-zone.net>
Subject: fsl-mph-dr-of: module autoload regression for ehci-fsl
Date:   Fri, 20 Jan 2023 12:29:42 +0100
Message-ID: <2791418.Y6S9NjorxK@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I just noticed that the following commit introduced a regression 
> bb160ee61c04f ("drivers/usb/host/ehci-fsl: Fix interrupt setup in host 
mode.")
in a way that the modalias of the created fsl-ehci platform device has 
changed. As of 6.2.0-rc4-next-20230117 I have the following modaliases:
$ cat /sys/bus/platform/devices/8600000.usb/modalias 
of:NusbT(null)Cfsl-usb2-dr-v2.5Cfsl-usb2-dr
$ cat /sys/bus/platform/devices/fsl-ehci.0/modalias 
of:NusbT(null)Cfsl-usb2-dr-v2.5Cfsl-usb2-dr

8600000.usb is usb2 node from arch/arm/boot/dts/ls1021a.dtsi, it's modalias is 
okay and to be expected. But the modalias from the seconds one is wrong, it 
should be 'fsl-ehci' for host mode (see dr_mode_data in fsl-mph-dr-of.c).

I guess the actual reason is the now set of_node on the new platform device.

If I revert the following two patches (bb160ee61c04f alone would result in IRQ 
parsing error)
a1a2b7125e107 ("of/platform: Drop static setup of IRQ resource from DT core")
bb160ee61c04f ("drivers/usb/host/ehci-fsl: Fix interrupt setup in host mode.")

I get the following modaliases
$ cat /sys/bus/platform/devices/8600000.usb/modalias 
of:NusbT(null)Cfsl-usb2-dr-v2.5Cfsl-usb2-dr
$ cat /sys/bus/platform/devices/fsl-ehci.0/modalias 
platform:fsl-ehci

This is what I would expect. Module autoloading still does not work, but this 
is due to a wrong MODULE_ALIAS in ehci-fsl.c. The following change fixes this
---8<---
diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
index 3d21946e8822a..92ec655fd09b6 100644
--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -29,7 +29,7 @@
 #include "ehci-fsl.h"
 
 #define DRIVER_DESC "Freescale EHCI Host controller driver"
-#define DRV_NAME "ehci-fsl"
+#define DRV_NAME "fsl-ehci"
 
 static struct hc_driver __read_mostly fsl_ehci_hc_driver;
---8<---

I'll send a patch for this.

Best regards,
Alexander



