Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A93A1C8BE3
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 15:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgEGNRR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 09:17:17 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:54981 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725948AbgEGNRR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 09:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588857436;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=geX7N42YtmADBy3liHNZ5oWXztK72qez5GHzumHYo4M=;
        b=dWNxxKBcz7zJaIx1CgUXDEcyLcdLNxQPlBsWPElZKtJ53+TDE6RKFranhEpoj6yv/ezC0k
        QxjhCgU7brBkP7+d7aGBIWCUoLxxP6SdtcFbDdMt5rUecciAUCEP/GA3GgBXVI2jYzeTf/
        pYTRvEGppqj1yAuhX0XZPuUbwKZL19M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-ZBNz5C4GMDyqUQkXr9MtRA-1; Thu, 07 May 2020 09:17:14 -0400
X-MC-Unique: ZBNz5C4GMDyqUQkXr9MtRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2CFD1B2C984;
        Thu,  7 May 2020 13:17:12 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-120.ams2.redhat.com [10.36.115.120])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 04E5C5D9E5;
        Thu,  7 May 2020 13:17:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Oliver Neukum <oneukum@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org,
        =?UTF-8?q?Julian=20Gro=C3=9F?= <julian.g@posteo.de>
Subject: [PATCH] USB: uas: Add US_FL_NO_REPORT_OPCODES for LaCie 2Big Quadra USB3 external disk
Date:   Thu,  7 May 2020 15:17:08 +0200
Message-Id: <20200507131708.250871-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The LaCie 2Big Quadra USB3 external disk does not like the REPORT_OPCODES
request, causing probing it to take several minutes (and several resets).

Add US_FL_NO_REPORT_OPCODES flag for this model to fix the probing delay.

Reported-by: Julian Gro=C3=9F <julian.g@posteo.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/storage/unusual_uas.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unus=
ual_uas.h
index 1b23741036ee..37157ed9a881 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -28,6 +28,13 @@
  * and don't forget to CC: the USB development list <linux-usb@vger.kern=
el.org>
  */
=20
+/* Reported-by: Julian Gro=C3=9F <julian.g@posteo.de> */
+UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
+		"LaCie",
+		"2Big Quadra USB3",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_OPCODES),
+
 /*
  * Apricorn USB3 dongle sometimes returns "USBSUSBSUSBS" in response to =
SCSI
  * commands in UAS mode.  Observed with the 1.28 firmware; are there oth=
ers?
--=20
2.26.0

