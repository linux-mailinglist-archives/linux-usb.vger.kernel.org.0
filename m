Return-Path: <linux-usb+bounces-32624-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBovBY4McmksawAAu9opvQ
	(envelope-from <linux-usb+bounces-32624-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 12:39:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD3B661F1
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 12:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 22D298C79DD
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 11:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C34843C04F;
	Thu, 22 Jan 2026 11:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hernandez-ros.com header.i=@hernandez-ros.com header.b="lC4+35dW";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="csjnpoSC"
X-Original-To: linux-usb@vger.kernel.org
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F232B38B7BF;
	Thu, 22 Jan 2026 11:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.27.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079820; cv=none; b=IaiB3R2A/TGRQOMYcnGbeA5QsEEm/BFYGbUVkAACZk8cgf3pLaeEer8nuVc6u++7xxEUaRUTIQlY7qkgmaYhOmZGb/GaABq5zz3y4ij0zIicYU4nbYLhPiLzD+47NFscYBDN+xTeVnGOu+5BB9EejZlNW/BQB0HVDUILEZ/x5rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079820; c=relaxed/simple;
	bh=UIzWzvBayaIOIXIDFseloNlX8f20dog8suZ8QC94ykM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-ID:References:To; b=HaGVnqgmZypoCA+PAcy076/CMfjbFeoFkuj+6HN5+y6jEO/FOFqhIaGD5LwrZNAyCr3ERxvuAplVaulQ3BzCwENyeALubZI6elFgDoHt4EualS9RGBLa7kZ4/LhNJEZ0nOXjX8D2a8wA+rcT+2cbG6utnKBO/vlx+5fLPnpFk9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hernandez-ros.com; spf=pass smtp.mailfrom=us-west-2.amazonses.com; dkim=pass (1024-bit key) header.d=hernandez-ros.com header.i=@hernandez-ros.com header.b=lC4+35dW; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=csjnpoSC; arc=none smtp.client-ip=54.240.27.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hernandez-ros.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-2.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4vmhj3boyfilqttfply4nxrhvlvpcgyy; d=hernandez-ros.com;
	t=1769079818;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To;
	bh=UIzWzvBayaIOIXIDFseloNlX8f20dog8suZ8QC94ykM=;
	b=lC4+35dW749h/wQp6tIAINU+yUz8BXffQV2SZv5Slr5c1lCMcr6cjnedmibgGGEE
	8IVRk5dfVa61Uh15LuSZ60q6OBsXbuoqtwf2Gsj7B+GT68Xo83Z4ZdvJVI0YDqZnd47
	uL9W8o2IDvOtdxC3olla2g+CcVgCWJSSHN5/qES4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769079818;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To:Feedback-ID;
	bh=UIzWzvBayaIOIXIDFseloNlX8f20dog8suZ8QC94ykM=;
	b=csjnpoSCZJXkXsAQV36rRueVfgZC4j0QZpYwmCX7W8KeFfbDvudn/Q0TUj4rN2S7
	y73fTMmuTgfM7c7XkPVO1LmGx9TX7tc3yJQ5OBSlc3u5Pz4xcSnsZH38+dSzStCPqRh
	mqWioC0AL0FOrIMO3QYT/uIdt8DMQG/WYvq+XaMM=
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] usbip: Reduce CONNRESET message noise in dmesg from stub
From: =?utf-8?Q?Ignacio_Hern=C3=A1ndez-Ros?= <ignacio@hernandez-ros.com>
In-Reply-To: <20260121163721.11933-1-skhan@linuxfoundation.org>
Date: Thu, 22 Jan 2026 11:03:38 +0000
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-ID: <0101019be55fc899-5597b939-9ae3-48be-817b-b61758d16312-000000@us-west-2.amazonses.com>
References: <20260121163721.11933-1-skhan@linuxfoundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
Feedback-ID: ::1.us-west-2.HjGwZwg5MFiEpu6H35PNuAp1STds0CnEvbYH/ASzZjo=:AmazonSES
X-SES-Outgoing: 2026.01.22-54.240.27.192
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[hernandez-ros.com:s=4vmhj3boyfilqttfply4nxrhvlvpcgyy,amazonses.com:s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32624-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[hernandez-ros.com];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,zenithal.me,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ignacio@hernandez-ros.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[hernandez-ros.com:+,amazonses.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amazonses.com:dkim,linuxfoundation.org:email,us-west-2.amazonses.com:mid,hernandez-ros.com:email,hernandez-ros.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 7DD3B661F1
X-Rspamd-Action: no action

Hi,

I need a couple of days to set up a new RPi hardware and compile kernel =
with USBIP debug set on.=20
I don't want to put my infrastructure on risk if anything goes wrong. =
But I=E2=80=99ll definitively send you the debug information required.

Regards
Ignacio

> El 21 ene 2026, a las 17:37, Shuah Khan <skhan@linuxfoundation.org> =
escribi=C3=B3:
>=20
> stub_complete() prints informational messages for each urb unlink
> filling dmesg. Change the message to dev_dbg() similar to vhci
> reports the CONNRESET condition.
>=20
> Reported-by: Ignacio Hernandez-Ros <ignacio@hernandez-ros.com>
> Closes: =
https://lore.kernel.org/all/0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693=
eef4179-000000@us-west-2.amazonses.com/
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
> drivers/usb/usbip/stub_tx.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/usbip/stub_tx.c b/drivers/usb/usbip/stub_tx.c
> index 55919c3762ba..4cae452bfadb 100644
> --- a/drivers/usb/usbip/stub_tx.c
> +++ b/drivers/usb/usbip/stub_tx.c
> @@ -55,7 +55,7 @@ void stub_complete(struct urb *urb)
> 			 "stopped by a call to usb_kill_urb() because of =
cleaning up a virtual connection\n");
> 		return;
> 	case -ECONNRESET:
> -		dev_info(&urb->dev->dev,
> +		dev_dbg(&urb->dev->dev,
> 			 "unlinked by a call to usb_unlink_urb()\n");
> 		break;
> 	case -EPIPE:
> --=20
> 2.51.0
>=20


