Return-Path: <linux-usb+bounces-38191-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IM5NhriG2ojHAkAu9opvQ
	(envelope-from <linux-usb+bounces-38191-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 09:24:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B9F614CFE
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 09:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B79F23032809
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 07:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE373364EB8;
	Sun, 31 May 2026 07:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z0ZPZWs0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF661363C6C;
	Sun, 31 May 2026 07:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780212241; cv=none; b=byu1V5hXR1WKKDOVh4wlEZZrYXm66YkVcTYNBjfORbSmHHlyXdzwAOXMlxfnro+vlm/mJou2ocfJBH1/zBy2FTies6+T+S65B6+77eKyYBGktsumC/UWl5uU2NSItxZfIOoIuWHUAerjUwLyRxGkuPdky2huUOvTQcrspqgubTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780212241; c=relaxed/simple;
	bh=/Ejyg2myYceiHjjcZeXo+l6q90ICcuSb3R72TetDr48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5Y9Kurc8cLu41UTzEm1PXO8q0ow3qEFVzmzVDz6w534ROrKhacah2xmd5KYvPLS/o76pDoi2TWFERRxS8teahB1keP3umUIkoOXtTGFkBOiEPOSeWzz4hzuqmDwrU5yG+i1hMnCGcm+XG0U17NVuUGJhHHarxB5xXVHuzcpCiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=z0ZPZWs0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9F91F00893;
	Sun, 31 May 2026 07:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780212238;
	bh=LXWQyZHFcxlOo6WRGoi3J1wOJdYQqzDrRiM4CI+TucE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=z0ZPZWs0KhOfoOxX9cAAM1KOdgGBG7wFhlIas9VFjrwxHKfsxHCKu5stLEihnIE0f
	 EiL3nLK2+fmEuae8/3bMomYAPuxWP91KgzehFCA9Bph5Lra6ONwi8tbq54L5+XhFuQ
	 qo8gQ2RGGKpVj2Cu0XsS4KPjQqKOwG05c6z5bSRc=
Date: Sun, 31 May 2026 09:23:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kefan Bai <baikefan@leap-io-kernel.com>
Cc: Alex Shi <seakeel@gmail.com>, linux-usb@vger.kernel.org,
	si.yanteng@linux.dev, alexs@kernel.org, dzm91@hust.edu.cn,
	corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, doubled@leap-io-kernel.com
Subject: Re: [PATCH v7 2/8] docs/zh_CN: Add acm.rst translation
Message-ID: <2026053149-flaky-shallow-2460@gregkh>
References: <cover.1779355170.git.baikefan@leap-io-kernel.com>
 <9f865599e837c90d3048b9a8004efd65b2e3f9d3.1779355170.git.baikefan@leap-io-kernel.com>
 <a6752fa9-b15b-4b50-baef-53c36460311e@gmail.com>
 <20260531145704.000061ae@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260531145704.000061ae@leap-io-kernel.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38191-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linux.dev,kernel.org,hust.edu.cn,lwn.net,linuxfoundation.org,leap-io-kernel.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,cqsoftware.com.cn:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,leap-io-kernel.com:email]
X-Rspamd-Queue-Id: 78B9F614CFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 31, 2026 at 02:57:04PM +0800, Kefan Bai wrote:
> On Mon, 25 May 2026 10:05:23 +0800
> Alex Shi <seakeel@gmail.com> wrote:
> 
> > 
> > 
> > On 2026/5/21 17:55, Kefan Bai wrote:
> > > Translate .../usb/acm.rst into Chinese
> > > 
> > > Update the translation through commit ecefae6db042
> > > ("docs: usb: rename files to .rst and add them to drivers-api")
> > > 
> > > Reviewed-by: Yanteng Si<siyanteng@cqsoftware.com.cn>
> > > Signed-off-by: Kefan Bai<baikefan@leap-io-kernel.com>
> > > ---
> > >   Documentation/translations/zh_CN/usb/acm.rst  | 147
> > > ++++++++++++++++++ .../translations/zh_CN/usb/index.rst          |
> > >  2 +- 2 files changed, 148 insertions(+), 1 deletion(-)
> > >   create mode 100644 Documentation/translations/zh_CN/usb/acm.rst
> > > 
> > > diff --git a/Documentation/translations/zh_CN/usb/acm.rst
> > > b/Documentation/translations/zh_CN/usb/acm.rst new file mode 100644
> > > index 000000000000..51d6eb8f5660
> > > --- /dev/null
> > > +++ b/Documentation/translations/zh_CN/usb/acm.rst
> > > @@ -0,0 +1,147 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +.. include:: ../disclaimer-zh_CN.rst
> > > +
> > > +:Original: Documentation/usb/acm.rst
> > > +
> > > +:翻译:
> > > +
> > > + 白钶凡 Kefan Bai<baikefan@leap-io-kernel.com>
> > > +
> > > +:校译:
> > > +
> > > +
> > > +====================
> > > +Linux ACM 驱动 v0.16
> > > +====================
> > > +
> > > +版权所有 (c) 1999 Vojtech Pavlik<vojtech@suse.cz>
> > > +
> > > +由 SuSE 赞助
> > > +
> > > +0. 免责声明
> > > +~~~~~~~~~~~
> > > +本程序是自由软件；你可以在自由软件基金会发布的
> > > +GNU 通用公共许可证第 2 版，或者（按你的选择）
> > > +任何后续版本的条款下重新发布和/或修改它。
> > > +
> > > +发布本程序是希望它能发挥作用，但它不附带任何担保；
> > > +甚至不包括对适销性或特定用途适用性的默示担保。
> > > +详情见 GNU 通用公共许可证。
> > 
> > Hi Kefan,
> > 
> > The alignment means we will try use the width for each of lines, not 
> > just stop for each of punctuation. Please fix all patches alignment,
> > try to expand the whole width for lines unless it's broken a word or
> > unreadable.
> > 
> > Thanks
> 
> Hi Alex,
> 
>   Sorry for the late reply, and thanks for the review.
> 
>   I understand the formatting point now. The translated text should be
>   reflowed more evenly, instead of breaking too early around
>   punctuation.
> 
>   Greg queued this series in usb-testing on May 21, 2026, and then
>   moved it into usb-next on May 27, 2026. At this point, would you
>   prefer me to leave the current series as-is and follow this rule in
>   future translations, or send a small follow-up cleanup patch on top
>   of usb-next?

Clean up patch on top would be great, thanks.

greg k-h

