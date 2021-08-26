Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4686A3F90CB
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 01:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243789AbhHZWsJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 18:48:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:39804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231243AbhHZWsJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Aug 2021 18:48:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A61FE60F5B;
        Thu, 26 Aug 2021 22:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630018041;
        bh=h39I9n86BAlrl3zQ0eJAFEWnK7UNEKpNYQBmlzdjPMU=;
        h=Date:From:To:Cc:Subject:From;
        b=uhqc+tucnvRMhmNnRiN4AoNp9O6g2YPMWosWtJs7zXT51Qt7K63MWmbY3UuF1Hni9
         i7I1R1SxAv+uR1Px0kWaEXIGCIW9plZ9SO8UbGsy3JWbEVeeIQIxtoyqDfbk75JAkf
         Aq8Ljsk5bVKml1P1mAzvXoxlLwzY/wwXaL8porn+HpnmJVnpkH2FS59YV3t1Xz9CyI
         rtL6NnP8tKEDFvoJSyTEpL88g9s/TSgAOiF/zDqFq0z8yeQQBD+sV5EKfw/3T1KLNW
         bMs28XkAI7tu9kL0OzNR+9a/wGoIk67TTMHQaqYV1a5Pl+9zK9ZTnHH9mtW7zGgipm
         DknWwff66G/ZQ==
Date:   Fri, 27 Aug 2021 06:47:13 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] usb: changes for v5.15-rc1
Message-ID: <20210826224713.GA4335@Peter>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


The following changes since commit e4788edc730a0d2b26e1ae1f08fbb3f635b92dbb:

  USB: EHCI: Add alias for Broadcom INSNREG (2021-08-18 22:28:28 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.15-rc1

for you to fetch changes up to e5d6a7c6cfae9e714a0e8ff64facd1ac68a784c6:

  usb: chipidea: host: fix port index underflow and UBSAN complains (2021-08-21 13:15:25 +0800)

----------------------------------------------------------------
Only one patch for improving port index calculation for chipidea driver, no big changes.

----------------------------------------------------------------
Li Jun (1):
      usb: chipidea: host: fix port index underflow and UBSAN complains

 drivers/usb/chipidea/host.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 

Thanks,
Peter Chen

