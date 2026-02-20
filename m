Return-Path: <linux-usb+bounces-33515-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFOhMBxmmGmJHgMAu9opvQ
	(envelope-from <linux-usb+bounces-33515-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 14:48:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30368168066
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 14:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71F32301389C
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 13:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E087E34846C;
	Fri, 20 Feb 2026 13:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gYGSVqCz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB81349B04
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 13:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771595282; cv=none; b=TlAfW38JhH7UVRwggpKB+IaJqUnGKBkbLOnXO66I8FfmUigauLbG0Co6g7oAZy+8c2i9QhL8b7fpnHppK3J9VKDt1CCENsHdobUd7r2YSwA3S08GzlYWqzxSpZWzyIeeehCoaFu2B3TvvUPUYDVGcZUPBRzUY7YVZm/EfppXkVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771595282; c=relaxed/simple;
	bh=LCP4S7nW1w6rXQ4VX/NQCO9pkK1t1/d43vAMdFSN+pM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ISjQ7Dz+ujozjZTdk50AcO4oa/QcletnOadxByjh9o5hcFkHuZflNaMKBWl0+kiZD57PIHQc7H/8spPczBfHlJtDHmOJGNEH1+QuchiysVmsLoxe8qzHJCCyKfP1TSBgfCi/5M88En6ABMuO3RQPr2M2rJ0DxaHhRr5nxLbu7Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gYGSVqCz; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 85A624E4088C;
	Fri, 20 Feb 2026 13:47:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5AEB75FA8F;
	Fri, 20 Feb 2026 13:47:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9CF810368C65;
	Fri, 20 Feb 2026 14:47:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771595278; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LCP4S7nW1w6rXQ4VX/NQCO9pkK1t1/d43vAMdFSN+pM=;
	b=gYGSVqCzaJvVEVp+sFsTycrhl0mJ8c2PcZZl4bwwhJCsEVmK9CCMEIcQtlkeuaAmMqJ74j
	N4k+s6/ucf3JrJ5oIuy1QjzX9xjKGRmtJng5sRgtiaHKae8t+kum5WU0hzEnYOcz+8af25
	rDN/obkkLjkz0PU6ZG3O8y0UuWEdIfB8w7o7nRmoBh8AOb6g11RnN7ni+7N0IhmqRW/zMb
	HnL71OKtAf1ja5YFWpa8yXbdI2mbu9JUHwaZb6oJ8fnW0X/570n8/HWbaNwSOM+NvRBo5R
	7RNjUaXb3Htyht1NNPW+zoXLKhT+JwkMHJ5Zz0OkdF+C0z1bRx/606OmTTRnVw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] usb: ehci-orion: remove optional PHY handling code
 remnants
In-Reply-To: <20260220-ehci-orion-drop-phy-handling-v1-1-01abd9f168cc@gmail.com>
	(Gabor Juhos's message of "Fri, 20 Feb 2026 14:27:02 +0100")
References: <20260220-ehci-orion-drop-phy-handling-v1-1-01abd9f168cc@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 20 Feb 2026 14:47:56 +0100
Message-ID: <875x7rsf03.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33515-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 30368168066
X-Rspamd-Action: no action

Hi Gabor,

On 20/02/2026 at 14:27:02 +01, Gabor Juhos <j4g8y7@gmail.com> wrote:

> Since the USB core code handles the generic USB PHYs automatically, the
> optional PHY handling code has been removed from the 'ehci-orion' driver
> entirely by commit e04585184dcf ("usb: ehci-orion: avoid double PHY
> initialization"). However, the devm_phy_optional_get() call has been kept
> so the driver still gets the PHY even though it is not used for anything
> in the driver.
>
> Drop the remaining code, and also remove the 'phy' member of the
> 'orion_ehci_hcd' structure to simplify the code.
>
> Fixes: e04585184dcf ("usb: ehci-orion: avoid double PHY initialization")

The fixes tag makes no sense here, this is pure cleanup. I do not
remember if this was needed or not, it is probably safe to drop today.

Cheers,
Miqu=C3=A8l

