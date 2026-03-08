Return-Path: <linux-usb+bounces-34229-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ceWmJXeDrWkP3wEAu9opvQ
	(envelope-from <linux-usb+bounces-34229-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 15:11:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2081230896
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 15:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 147A13012C60
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 14:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E16C326D51;
	Sun,  8 Mar 2026 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=nils.reuter@gmx.net header.b="d2t/ZcLU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C9F23A566
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 14:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772979058; cv=none; b=rOMTLuGajn9k0O2Nrxf7LkRnOnn6wLvpHjWv81jz+Qj0TF4tAkBYrYyRlxwPFr3/pjTyQx3rpxKOJ6q5ZYU/zbNVckX54dZQA2OkUJtxgTNmozx9hssA8GMJerXdLfKtw5RL0kKwcH01I5kgBnUie1lRAPhY5REaotDcZr8c4l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772979058; c=relaxed/simple;
	bh=UzhsOMEPxlBSJi1H0yh+FegiM+aNu+xClRra4neBZJs=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=lBzwBsirFcCfxcouHHqONbBUwEeaoYwJiag95tl8O8PYIEgnifRMT9rNOMTWWt2gcPSWAsyhW2NeNgJ4pDwL5fHq/9Nrrr8HuDLF8L8Cv0HzJDyIeTTaY0nSwIc4Vaix6hQGuqu0kPpYzFCI7uBFYW02UQVdwlG59hLPQdA/u6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=nils.reuter@gmx.net header.b=d2t/ZcLU; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1772979054; x=1773583854; i=nils.reuter@gmx.net;
	bh=zNlTkoe7kBufmtOVjAYVuxc8Y/gVHKg36Vwv0jjiMnA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Reply-To:To:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=d2t/ZcLUgHiouuImZhNkXg6akYyeXnUaz9aV+1PB1vKuhDjSJR4v+JbOfQ5C2oaS
	 Bycatl6ZPX3NSEXRcLKJejLLlBh5Bwb7fCr8wjWqtWVxmLC9wzNdyi1iSh3FWKD4Q
	 9c2UKZbqDHWVm9kDo6R4jDZzM+9P6N78i5bIA9gIhHwGLp9Maz241Lvftnq9XQPAO
	 fiU5ZO8JMl/3d27fQmOwBK6nRLzT9IPApYSUSyYG8y++4kpy5SqEoD0NmbBgLDFmW
	 WSZcJBtKl7bjiH/LUWuMHn+pVJ+qJZq34L3ZomV5KWJW6lHA+hNG8MJwCQo3cPYUf
	 FJWe9cnfR9THipnRDg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuDc7-1ve0Yt2PYz-00zbKf for
 <linux-usb@vger.kernel.org>; Sun, 08 Mar 2026 15:10:54 +0100
Message-ID: <151d1ec4-275a-43d6-bc06-26e013695b7b@gmx.net>
Date: Sun, 8 Mar 2026 15:10:54 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Reply-To: nils.reuter@gmx.net
Content-Language: en-US, de-DE
To: linux-usb@vger.kernel.org
From: Nils Reuter <nils.reuter@gmx.net>
Subject: [BUG] UAS protocol hangs on Realtek RTL9210B (0bda:9210, bcdDevice
 f0.01)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jaqFjyubhTBQj/vcAp3a2pIEg0Lhs+2Pt7Cc+tOR9Dt2mrdLUWP
 HG7XE60uY7mFF7c5HjAOpUA2r+GA9TLJURfqq2PZPdIIFz9/2jFxv7VSLhb8Kax3ksNRbte
 KXEcCqtMRhx554KbfHLvdI5V9Dp15hXjvKtWA6+XKyfqFL8Wp2m3NLh4LnxbSXH3YC6UQOj
 Rr81YMRciFt1YePHvYQsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:45KvnL3Se7M=;+7z7fZ36gAUmsiySFztZNwmt3tG
 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
X-Rspamd-Queue-Id: E2081230896
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.net,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.net:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34229-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_REPLYTO(0.00)[gmx.net];
	DKIM_TRACE(0.00)[gmx.net:+];
	FREEMAIL_FROM(0.00)[gmx.net];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[nils.reuter@gmx.net];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nils.reuter@gmx.net,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello,

I would like to report a persistent UAS protocol issue with a Realtek=20
RTL9210B based M.2 enclosure.

*Hardware Environment:*

  *

    Enclosure: Ugreen SKU 15813 (Model CM767)

  *

    Bridge Chip: Realtek RTL9210B (ID 0bda:9210, bcdDevice f0.01)

  *

    Drive: Transcend TS512GMTS430S (SATA M.2)

  *

    System: Debian /=C2=A0OpenMediaVault (Linux omv 6.18.12+deb13-amd64)

  *

    Kernel: 6.18.12-amd64

*Problem Description:* Under heavy I/O load (e.g., backup operations),=20
the device experience UAS protocol hangs. The kernel log shows multiple=20
|uas_eh_abort_handler| events, followed by SCSI read/write errors and a=20
device reset (error -71). Eventually, the device is offlined or=20
remounted as read-only.

SMART logs show incrementing UDMA CRC errors (Attribute 199) during=20
these events, even though the hardware (cable/SSD) tests fine on other=20
platforms.

*Logs:*

|[timestamp] sd 1:0:0:0: [sdb] tag#18 uas_eh_abort_handler 0 uas-tag 15=20
inflight: CMD IN [timestamp] usb 2-1-port3: cannot reset (err =3D -71)=20
[timestamp] sd 1:0:0:0: Device offlined - not ready after error recovery |

*Workaround:* The device works perfectly stable when UAS is disabled via=
=20
usb-storage quirks: |options usb-storage quirks=3D0bda:9210:u|

*Request:* Please consider adding this device (0bda:9210 with bcdDevice=20
f0.01) to the kernel's UAS quirks list to ensure out-of-the-box=20
stability for other users.

Best regards, Nils Reuter


=2D-=20
Nils Reuter
Houbirggasse 7
90482 N=C3=BCrnberg

nils.reuter@gmx.net


