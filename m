Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C12AC1221A3
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 02:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfLQBqV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Dec 2019 20:46:21 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:42196 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726016AbfLQBqV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Dec 2019 20:46:21 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C71CFC00C1;
        Tue, 17 Dec 2019 01:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576547180; bh=Edbaqb3iJAOnk+4ECoUojPCuZvmaxWFod2KGieVXWr8=;
        h=Date:From:Subject:To:Cc:From;
        b=OBKhoW2ecKtKCEb4gjYX5UN5nfjezN7LNedkEmsMIDeJggW9yH9f8EaGw2ynjJzN9
         KqOIQqmKpGPyTOoV+g+K1hhMpCwTXMLD3HyiGKeH71q4kKs5hxlJGvNop+wJO1zdLK
         oxj+9Vn+YJH/66xHvQe5ezbwTfa7ry1C92ZQgbimyREyku2bWvBzNVpyFV7thZf7Xi
         87Bm7TvcnPZSAMuclozrnlVkT41Rv5HG0luDbQbvxYwNH/0LeDMDOwWQHJVYphoFmd
         +3ay9J6JyDTWXB9T5Ii3gKH0471R5m7LsQo8FYTPchH39XSiB6Ljbnm0serMcwF5EB
         GEsTg7ae/BD2Q==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 62BC0A006D;
        Tue, 17 Dec 2019 01:46:19 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 16 Dec 2019 17:46:19 -0800
Date:   Mon, 16 Dec 2019 17:46:19 -0800
Message-Id: <cover.1576546936.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 0/3] usb: dwc3: gadget: Improve END_TRANSFER handling
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series improves the handling of the END_TRANSFER command:

1) Don't issue multiple END_TRANSFER commands while the previous hasn't
   completed.
2) Don't issue START_TRANSFER command while END_TRANSFER hasn't completed
3) Remove arbirary 100us delay



Thinh Nguyen (3):
  usb: dwc3: gadget: Check END_TRANSFER completion
  usb: dwc3: gadget: Delay starting transfer
  usb: dwc3: gadget: Remove END_TRANSFER delay

 drivers/usb/dwc3/core.h   |  2 ++
 drivers/usb/dwc3/ep0.c    |  4 +++-
 drivers/usb/dwc3/gadget.c | 34 +++++++++++++++++++++-------------
 3 files changed, 26 insertions(+), 14 deletions(-)

-- 
2.11.0

