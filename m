Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8F91A7E43
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2020 15:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732404AbgDNNfu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Apr 2020 09:35:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58264 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728955AbgDNNdU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Apr 2020 09:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586871198;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=AoE/N24nYYzlQbVkLmfH6Lq/Ih32VhCGTIHdxMgbBwQ=;
        b=O5c5jjEGBxs2rddFb2PnTlktakUC/UGvgMA0TWrQ9fY+qUpr2lNE58EMvhbY68rGuU7JwA
        rPG3w6QuE56OCqHTATrNP7RWCOQgOfNYlTo4eQuv4lnZKFEIjJTLRIJN4hH44vhWF1KjLK
        tncotGEpX/jKpx1970e2S+QJsStPEP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-iI-gpJ02O86Napf4qcGJWg-1; Tue, 14 Apr 2020 09:33:17 -0400
X-MC-Unique: iI-gpJ02O86Napf4qcGJWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8939DBA7;
        Tue, 14 Apr 2020 13:33:15 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-21.ams2.redhat.com [10.36.114.21])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E0DDD5C1D4;
        Tue, 14 Apr 2020 13:33:14 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: pi3usb30532: Set switch_ / mux_desc name field to NULL
Date:   Tue, 14 Apr 2020 15:33:13 +0200
Message-Id: <20200414133313.131802-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since commit ef441dd6af91 ("usb: typec: mux: Allow the muxes to be named"=
)
the typec_switch_desc and typec_mux_desc structs contain a name field.

The pi3usb30532 driver allocates these structs on the stack and so far di=
d
not explicitly zero the mem used for the structs. This causes the new nam=
e
fields to point to a random memory address, which in my test case happens
to be a valid address leading to "interesting" mux / switch names:

[root@localhost ~]# ls -l /sys/class/typec_mux/
total 0
lrwxrwxrwx. 1 root root 0 Apr 14 12:55 ''$'\r''-switch' -> ...
lrwxrwxrwx. 1 root root 0 Apr 14 12:55 ''$'\320\302\006''2'$'...

Explicitly initialize the structs to zero when declaring them on the stac=
k
so that any unused fields get set to 0, fixing this.

Fixes: ef441dd6af91 ("usb: typec: mux: Allow the muxes to be named")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/mux/pi3usb30532.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/=
pi3usb30532.c
index 46457c133d2b..7afe275b17d0 100644
--- a/drivers/usb/typec/mux/pi3usb30532.c
+++ b/drivers/usb/typec/mux/pi3usb30532.c
@@ -114,8 +114,8 @@ pi3usb30532_mux_set(struct typec_mux *mux, struct typ=
ec_mux_state *state)
 static int pi3usb30532_probe(struct i2c_client *client)
 {
 	struct device *dev =3D &client->dev;
-	struct typec_switch_desc sw_desc;
-	struct typec_mux_desc mux_desc;
+	struct typec_switch_desc sw_desc =3D { };
+	struct typec_mux_desc mux_desc =3D { };
 	struct pi3usb30532 *pi;
 	int ret;
=20
--=20
2.26.0

