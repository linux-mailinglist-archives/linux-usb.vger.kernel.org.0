Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA4794E1B7
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2019 10:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbfFUIK3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jun 2019 04:10:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:40832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbfFUIK3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Jun 2019 04:10:29 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 14900208CA;
        Fri, 21 Jun 2019 08:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561104628;
        bh=DcNtDbXBQYfpKbxtOfWOz5DR9ppohi+L4kdDgJPJvhc=;
        h=Date:From:To:Cc:Subject:From;
        b=F4VkM4+9VdK6bb4B/gxyNI5iAVUO0HtGGCkZuSqx7DpCqO1Zq0zcNs9m8CUMs8o8A
         BvJVWLLdBVHQARe9z+VML0Ur9RatvwdG2k0wp1DYrCCV9M5JJc2Ubq8Eee68nLRfLJ
         maU6M8dgVVlR/1N1u9lWJTIqQDdhU/DUSl+P17es=
Date:   Fri, 21 Jun 2019 10:10:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [GIT PULL] USB fixes for 5.2-rc6
Message-ID: <20190621081026.GA27919@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 9e0babf2c06c73cda2c0cd37a1653d823adb40ec:

  Linux 5.2-rc5 (2019-06-16 08:49:45 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.2-rc6

for you to fetch changes up to d28bdaff5e260852621d45edd3af017cc5d16925:

  Merge tag 'fixes-for-v5.2-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-linus (2019-06-20 11:56:35 +0200)

----------------------------------------------------------------
USB fixes for 5.2-rc6

Here are 4 small USB fixes for 5.2-rc6.

They include 2 xhci bugfixes, a chipidea fix, and a small dwc2 fix.
Nothing major, just nice things to get resolved for reported issues.

All have been in linux-next with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Greg Kroah-Hartman (1):
      Merge tag 'fixes-for-v5.2-rc5' of git://git.kernel.org/.../balbi/usb into usb-linus

Jules Maselbas (1):
      usb: dwc2: Use generic PHY width in params setup

Mathias Nyman (2):
      usb: xhci: Don't try to recover an endpoint if port is in error state.
      xhci: detect USB 3.2 capable host controllers correctly

Peter Chen (1):
      usb: chipidea: udc: workaround for endpoint conflict issue

 drivers/usb/chipidea/udc.c   | 20 ++++++++++++++++++++
 drivers/usb/dwc2/params.c    |  9 +++++++++
 drivers/usb/dwc2/platform.c  |  9 ---------
 drivers/usb/host/xhci-ring.c | 15 ++++++++++++++-
 drivers/usb/host/xhci.c      | 25 ++++++++++++++++++++-----
 drivers/usb/host/xhci.h      |  9 +++++++++
 6 files changed, 72 insertions(+), 15 deletions(-)
