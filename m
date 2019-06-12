Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF70A421B2
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2019 11:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437921AbfFLJzh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jun 2019 05:55:37 -0400
Received: from mga02.intel.com ([134.134.136.20]:5764 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437919AbfFLJzg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Jun 2019 05:55:36 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jun 2019 02:55:35 -0700
X-ExtLoop1: 1
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 12 Jun 2019 02:55:33 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 12 Jun 2019 12:55:32 +0300
Date:   Wed, 12 Jun 2019 12:55:32 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Vladimir Yerilov <openmindead@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: kernel NULL pointer dereference, ucsi bug
Message-ID: <20190612095532.GB19831@kuha.fi.intel.com>
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
 <20190611075431.GB7918@kuha.fi.intel.com>
 <CAB31r6V+PYppYJz29u_hfpiL6xqhhe+-2xZTRpqOmpLrtCdh8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <CAB31r6V+PYppYJz29u_hfpiL6xqhhe+-2xZTRpqOmpLrtCdh8Q@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2019 at 10:19:27PM +1000, Vladimir Yerilov wrote:
> Hi Heikki,
> 
> > What do you have connected to the USB Type-C connectors on the
> machine when that happens?
> 
> Now, on 5.2-rc4, it happens only during boot and when power cord is
> connected to laptop's type-c charging port. Another port, which does
> not support charging, does not cause this problem, I mean I can have
> something connected to it or not, no issue is observed if charger is
> disconnected. I even tried to connect my hub to the guilty charging
> port, everything works fine until hub is powered from the charger, in
> that case the bug happens again. This differs from my previous tests
> when whatever I had connected to the charging port, caused failures,
> even type C to A OTG cable. To summarize: now it happens when power
> cord from the charger is connected during the boot, but if I connect
> it after boot (e.g. after logging in to my X session), no crash
> occurs.
> 
> > Can you use the machine normally when nothing is connected to the USB Type-C connectors
> 
> Yeah, everything is great when nothing is connected to the faulty
> charging port during the boot, and charger may be connected later, but
> it's kinda... wrong.
> 
> > Is it possible to send complete dmesg output after that happened?
> 
> You can find everything attached (done with journalctl -k -xb)

Thanks. I don't see anything the driver is doing wrong. I'm attaching
a patch. Can you test if it fixes the issue?

Br,

-- 
heikki

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-usb-typec-Make-sure-an-alt-mode-exist-before-getting.patch"

From d6979950ee911194dab9ae7513fe36dc3730f7a9 Mon Sep 17 00:00:00 2001
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Tue, 11 Jun 2019 11:10:25 +0300
Subject: [PATCH] usb: typec: Make sure an alt mode exist before getting its
 partner

Interim. For testing only!

Adding check to typec_altmode_get_partner() to prevent
potential NULL pointer dereference.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index 76299b6ff06d..74cb3c2ecb34 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -192,7 +192,7 @@ EXPORT_SYMBOL_GPL(typec_altmode_vdm);
 const struct typec_altmode *
 typec_altmode_get_partner(struct typec_altmode *adev)
 {
-	return &to_altmode(adev)->partner->adev;
+	return adev ? &to_altmode(adev)->partner->adev : NULL;
 }
 EXPORT_SYMBOL_GPL(typec_altmode_get_partner);
 
-- 
2.20.1


--+QahgC5+KEYLbs62--
