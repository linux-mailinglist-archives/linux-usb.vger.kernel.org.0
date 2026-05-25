Return-Path: <linux-usb+bounces-38013-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLN0LmAlFGrfKAcAu9opvQ
	(envelope-from <linux-usb+bounces-38013-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 12:33:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB665C9434
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 12:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEC313019931
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 10:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF3C3546E8;
	Mon, 25 May 2026 10:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="lG372KeD"
X-Original-To: linux-usb@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B921C7012;
	Mon, 25 May 2026 10:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705177; cv=none; b=cwmPY1XKErGdESX/Kml2NHRAYInQO17I0NZ7rvtbJh7Ov87jx+8zhJYw1dBVIOL+rnQ9X1oAtqQPj4Djy/x8dnkUqGVy27Pv6+JYx+q0HfMmneAMCBgtKDezBQ7R2gPSCXDZqOSy7oSy59wVg4bAvyU51Ni9JsyetiZAG1QmjmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705177; c=relaxed/simple;
	bh=SOrP58B0bW3B1ky0uA5PhJbnoGnvufBFydcUAmHTIZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhhLjUsMbrtiKEFUHDwaGDALZ+lTSMBjQLfFgxlI286EWrwb8P6hvo0T/tRr78Tlld6qYhnfa10miUMpNwvp1/UDH7VPAkwgSOritj331zREpC7jSk80xRTR/9OiFdtNxNajMazaAjyos33JYn5LEIrqR1KBkZoLAw8mm2Z5nTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=lG372KeD; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1779705174;
	bh=SOrP58B0bW3B1ky0uA5PhJbnoGnvufBFydcUAmHTIZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lG372KeDNpEnr2vThdhNBROVHzwuX+TqTu8cwcdhjcAZJDdWLCxvsWNeYEhSCHi9E
	 DOns2SEuYbYklo75NxFVoRVBmEiB41KvsLfNObXle/qXU3h3s7BS/nIE0c/1WHfFEp
	 4eCHNXwQGHDdKGCFr75AfzPJFgDbjsYj+eZVhI6U=
Date: Mon, 25 May 2026 12:32:54 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Michael Jamet <michael.jamet@intel.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yehezkel Bernat <yehezkel.bernat@intel.com>
Subject: Re: [PATCH 0/6] thunderbolt: property: Fix property parsing on
 big-endian
Message-ID: <099b66e8-f8fc-430a-af3c-9af916350152@t-8ch.de>
References: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
 <20260525093529.GK8580@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525093529.GK8580@black.igk.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,linux.intel.com,intel.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-38013-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1EB665C9434
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mika,

On 2026-05-25 11:35:29+0200, Mika Westerberg wrote:
> On Sun, May 24, 2026 at 03:06:42PM +0200, Thomas Weißschuh wrote:
> > The parsing logic currently only works on little-endian.
> > Also make it work on big-endian.
> 
> I'm all in making it more portable. Do you have big-endian hardware with
> USB4 support or you are just doing so to cover some future hardware? Also
> how did you test this?

This came up while doing some KUnit runs. I don't have any hardware for
it. I also only tested it with KUnit.

> > The first four patches are necessary to make the parsing work on
> > big-endian machines. The remaining ones are some trivial cleanups.
> > 
> > Based on thunderbolt/fixes.
> 
> I suggest basing on my next branch because these are really not
> regressions, rather you are "improving" the code (and I prefer to keep
> these longer in linux-next so that we could catch any unintended
> side-effects).

Ack. There will be some conflicts between my series, thunderbolt/fixes
and thunderbolt/next. I'll resubmit the patches after -rc1, where these
should have resolved themselves.


Thomas

