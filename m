Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101A136A2FB
	for <lists+linux-usb@lfdr.de>; Sat, 24 Apr 2021 22:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234040AbhDXUdC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Apr 2021 16:33:02 -0400
Received: from mx.exactcode.de ([144.76.154.42]:39310 "EHLO mx.exactcode.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232560AbhDXUdC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 24 Apr 2021 16:33:02 -0400
X-Greylist: delayed 1709 seconds by postgrey-1.27 at vger.kernel.org; Sat, 24 Apr 2021 16:33:02 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; s=x;
        h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To:Message-Id:Date; bh=RNAduPsH6Aq71WOCUC7VulmmgWj6SDBfA3/mxvU5URc=;
        b=NO4ys8zWvp+0OHPGiwmxfGjVumIHCK3xvYoR3By3d8BmXYpf0SLaKOouUexVJwjgqZztZU6CCJ4HVA3btIj2XfYUbjP07C2AX/+gvomxr6ma8osLlunD+Qwj64MqZKeu3vszU5NV0BFGCDpRRK+1n5X8s7hg/jhhLc3kD1l+ZB4=;
Received: from exactco.de ([90.187.5.221])
        by mx.exactcode.de with esmtp (Exim 4.82)
        (envelope-from <rene@exactcode.com>)
        id 1laOVU-0008CW-8u; Sat, 24 Apr 2021 20:04:00 +0000
Received: from [192.168.2.131] (helo=localhost)
        by exactco.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.86_2)
        (envelope-from <rene@exactcode.com>)
        id 1laORl-000438-Pp; Sat, 24 Apr 2021 20:00:10 +0000
Date:   Sat, 24 Apr 2021 22:03:16 +0200 (CEST)
Message-Id: <20210424.220316.855336714119430355.rene@exactcode.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
From:   Rene Rebe <rene@exactcode.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -1.6 (-)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi there,

for some time I already wondered why my external USB Seagate Seven
drive does not report any SMART status. Only recently did I take a
look and it turns out ATA pass-through was explicitly disabed for all
Seagate drives with 7fee72 "uas: Always apply US_FL_NO_ATA_1X quirk to
Seagate devices" in 2017. Apparently some early ones where buggy, ...

However, fast forward a couple of years and this is no longer true,
this Segate Seven even is already from 2016, and apparently first
available in 2015. I suggest removing this rather drastic global
measure, and instead only add very old broken ones with individual
quirks, should any of them still be alive ;-)

Signed-off-by: Ren=E9 Rebe <rene@exactcode.com>

--- linux-5.11/drivers/usb/storage/uas-detect.h.backup	2021-03-05 11:36=
:00.517423726 +0100
+++ linux-5.11/drivers/usb/storage/uas-detect.h	2021-03-05 11:36:16.373=
424544 +0100
@@ -113,8 +113,4 @@
 	}
 =

-	/* All Seagate disk enclosures have broken ATA pass-through support *=
/
-	if (le16_to_cpu(udev->descriptor.idVendor) =3D=3D 0x0bc2)
-		flags |=3D US_FL_NO_ATA_1X;
-
 	usb_stor_adjust_quirks(udev, &flags);
 =


-- =

  Ren=E9 Rebe, ExactCODE GmbH, Lietzenburger Str. 42, DE-10789 Berlin
  https://exactcode.com | https://t2sde.org | https://rene.rebe.de
