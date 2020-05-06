Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150221C65F2
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 04:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgEFCqJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 22:46:09 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35298 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725915AbgEFCqJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 22:46:09 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B1E7C407EB;
        Wed,  6 May 2020 02:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588733168; bh=pmUr1Pgpsaug8jdBJqk/Sk91eX2l7PNJvggf/yp9Czg=;
        h=Date:From:Subject:To:Cc:From;
        b=jbUFcWaRHfDeH//KJ8C0qWi9I+kgOW86jW7rhXGAJawvJ0YMEv81J6Nl9YDF9zDGv
         Y8ErdmM0ZEJfwD3RzF/PmqNDn6SKNlMH/mKiMBBj34lBxRNLFkIgWj3f9SWGD2dxP6
         x1+s02z7C8HpPHetupTwCUVrWSPICiKibrVGZRneks45J78EvWzQFW7bY/okXSOU6C
         1CVeYeLMhPVgXSlf1dvYCquFmj18wFJsm81KXDYLZFILksDodtkZ+uCqInLozhJh2w
         +a4H29sFPMhRoEXHxtODJAnxxZ8vuZaxf35btZFgnPuGPuoNU8WoVXSW5PTU7814/I
         ohtISVL2Xl+5Q==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id B7AC1A0072;
        Wed,  6 May 2020 02:46:06 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 05 May 2020 19:46:06 -0700
Date:   Tue, 05 May 2020 19:46:06 -0700
Message-Id: <cover.1588732815.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 00/11] usb: dwc3: gadget: Handle streams
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Overview of stream transfer requirement:
 * A transfer will have a set of TRBs of the same stream ID.
 * A transfer is started with a stream ID in START_TRANSFER command.
 * A new stream will only start when the previous completes.

Overview of stream events:
 * A "prime" from host indicates that its endpoints are active
   (buffers prepared and ready to receive/transmit data). The controller
   automatically initiates stream if it sees this.
 * A "NoStream" rejection event indicates that the host isn't ready.
   Host will put the endpoint back to idle state. Device may need to
   reinitiate the stream to start transfer again.
 * A Stream Found event means host accepted device initiated stream.
   Nothing needs to be done from driver.

To initiate a stream, the driver will issue START_TRANSFER command with a
stream ID. To reinitiate the stream, the driver must issue END_TRANSFER and
restart the transfer with START_TRANSFER command with the same stream ID.

This implementation handles device-initated streams (e.g. UASP driver).  It
also handles some hosts' quirky behavior where they only prime each endpoint
once.

Prerequisite:
  This series requires DWC_usb32 patch series
  https://patchwork.kernel.org/project/linux-usb/list/?series=269641

  [PATCH 1/2] usb: dwc3: Add support for DWC_usb32 IP
  [PATCH 2/2] usb: dwc3: Get MDWIDTH for DWC_usb32


Changes in v2:
 - Update cover letter
 - Split handling of stream and of transfer completion into smaller patches
 - Reword usb_request->is_last to strictly use for streams
 - Enforce transfer completion handling to only for stream capable endpoints


Thinh Nguyen (11):
  usb: gadget: Introduce usb_request->is_last
  usb: gadget: f_tcm: Inform last stream request
  usb: dwc3: gadget: Continue to process pending requests
  usb: dwc3: gadget: Check for in-progress END_TRANSFER
  usb: dwc3: gadget: Refactor TRB completion handler
  usb: dwc3: gadget: Enable XferComplete event
  usb: dwc3: gadget: Handle XferComplete for streams
  usb: dwc3: gadget: Wait for transfer completion
  usb: dwc3: gadget: Don't prepare beyond a transfer
  usb: dwc3: gadget: Handle stream transfers
  usb: dwc3: gadget: Use SET_EP_PRIME for NoStream

 drivers/usb/dwc3/core.h             |  12 ++
 drivers/usb/dwc3/debug.h            |   2 +
 drivers/usb/dwc3/gadget.c           | 225 +++++++++++++++++++++++++++++++-----
 drivers/usb/gadget/function/f_tcm.c |   3 +
 include/linux/usb/gadget.h          |   3 +
 5 files changed, 215 insertions(+), 30 deletions(-)

-- 
2.11.0

