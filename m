Return-Path: <linux-usb+bounces-34244-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1FqIAQPQrWk27wEAu9opvQ
	(envelope-from <linux-usb+bounces-34244-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 20:37:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8471A231FBF
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 20:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 162CF300A512
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 19:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F77F39449A;
	Sun,  8 Mar 2026 19:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=nils.reuter@gmx.net header.b="h50E/TXf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937762727F3
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 19:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772998652; cv=none; b=O6JR0TnpW5jknKAr1JKmMuGbnhCC+IQiiqpz3Ji7oMx89/NMMSVmuXTonALWIB8+mKKTudJzcHVSxLB9wZBX85ywl4VWqkIB6Vz0PMAAIDG5CRlNMKX7MQNODL9qCEzR/0Z5P0ExupHUeCgXMTwlXjA1cSDW0KUZXIkE9h+FKgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772998652; c=relaxed/simple;
	bh=Y5MKtS1t9cSDwq6ZRINJwz2Wran0zj6XsxJdJF3hMTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=DqdM5ohhi2SK317RQBWWcsTifA1rEEJYPPSzMUgeWzNaEVCQixzJ6BmXJdPazWq5ABiziWV1jW1HY/M3lyy+OfPuijTbHNVtKz+tVxLkS9p4DNOClbid7gibitzXHwGD1O1jij6c9+dry4GsYGeCwj4+nqwcMXkdNwBq5c6rpy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=nils.reuter@gmx.net header.b=h50E/TXf; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1772998648; x=1773603448; i=nils.reuter@gmx.net;
	bh=i0AZw4so3ieg/3HG/qbluB9yhQnkFRTDLZ2MCvKx5DQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Reply-To:Subject:
	 To:References:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=h50E/TXfZme04wyTaXT/cRjVo7HD4gg/ZfgomGpILqPb6fnHRfzfWGqM8xQ+RONm
	 7O6h9anFxi9XcHwsTrF8+BEda8coIaDiI1NegZVSfSPCuaFU+WaoRWgh2Hy1qtXiC
	 REGSu1Rpi2nGeWNHoIF67NJhc4zzVuj3AVgJd9uIQxZNatA0YofiQqBHUyv0M5h01
	 6XYRX55o7EUmr51mw7u2zHGJ1X3ZNiPGig7YI7eOZq82I5aGWCzJk5Tpw/mT1vvi2
	 oZWgMh1JphM/Pjj7cXUP+UGEn2Rx/xZjuOpjIh9Zs5fG9842OnWgQrjiIRW+XUzVw
	 rajewKOvjJkeMNHqCQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mf0BM-1vSk0Q352Y-00ngl6; Sun, 08
 Mar 2026 20:37:28 +0100
Message-ID: <1b015499-70b0-47c0-8600-4fb1555f9978@gmx.net>
Date: Sun, 8 Mar 2026 20:37:28 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Reply-To: nils.reuter@gmx.net
Subject: [PATCH] USB: storage: UAS: ignore UAS on Realtek RTL9210B with
 firmware f0.01
To: Greg KH <gregkh@linuxfoundation.org>
References: <151d1ec4-275a-43d6-bc06-26e013695b7b@gmx.net>
 <2026030817-cupping-reason-0bb9@gregkh>
Content-Language: en-US, de-DE
From: Nils Reuter <nils.reuter@gmx.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <2026030817-cupping-reason-0bb9@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t3FvF+BSLkl5HhxMEerBR/+Iye8amJ8BEorR2mTOJqeqXfO6jot
 zrq1aeeax8K/08+cv/szJjNW65+Jhz1OSKLkJBf8xiI2eEc4OS2M5TjUl+A5+LBYce6C+JA
 G9n5btzEkCk7J/FCBrLmv8+0AMflCIpZM4g5hiRBoqE0gaZrIOb5kZbb+PiWWtlBvWQxR5L
 pozjICeQcWT2hYt8QqNhQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NtkkHwhC9D4=;ZrRmzknDtn14YNf6Q/f3DUZCrGj
 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
X-Rspamd-Queue-Id: 8471A231FBF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.net,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.net:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34244-lists,linux-usb=lfdr.de];
	FREEMAIL_REPLYTO(0.00)[gmx.net];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_FROM(0.00)[gmx.net];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[nils.reuter@gmx.net];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.931];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nils.reuter@gmx.net,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,suse.com:email]
X-Rspamd-Action: no action

Hi Greg,

Thanks for the feedback. As requested, here is the patch to add the UAS
quirk for the Realtek RTL9210B (bcdDevice f0.01).

Regards,
Nils

=2D--

=46rom cb1f8118e802be51a06f4564bb01f91110a51b53 Mon Sep 17 00:00:00 2001
From: Nils Reuter <nils.reuter@gmx.net>
Date: Sun, 8 Mar 2026 19:39:21 +0100
Subject: [PATCH] USB: storage: UAS: ignore UAS on Realtek RTL9210B with
 firmware f0.01

The Realtek RTL9210B (0bda:9210) with firmware version f0.01 suffers
from UAS protocol hangs under heavy I/O load, leading to device
resets and read-only remounts. Disabling UAS via the IGNORE_UAS
quirk stabilizes the connection.

Signed-off-by: Nils Reuter <nils.reuter@gmx.net>
=2D--
 drivers/usb/storage/unusual_uas.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusu=
al_uas.h
index 939a98c2d..f17469f8c 100644
=2D-- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -90,6 +90,13 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_REPORT_LUNS),
=20
+/* Reported-by: Nils Reuter <nils.reuter@gmx.net> */
+UNUSUAL_DEV(0x0bda, 0x9210, 0xf001, 0xf001,
+		"Realtek",
+		"RTL9210B",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 /* Reported-by: Oliver Neukum <oneukum@suse.com> */
 UNUSUAL_DEV(0x125f, 0xa94a, 0x0160, 0x0160,
 		"ADATA",
=2D-=20
2.53.0

=2D--

