Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7FD39D29B
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 03:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhFGBcH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Jun 2021 21:32:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:51414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230078AbhFGBcG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 6 Jun 2021 21:32:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2EC561090;
        Mon,  7 Jun 2021 01:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623029415;
        bh=wNIeWm7aqShyivxqfR1GOkMMgPrLy3xuinR1KZ+Ddao=;
        h=Date:From:To:Cc:Subject:From;
        b=WdJRjw0BSogpJWd0IBggN1sXKtRxaqbZtoJIRbTDM/Cey5Mpjv+WogHwxBmlYDcgw
         hUYfWWM61EA22D7jLfOpgtRO+YK0G7xaBQARdeEnxeyq78qt+0M4zo1pxvG0IOtmKX
         v0OEgGTQIllVDpIAZaPqIj02VKfoRf0aD+bp5AwOM3B1T9VixwC7rrTg/aUdke7WDq
         p51fHG7YLz52PsGaqV10HCuGkzINbkvOIupS9BYxVxjOSwo305qRTJ6vaFgs+LxsOG
         LQZabE2NC0W81evfx3w3w0G4WU82rki0tkKohwZT5OL4WaC2/cfE2/DS4e/X+VJdrS
         4XmPZ2Dl0gXwg==
Date:   Mon, 7 Jun 2021 09:30:11 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] usb: fixes for v5.13
Message-ID: <20210607013011.GA4633@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 9e3927f6373da54cb17e17f4bd700907e1123d2f:

  usb: chipidea: udc: assign interrupt number to USB gadget structure (2021-05-17 10:04:05 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.13-rc6

for you to fetch changes up to a9aecef198faae3240921b707bc09b602e966fce:

  usb: cdnsp: Fix deadlock issue in cdnsp_thread_irq_handler (2021-05-27 09:36:20 +0800)

----------------------------------------------------------------
Two bug fixes for cdns3 and cdnsp

----------------------------------------------------------------
Pawel Laszczak (1):
      usb: cdnsp: Fix deadlock issue in cdnsp_thread_irq_handler

Sanket Parmar (1):
      usb: cdns3: Enable TDL_CHK only for OUT ep

 drivers/usb/cdns3/cdns3-gadget.c | 8 +++-----
 drivers/usb/cdns3/cdnsp-ring.c   | 7 ++++---
 2 files changed, 7 insertions(+), 8 deletions(-)

-- 

Thanks,
Peter Chen

