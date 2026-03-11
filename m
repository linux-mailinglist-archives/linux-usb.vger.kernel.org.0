Return-Path: <linux-usb+bounces-34605-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCsCLQi2sWl0EwAAu9opvQ
	(envelope-from <linux-usb+bounces-34605-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:35:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4C1268AD5
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABCFC313FC58
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 18:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B1E3E7149;
	Wed, 11 Mar 2026 18:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="qpY5+DyJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail1.manjaro.org (mail1.manjaro.org [142.132.176.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A246D3E6DD1;
	Wed, 11 Mar 2026 18:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.132.176.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773253969; cv=none; b=mdBEqGYPPOipLUAXIygDcx0wUhccpDfWYErOvtXmTXUMhXaqOKDyDXHds23m4/hb74rAl6cIJ2noapiooDRDPIAkLP7e+m0Ws8qFhizKjtneYUWZ23af4pYQSixLsEqFScgzWRLEFzikNu4IIbHMgvRxG7Ot8WxX21q4X9YsPrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773253969; c=relaxed/simple;
	bh=RPnx1LOblu5xL4Kd+pacXB8hrUDZl8C/7QUnQfNJkwQ=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=Uw91kOu0lo2s89p0zv+zDiEF4z2+hugszAz46kCsEn9yPS9IhbscrNZ9+9stwqMPOEVJcU1crreOqsTrKaSk+B/zxoxvHWKuee/omoCa9rPtAudH02LzHC8tg7+QUuHveaq4nlVQ6iyJQjIv8j08ry0P3wypXcTagvw8IfDwj7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=qpY5+DyJ; arc=none smtp.client-ip=142.132.176.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 60AC042183;
	Wed, 11 Mar 2026 19:32:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1773253959; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=81J9RcYlVjgXPDSeMj9W/C70E173wqDJE/JZDphTsSM=;
	b=qpY5+DyJVsvmbHbN+N+4uRjVm2nTPpA3XmNT0W0zNPxvY78SQNsI7zJ983G5NQGetqLDTP
	wSkzbFXWxtJae4N8H+hmPdV4/0BPnb5Z7+asjBLcTqX+QWv+1/uoSxyLrSeY2JYOxpcQBy
	iTggG0B0MxpNxGp2OMaMfAzm5WsWmS4uOhme8T9Wce+rGpy5PNVtm6THlJu5ABt/ANoF2Y
	eaueW1q2vE6Z22XQGpS8uVl+bqft3ItI+eiE/xvN3mbeJMtaJUOPIRJFUoGbKXXuYNkMvQ
	X5h7rWKVx/0cznDHHf2OLI7CsgDWtDwCKuRZ+oeKMRSLtqsg34wZS+/2v758ig==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
Content-Type: text/plain; charset="utf-8"
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
Date: Wed, 11 Mar 2026 19:32:35 +0100
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Gene Chen" <gene_chen@richtek.com>, "Heiko Stuebner" <heiko@sntech.de>, "Sebastian Reichel" <sebastian.reichel@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
To: "Alexey Charkov" <alchark@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <802df30e-607b-7404-6693-6691ea45618b@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH 0/4] Add HUSB311 Type-C controller
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[manjaro.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[manjaro.org:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34605-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dsimic@manjaro.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[manjaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F4C1268AD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Alexey,

On Wednesday, March 11, 2026 17:20 CET, Alexey Charkov <alchark@flipper=
.net> wrote:
> HUSB311 is a drop-in replacement for RT1711H, used in Rockchip RK3576=
 EVB1
> board and some other boards closely following the reference schematic=
.
>=20
> The existing RT1711H driver seems to work fine with HUSB311, and ther=
e is
> no public documentation available for HUSB311 to identify any meaning=
ful
> differences, so this series wires up the existing driver to treat
> HUSB311 in the same way it treats RT1711H.

I'm a bit surprised that you haven't managed to find any HUSB311 datash=
eets,
because they are seemingly rather easy to obtain.  I've got a couple of
HUSB311 datasheet versions with the register descriptions and whatnot, =
would
you like me to send them over?

> This also enables a bare-bones DT node for HUSB311 on RK3576 EVB1, bu=
t
> currently misses the connections graph for the USB SS and SBU lines, =
as
> those might require the USBDP PHY ports schema to be updated first fo=
r
> proper DP AltMode support as indicated by Sebastian.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
>=20
> ---
> Alexey Charkov (4):
>       dt-bindings: vendor-prefixes: Add Hynetek Semiconductor Co., Lt=
d.
>       dt-bindings: usb: richtek,rt1711h: Add Hynetek HUSB311
>       usb: typec: tcpci=5Frt1711h: Add support for Hynetek HUSB311
>       arm64: dts: rockchip: Add HUSB311 Type-C controller on RK3576 E=
VB1
>=20
>  .../devicetree/bindings/usb/richtek,rt1711h.yaml    |  2 ++
>  .../devicetree/bindings/vendor-prefixes.yaml        |  2 ++
>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts    | 20 +++++++++++=
+++++++++
>  drivers/usb/typec/tcpm/tcpci=5Frt1711h.c              | 21 +++++++++=
++++++++++--
>  4 files changed, 43 insertions(+), 2 deletions(-)


