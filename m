Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50DE81BB17A
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 00:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgD0W1h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 18:27:37 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:53158 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726224AbgD0W1h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Apr 2020 18:27:37 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7AE5C404B4;
        Mon, 27 Apr 2020 22:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588026456; bh=z9Oj18vcPGzeddIeJrdagNiqeZie9w/QgD1JNmTL084=;
        h=Date:From:Subject:To:Cc:From;
        b=DFe22skaIBg/krqnErYDUYyG/Zs+1DC+AJnD2KZowTswO+UgeUXTaGCy3YQMdlFBb
         KvMIDvrF/WLynb2Qw0mr42oK0hAyFj79WKkpanAKhmGMVbYiMcaUF4u4Dtb6KkAlxS
         +rvkS7bwaxHdNrvsiJpEXdTll7VZJOrqBhG7HmKwbj0FUgNlDfvZIypLWqbkK65Vox
         3X8guyjcLJ5RO0OaW5b01bnvA+ZqZQTquL8thSzABrcqt95wYfmcsDwgCMxrPz3BEQ
         8KULZGuQthtteq7XND/LCC6u3DegaTZf+/xaNeG4FLRZidsIZRxxyOJ87svpXBgJBG
         cYMROtB0Y5W6Q==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 4ACE5A007C;
        Mon, 27 Apr 2020 22:27:34 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 27 Apr 2020 15:27:34 -0700
Date:   Mon, 27 Apr 2020 15:27:34 -0700
Message-Id: <cover.1588025916.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 0/5] usb: dwc3: gadget: Handle streams
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The dwc3 driver wasn't implemented to handle streams. This series provide a few
updates to dwc3 and usb request for that:
* Introduce usb_request->is_last field
* Handle dwc3 transfer completion
* Handle dwc3 stream events

To use stream, the dwc3 driver must know which request is the last request of a
transfer. The controller uses this information to reallocate its resources for
different streams as transfers are completed. Function drivers that support
stream must indicate this via usb_request->is_last field.

Please note, I also included the patch
"usb: dwc3: gadget: Continue to process pending requests" in this series to
avoid dependency issue when applying to your git tree.

https://patchwork.kernel.org/patch/11466967/

Prerequisite
------------
This series requires DWC_usb32 patch series:
https://patchwork.kernel.org/project/linux-usb/list/?series=269641

[PATCH 1/2] usb: dwc3: Add support for DWC_usb32 IP
[PATCH 2/2] usb: dwc3: Get MDWIDTH for DWC_usb32



Thinh Nguyen (5):
  usb: gadget: Introduce usb_request->is_last field
  usb: gadget: f_tcm: Inform last transfer request
  usb: dwc3: gadget: Continue to process pending requests
  usb: dwc3: gadget: Handle transfer completion
  usb: dwc3: gadget: Handle stream transfers

 drivers/usb/dwc3/core.h             |  12 ++
 drivers/usb/dwc3/debug.h            |   2 +
 drivers/usb/dwc3/gadget.c           | 225 ++++++++++++++++++++++++++++++------
 drivers/usb/gadget/function/f_tcm.c |   3 +
 include/linux/usb/gadget.h          |   2 +
 5 files changed, 211 insertions(+), 33 deletions(-)

-- 
2.11.0

