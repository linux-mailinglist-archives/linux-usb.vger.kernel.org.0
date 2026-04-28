Return-Path: <linux-usb+bounces-36652-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCtxGZ0R8WmXcQEAu9opvQ
	(envelope-from <linux-usb+bounces-36652-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 21:59:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EFC48B67B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 21:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12CFB30AB848
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 19:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8578D3B8958;
	Tue, 28 Apr 2026 19:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="QlEPR7/t"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2370F3290C5;
	Tue, 28 Apr 2026 19:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406178; cv=none; b=il/QP258NpEJPHBNxgbUXNA6QiWbi0JX7qe3HVoLKXcFxv0qcz59lougGUzjFiRAwmgVc8jKEtfEwMcVRSS61qJZ0b+XBPLpTku9IZcglZdAiCaQATNierj4jwbqL+2A/CgI2aSSefqrmNO6Y6ynLL+inJMtrWi2LGnE8ROJoc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406178; c=relaxed/simple;
	bh=J8wqvTcK39l6+nXBzikh7BzxR2KJJqZEtAy+55It6kU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=DL1ogmzvi4dSg4fFbbONdpjizZbIXX+6eYX5HaDEM/Vk05LziAtmeGljk9WrxUloEhGByWp5prHFHlj52VPunovx3JvpguYehoUHurQgFOMmcTD6A4HmVpLIFqDd51ePwQNWFdiCMsngs/3KtAuoZ1gowTLkaOSMH/e03vQ1qBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=QlEPR7/t; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:References:From:Subject:Cc:To:Message-Id:Date:
	Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=J8wqvTcK39l6+nXBzikh7BzxR2KJJqZEtAy+55It6kU=; b=QlEPR7/txw270mOz6ariFvQPW0
	VDyyOi0a/M+iJVT7W0EgdFr5vaJEhuiSI3pMCJWEyN4dlrpMq4eMtsiNcGYGiQ+1LdUo7HLR1bp+z
	pjLmHvEouauzxOA4/Z5xiQxVFG1rWlxD701ToouuMqW0ToEgrhLueU8anzwId6lH9dCy7HsMd/0rH
	CjTtXeFl4W3T+/LIapdaEzuPj7s8j0fIWiqOJRjM3e+sFuj2BCoiDqsEo69EvygdhrsooSltjCfQu
	p+yy/193D/ZEyMSXkutsSGfgDfI1q+ujP5luo0F4CbHknwW5eJCGzhpLmPCGbLnGnTknT9sNuLL4b
	I2LAfmQg==;
Received: from 177-136-93-123.vmaxnet.com.br ([177.136.93.123] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wHoXN-003Y2R-MC; Tue, 28 Apr 2026 21:56:05 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 16:55:58 -0300
Message-Id: <DI51WD2C7TJF.1X6B12NO0OO4@igalia.com>
To: "Michal Pecio" <michal.pecio@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel-dev@igalia.com>,
 <syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com>,
 <stable@kernel.org>
Subject: Re: [PATCH v2] usb: usbtmc: reject invalid interrupt endpoints
From: "Heitor Alves de Siqueira" <halves@igalia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260423-usbtmc-iin-size-v2-1-31afa4874f71@igalia.com>
 <20260424002839.5ad25517.michal.pecio@gmail.com>
In-Reply-To: <20260424002839.5ad25517.michal.pecio@gmail.com>
X-Rspamd-Queue-Id: E0EFC48B67B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36652-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_SPAM(0.00)[0.485];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[halves@igalia.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,abbfd103085885cf16a2];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email]

On Thu Apr 23, 2026 at 7:28 PM -03, Michal Pecio wrote:
> On Thu, 23 Apr 2026 15:04:38 -0300, Heitor Alves de Siqueira wrote:
>> The USBTMC driver allocates the Interrupt-IN buffer according to the
>> wMaxPacketSize value obtained from the USB endpoint. If a USB device
>> advertises a small enough wMaxPacketSize (e.g. a malfunctioning device
>> or an endpoint constructed by syzbot), the buffer will not have enough
>> space for the mandatory headers and will trigger an out-of-bounds read.
>>=20
>> Fix by rejecting devices advertising interrupt endpoints that don't fit
>> at least the mandatory headers (bNotify1 and bNotify2).
>>=20
>> Fixes: dbf3e7f654c0 ("Implement an ioctl to support the USMTMC-USB488 RE=
AD_STATUS_BYTE operation.")
>> Reported-by: syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=3Dabbfd103085885cf16a2
>> Cc: stable@kernel.org
>> Suggested-by: Michal Pecio <michal.pecio@gmail.com>
>> Signed-off-by: Heitor Alves de Siqueira <halves@igalia.com>
>> ---
>> Changes in v2:
>> - Instead of ensuring buffer size, reject devices that advertise illegal=
/invalid interrupt endpoints
>> - Link to v1: https://patch.msgid.link/20260422-usbtmc-iin-size-v1-1-5dc=
44b4389aa@igalia.com
>
> On second thought, this may be not enough. A wMaxPacketSize =3D=3D 2 devi=
ce
> can still send only 1 byte (or even 0) and cause unititialized read.
> Better check if the URB completed with expected actual_length before
> trying to parse the message.

You're right, although I think these are two separate issues. There
are indeed no checks for actual_length in usbtmc_interrupt(), and I'd
be happy to include those in a v3 (or a separate patch) if you agree
with this approach. For these cases though, I wonder if we can just
ignore the URB, as actual_length<2 would imply that either the headers
are missing, or the payload length is 0.

> And by the way, an interrupt transfer may span multiple intervals and
> exceed wMaxPacketSize, USBTMC spec alludes to it. Theoretically, even
> wMaxPacketSize =3D=3D 1 seems possible, though it would be crazy and like=
ly
> no such HW exists because nobody complains that it doesn't work.

Yes, but aren't such cases already handled as long as we validate the
bNotify headers? USBTMC interrupt payloads must include at least two
bytes for bNotify1 and bNotify2, so URBs that don't fit those should be
considered invalid, right? Even if the payload is split between multiple
transfers, these headers should be present in individual URBs. Checking
if actual_length fits both bNotify headers should be sufficient, as
data buffers will have enough space for at least wMaxPacketSize, and the
overflow case is already handled in usbtmc_interrupt().

Please let me know what you think, and I can submit a v3 with checks for
wMaxPacketSize in usbtmc_probe() as well as for actual_length in
usbtmc_interrupt().

Best regards,
Heitor

