Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68D03ADA8F
	for <lists+linux-usb@lfdr.de>; Sat, 19 Jun 2021 17:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234563AbhFSPTR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Jun 2021 11:19:17 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:62192 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234128AbhFSPTR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Jun 2021 11:19:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624115826; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=7XnqN+1X3txwTAZRuFJe8BIrIm4rB/z1MRRj7oDx9SM=; b=BvmybWWwK6lon/hY6v7t7eNSfYfmRigkj/XJ38wZVIsg/FfEdeYY4UxAKUNE8/mvUa6VsGVx
 RRSYpAKntFPx2xXWdN3IOrCYRFJH6QKDnt+5TljcvNjyJtKTrbfSSz3ZbY2UmVAoIr7dS3F2
 IXr28uUNnDB5P2Xg06Xo5GnEJCA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60ce0a6f6ddc3305c4019fbd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 19 Jun 2021 15:17:03
 GMT
Sender: linyyuan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 241E2C433F1; Sat, 19 Jun 2021 15:17:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from localhost.localdomain (unknown [101.87.142.17])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: linyyuan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 79384C433F1;
        Sat, 19 Jun 2021 15:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 79384C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=linyyuan@codeaurora.org
From:   Linyu Yuan <linyyuan@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>,
        Linyu Yuan <linyyuan@codeaurora.org>
Subject: [PATCH 0/2] usb: udc: indroduce more api for lower gadget driver
Date:   Sat, 19 Jun 2021 23:16:33 +0800
Message-Id: <20210619151633.51582-1-linyyuan@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

introdue following udc apis which will forbid lower gadget driver
operate upper layer usb gadget driver directly.

void usb_gadget_udc_disconnect(struct usb_gadget *);
void usb_gadget_udc_suspend(struct usb_gadget *);
void usb_gadget_udc_resume(struct usb_gadget *);
int usb_gadget_udc_setup(struct usb_gadget *,
			const struct usb_ctrlrequest *);

dwc3 is first driver to use these apis.

Linyu Yuan (2):
  usb: udc: core: hide struct usb_gadget_driver to gadget driver
  usb: dwc3: fix race of usb_gadget_driver operation

 drivers/usb/dwc3/core.h       |  2 --
 drivers/usb/dwc3/ep0.c        |  6 +---
 drivers/usb/dwc3/gadget.c     | 53 +++++++++--------------------------
 drivers/usb/gadget/udc/core.c | 47 ++++++++++++++++++++++++++++++-
 include/linux/usb/gadget.h    |  6 ++++
 5 files changed, 66 insertions(+), 48 deletions(-)

-- 
2.25.1

