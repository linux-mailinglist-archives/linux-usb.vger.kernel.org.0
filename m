Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF10457AAD
	for <lists+linux-usb@lfdr.de>; Sat, 20 Nov 2021 04:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236722AbhKTDKg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Nov 2021 22:10:36 -0500
Received: from marcansoft.com ([212.63.210.85]:48894 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236707AbhKTDKc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Nov 2021 22:10:32 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: hector@marcansoft.com)
        by mail.marcansoft.com (Postfix) with ESMTPSA id A5D084248D;
        Sat, 20 Nov 2021 03:07:23 +0000 (UTC)
From:   Hector Martin <marcan@marcan.st>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sven Peter <sven@svenpeter.dev>
Cc:     Hector Martin <marcan@marcan.st>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/2] usb: typec: tipd: Fixes for Apple M1 (CD321X) support
Date:   Sat, 20 Nov 2021 12:07:15 +0900
Message-Id: <20211120030717.84287-1-marcan@marcan.st>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi folks,

These two fixes make tipd work properly on Apple M1 devices, in
particular in the case where the bootloader hasn't initialized
the controllers yet.

We normally do it in m1n1 (so the machine can charge and so bootloaders
get working USB without needing this driver), but that was causing this
codepath to never get properly exercised, so we never caught it. I
noticed on the new machines with 3+1 ports, since m1n1 was only
initializing 2 and the other 2 were failing to initialize.

No changes since the previous version, just updating the commit tags.

Hector Martin (2):
  usb: typec: tipd: Fix typo in cd321x_switch_power_state
  usb: typec: tipd: Fix initialization sequence for cd321x

 drivers/usb/typec/tipd/core.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

-- 
2.33.0

