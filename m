Return-Path: <linux-usb+bounces-34647-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAvuHiJbsmngLwAAu9opvQ
	(envelope-from <linux-usb+bounces-34647-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 07:20:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BFF26D92E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 07:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34492308833F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 06:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394FE33B6FB;
	Thu, 12 Mar 2026 06:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="VeoEbx0Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AA72BCFB
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 06:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773296326; cv=none; b=stDEvIEHm34nKIZOoRCqKFUzNEuOed5RYjAhQaZdHTdLqviMjaP6HjB7XOA1/qOWsBVlymWoqmCrLTeO30DiNAbDjPldCxdPU+G/h65r0fsEL3ADPm6KwtxAiMSJQsxflkgQCRubNZfZVTCphDJg4IXs3l2hIWKovgpEKKAeB9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773296326; c=relaxed/simple;
	bh=GGEG/iXcpX15qUuubohwdpntNlJn0sLBn6ojdxqc81k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AuPZ47rxirActEfF82cGPxon3kVGPixv0911iap8cclwxXn2NW3S1eA45cGMKfg1mXWENr/dPsD//+IkgnvEPDJ5NuFX+8cCQz40jc8Fu5UE/c2g4A0x2UoERoXk4r59yUfzh9uhLQfdShEh4ghntbkQb1uiBaqnm910W9b9yuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=VeoEbx0Q; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773296317; x=1773555517;
	bh=msKiFDEI7WW9jpJXjs5mIiIQtN0ui9UCxytc66kG8mc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VeoEbx0Qa52sJUotNe1muW5U5DuxCcQ8bf849dIfLlYGZi//CBDRUUL7WhrGaPNvY
	 VonDKN8vEDePXMuB1T1X+nW/xL6LeUfise/JI0T9vL1ISQtfyjAT5jc9fTzmp4/O6z
	 BhxnANsbIqoH9svjUg24dg4kMRMI1XPiE47GRdOSo52i77TdmuHK5NJz1taw01xhZj
	 j9A4xOPki/9YovCjBo0oByL7PGRycEbhsi6rnjmc77coKS597FLTTena+KLT/ZrBXg
	 GqCzL5I8U396nYH7KAf/3IUjAdTR/YQXqVESO8Sz6PfTSvkR42UPCnH18AEPJ8W7vi
	 dg5/ebpVff7Sg==
Date: Thu, 12 Mar 2026 06:18:31 +0000
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] usb: typec: qcom: Add support for shared USBIN VBUS detection
Message-ID: <0_Uzay_JH2Pb9Ff9XJ6VD5Y1EgtfjUQPIK7JPpYzBS9te24xw6JEs5XH2TDzIvGHmDk0ke8AuDKXYZWhQA2mMtmVkpnpXAMCePPZgAQqLZ4=@pm.me>
In-Reply-To: <1bc80b89-5b09-4042-a61d-698884febded@linaro.org>
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me> <20260308-qcom-typec-shared-vbus-v1-2-7d574b91052a@pm.me> <1bc80b89-5b09-4042-a61d-698884febded@linaro.org>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: c35c85aff5daf4509ae0e410cfad3f3ca9bb8ea7
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34647-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:dkim,pm.me:mid,linaro.org:email]
X-Rspamd-Queue-Id: D1BFF26D92E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wednesday, March 11th, 2026 at 7:06 PM, Bryan O'Donoghue <bryan.odonoghu=
e@linaro.org> wrote:

> On 08/03/2026 23:20, Alexander Koskovich wrote:
> > +=09if (IS_ERR(pmic_typec_port->vbus_detect_gpio))
> > +=09=09return dev_err_probe(dev, PTR_ERR(pmic_typec_port->vbus_detect_g=
pio),
> > +=09=09=09=09     "failed to get vbus-detect GPIO\n");
> > +
>=20
> I'd prefer if this was bracketed since it is over more than one line.
>=20
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Uploaded v2 but didn't carry your Reviewed-By since there's a fair bit of d=
iff, can you look at v2 and check if all looks good?

>=20
> ---
> bod
>=20
>=20

Thanks,
Alex

