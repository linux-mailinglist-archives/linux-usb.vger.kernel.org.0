Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B12DE1A4D6A
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2020 04:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgDKCNv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Apr 2020 22:13:51 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:36590 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726671AbgDKCNu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Apr 2020 22:13:50 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 79B97C00A7;
        Sat, 11 Apr 2020 02:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1586571230; bh=m5qHkOKsle+76d2r6hwrWo6gCwKktTkEBGmPuP6biCc=;
        h=Date:From:Subject:To:Cc:From;
        b=PNgiyOAkvGk2CGnbhunaajw5yb4BkXa+2r83tL9mXaKkfs7BX0AWmdY9nPZAn42lb
         MJVmhTIjpHi6mupugQEW1Y8yLF8Q1OQLb73/agbyuTtqGeMtaXxfX2NkPTSs46Bonh
         jxyntpjh/KNNAPkwRE6zVL9rfmwITd3JhcPDpWzjx3ECs7/BydKg3q+w4HXZ4vZKzi
         b8cJGoPy8PHzyIGWWAO/x6kkEIxUWAqirRu5IUNQ0qCJE57GyaP2EiNJYSc99JyNtm
         e3jaJlbYdxLxU11yNyJpauPJ0YhXqYgeLOk0fYyLmAy98SkZRX2khs/w4bFr8g/oAT
         whRsKDxBD/B4Q==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id E5933A007B;
        Sat, 11 Apr 2020 02:13:48 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 10 Apr 2020 19:13:48 -0700
Date:   Fri, 10 Apr 2020 19:13:48 -0700
Message-Id: <cover.1586570825.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 0/2] usb: dwc3: Introduce DWC_usb32 IP
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series adds support to Synopsys DWC_usb32 controller. The controller
supports dual-lane and speed up to 20 Gbps, and the DWC3 driver will drive this
controller.

The configuration and programming model for DWC_usb32 is very similar to
DWC_usb31 and DWC_usb30. This series is one of the first sets, and it only
includes the necessary changes to recognize, initialize, and run DWC_usb32. It
includes:
* New IP checking scheme
* IP Checks for DWC_usb32
* New MDWIDTH parameter for DWC_usb32

The change to support lane count and lane speed mantissa will come in a
separate series. Hopefully this helps simplify the review process and help push
the change in steps.

This series is base off of Felipe's testing/next branch:
https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/log/?h=testing/next

It also depends on the following patches in Felipe's testing/fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/log/?h=testing/fixes

usb: dwc3: Fix GTXFIFOSIZ.TXFDEP macro name
usb: dwc3: gadget: Properly set maxpacket limit

https://patchwork.kernel.org/cover/11283761/



Thinh Nguyen (2):
  usb: dwc3: Add support for DWC_usb32 IP
  usb: dwc3: Get MDWIDTH for DWC_usb32

 drivers/usb/dwc3/core.c    | 49 ++++++++++++---------------
 drivers/usb/dwc3/core.h    | 69 +++++++++++++++++++++----------------
 drivers/usb/dwc3/debugfs.c | 14 ++++++--
 drivers/usb/dwc3/gadget.c  | 84 ++++++++++++++++++++++++----------------------
 drivers/usb/dwc3/host.c    |  2 +-
 5 files changed, 119 insertions(+), 99 deletions(-)

-- 
2.11.0

