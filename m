Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04BCC1DC8C9
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2020 10:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728611AbgEUIgY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 May 2020 04:36:24 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:21360 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728713AbgEUIgW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 May 2020 04:36:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590050181; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=OldWI3GbYyFeEDn6EU3YMjMalIM9qrgjySI6Ez3VZXg=; b=hZmHhT3P8s9kJLkAmiyRi4O5uGmdOK3/qH6XHYufpp09lxtovJCpYYD2z2Asx076jV1AGl59
 ViAr4l3vi6u+1i/0rMSNpcJTwwFbmzNNl5oTou5FJcPM+mj9AYTLklaj0/KCoKg3mTX2gCmS
 0gEnNrd7IS8K0hM81E4lWT7vIHQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ec63d7fe79e24225da452ca (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 May 2020 08:36:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DC74BC433C8; Thu, 21 May 2020 08:36:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CD47BC433C8;
        Thu, 21 May 2020 08:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CD47BC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v2 0/3] Re-introduce TX FIFO resize for larger EP bursting
Date:   Thu, 21 May 2020 01:36:06 -0700
Message-Id: <1590050169-30747-1-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Changes in V2:
 - Modified TXFIFO resizing logic to ensure that each EP is reserved a
   FIFO.
 - Removed dev_dbg() prints and fixed typos from patches
 - Added some more description on the dt-bindings commit message

Reviewed-by: Felipe Balbi <balbi@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>

Currently, there is no functionality to allow for resizing the TXFIFOs, and
relying on the HW default setting for the TXFIFO depth.  In most cases, the
HW default is probably sufficient, but for USB compositions that contain
multiple functions that require EP bursting, the default settings
might not be enough.  Also to note, the current SW will assign an EP to a
function driver w/o checking to see if the TXFIFO size for that particular
EP is large enough. (this is a problem if there are multiple HW defined
values for the TXFIFO size)

It is mentioned in the SNPS databook that a minimum of TX FIFO depth = 3
is required for an EP that supports bursting.  Otherwise, there may be
frequent occurences of bursts ending.  For high bandwidth functions,
such as data tethering (protocols that support data aggregation), mass
storage, and media transfer protocol (over FFS), the bMaxBurst value can be
large, and a bigger TXFIFO depth may prove to be beneficial in terms of USB
throughput. (which can be associated to system access latency, etc...)  It
allows for a more consistent burst of traffic, w/o any interruptions, as
data is readily available in the FIFO.

With testing done using the mass storage function driver, the results show
that with a larger TXFIFO depth, the bandwidth increased significantly.

Test Parameters:
 - Platform: Qualcomm SM8150
 - bMaxBurst = 6
 - USB req size = 256kB
 - Num of USB reqs = 16
 - USB Speed = Super-Speed
 - Function Driver: Mass Storage (w/ ramdisk)
 - Test Application: CrystalDiskMark

Results:

TXFIFO Depth = 3 max packets

Test Case | Data Size | AVG tput (in MB/s)
-------------------------------------------
Sequential|1 GB x     | 
Read      |9 loops    | 193.60
	  |           | 195.86
          |           | 184.77
          |           | 193.60
-------------------------------------------

TXFIFO Depth = 6 max packets

Test Case | Data Size | AVG tput (in MB/s)
-------------------------------------------
Sequential|1 GB x     | 
Read      |9 loops    | 287.35
	  |           | 304.94
          |           | 289.64
          |           | 293.61
-------------------------------------------

Wesley Cheng (3):
  usb: dwc3: Resize TX FIFOs to meet EP bursting requirements
  arm64: boot: dts: qcom: sm8150: Enable dynamic TX FIFO resize logic
  dt-bindings: usb: dwc3: Add entry for tx-fifo-resize

 Documentation/devicetree/bindings/usb/dwc3.txt |   2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi           |   1 +
 drivers/usb/dwc3/core.c                        |   2 +
 drivers/usb/dwc3/core.h                        |   8 ++
 drivers/usb/dwc3/ep0.c                         |  37 ++++++++-
 drivers/usb/dwc3/gadget.c                      | 111 +++++++++++++++++++++++++
 6 files changed, 159 insertions(+), 2 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

