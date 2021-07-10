Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2CE3C33DA
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jul 2021 11:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232454AbhGJJQ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Jul 2021 05:16:28 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57512 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232448AbhGJJQ0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 10 Jul 2021 05:16:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625908422; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=AzD2cehJx3vHS5imXZY8OJJDgjZoB3cD+KIs57ugSs8=; b=i4hbP9becnE7hv6lo/cTwF4Mz0GBjuxBp+yzuK2QnhgqdDg+1rLHLV8XjuvD46wCBW0n9L3N
 hxoVJBu/5Y2rIMHE2GsGitZuAEooatMY6925LiyYNpNYmpUvuU4LjsXin8Kk0+ykxvoLKSio
 TimCkY7f8WrtShql/z94E1s0Z7A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60e964b001dd9a943179038c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 10 Jul 2021 09:13:20
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF43AC4323A; Sat, 10 Jul 2021 09:13:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B235C433F1;
        Sat, 10 Jul 2021 09:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4B235C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        frowand.list@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v14 0/6] Re-introduce TX FIFO resize for larger EP bursting
Date:   Sat, 10 Jul 2021 02:13:09 -0700
Message-Id: <1625908395-5498-1-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Changes in V14:
 - Adding missing comment for do_fifo_resize parameter.

Changes in V13:
 - Added some more comments on the background of the APIs and how they work.
 - Check for the do_fifo_resize flag before reading out the max number of fifos
   DT property.

Changes in V12:
 - Re-added change to add a stub for of_add_property(), and exporting it as well
   so that it can be used by modules.
 - Minor updates to some of the APIs, including updating comments, adding error
   handling, etc...

Changes in V11:
 - Added a DWC3 controller revision check to use a different calculation, based
   on Ferry's testing.
 - Removed descriptor loop in configfs, and utilize the fact that the ep->claimed
   parameter is still valid as ep_autoconf_reset() isn't called at the time of
   check_config()
 - Fix compilation errors if CONFIG_OF is not defined
 - Removed patch to add stubs for of_add_property()

Changes in V10:
 - Fixed compilation errors in config where OF is not used (error due to
   unknown symbol for of_add_property()).  Add of_add_property() stub.
 - Fixed compilation warning for incorrect argument being passed to dwc3_mdwidth

Changes in V9:
 - Fixed incorrect patch in series.  Removed changes in DTSI, as dwc3-qcom will
   add the property by default from the kernel.

Changes in V8:
 - Rebased to usb-testing
 - Using devm_kzalloc for adding txfifo property in dwc3-qcom
 - Removed DWC3 QCOM ACPI property for enabling the txfifo resize

Changes in V7:
 - Added a new property tx-fifo-max-num for limiting how much fifo space the
   resizing logic can allocate for endpoints with large burst values.  This
   can differ across platforms, and tie in closely with overall system latency.
 - Added recommended checks for DWC32.
 - Added changes to set the tx-fifo-resize property from dwc3-qcom by default
   instead of modifying the current DTSI files.
 - Added comments on all APIs/variables introduced.
 - Updated the DWC3 YAML to include a better description of the tx-fifo-resize
   property and added an entry for tx-fifo-max-num.

Changes in V6:
 - Rebased patches to usb-testing.
 - Renamed to PATCH series instead of RFC.
 - Checking for fs_descriptors instead of ss_descriptors for determining the
   endpoint count for a particular configuration.
 - Re-ordered patch series to fix patch dependencies.

Changes in V5:
 - Added check_config() logic, which is used to communicate the number of EPs
   used in a particular configuration.  Based on this, the DWC3 gadget driver
   has the ability to know the maximum number of eps utilized in all configs.
   This helps reduce unnecessary allocation to unused eps, and will catch fifo
   allocation issues at bind() time.
 - Fixed variable declaration to single line per variable, and reverse xmas.
 - Created a helper for fifo clearing, which is used by ep0.c

Changes in V4:
 - Removed struct dwc3* as an argument for dwc3_gadget_resize_tx_fifos()
 - Removed WARN_ON(1) in case we run out of fifo space
 
Changes in V3:
 - Removed "Reviewed-by" tags
 - Renamed series back to RFC
 - Modified logic to ensure that fifo_size is reset if we pass the minimum
   threshold.  Tested with binding multiple FDs requesting 6 FIFOs.

Changes in V2:
 - Modified TXFIFO resizing logic to ensure that each EP is reserved a
   FIFO.
 - Removed dev_dbg() prints and fixed typos from patches
 - Added some more description on the dt-bindings commit message

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

Wesley Cheng (6):
  usb: gadget: udc: core: Introduce check_config to verify USB
    configuration
  usb: gadget: configfs: Check USB configuration before adding
  usb: dwc3: Resize TX FIFOs to meet EP bursting requirements
  of: Add stub for of_add_property()
  usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default
  dt-bindings: usb: dwc3: Update dwc3 TX fifo properties

 .../devicetree/bindings/usb/snps,dwc3.yaml         |  15 +-
 drivers/of/base.c                                  |   1 +
 drivers/usb/dwc3/core.c                            |  15 ++
 drivers/usb/dwc3/core.h                            |  16 ++
 drivers/usb/dwc3/dwc3-qcom.c                       |  15 ++
 drivers/usb/dwc3/ep0.c                             |   2 +
 drivers/usb/dwc3/gadget.c                          | 232 +++++++++++++++++++++
 drivers/usb/gadget/configfs.c                      |   4 +
 drivers/usb/gadget/udc/core.c                      |  19 ++
 include/linux/of.h                                 |   5 +
 include/linux/usb/gadget.h                         |   4 +
 11 files changed, 326 insertions(+), 2 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

