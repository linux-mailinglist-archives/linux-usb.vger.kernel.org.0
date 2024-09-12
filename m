Return-Path: <linux-usb+bounces-15059-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9A6977470
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 00:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69F011F25467
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 22:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B25B1C2DD9;
	Thu, 12 Sep 2024 22:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="kaAQ40wD"
X-Original-To: linux-usb@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAF81C244F
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 22:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726180827; cv=none; b=mtn1kn1AmCib4cJi5z5Oq9VttnrCG5Gtw3vZJRWcsjhOl6uWw42dx6aW4jiuLjw5GAyTN9jpBdVQeBB0RbFrO9i7NNT/LkoRk5yrgX65wyoYshqejXdJF7kZyFd2r/s20p9/N47ecRUk17Qd3EpIGDkJq8WzuabRNdixEkd8G98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726180827; c=relaxed/simple;
	bh=sxAKHP3cQV0x7xhU/eX/1732Tjzdx2vIP6oJohlXeQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pupgHiuCkkCkDBxIBWpsHivfOi6DGw36UaDXDJ1I2UU976XfXcl+vzBOFH97Xr55a2RxABWA5URTo7t4wKykbLWAWsc4cZ47j0/9e6vW59RymhmVcrkHdft7NthaHsD/mawrBeJP3hRt5b81Jtu6uaZoJgyooyr6Ah+03JYQRPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=kaAQ40wD; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4X4XT558QTzlgMVj;
	Thu, 12 Sep 2024 22:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1726180820; x=1728772821; bh=guJG9
	KumtE8xMLtZPQDShZaNC8ri4kiOKkGzlIM4Teg=; b=kaAQ40wDaRMxJ4+ZmnIAx
	8tqeFL+1gpjrgv7VoH/2UFv+/T4ARgrtg7KaIi/zctyEY2iS75r/zmIwXQfRcowt
	bHufIZBDFQ8A6MzIfeASK6bfjlRMlim+9d8CH6OQwP21JOri0cgX9MkLRzu3R217
	sGlduz2ii34zXk2K8FhYqchUYTdVpmaAiJ0qf1JGQI1UAjL3TEQAumb1qt8+sbon
	hnZQ6OgIWUp/dQuu94acsx7/JJOIAxp1MBVQVN+hwAkd+jd7yRmulJRO/8r7Lur6
	12alSgD6/CABEnjE6lmZvQzQr93arwxl0d+QYDbkA1U948B4y7FKhcPyKU07bWyx
	Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id zeVFqAQgqILO; Thu, 12 Sep 2024 22:40:20 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4X4XSz2x6XzlgMVl;
	Thu, 12 Sep 2024 22:40:19 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v3 3/3] usb: roles: Improve the fix for a false positive recursive locking complaint
Date: Thu, 12 Sep 2024 15:39:56 -0700
Message-ID: <20240912223956.3554086-4-bvanassche@acm.org>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
In-Reply-To: <20240912223956.3554086-1-bvanassche@acm.org>
References: <20240912223956.3554086-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Improve commit fc88bb116179 ("usb: roles: add lockdep class key to struct
usb_role_switch") as follows:
* Move the lock class key declaration just above the mutex declaration su=
ch
  that the declaration order of these objects matches their initializatio=
n
  order.
* Destroy the mutex and lock class key just before these objects are
  freed. This makes it easier to verify that the destruction calls happen
  after the last use of these objects.
* Instead of switching the mutex key to the dynamic lock class key after
  initialization of the mutex has completed, initialize the mutex with th=
e
  dynamic lock class key.

Cc: Amit Sunil Dhamne <amitsd@google.com>
Cc: Badhri Jagan Sridharan <badhri@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/usb/roles/class.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index 7aca1ef7f44c..c58a12c147f4 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -22,6 +22,7 @@ static const struct class role_class =3D {
=20
 struct usb_role_switch {
 	struct device dev;
+	struct lock_class_key key;
 	struct mutex lock; /* device lock*/
 	struct module *module; /* the module this device depends on */
 	enum usb_role role;
@@ -34,8 +35,6 @@ struct usb_role_switch {
 	usb_role_switch_set_t set;
 	usb_role_switch_get_t get;
 	bool allow_userspace_control;
-
-	struct lock_class_key key;
 };
=20
 #define to_role_switch(d)	container_of(d, struct usb_role_switch, dev)
@@ -329,6 +328,8 @@ static void usb_role_switch_release(struct device *de=
v)
 {
 	struct usb_role_switch *sw =3D to_role_switch(dev);
=20
+	mutex_destroy(&sw->lock);
+	lockdep_unregister_key(&sw->key);
 	kfree(sw);
 }
=20
@@ -367,7 +368,8 @@ usb_role_switch_register(struct device *parent,
 	if (!sw)
 		return ERR_PTR(-ENOMEM);
=20
-	mutex_init(&sw->lock);
+	lockdep_register_key(&sw->key);
+	mutex_init_with_key(&sw->lock, &sw->key);
=20
 	sw->allow_userspace_control =3D desc->allow_userspace_control;
 	sw->usb2_port =3D desc->usb2_port;
@@ -399,9 +401,6 @@ usb_role_switch_register(struct device *parent,
=20
 	sw->registered =3D true;
=20
-	lockdep_register_key(&sw->key);
-	lockdep_set_class(&sw->lock, &sw->key);
-
 	/* TODO: Symlinks for the host port and the device controller. */
=20
 	return sw;
@@ -418,9 +417,6 @@ void usb_role_switch_unregister(struct usb_role_switc=
h *sw)
 {
 	if (IS_ERR_OR_NULL(sw))
 		return;
-
-	lockdep_unregister_key(&sw->key);
-
 	sw->registered =3D false;
 	if (dev_fwnode(&sw->dev))
 		component_del(&sw->dev, &connector_ops);

