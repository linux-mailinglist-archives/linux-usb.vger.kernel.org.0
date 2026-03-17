Return-Path: <linux-usb+bounces-34902-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNLDHyHPuGlfjgEAu9opvQ
	(envelope-from <linux-usb+bounces-34902-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 04:48:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FCE2A356B
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 04:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBF503019511
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 03:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EB031353B;
	Tue, 17 Mar 2026 03:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r52WIV8t"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C2D313E2F
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 03:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773719124; cv=none; b=fW3m6XTfmSJ0zY3be0p5qKo+Aj23ykicj3pJBvXqUyH66RZaHdBU9LlwldLUVfapMW3GIWK0OMNIkr45GxQhVv1l4OAymIoV7GBXhmRsAO0EcUpXYh4gtkdoRdi0Cns/FKfb6iiPmbhI2whEHfUktzsfFAYZAKnLYZAk4l+H4A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773719124; c=relaxed/simple;
	bh=Wvgb0QK9/kdW4xiCJDb2YWNz0nwp287l2ggwg/P8HB8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=WU8OFCmoD8bU+Hbd4D5inLw4AH4YDVqcWp7M9NObF3JJ+8rCj2XbNAgirztf+d/YsPm94BT86trZAaI++AqIVfyPn+KTU7N9mUgVqGBR2oIJ3LVZ2Xp59JjDR+rggE3+s9o2N0ySSBzfK2FlQxJKwuQ098Y0nzCAzYvQyb2A16g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r52WIV8t; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773719120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4i2+UVfo722vu90425e3cyaw1piodx4Inw2OrQ0w3Q=;
	b=r52WIV8tirMuLbByMH5685Hf9HkG2XX+5sDEp6fRTBay6g9ubIjq7jIPmu6aFAqUlsgiqA
	wG7Po0h7WLRP6t82lcE7HylGZpf8XsW7lWwGYy9NThgAM6kQ2yHZdJvXuRktlurV18Btrs
	GSUP+gbLye6BskET3tA4OHjDyzDMDjg=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 11:44:27 +0800
Message-Id: <DH4QXMW272P1.1ZFLSL4PHR2T0@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Marco Felsch" <m.felsch@pengutronix.de>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Fabio Estevam" <festevam@gmail.com>, "Matthias Kaehlcke"
 <mka@chromium.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, <huang.ze@linux.dev>
Cc: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <kernel@pengutronix.de>
Subject: Re: [PATCH v5 0/4] Add onboard-dev USB hub host managed vbus
 handling support
References: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de> <shnrtu77frks3yd5r66tzpeca3bxxuu4jpfaqxzerc3tl7j6hr@4ewe2trbh746>
In-Reply-To: <shnrtu77frks3yd5r66tzpeca3bxxuu4jpfaqxzerc3tl7j6hr@4ewe2trbh746>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34902-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[pengutronix.de,linuxfoundation.org,kernel.org,gmail.com,chromium.org,linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[huang.ze@linux.dev,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D8FCE2A356B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 5, 2026 at 7:29 PM CST, Marco Felsch wrote:
> Hi,
>
> +To: huang.ze@linux.dev
>
> On 26-02-23, Marco Felsch wrote:
>> Hi,
>>=20
>> the whole purpose of this series is to make it possible to control the
>> USB VBUS regulators of an USB hub via host managed regulators.
>>=20
>> Regards,
>>   Marco
>>=20

I have tested this patch series on the SpacemiT K1 Milkv Jupiter board.

Thanks for driving this!

Tested-by: Ze Huang <huang.ze@linux.dev>

