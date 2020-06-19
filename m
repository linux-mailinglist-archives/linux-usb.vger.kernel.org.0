Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85914201488
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 18:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391322AbgFSQL5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 12:11:57 -0400
Received: from netrider.rowland.org ([192.131.102.5]:35605 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2391303AbgFSPF2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jun 2020 11:05:28 -0400
Received: (qmail 51984 invoked by uid 1000); 19 Jun 2020 11:05:27 -0400
Date:   Fri, 19 Jun 2020 11:05:27 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Till =?iso-8859-1?Q?D=F6rges?= <doerges@pre-sense.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Ext. HDDs not working under Linux via USB 3.0 but under Windows
Message-ID: <20200619150527.GA49731@rowland.harvard.edu>
References: <512118bc-e639-2387-e608-56b7e30fc3b2@pre-sense.de>
 <20200523154817.GA7091@rowland.harvard.edu>
 <34933b01-e4b0-10da-c935-9e6a9a6ae427@pre-sense.de>
 <20200523203349.GA12853@rowland.harvard.edu>
 <5bd5e8be-f8a9-9456-cced-c2bc75455556@pre-sense.de>
 <20200617163734.GC11314@rowland.harvard.edu>
 <763037ac-d8fa-8697-7f75-c0bf958b4308@pre-sense.de>
 <ce4d0606-b398-d23b-1a5f-25611eb4338f@pre-sense.de>
 <364ac09a-a877-c04e-5f2f-d5a559406590@pre-sense.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <364ac09a-a877-c04e-5f2f-d5a559406590@pre-sense.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > I reported my results when setting the quirk 054c:087d:*u* (ignore UAS).
> > 
> > It just occurred to me that 054c:087d:*f* (NO_REPORT_OPCODES) might be sufficient.
> > Before going ahead with the patch I suggest I check that, too.
> 
> It is. Both PSZ-HA drives work fine with just
> 
> --- snip ---
> $ cat /sys/module/usb_storage/parameters/quirks
> 054c:087d:f
> --- snap ---
> 
> Thanks -- Till

Can you build and test a kernel with the patch below, to make sure it does 
what you want?

Alan Stern


Index: usb-devel/drivers/usb/storage/unusual_uas.h
===================================================================
--- usb-devel.orig/drivers/usb/storage/unusual_uas.h
+++ usb-devel/drivers/usb/storage/unusual_uas.h
@@ -28,6 +28,13 @@
  * and don't forget to CC: the USB development list <linux-usb@vger.kernel.org>
  */
 
+/* Reported-by: Till Dörges <doerges@pre-sense.de> */
+UNUSUAL_DEV(0x054c, 0x087d, 0x0000, 0x9999,
+		"Sony",
+		"PSZ-HA*",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_OPCODES),
+
 /*
  * Apricorn USB3 dongle sometimes returns "USBSUSBSUSBS" in response to SCSI
  * commands in UAS mode.  Observed with the 1.28 firmware; are there others?

