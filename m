Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D594E27FE
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 04:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408169AbfJXCPj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 22:15:39 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:42364 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2407918AbfJXCPj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 22:15:39 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A4D2FC0B9C;
        Thu, 24 Oct 2019 02:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1571883338; bh=sGZWpL6gdQ/F+fwyjySb7jOZlLuOPfhsCj8e+49zyL8=;
        h=Date:From:Subject:To:Cc:From;
        b=UhUACnYpIhjQ7gR7V+N2Y84pvw8qsf3jlBkJY3d9c4NnmCzF9odYSvPo6Q0iSmbPr
         YrUdp4mCYGiNBSMAR52Ou/f4njnb8beizyhnVy5LRfgNBDQ8DgFr5U6QiLVZ0AuyEf
         NEbLAiKTtBj40USg086PfCKWT4NMSU9n1pShjnvA9L1gWYX3XyjVVr5y2jBKGorf+X
         R80rqp9kmYLWpPHWshHs+toS5Zra/BpfQrlFnitQddsk3a2vRgRJlxeCy3ly+2N8vm
         mpv9aF3xd3fYyr96kts7VIQ2SpUgBvE8enm5XfreN5uu5GkFXTUA2U5j1/UnhRvWPR
         H0ZiBIJoTtl8A==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 483CCA005F;
        Thu, 24 Oct 2019 02:15:37 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 23 Oct 2019 19:15:36 -0700
Date:   Wed, 23 Oct 2019 19:15:36 -0700
Message-Id: <cover.1571882179.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 0/4] usb: gadget: Link state changes
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series adds some fixes to how dwc3 handles cases related to
link state changes.

Changes in v2:
 - Create inline function to do safe write to DCTL


Thinh Nguyen (4):
  usb: dwc3: gadget: Don't send unintended link state change
  usb: dwc3: gadget: Set link state to RX_Detect on disconnect
  usb: dwc3: gadget: Clear DCTL.ULSTCHNGREQ before set
  usb: dwc3: debug: Remove newline printout

 drivers/usb/dwc3/debug.h  |  4 ++--
 drivers/usb/dwc3/gadget.c | 21 ++++++++++++---------
 drivers/usb/dwc3/gadget.h | 14 ++++++++++++++
 3 files changed, 28 insertions(+), 11 deletions(-)

-- 
2.11.0

