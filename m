Return-Path: <linux-usb+bounces-34935-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGi7BcZguWlsCwIAu9opvQ
	(envelope-from <linux-usb+bounces-34935-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:10:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5482AB83C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0285D3014F48
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59433E1223;
	Tue, 17 Mar 2026 14:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3qBK+zw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7173E33556B;
	Tue, 17 Mar 2026 14:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756601; cv=none; b=jbdfa10iGs6jUeFPSC4jSmxqRaMEkvi4RBOEmbmwRrCNuIrPJn9XuoW9oTBhOHrSkT0nCT+jmwd3zo2eZ5Yne0z189DDimHMoBVZOCLK2SwYOMWwWWwm9dEh7gj98IVlMW8WyUQBlEHm38kO7cNwjShdUMBKPc+oji2OVVSd0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756601; c=relaxed/simple;
	bh=sYaeTWCIh3JpwT+wVxycYzR9Lg3db6/Lu78Ox3Hx+fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvimFqPI1mX/BIgDjXvqj9FeJMphOMvv8cTQ2JwUn2fBKA8h60Sop1i7c72hU93LmUKfb/gwUCsFg/tIFAiMDFVIbBTSxmaF2Xv5Q0TisXe9vIxEsY5tzfMEaUQ68uif9pHHxmRntzviatYqfu5P6MeRx2GdGw4ly5F3EYthDoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3qBK+zw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C294C19424;
	Tue, 17 Mar 2026 14:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773756601;
	bh=sYaeTWCIh3JpwT+wVxycYzR9Lg3db6/Lu78Ox3Hx+fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A3qBK+zwkvMhsiaXBbUkG+wpB6XMp2dGeRiC9ZmqAucpNKkb0DswPz6bfcNyGpAPU
	 06KqeUq8HmbYhvUGdy1izS8VRMQMkC47IQIrVVHhy56ei+5FRlk6fq61FFN2lfe1eW
	 AMCaPlKND8muDxi3xOAiEasos38cWBZJdzjDkr4KyTHF2H75qL9b+tF3b+/FJSgc4v
	 v5n0aT88RNgGuO8MiMJGv3fmm3AzhUZoqs6YKjq3nySVJessaNRqyVmhdHcekDIZwN
	 ol+EyLF2x2l7K/NUYW5lg1cQjk1EPV/q0nwchk9O58jE5poOMxhxpehBwSOT4Z+sMj
	 eOQPPCZZ+50qw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w2V7O-000000002q9-2tts;
	Tue, 17 Mar 2026 15:09:58 +0100
Date: Tue, 17 Mar 2026 15:09:58 +0100
From: Johan Hovold <johan@kernel.org>
To: zwq2226404116@163.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: Re: [PATCH] [PATCH v4] usb: serial: add support for Rolling Wireless
 RW135R-GL (33f8:1003)
Message-ID: <ablgtsu9VSUEcI9H@hovoldconsulting.com>
References: <20260316115512.921535-1-zwq2226404116@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316115512.921535-1-zwq2226404116@163.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34935-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DD5482AB83C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 07:55:12PM +0800, zwq2226404116@163.com wrote:
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
> 
> Add VID/PID 33f8:1003 for the Rolling Wireless RW135R-GL M.2 module,
> which is used in laptop debug cards with MBIM interface for
> Linux/Chrome OS. The device supports mbim, pipe functionalities.
> 
> Here are the outputs of usb-devices:
> T:  Bus=04 Lev=01 Prnt=01 Port=02 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
> D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
> P:  Vendor=33f8 ProdID=1003 Rev=05.15
> S:  Manufacturer=Rolling Wireless S.a.r.l.
> S:  Product=Rolling RW135R-GL Module
> S:  SerialNumber=12345678
> C:  #Ifs= 3 Cfg#= 1 Atr=a0 MxPwr=896mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=81(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=40 Driver=option
> E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> 
> Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
> ---
> Changes in v4:
> - Remove unnecessary .driver_info = RSVD(5)
> - Fix subject format: use git format-patch -v4 to generate clean versioned subject
> - Finalize commit message: keep only core MBIM functionality description

Thanks for the update. Now applied.

Next time, you can keep the changelog for all previous versions when
resending.

Johan

