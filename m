Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F01053D9DB8
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jul 2021 08:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbhG2GhM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jul 2021 02:37:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:38178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234079AbhG2GhL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Jul 2021 02:37:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42ABB6103A;
        Thu, 29 Jul 2021 06:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627540628;
        bh=Fo8tdhdzn+YMW/N23hT23O6Rxf2nYLXltlo0NRiL3zM=;
        h=Date:From:To:Cc:Subject:From;
        b=t2Qby4MOwaE7qdvv5QMhnMRjAEvM2Cy3F3jsPl0nzMNAObCCb11NIX06UB457JkHH
         TaF3uojzUV5CjkvH0pOVPQAgjT8PPK6yQfJY3DK/F2GHdv1CRadTd9sANC6v9wg0rm
         oh4K5jTPLL24/2rClBQtACIHwTEnus2dXz3dw/itgFmz7EoYsCDY6+2M+dhNmlX8QI
         WQL/z+k7Fm7oRoFGJN9bC0L1KvE4ccJFUQjpdvfwv4FobKe0oxHF4w5x0aHHK0NFBu
         QQa/c8v++OOd4y+ED/sNw375JIZZhyzxRfmTfCRigf69irDEQwSuJOIEn8FJb7y5FV
         wapO5s8HRr8jw==
Date:   Thu, 29 Jul 2021 14:37:02 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] usb: fixes for v5.14-rc4
Message-ID: <20210729063702.GA28130@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit ff1176468d368232b684f75e82563369208bc371:

  Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.14-rc4

for you to fetch changes up to 5df09c15bab98463203c83ecab88b9321466e626:

  usb: cdnsp: Fix the IMAN_IE_SET and IMAN_IE_CLEAR macro (2021-07-29 14:28:15 +0800)

----------------------------------------------------------------
Several small bug-fixes for cdns3 and cdnsp driver

----------------------------------------------------------------
Christophe JAILLET (1):
      usb: cdnsp: Fix the IMAN_IE_SET and IMAN_IE_CLEAR macro

Pawel Laszczak (3):
      usb: cdns3: Fixed incorrect gadget state
      usb: cdnsp: Fix incorrect supported maximum speed
      usb: cdnsp: Fixed issue with ZLP

 drivers/usb/cdns3/cdns3-ep0.c    |  1 +
 drivers/usb/cdns3/cdnsp-gadget.c |  2 +-
 drivers/usb/cdns3/cdnsp-gadget.h |  4 ++--
 drivers/usb/cdns3/cdnsp-ring.c   | 18 ++++++++----------
 4 files changed, 12 insertions(+), 13 deletions(-)

-- 

Thanks,
Peter Chen

