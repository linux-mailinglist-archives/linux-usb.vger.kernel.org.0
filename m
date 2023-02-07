Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA19068D50F
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 12:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbjBGLFq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 06:05:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbjBGLFo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 06:05:44 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BBADBDC;
        Tue,  7 Feb 2023 03:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675767943; x=1707303943;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fXOh6l9nudX6hQdwn8eYhtvO+xZ109uDckra2QaO+SI=;
  b=qlQhJf1IMKpQRH2b4tgtZwUwuwrJ40cWdyGOeaoflaPIdd2SgM+iCFLR
   nsFYptyBLddQX5ifBfq1y+k2bm0YP78WsLpPD1aALY0sXIpdO6dW/Mljp
   L8wQIU3BSFPNlRoUXM1OqnbUkBHjpqatREJFnuG283KS6HNc6yhrcLEG4
   67ag/C8TersWWNIZ9oUapY2yOZpDOsNImJmQcR1Jt7BXjzlNLcIyALNBc
   c8MwtSMyT8+H9kRsHuwKRaCuj8kT/sV7O2ZnzzJdWrMqCn9k9vMWRLdTt
   DXhBtfznQCfvAKNhlwyf7SLNBXtwMq1TcPDHBtpLxkmxX96OMR28rL8AX
   w==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669071600"; 
   d="scan'208";a="28917148"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 07 Feb 2023 12:05:41 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 07 Feb 2023 12:05:41 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 07 Feb 2023 12:05:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675767941; x=1707303941;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fXOh6l9nudX6hQdwn8eYhtvO+xZ109uDckra2QaO+SI=;
  b=X00C0+SePsts98wX9cda+PakGEd2IILpSE2otYYjPvoSasgm5/x0tZLs
   EDH/mxMGG30PsodMlMTqxd8CrCrEpSUymdG4L9Bk1LXHhPe/a+FqD+Zj9
   j0lRPRnT84CtuSwiDr+W2Mia+qwGD6nttvss3JZO+ZuV2SJtXtLwBtQSP
   PQPcFJsEYdeCCKwM6jxjEterPuIZ6YY7rgv44sQUKwkcogUeRYXDy9n9t
   LuAimCLtS7SzFXgzFnQ6Aj4hKnTe0NPfw3Zmy5wf9/iqtrNRl0Y6LaSfU
   hxK5x3F47IpzgxQk5bdusIMclq9DQ1AgfMPlEZA0NKdPmzdcHCCi03Ju9
   A==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669071600"; 
   d="scan'208";a="28917147"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 07 Feb 2023 12:05:41 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 581E6280056;
        Tue,  7 Feb 2023 12:05:41 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Darren Stevens <darren@stevens-zone.net>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 0/3] Fix ehci-fsl autoload regression on fsl-mph-dr-of
Date:   Tue,  7 Feb 2023 12:05:28 +0100
Message-Id: <20230207110531.1060252-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I noticed on my ls1021a based platform (TQMLS102xA) that the platform device
created by fsl-mph-dr-of does not autoload fsl-ehci. Digging into it I noticed
that starting from commit bb160ee61c04f ("drivers/usb/host/ehci-fsl: Fix
interrupt setup in host mode.") this platform device has the wrong modalias:

$ cat /sys/bus/platform/devices/8600000.usb/fsl-ehci.0/modalias 
of:NusbT(null)Cfsl-usb2-dr-v2.5Cfsl-usb2-dr

This is the modalias of the parent device, thus module ehci_fsl is not loaded
automatically. Given the reason of removing the IRQ resource from DT in
commit a1a2b7125e107 ("of/platform: Drop static setup of IRQ resource from DT
core") the of_node has to be assigned to the subnode, but for modalias the
reused of_node has to be ignored.

Patch 2 is not strictly required to fix autoloading, but this is still a bug fix.

Best regards,
Alexander

Alexander Stein (3):
  of: device: Ignore modalias of reused nodes
  of: device: Do not ignore error code in of_device_uevent_modalias
  usb: host: fsl-mph-dr-of: reuse device_set_of_node_from_dev

 drivers/of/device.c              | 6 ++++--
 drivers/usb/host/fsl-mph-dr-of.c | 3 +--
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.34.1

