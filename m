Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E963B1A5BFD
	for <lists+linux-usb@lfdr.de>; Sun, 12 Apr 2020 04:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgDLCT4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Apr 2020 22:19:56 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:58652 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726565AbgDLCT4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Apr 2020 22:19:56 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 418C140191;
        Sun, 12 Apr 2020 02:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1586657996; bh=e1RPQr/bd6dwRqtRqyD8PafDdARLW8xtaEm0M2oYXjU=;
        h=Date:From:Subject:To:Cc:From;
        b=c/AncfP/o/5CdowA4QvU/45sBwuZtpdyGmjtYUV0DFR0eLMrrbs/UlgCXtjnLbaSG
         PRTjN4r/9W54olGoOCn61e3Ub5aPt7jmLHFjnbVlzjHhMYZI5PxpF815Lx1Wlhb7Ie
         qy1deh698pbbm4ABPSay4O078XQDpiDTn4Qk7glrHUJFM3807eJAIjbRehC1aAFAQ5
         uwDGw3CZKzflf2MT2CKHK2MhaR7tQKffiwveEXQrqpgGrwbq/rF0UG/hn/Fdtinjn7
         qpHYQSTu1mEyQhKz5F325Oky00CbwueH+EWbL85Etcbfkv4+GbxXDLH4BXO/qUa2dp
         f8sm3WhenpP0A==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id DFCAFA0078;
        Sun, 12 Apr 2020 02:19:54 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sat, 11 Apr 2020 19:19:54 -0700
Date:   Sat, 11 Apr 2020 19:19:54 -0700
Message-Id: <cover.1586657326.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 0/2] usb: dwc3: Introduce DWC_usb32 IP
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
usb: dwc3: Fix GTXFIFOSIZ.TXFDEP macro name
usb: dwc3: gadget: Properly set maxpacket limit

https://patchwork.kernel.org/cover/11283761/

https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/log/?h=testing/fixes

Changes in v2:
 - Change the macro to avoid constant to constant comparison static analysis
   warnings. (DWC3x_VERSION_ANY == DWC3x_VERSION_XXX) => !(DWC3x_VERSION_XXX)


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

