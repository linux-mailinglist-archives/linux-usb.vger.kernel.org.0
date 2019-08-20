Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F228195376
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 03:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbfHTBfo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 21:35:44 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.61.142]:51702 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728627AbfHTBfn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 21:35:43 -0400
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com [10.13.135.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3575BC037C;
        Tue, 20 Aug 2019 01:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1566264943; bh=xS7u1HcNqaZO5vx3hM68cRyT6whYdZUNpk/4aRH2TYo=;
        h=Date:From:Subject:To:CC:From;
        b=k1mYL8yH14+nEG6mN1lrMTGFvCOaucuGRFW1rbwASKAAnovv+LhUE5e1Dow5wTgmI
         pwUcikvolp6REX+TLMBb+ns+NwI1+XbNXPUWNGlfONmFsSpqkVcyKlDvR9wJ5UP3SC
         15CtFZDP1ytXhD2KGXFCq9KkepfZCnL+7S8OD5YVpC/IaATyLEM6Eil86QD5Esz2ns
         iZxxOuSmpLr8GJuRjdhcDsadem3ZpjdndAXaVM9a6lalEccaCdYkfN2CNB3d6uqobD
         5BrnJPq7Q1nY5G0av0C9ElrZIMIzkAqs1BkZpfetkzajO1pdupYrRYm6KGa/k6Gr7u
         BFU6jgbmLOYPQ==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id C8B9FA0067;
        Tue, 20 Aug 2019 01:35:42 +0000 (UTC)
Received: from US01WEHTC3.internal.synopsys.com (10.15.84.232) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 19 Aug 2019 18:35:42 -0700
Received: from te-lab16 (10.13.184.19) by US01WEHTC3.internal.synopsys.com
 (10.15.84.231) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 19 Aug
 2019 18:35:38 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 19 Aug 2019 18:35:38
 -0700
Date:   Mon, 19 Aug 2019 18:35:38 -0700
Message-ID: <cover.1566263914.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 0/4] usb: gadget: Report recommended BESL
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.184.19]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series add an option for the gadget driver to export recommended
BESL value to improve power saving for devices operating with LPM feature.



Thinh Nguyen (4):
  usb: gadget: Export recommended BESL values
  usb: dwc3: Separate field holding multiple properties
  usb: dwc3: gadget: Set BESL config parameter
  usb: gadget: composite: Set recommended BESL values

 drivers/usb/dwc3/core.c        |  3 +--
 drivers/usb/dwc3/gadget.c      | 13 ++++++++++++-
 drivers/usb/gadget/composite.c | 38 ++++++++++++++++++++++++++------------
 include/linux/usb/gadget.h     |  3 +++
 include/uapi/linux/usb/ch9.h   |  2 ++
 5 files changed, 44 insertions(+), 15 deletions(-)

-- 
2.11.0

