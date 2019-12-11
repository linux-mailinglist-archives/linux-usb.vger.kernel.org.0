Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 675A111A14C
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 03:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfLKCZu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 21:25:50 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:38944 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727230AbfLKCZt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 21:25:49 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4CC824264D;
        Wed, 11 Dec 2019 02:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576031149; bh=esFAnLhoM/zd/r+nXJtSL9wr/jZ97gN0TI7qZ0AyquI=;
        h=Date:From:Subject:To:Cc:From;
        b=cdXpEuyog78NeyqYaCPbAwNQ07Zb9ZN8fDQu5QtubxyAIAKQVBfS+ldBIFlLZ4cib
         qff3g/OR6jyVvHf0zHEGoh6KqhKagul3fSLxXUqWGNsXvUhawYFmvtGcgzQYbGrPaC
         My2W75oB2ZD9HqH46aoTwhqb1h5HEyYqsI4SronKCI5WIgFuszyXlMa8oUwRX2UHHl
         jm6VeSrQD3Oyx/83CuPMQcciLR1SIQpAdkL4FSB3fHQb9BR5rK80tS2T8XwiHmUSK/
         SDdtvZt5RuhbLMX3uc5tvoURPkV/42mj/RdGZYrJNEJLYHjjodT/JldajBIagZdLZw
         skInoIn1k13lw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 06DA3A005E;
        Wed, 11 Dec 2019 02:25:47 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 10 Dec 2019 18:25:47 -0800
Date:   Tue, 10 Dec 2019 18:25:47 -0800
Message-Id: <cover.1576030839.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 0/2] usb: dwc3: gadget: Revise maxpacket_limit calculation
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     John Youn <John.Youn@synopsys.com>, linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series revises how dwc3 calculate maxpacket_limit for IN and OUT
endpoints to follow the databook.

Changes in v2:
 - Add Fixes tag for macro name change


Thinh Nguyen (2):
  usb: dwc3: Fix GTXFIFOSIZ.TXFDEP macro name
  usb: dwc3: gadget: Properly set maxpacket limit

 drivers/usb/dwc3/core.h   |  8 +++++--
 drivers/usb/dwc3/gadget.c | 56 ++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 49 insertions(+), 15 deletions(-)

-- 
2.11.0

