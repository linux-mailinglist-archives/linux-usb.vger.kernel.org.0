Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68161462ABB
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 03:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbhK3C43 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Nov 2021 21:56:29 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:43332 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230143AbhK3C40 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Nov 2021 21:56:26 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D8BAB41946;
        Tue, 30 Nov 2021 02:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1638240784; bh=BJP9WbB/ztpqae2oMAV/C4aurg/clOGNyDRrHAKcvXM=;
        h=Date:From:Subject:To:Cc:From;
        b=VzkMeZp72ZVy75uToFpA9VgxwcaYBn95hTj2F2btxQKTqGlROx9F32iNJbnnBCLsy
         XIIFQStNzmUE8vEItvrXyHAe+m7HMkRe5qW+a6ebrwOU5t02k6mmToAHh7r8WbkMzj
         VdTGw+npEmBNdf3b9LaJQp8os8xlBb9VUgnvHgaZwJb+DIBQkssPq5bXDrrYZUfZCm
         HQh5ySZS6RUm3J0N8JugxvqBkeg0JJiivXNApWZqz29almQ1IDtBjJVqAKBDp1IvaE
         xR8x0sVb2OrB3PKWYhDltgxizkBHCDRBf1kqzn/vDvXPWqd+JiLwN5D823UFG6Z9o5
         U3xzj+bxcLxuw==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 653A7A0096;
        Tue, 30 Nov 2021 02:53:03 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Mon, 29 Nov 2021 18:53:03 -0800
Date:   Mon, 29 Nov 2021 18:53:03 -0800
Message-Id: <cover.1638240306.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 0/3] usb: dwc3: gadget: Reduce register read/write operations
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Depends on the device platform, a register read/write may take a few
microseconds to complete. A register read on a HAPS platform takes ~2us where
as register write takes less than 1us. These delays impact performance of small
transfers or interface(s) with many endpoints such as UASP interface. For large
transfer size and low rate of events generated, this series does not make much
of a difference.

This series avoids register read/write operations where they are not needed.
On the HAPS platform with UASP in SSP Gen 2x2 speed, we observed almost double
in performance speed when testing 4KB transfers reading and writing.


Thinh Nguyen (3):
  usb: dwc3: gadget: Skip checking Update Transfer status
  usb: dwc3: gadget: Ignore Update Transfer cmd params
  usb: dwc3: gadget: Skip reading GEVNTSIZn

 drivers/usb/dwc3/gadget.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)


base-commit: 4d012040161cba054208555300d9fdf2b8925c34
-- 
2.28.0

