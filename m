Return-Path: <linux-usb+bounces-36800-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOh5EUOg82ly5QEAu9opvQ
	(envelope-from <linux-usb+bounces-36800-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 20:32:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B0E4A6FCD
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 20:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7A88302AC07
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 18:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A0747CC61;
	Thu, 30 Apr 2026 18:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="BLnDLn+P"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DB94779A4;
	Thu, 30 Apr 2026 18:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777573936; cv=none; b=g+MIaLtj8DpsB8/Sws65P8jDs7KgS4FAQQh7CrBhBTX5ErqhT8aWG+8985M1aeuF+I7pUeTET+fPSwOXdynsUTvI2caeLlo06hpJrzJcs+8uWraiqz94jW08a0drCSkrUJm6b8ZymnisXONpIgOi5bFXOjqprHJ/QYhwlOU21kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777573936; c=relaxed/simple;
	bh=q3B4lX8WnBeJfC3WXPLuc7GCXjF7pt7gf6jO1l5mGhE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=s+xYRw/lJZT0qY9dVCNtXLb63dpvYGIlT+a0S6HgZoc0bSehAwioBZoCnxdZ3702NeIFxYtwRzK7CK81brFqzO6KCFJQr6MW0Dn0RtwS67Pf8i+8WR8nA//oLB7Ki52LH0T+iWoPDgqDjvz5eNraOH0H6uG70T2CmNd2yH6lf3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=BLnDLn+P; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:References:From:Subject:Cc:To:Message-Id:Date:
	Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q3B4lX8WnBeJfC3WXPLuc7GCXjF7pt7gf6jO1l5mGhE=; b=BLnDLn+PYQmsa/BYZke8oFNqy3
	9LHcdqXG54ki/W1u2pgSsU9JDr1G8tjyvhNlRyARA1tGdEch6msTCoHAQ8ogjJCXwkrQeIRl7rI8i
	xBMS6EbMV1a9Y0vNTIQmFdLO4TaZ22iJ+wj+sINrmrXL0mMVHYp0zM6ovP+hLNWNoeMcxkHfyteGu
	BEDs3Stner0x2Hh1NsfhY62uMYUTCg75+4PTbyiblfmeTnTKS0YVpZn9k3pCl0uwNLZ2mY3QvWWHR
	sG22Vob9dsGuFN/NSSHpMVhawSmScgbTDpq2vSd04fY3wx6hoc7eYNQ8+iTL50ODaWHN0NX1GdEt1
	A9c35CEg==;
Received: from 177-136-93-123.vmaxnet.com.br ([177.136.93.123] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wIWB9-004Y5E-9r; Thu, 30 Apr 2026 20:32:02 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 15:31:55 -0300
Message-Id: <DI6PD3MOZAXW.RNUBKGQG1O6M@igalia.com>
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
 <DI51WD2C7TJF.1X6B12NO0OO4@igalia.com>
 <20260429001626.2f08b991.michal.pecio@gmail.com>
In-Reply-To: <20260429001626.2f08b991.michal.pecio@gmail.com>
X-Rspamd-Queue-Id: 98B0E4A6FCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36800-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.939];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[halves@igalia.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,abbfd103085885cf16a2];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,igalia.com:mid]

On Tue Apr 28, 2026 at 7:16 PM -03, Michal Pecio wrote:
> I'm completely unfamiliar with this class, but my understanding of
> USBTMC spec is that bNotify1 is mandatory while bNotify2 may have
> any length, likely including zero, though it's a bit imprecise.
>
> The driver only supports notifications defined in the separate USB488
> spec and for these, bNotify2 should be one byte. It also warns on
> every unrecognized notification.
>
> I think a minimal fix which mostly preserves existing behavior would
> be adding "urb->actual_length =3D=3D 2" as a requirement for all USB488
> notifications. Then any truncated message will be ignored and logged.

Yes, that's my understanding as well! Although I don't think bNotify2
would ever be zero in practice, this sounds like a good approach. I'll
submit a v3 with this change plus the endpoint check from v2, hopefully
that'll improve things for these edge cases.

> wMaxPacketSize is a separate issue indeed and it seems that a USB488
> device could legally set it to 1, though it would be crazy. Your v1
> patch would probably make such devices work, if anyone cares.

Honestly, I'm also more inclined to just reject endpoints with this
configuration. This seems like a very niche edge-case, I'd be surprised
if real hardware operated like this (famous last words? heh). I'm not
sure if this would even be valid/legal, given your previous point on
bNotify2 being one byte. Considering these devices do not work at all
currently, checking if wMaxPacketSize and urb->actual_length are big
enough seems like a saner approach and won't require bigger changes to
the driver.

Thanks for the help, Michal!

Best regards,
Heitor

