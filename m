Return-Path: <linux-usb+bounces-34155-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AyZEU/Rqmn3XQEAu9opvQ
	(envelope-from <linux-usb+bounces-34155-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 14:06:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BD5221584
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 14:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DEFE313C38A
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 13:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A0639281E;
	Fri,  6 Mar 2026 13:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzXGg6rV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E344B2E54BD;
	Fri,  6 Mar 2026 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772802039; cv=none; b=rS3zqM4mYm+5R/+E2zIVl9cn6ZRsPlQ8PpdGuWz9AZapTF7d/y1hE04FE9J/yvM7oqra9U9zZDKwGE3Et6480o9cjj/6Go2v+KJOSC/+0bGKRnzgIJ2WvX3fgjUKy80E2tR7vBcmGmwNo7cSX8bI3zXSnwyOflCwP5ZSo8gEcuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772802039; c=relaxed/simple;
	bh=SUilmRyxi9rSQ2L8Zu1tUGBe9n/KlEBwjbmt8lTSZZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kf7qaBjA3m87qdZsHg44Q+pJlk6ivrP92XjNEe0D5lsGcRrlLgfpKFs3BDNsoljQydbXLJ7BjnI7kt2ZlVAfJaCyXhF/kyMdUs8+OG9GUckkNJd398yxJFebBrRJQ1va341dF2/u7pdSM2UvtfJGVoV4I7Qn6tSwtXv30+bIBgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzXGg6rV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C1EC4CEF7;
	Fri,  6 Mar 2026 13:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772802038;
	bh=SUilmRyxi9rSQ2L8Zu1tUGBe9n/KlEBwjbmt8lTSZZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzXGg6rVmEJJG6AygVVVyC5TblHizjVm0/fiTm/TAugIDMsSYhg5s5vU4fdpnvQL1
	 lLWB1P9pUgPZ5fFLbjxnh1Zh5swrJmEEomAzl+WOu1XH1rti0ulKpuzmiW3Def6Wxh
	 fJvIYXw2QUG/UOyUol8+3BsSYK/JVrghOF4O1WOl4LeRazwSx4EqT6Xi0+MOv/gZmq
	 ouHiiLJdgZyKoRETncAhoajKoboLNKuG9Gxi+M3qEK/YV4mfAXfIQbjX7vkB50oeTF
	 jT+H55kOfCxtBjluOlRP2ToS/1wBfsDU6t+vWPukoJicc4pdk3P4VtAvRJukRjaqeg
	 suq05TtmZZeWQ==
Date: Fri, 6 Mar 2026 13:00:31 +0000
From: Lee Jones <lee@kernel.org>
To: amitsd@google.com
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v8 3/6] mfd: max77759: add register bitmasks and modify
 irq configs for charger
Message-ID: <20260306130031.GK183676@google.com>
References: <20260224-max77759-charger-v8-0-eb86bd570e9c@google.com>
 <20260224-max77759-charger-v8-3-eb86bd570e9c@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260224-max77759-charger-v8-3-eb86bd570e9c@google.com>
X-Rspamd-Queue-Id: C8BD5221584
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34155-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,linuxfoundation.org,google.com,linux.intel.com,samsung.com,gmail.com,linux-foundation.org,vger.kernel.org,lists.infradead.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, 24 Feb 2026, Amit Sunil Dhamne via B4 Relay wrote:

> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> Add register bitmasks for charger function.
> In addition split the charger IRQs further such that each bit represents
> an IRQ downstream of charger regmap irq chip. In addition populate the
> ack_base to offload irq ack to the regmap irq chip framework.
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/mfd/max77759.c       |  91 ++++++++++++++++++++--
>  include/linux/mfd/max77759.h | 176 ++++++++++++++++++++++++++++++++++++-------
>  2 files changed, 230 insertions(+), 37 deletions(-)

Does this patch have any dependents or dependencies?

-- 
Lee Jones [李琼斯]

