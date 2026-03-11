Return-Path: <linux-usb+bounces-34617-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NmvGdXmsWmcGwAAu9opvQ
	(envelope-from <linux-usb+bounces-34617-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 23:04:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE46426AB75
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 23:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F2AF3077522
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 21:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E1E34107F;
	Wed, 11 Mar 2026 21:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=nils.reuter@gmx.net header.b="rhMX+OfJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30E91E7660
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 21:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773266381; cv=none; b=avCAC/g0KbVCsoyGeGUMe32maLFFT1WvUmUhH+RU+8bWCHSeWvDCHSebpQM0djHU43A/LtqKwf9KBtCkSz8hBAlO6PAFUTfapRIt3zYFBPb+LkukA7O5zePBJ2t69lsGGj4pjWzItn8gdNmbugAikBmQWcwI8oQvm+6HMlwMS4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773266381; c=relaxed/simple;
	bh=g8zkd3IMK1XFLZEEV2Dd0bB5xLpL3FxiGdXPu6ZXwNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJ4Q/kzZQ8T39ltEf9xM6LWBXm8+UPTH7tx/zi0WjjBNklcR/G2Ow8b+fYis9afrZN6r/o29oW4nMeG/XHCCUmNef/idaj9UcOsR1+W5VyfXEunIT4D/IRmO2B/8FrpnVXn4UAxAYkXZ6EWRVIvaYkN/9YgmBNb4ptz9rWC8yVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=nils.reuter@gmx.net header.b=rhMX+OfJ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1773266377; x=1773871177; i=nils.reuter@gmx.net;
	bh=T1YP7KJm9vyOViLrM7E4bdHppwTG0okbonk1oIjkNqk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Reply-To:Subject:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rhMX+OfJMlk3TRK+Sg8IqvszQ9tVi5s3lEBoHLlrb5bhtsz12qevMT9q5tULfha4
	 7Y1E+LiUvzgBWhoM/krDgizTNmBLSYQTZECMi6r6Yee+hvZ4GKP54xfzr7ZDWrrm1
	 0nCLqn51x0CWv0mwcqM4DxyWklK0bD2FlqOn0aKolLHyfziNmXnIeJWPaMopwG32X
	 eJ4jDE4pRwFUsGQmWLpvry9Kj4Qk5I6ItTdMg5yew0h518JWoPQat0BASZMdtvmTC
	 5I3EYjgTfxdz0aAsIMYLaz+YT0t0EfV9DPPEOx074aCR4NQzy4z8Va/Pz4HNMJyme
	 M4jmn2JYQd0L8Bj73g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgNh1-1vQJ1i0p3P-00eJwy; Wed, 11
 Mar 2026 22:59:37 +0100
Message-ID: <de9c6047-27db-4dcb-8c1e-610dbf861da9@gmx.net>
Date: Wed, 11 Mar 2026 22:59:36 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Reply-To: nils.reuter@gmx.net
Subject: Re: [PATCH] USB: storage: UAS: ignore UAS on Realtek RTL9210B with
 firmware f0.01
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <151d1ec4-275a-43d6-bc06-26e013695b7b@gmx.net>
 <2026030817-cupping-reason-0bb9@gregkh>
 <1b015499-70b0-47c0-8600-4fb1555f9978@gmx.net>
 <2026031146-acclimate-attic-d402@gregkh>
Content-Language: en-US, de-DE
From: Nils Reuter <nils.reuter@gmx.net>
In-Reply-To: <2026031146-acclimate-attic-d402@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:57OG775kg6wZhP0+SnfbZIT8/Bu9RqXXIi0H8ZVGr4TTc5AZt0M
 fzJ5sK0KopGl5+KM1sezDK7Sj/BdDJUSl7EmJdD+U9yEgkzwu08q9thBcZjC0I0PgXpiCIz
 y13M2fyiFBA1bUbYiGRBbCrdrRz0gvGcKyktX6clumV9hMKCU0zaXc4unvS5B/2rDbzXIPH
 s3Q99ufgFrmS1x2y+Cspg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZH9ED0MGom4=;iaphFe8RxdHvvwrbjN1gYdPGmSJ
 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
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.net,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.net:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34617-lists,linux-usb=lfdr.de];
	FREEMAIL_REPLYTO(0.00)[gmx.net];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_FROM(0.00)[gmx.net];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[nils.reuter@gmx.net];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nils.reuter@gmx.net,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BE46426AB75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 11/03/2026 13:35, Greg KH wrote:
> This is a VERY heavy hammer for this type of device.  You say that the
> device just starts to time out, which implies it overheats or something
> else?  Are you sure that slowing it down like this is the best overall
> solution?  What does other operating systems do for this device?
>
> thanks,
>
> greg k-h

Hi Greg,

Please withdraw this patch.

Extensive stress testing with fio confirmed that the device is stable at high temperatures under UAS after I improved the hardware cooling. The initial hangs were likely thermal-related; I cannot confirm with certainty that the firmware version (f0.01) was the root cause.

Apologies for the noise.

Best regards,
Nils



