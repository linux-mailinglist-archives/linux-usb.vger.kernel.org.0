Return-Path: <linux-usb+bounces-35255-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJGgDt9jvWlF9gIAu9opvQ
	(envelope-from <linux-usb+bounces-35255-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 16:12:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD88E2DC69E
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 16:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C875F30648F9
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 15:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8483BC68F;
	Fri, 20 Mar 2026 15:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ru+5fBvc"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C706C29AB02
	for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 15:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774019204; cv=none; b=X3nFTRJOrpWYQNzp5iCnVUXhCigydvzYSDAjHB+swb2EOiJ2r7FrQF9cuiy1mRmhMMtabB/r5WC1dntVZna8/B1nq15ryhDtiZJPSyfOLoonH0tyjU0+3KPh3UygQD9/+3f1230NLqmHO9dXjyDyX4TQERvPIONjl2VvMifzRLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774019204; c=relaxed/simple;
	bh=+gY0U88ZU3WFbE3S3UKhriDpSE3AB91y+8EwGdS+r/8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ce33oyTIg1a5aFkNEXiLY12Lbovq46KhTvZAQ50maRCL7WHfxh26uiS7k6lNAiDCdMgDo3Z/9yYF15Oo5wL9dfGNDthKNeuzWUYGXqEoIJa6wDgprMTyfG6CCMcZFi1YPAqBG1s7ooEbd9wLEMnNuXAAQLrlQWd0rU+5w5AEaIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ru+5fBvc; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774019191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+gY0U88ZU3WFbE3S3UKhriDpSE3AB91y+8EwGdS+r/8=;
	b=ru+5fBvcm+pEAo0/qfX05QZrWp0JkVZkWaK/eGQezaL3cnyirJyZv/JIfWcEZr2udZrJys
	gL0u5/AscC8IMzlMsA/pii/52ijo4kxbVFlQM1NI/KKq0zjVsmDEwfSU0xz/UNh7xUJ8EN
	tSAdsI23J8B4l9To3y/mCEgDpxusVNI=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 23:05:33 +0800
Message-Id: <DH7PARAFZS7V.1YIE6OED3NA6C@linux.dev>
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, <huang.ze@linux.dev>
Cc: <dlan@kernel.org>, <gregkh@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-usb@vger.kernel.org>, <spacemit@lists.linux.dev>,
 <thinh.nguyen@synopsys.com>
References: <DH7ILSL8DXBO.ZR74CL1QEUBU@linux.dev>
 <20260320104026.1350571-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260320104026.1350571-1-amadeus@jmu.edu.cn>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35255-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[huang.ze@linux.dev,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.910];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CD88E2DC69E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Mar 20, 2026 at 6:40 PM CST, Chukun Pan wrote:
> Hi,
>
>> I think it's better to align the driver with the actual hardware. I'm no=
t
>> opposed to managing any regulators in usb host/device drivers. But if we
>> do have an onboard hub, and regulator belongs to the downstream ports of
>> the hub, then it's hub's job, right?
>
>> Many boards leave gpio controlled regulators always on, that's what we
>> want to solve. If we have to choose the parent of these regulators, why
>> not put them in the correct hierarchy?
>
> I think we can manage the regulator in the USB host driver first,
> and then use it after the onboard_usb_dev driver has been merged.
> This is better than keeping the regulator always on.
>
>> If such a board really need the regulator, IMO, your patch is the way to=
 go.
>>
>> OrangePi haven't released the schematic yet.
>>
>> That's what I could find [1], which seems similar to RV2.
>
> There is no onboard USB hub. Just check the image:
>
> http://www.orangepi.org/img/r2s/details/17.png
> http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details=
/Orange-Pi-R2S.html
>

That's fine, thanks.

> Thanks,
> Chukun


