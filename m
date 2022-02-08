Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 788704AE458
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 23:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387453AbiBHWYP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 17:24:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386517AbiBHUtI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 15:49:08 -0500
Received: from smtp1.lauterbach.com (smtp1.lauterbach.com [62.154.241.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D2AC0613CB
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 12:49:06 -0800 (PST)
Received: (qmail 7480 invoked by uid 484); 8 Feb 2022 20:49:04 -0000
X-Qmail-Scanner-Diagnostics: from ingpc2.intern.lauterbach.com by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.44):. 
 Processed in 0.06411 secs); 08 Feb 2022 20:49:04 -0000
Received: from ingpc2.intern.lauterbach.com (Authenticated_SSL:irohloff@[10.2.10.44])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <gregkh@linuxfoundation.org>; 8 Feb 2022 20:49:04 -0000
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH 0/1] USB: usbfs: replace atomic64 accesses by spinlock
Date:   Tue,  8 Feb 2022 21:48:57 +0100
Message-Id: <20220208204858.3406-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

patch for f_fs.c:
> > > > + atomic64_sub(amount, &ffs->mmap_mem_usage);    

Greg KH:
> > > Why not use a real lock instead of trying to do a fake one with
> > > this atomic variable?

Ingo:
> > I just took the code from "drivers/usb/core/devio.c",
> > "usbfs_increase_memory_usage()".
> > ...
> > You are of course right: You can easily use a lock here and this
> > makes the intention of the code a lot clearer I guess.
> > 
> > I will modify the patch accordingly.  

Alan Stern:
> If you also feel like making a similar change to the code in devio.c,
> it would be welcome.

Ingo Rohloff (1):
  USB: usbfs: Use a spinlock instead of atomic accesses to tally used
    memory.

 drivers/usb/core/devio.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

-- 
2.17.1
