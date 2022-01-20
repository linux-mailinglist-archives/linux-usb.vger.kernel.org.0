Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A0949483D
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jan 2022 08:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358636AbiATH2f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jan 2022 02:28:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbiATH2e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jan 2022 02:28:34 -0500
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96BFFC061574
        for <linux-usb@vger.kernel.org>; Wed, 19 Jan 2022 23:28:34 -0800 (PST)
Date:   Thu, 20 Jan 2022 08:28:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1642663711;
        bh=hcFmP64TQUq5n4dvqxgQHWX+qKGyKCQCMBYfwYVzb3Y=;
        h=Date:From:To:Cc:Subject:From;
        b=KOCQErNqBJooVaawiuAqjE+brGAAGOUFaRtQ2ViouSmsomvso0sdlt+mLkbd2zQSZ
         kyZSTQ9Bc/KsQO/5JFEVA89GbCjfijXOYbaGEzo/+xBQAHuLmqWjZK8V1QhDaiDkgP
         zQDQbHRYHxPkCY5pQ3dGEM/nO1wSOCbkHdVT53yM=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, DocMAX <mail@vacharakis.de>
Subject: Re: Issue with UAS and" VIA Labs, Inc. VL817 SATA Adaptor"
Message-ID: <40eecdd0-93bc-40c6-b8c0-f4ad4c6ffe59@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

I hava a IcyBox IB-3740-C31 [0], this device seems to be identical to the one
here. It has the same USB IDs and case design.
It also has the serial number "4".
The only difference it seems is the field bcdDevice which is "1.36" and the
reported name is different (see the patch below).

So I adapted the patch slightly to also match that bcdDevice.
I also changed the productName field but that does not seem to be used anyways.

Using the quirk flags "fgkm" as mentioned in [1] did not help.

FYI while there are many reports that UAS does not work with these devices,
there also are a few that report it working. For example [2].

diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
index 29191d33c0e3..53e8249644b2 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -2301,6 +2301,19 @@ UNUSUAL_DEV(  0x2027, 0xa001, 0x0000, 0x9999,
                USB_SC_DEVICE, USB_PR_DEVICE, usb_stor_euscsi_init,
                US_FL_SCM_MULT_TARG ),

+UNUSUAL_DEV( 0x2109, 0x0715, 0x0000, 0x9999,
+               "VIA Labs, Inc.",
+               "VL817 SATA Adaptor",
+               USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+               US_FL_IGNORE_UAS),

This is the exact issue:

[ 3606.231973] scsi host14: uas_eh_device_reset_handler start
[ 3606.232149] sd 14:0:0:0: [sdg] tag#2 uas_zap_pending 0 uas-tag 1 inflight: CMD
[ 3606.232154] sd 14:0:0:0: [sdg] tag#2 CDB: Write(16) 8a 00 00 00 00 00 18 0c c9 80 00 00 00 80 00 00
[ 3606.306257] usb 4-4.4: reset SuperSpeed Plus Gen 2x1 USB device number 11 using xhci_hcd
[ 3606.328584] scsi host14: uas_eh_device_reset_handler success

For this patch:

Tested-by: Thomas Weißschuh <linux@weissschuh.net>

Thomas

[0] https://icybox.de/en/product.php?id=155
[1] https://lore.kernel.org/linux-usb/c4b4aa34-12d9-7000-6398-d94a7ebffdfc@suse.com/
[2] https://spod.cx/blog/enabling_trim_support_via_VL817_usb_sata_adaptor.shtml
