Return-Path: <linux-usb+bounces-34069-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KYdFudlqWlN6wAAu9opvQ
	(envelope-from <linux-usb+bounces-34069-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 12:15:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E31C2106D0
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 12:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DB2C3025ED0
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 11:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF22738837C;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYjST4up"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFC8385536;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772709328; cv=none; b=gCA7NIeUnYWke6Ll7IEQ4BupvknrPAeUjIxs0MNbA0yjHeLjrCm2ZfE+VFX/Dl3+tspB5eyfG1Z+1txC8eYt1vc3VncGcOI1LZONoVpFkmh6/qYcDR6NCSSsUHnT+itHTCrBD8VdAcyHT/jLxFk+KNlZjV+LczEZgtmMULNL+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772709328; c=relaxed/simple;
	bh=LHTW92pouoy0ryE6AcSXfrvIRL/W8q7FUWuga+ffaF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKWxQs7+AAW7TKh3g3itikVue0os/mzS8yk2qYnYb0/tgynzIqfd1GFV4mi2ffnpQ7vcx7GzUP1PyNK+5BaJswGKDaNsh23bqQbK63606QVpDNexz9qSgJXBDySXAhndIsNHDxjk3WyTvc40IHw26xXh58Zh3kL74VT5xxOpDZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYjST4up; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADA5C19423;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772709328;
	bh=LHTW92pouoy0ryE6AcSXfrvIRL/W8q7FUWuga+ffaF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NYjST4upKGCaQ6j7GAPkO0fgJAlvnfWbKdPM0k0qU8XPUhT1uMgBg1/qoK/8/Mye1
	 z1WDJSxoRQykGiIWzgFUvj4evhfhAQo2ddwcDOyPn7MwBfjDh8OBLRKtd/JkBVoqpX
	 azijyC2ntOZ50f5anboHRPKbOATm+A9D9h2td9h/hn+A2elSam4dvufIyZ85Lr4Agn
	 xN0v6uYQ/jJ+JOeX9R8BBpiip78lSCGMb7v0E+BbGdVxtqKADuzJUSRH7HXo6NvpMU
	 va/tboUwV0oQ9kdqdR8urA7ha7wS2vsi1Rq1R3w8pMR+SIwf0stlLIjjonyLV+RswI
	 6oUH+1RdHGySw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy6ft-000000004ng-3oJO;
	Thu, 05 Mar 2026 12:15:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/5] USB: cytherm: drop redundant device reference
Date: Thu,  5 Mar 2026 12:15:08 +0100
Message-ID: <20260305111511.18386-3-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305111511.18386-1-johan@kernel.org>
References: <20260305111511.18386-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8E31C2106D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34069-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Driver core holds a reference to the USB interface and its parent USB
device while the interface is bound to a driver and there is no need to
take additional references unless the structures are needed after
disconnect.

Drop the redundant device reference to reduce cargo culting, make it
easier to spot drivers where an extra reference is needed, and reduce
the risk of memory leaks when drivers fail to release it.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/cytherm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/misc/cytherm.c b/drivers/usb/misc/cytherm.c
index 2bf082474e9d..b183df9826bc 100644
--- a/drivers/usb/misc/cytherm.c
+++ b/drivers/usb/misc/cytherm.c
@@ -311,7 +311,7 @@ static int cytherm_probe(struct usb_interface *interface,
 	if (!dev)
 		goto error_mem;
 
-	dev->udev = usb_get_dev(udev);
+	dev->udev = udev;
 
 	usb_set_intfdata(interface, dev);
 
@@ -334,8 +334,6 @@ static void cytherm_disconnect(struct usb_interface *interface)
 	/* first remove the files, then NULL the pointer */
 	usb_set_intfdata(interface, NULL);
 
-	usb_put_dev(dev->udev);
-
 	kfree(dev);
 
 	dev_info(&interface->dev, "Cypress thermometer now disconnected\n");
-- 
2.52.0


