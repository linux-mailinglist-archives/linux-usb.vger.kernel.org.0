Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01CB2E7521
	for <lists+linux-usb@lfdr.de>; Wed, 30 Dec 2020 00:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgL2XGb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Dec 2020 18:06:31 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:26712 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgL2XGb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Dec 2020 18:06:31 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609283170; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=1KAhvuLf/yvnWPBQm8h6VYbwH4+MlaWZaU2ApTgCAck=; b=xl+feD0reeLRjy4vyTclE+EWXnlPvRTcBrM5Xqz5ctwssYOc+DkxR3cu/wywpAH19Pk1LyyI
 muev+pUQRt5dvEIy2eAjKJF8T6EsZmHBVGDHmBNbjUBE+BlegMiIb/qPdVyHU6oASLkJOfO3
 mkvALHfPRhtkSy6tWtFn5XZDJNA=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5febb644da47198188af06cd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Dec 2020 23:05:40
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 42157C43462; Tue, 29 Dec 2020 23:05:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9F556C433C6;
        Tue, 29 Dec 2020 23:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9F556C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v2 0/2] Allow DWC3 runtime suspend if UDC is unbinded
Date:   Tue, 29 Dec 2020 15:05:34 -0800
Message-Id: <1609283136-22140-1-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Changes in v2:
 - Modified logic for executing the runtime PM resume.  Using a sychronous get
   call to avoid race conditions.

During the following scenario, the DWC3 runtime suspend routine is blocked as
the connected flag is still true:

1.  Enumerate device w/ host.
2.  Gadget is unbinded
	- echo "" > /sys/kernel/config/usb_gadget/g1/UDC
3.  Disconnect the USB cable (VBUS low)
4.  No dwc3_gadget_disconnect_interrupt() seen (since controller is
   halted from step#1)
5.  Runtime PM autosuspend fails due to "dwc->connected" being true
(cleared in dwc3_gadget_disconnect_interrupt())
6.  Gadget binded
	- echo udc_name > /sys/kernel/config/usb_gadget/g1/UDC
7.  No runtime suspend until cable is plugged in and out

Technically, for device initiated disconnects, there is no active session/link
with the host, so the DWC3 controller should be allowed to go into a low power
state.  Also, we need to now consider when re-binding the UDC,
dwc3_gadget_set_speed() is executed before dwc3_gadget_pullup(), so if the DWC3
controller is suspended/disabled, while accessing the DCFG, that could result in
bus timeouts, etc...  Change the dwc3_gadget_set_speed() to save the speed
being requested, and program it during dwc3_gadget_run_stop(), which is executed
during PM runtime resume.  If not, previous setting will be overridden as we
execute a DWC3 controller reset during PM runtime resume. 

Wesley Cheng (2):
  usb: dwc3: gadget: Allow runtime suspend if UDC unbinded
  usb: dwc3: gadget: Preserve UDC max speed setting

 drivers/usb/dwc3/core.h   |   1 +
 drivers/usb/dwc3/gadget.c | 121 ++++++++++++++++++++++----------------
 2 files changed, 71 insertions(+), 51 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

