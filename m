Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82738405C56
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 19:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241771AbhIIRtp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 13:49:45 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:26034 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237196AbhIIRtp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Sep 2021 13:49:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631209716; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=twDB8hiwHO2fo/eac2/J9y3Y2piosgeBTi7ssKxrfRE=; b=QXJg8+VC9Y/F2zQb/ZqwaKfQPI1wQ8QUV0ylVTVz7vkE50N0iT+VDp9PsKW509QoK8u0zB3v
 3Ov+UJcm3EsJeGukvBaou5iwhxfRGQdVzkFYbbGj0Kavyki4l0aeXKNZXWjj122WEd5AI1dy
 M5wB+XWVz9SWbiN6KSp552LJQIA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 613a48e547c94676c8a8608e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 17:48:21
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0932C4361A; Thu,  9 Sep 2021 17:48:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6309EC4338F;
        Thu,  9 Sep 2021 17:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6309EC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org, Ferry Toth <fntoth@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH v3 0/2] usb: gadget: f_uac2: Fixes for SuperSpeed
Date:   Thu,  9 Sep 2021 10:48:09 -0700
Message-Id: <20210909174811.12534-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fixes SuperSpeed (and SuperSpeedPlus) functionality for the
UAC2 function driver.  The first patch fixes enumeration failures due
to a missing companion descriptor, while the second patch is necessary
for actual data transfer functionality to work.

V3: Fixed elementary "." vs "->" mistake in patch 2
V2: Made this a series. Patch 1 revised to create a separate descriptor just
    for the feedback endpoint. Patch 2 is new.

Jack Pham (2):
  usb: gadget: f_uac2: Add missing companion descriptor for feedback EP
  usb: gadget: f_uac2: Populate SS descriptors' wBytesPerInterval

 drivers/usb/gadget/function/f_uac2.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

-- 
2.24.0

