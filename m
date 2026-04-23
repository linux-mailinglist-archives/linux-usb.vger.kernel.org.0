Return-Path: <linux-usb+bounces-36444-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDGlADcZ6mk7uAIAu9opvQ
	(envelope-from <linux-usb+bounces-36444-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 15:05:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2105452751
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 15:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96D0730117E1
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 13:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FDB3EE1EF;
	Thu, 23 Apr 2026 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="IQm6xwnS"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1FB1F151C;
	Thu, 23 Apr 2026 13:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949437; cv=none; b=psZIb0wMsOoPFlOFhPm/9KYMlm6ocn0Ocns/64CNW3cq7SEw4MGK0fyloXfIoKrvr/tYbNCF0vRW05qfXyMemEc/aNpvBCN76dkwkr0Q/xqvfZOLZbeiMjEQll2OHFa+lsLzHLjJqdIY2iKl0Sip5iTgZH3k8MNIAK61LOkS7M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949437; c=relaxed/simple;
	bh=eVWNf49P0/QU2AQlWfz5IjglLXRbcfDDl64DjiNE2w8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UUWDSQn19NqAorRJdGgt1exIC5hOXyQE/4vYaAcwBDZxqci7nYcbvo/9PKU8n4XecPqrO8sSxQ765KvEMgOJlL8/SZezMyETDFbz2nMIyZUrKdqyK0a74iP0LoOgaJfFBJWgmDPQO8pgQHxtxCr6QwFbhtuw42z8EMrA6+Ic06k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=IQm6xwnS; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:
	Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QueaoqBtTpcZsRt7i8IWvSyVxgU0wY2fcoNKkTls1Yk=; b=IQm6xwnS9AXQ0+VTQi/ENUYb5d
	aGb5DOQy7G7PYP0YliJ/hTcOdc9C7NspKVK/j2sLhnnMt6GwD4ORPN4YuN9fKWuq6eynIcwo4UuyH
	BVdI5JzkpgbYOF7GXVNWvpp302OFIygwvgU7P7vY2mWIfK+HxhaJ2dTohodJ6V8C1BaVe+rNKQXwN
	Sr5EUBoIFS9X4iJBdlqJigBYaD/Jv13BIHCvQ4VeXmySsRcvLFsTkyAs/QT/XYBGN7ncabKFplqto
	yU59jif1FMZZH99jf4FzrrogppUzdc9iSVS/6vypTRE1jegRw+sFWrB+9H5A9vzogB0GZvytL7ytq
	TKrHmNLg==;
Received: from 177-136-93-33.vmaxnet.com.br ([177.136.93.33] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wFtid-0016yZ-PI; Thu, 23 Apr 2026 15:03:47 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 10:03:41 -0300
Message-Id: <DI0JZYWTVN2L.1MLYYIHUJ8XUK@igalia.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel-dev@igalia.com>,
 <syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com>,
 <stable@kernel.org>
Subject: Re: [PATCH] usb: usbtmc: Allocate enough space for interrupt-IN
 buffer
From: "Heitor Alves de Siqueira" <halves@igalia.com>
To: "Michal Pecio" <michal.pecio@gmail.com>, "Heitor Alves de Siqueira"
 <halves@igalia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260422-usbtmc-iin-size-v1-1-5dc44b4389aa@igalia.com>
 <20260423073307.2b81543c.michal.pecio@gmail.com>
In-Reply-To: <20260423073307.2b81543c.michal.pecio@gmail.com>
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36444-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,igalia.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.965];
	MAILSPIKE_FAIL(0.00)[2600:3c09:e001:a7::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[halves@igalia.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,abbfd103085885cf16a2];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,syzkaller.appspot.com:url,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: A2105452751
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Apr 23, 2026 at 2:33 AM -03, Michal Pecio wrote:
> On Wed, 22 Apr 2026 19:22:09 -0300, Heitor Alves de Siqueira wrote:
>> The USBTMC driver allocates the Interrupt-IN buffer according to the
>> wMaxPacketSize value obtained from the USB endpoint. If a USB device
>> advertises a small enough wMaxPacketSize (e.g. a malfunctioning device
>> or an endpoint constructed by syzbot), the buffer will not have enough
>> space for the mandatory headers and will trigger an out-of-bounds read.
>>=20
>> Fix by ensuring the driver will allocate at least enough space to fit
>> the headers for Interrupt-IN packets (bNotify1 and bNotify2).
>>=20
>> Fixes: dbf3e7f654c0 ("Implement an ioctl to support the USMTMC-USB488 RE=
AD_STATUS_BYTE operation.")
>> Reported-by: syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=3Dabbfd103085885cf16a2
>> Cc: stable@kernel.org
>> Signed-off-by: Heitor Alves de Siqueira <halves@igalia.com>
>> ---
>>  drivers/usb/class/usbtmc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
>> index bd9347804dec..22efa74008f8 100644
>> --- a/drivers/usb/class/usbtmc.c
>> +++ b/drivers/usb/class/usbtmc.c
>> @@ -2452,7 +2452,7 @@ static int usbtmc_probe(struct usb_interface *intf=
,
>>  		kref_get(&data->kref);
>> =20
>>  		/* allocate buffer for interrupt in */
>> -		data->iin_buffer =3D kmalloc(data->iin_wMaxPacketSize,
>> +		data->iin_buffer =3D kmalloc(max(2, data->iin_wMaxPacketSize),
>>  					GFP_KERNEL);
>
> This changes OOB read into uninitialized memory read, which syzbot
> may complain about again next week.
>
> More reliable fix would be to reject such devices if they are illegal,
> or make the driver not read beyond wMaxPacketSize if they are legal.
>

That's a great point. The USBTMC spec doesn't explicitly mention that
small sizes of vMaxPacketSize are illegal, but indeed it doesn't make
sense to have a device that can't transfer at least the mandatory
headers. I'll see if I can send a follow-up for this soon, thanks!

Best regards,
Heitor

