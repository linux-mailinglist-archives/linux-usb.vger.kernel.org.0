Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0403A25A4F4
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 07:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgIBFUH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 01:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgIBFUF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 01:20:05 -0400
X-Greylist: delayed 345 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 01 Sep 2020 22:20:04 PDT
Received: from zeus.clearfield.com (zeus.clearfield.com [IPv6:2405:6000:b:40:0:fff:fe00:1000])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9701EC061244
        for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2020 22:20:04 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by zeus.clearfield.com (Postfix) with ESMTP id 57D242582284;
        Wed,  2 Sep 2020 17:14:13 +1200 (NZST)
Received: from zeus.clearfield.com ([127.0.0.1])
        by localhost (zeus.clearfield.com [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id Ef5s-FPwv14W; Wed,  2 Sep 2020 17:14:13 +1200 (NZST)
Received: from [IPv6:2405:6000:b:40:0:fff:fe00:4900] (unknown [IPv6:2405:6000:b:40:0:fff:fe00:4900])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jfp)
        by zeus.clearfield.com (Postfix) with ESMTPSA id 0C6862582283;
        Wed,  2 Sep 2020 17:14:13 +1200 (NZST)
DKIM-Filter: OpenDKIM Filter v2.11.0 zeus.clearfield.com 0C6862582283
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clearfield.com;
        s=zeus.clearfield.com; t=1599023653;
        bh=Evo9aLJMkOMwhSuAbZ9vPj1Aa5A9HjGt2whN0S1I+/w=;
        h=Subject:From:To:Cc:Date:From;
        b=kFYJ40VvpJmPLmCIAk4AGHjol86QN+wSXhnvmvdDjkwn1yj4qqbRrNqUxAnrmWIBa
         12LAYUrVdnc+4CLXogNPHroxIeVXTfHiDiKmkP4KlGjNdQZaniToOHTzQ9EgaDy+1b
         nWS2/RCJ6gcYvFYI3iExmjBdYfvMb8VLFjL3FgqU=
Message-ID: <8b0d02a71c781c1325a491f6450df0876d724d85.camel@clearfield.com>
Subject: copy/paste error in unusual_uas.h  from commit bc3bdb1
From:   Jean-Francois Pirus <jfp@clearfield.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org
Date:   Wed, 02 Sep 2020 17:14:12 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Looks like a copy/paste error from the previous entry.

patch:

--- unusual_uas.h.org	2020-09-02 17:00:32.295919812 +1200
+++ unusual_uas.h	2020-09-02 17:01:02.596173298 +1200
@@ -69,7 +69,7 @@
 /* Reported-by: David Kozub <zub@linux.fjfi.cvut.cz> */
 UNUSUAL_DEV(0x152d, 0x0578, 0x0000, 0x9999,
 		"JMicron",
-		"JMS567",
+		"JMS578",
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_BROKEN_FUA),

Thanks.

