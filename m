Return-Path: <linux-usb+bounces-32661-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPLLOKrUc2kCywAAu9opvQ
	(envelope-from <linux-usb+bounces-32661-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 21:06:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A09F7A78B
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 21:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23D8C3050A17
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 20:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803F62C08B1;
	Fri, 23 Jan 2026 20:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="EGXXnIqN"
X-Original-To: linux-usb@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371D22D46BD
	for <linux-usb@vger.kernel.org>; Fri, 23 Jan 2026 20:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769198721; cv=none; b=ZbCFxBET99Ik6sxIb0n/Kbz+EALX6SR04AWWlRMUvnlRjHmrCweuWaGR0bkpmT8DiIuInAM6h2b/AeQ4Ln1eGwLEXs/l7VlHrEhSFpM544LLzL5F/g2PKMmSxuvA+mTmK0/xGxw3/g4oFVZ5ovnIa1iFZq2s2Hnl0aFFtusoddE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769198721; c=relaxed/simple;
	bh=Q9QDlQYq8HcUocZzHDc81qU8oTuCskbFTBqYgKQ/GyI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hWo+IqQ+8Sk71NhHveL4Mc/7pFcnju6KQlklbtbPIqYBFR7Sx9vTlEGvruDGs3iStrzXxDErGKCQNJZ88K6shvq8LrkNndEHGy9cPPPbFbKIOFncoDlMMg/VcMxLQO6qzG3Ss1ORLj0wT4odMKwurS2IW+h1efphmwedpkwmKqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=EGXXnIqN; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
DKIM-Signature: a=rsa-sha256; b=EGXXnIqNf7p/NMmYROW5yQDoec8428yQIx6eX7KeILgvMUa6wAvl5a0p1ag6v8+Brd/0s1Os9JPJc+BQrAqvQ06aRiwFKjwLRQ+wHUfe+TaOEt58qb/d/9Q4TzygaRwga/N/ENqBDcytZtOE4ptu8iWZHmHthwSniqpnAXKdZRj9M6t+9Qk9PpdhdQBGom1+jj9mDwqvGxCbXyGbCTUzpjOxQO2MCYTm8RzC0lHwepcTF1vBWts8mbdXTLf9rZGJMohKhwFHd6X3dZmIPz4Na5sEry6cW+BmQTPwSVzdhnt7hJ63l+tAPAEhFHTTNCl+0TI+jkadVfZEB161wUXaFw==; s=purelymail1; d=purelymail.com; v=1; bh=Q9QDlQYq8HcUocZzHDc81qU8oTuCskbFTBqYgKQ/GyI=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-usb@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1410584204;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 23 Jan 2026 20:04:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1vjNOo-0000000FoVT-16Ny;
	Fri, 23 Jan 2026 21:04:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: netdev@vger.kernel.org,  linux-usb@vger.kernel.org,  Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next] net: usb: sr9700: use ETH_ALEN instead of
 magic number
In-Reply-To: <20260123070645.56434-1-enelsonmoore@gmail.com> (Ethan
	Nelson-Moore's message of "Thu, 22 Jan 2026 23:06:39 -0800")
References: <20260123070645.56434-1-enelsonmoore@gmail.com>
Date: Fri, 23 Jan 2026 21:04:54 +0100
Message-ID: <87tswcrt7d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[purelymail.com:s=purelymail1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[korsgaard.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32661-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[peter@korsgaard.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[purelymail.com:+];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5A09F7A78B
X-Rspamd-Action: no action

>>>>> "Ethan" == Ethan Nelson-Moore <enelsonmoore@gmail.com> writes:

 > The driver hardcodes the number 6 as the number of bytes to write to
 > the SR_PAR register, which stores the MAC address. Use ETH_ALEN instead
 > to make the code clearer.

 > Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard

