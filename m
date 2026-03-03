Return-Path: <linux-usb+bounces-33901-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2J+aFXqhpmlqRwAAu9opvQ
	(envelope-from <linux-usb+bounces-33901-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 09:53:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C166D1EB163
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 09:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CC19303C828
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 08:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7406E388E76;
	Tue,  3 Mar 2026 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WRRhIhW7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE27130DD11
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 08:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527985; cv=none; b=Yub0QtfVzn/oDPLJ9ldglbwNISqx9NWbnOvZuwwvyD+iQ28OKosOoD/1CCqEUlcQa4JBo+28c2H5+vaf9IA1Ap18ufOe1hePn1opfUQLhm18b8cEiHKJFQo7dl9OfFQin+mVpOju+C/lAkyg/SfIjH88b+Cnvr5M+4+GJ9TnYpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527985; c=relaxed/simple;
	bh=EZJ4svSt7V3vpKRfdhXZ9YHmHiWswuXMdvqzwzAMZ+g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=c4OSHLt62l2cJ5QbHBcFYkRWGMkOGriGc+PcgzQQow4WTbM0aoxrB3zjCbKdiifHLjqBtoqNc+U3PRs2XH29D5tawviQV1W/1Z7Ytc6rZPZCzqRg1KEvG7UaY9wBfiaG3KMgdvYfHaLF4mglAAVBFRtXJksI+6BnLFlHwZ70M8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WRRhIhW7; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 73D74C40FA1;
	Tue,  3 Mar 2026 08:53:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF6105FF29;
	Tue,  3 Mar 2026 08:53:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B877610368535;
	Tue,  3 Mar 2026 09:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772527980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dHzjooMLjEqCTLZkR7Emb0dRbrH9mQHksD/dLPxL7GM=;
	b=WRRhIhW7vgeQlUBtRYy3lSHT0g7ssIR9CeRQtfoaN7OdZZdWE5SukFGsLLbCIdZ9Rvk5P5
	x3YGBf1y7LiWXgLFbXOctHmnCPnz6MEz3JcxtoJgT292PBQcgsZgMb67LDJ4ygTtonXGHl
	NptOg5QWRQocFJ+rT7Ew6sQ0KYNhopPIv/Sav8VfDWGHMf3N+Fwfq3dDYHpRN0lgFNsuS4
	Ag/RcE50VgDX70ljiGOuXWmZFxz47/OxtST229tGXoP+k/sbo+ZIeYJPL0S9DBPiU1pXDO
	7lRXVgu2hOg0vCWsWnhBaS9gdwTuafASl358/MHiepvPTdxf4JFQsgDLCDOXbQ==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 09:52:49 +0100
Message-Id: <DGT0Q3TGTG26.KD9DBZYH63DY@bootlin.com>
Cc: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Peter Chen" <hzpeterchen@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Sandy Huang" <hjc@rock-chips.com>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Yubing Zhang" <yubing.zhang@rock-chips.com>,
 "Frank Wang" <frank.wang@rock-chips.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Amit Sunil Dhamne"
 <amitsd@google.com>, "Dragan Simic" <dsimic@manjaro.org>, "Johan Jonker"
 <jbx6244@gmail.com>, "Diederik de Haas" <didi.debian@cknow.org>, "Peter
 Robinson" <pbrobinson@gmail.com>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <dri-devel@lists.freedesktop.org>
To: "Chaoyi Chen" <chaoyi.chen@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v14 7/9] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
X-Mailer: aerc 0.20.1
References: <20260119073100.143-1-kernel@airkyi.com>
 <20260119073100.143-8-kernel@airkyi.com>
 <DGSHIQOB2YTB.1559SD1YLGT7P@bootlin.com>
 <601a8b51-7411-429d-91a1-0633cabce9ee@rock-chips.com>
In-Reply-To: <601a8b51-7411-429d-91a1-0633cabce9ee@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: C166D1EB163
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33901-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,oss.qualcomm.com,gmail.com,kernel.org,sntech.de,rock-chips.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,suse.de,ffwll.ch,google.com,manjaro.org,cknow.org,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:url,bootlin.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello Chaoyi,

On Tue Mar 3, 2026 at 1:44 AM CET, Chaoyi Chen wrote:
>>> +static int cdn_dp_parse_next_bridge_dt(struct cdn_dp_device *dp)
>>> +{
>>> +	struct device_node *np =3D dp->dev->of_node;
>>> +	struct device_node *port __free(device_node) =3D of_graph_get_port_by=
_id(np, 1);
>>> +	struct drm_bridge *bridge;
>>> +	int count =3D 0;
>>> +	int ret =3D 0;
>>> +	int i;
>>> +
>>> +	/* If device use extcon, do not use hpd bridge */
>>> +	for (i =3D 0; i < dp->ports; i++) {
>>> +		if (dp->port[i]->extcon) {
>>> +			dp->bridge_count =3D 1;
>>> +			return 0;
>>> +		}
>>> +	}
>>> +
>>> +	/* One endpoint may correspond to one next bridge. */
>>> +	for_each_of_graph_port_endpoint(port, dp_ep) {
>>> +		struct device_node *next_bridge_node __free(device_node) =3D
>>> +			of_graph_get_remote_port_parent(dp_ep);
>>> +
>>> +		bridge =3D of_drm_find_bridge(next_bridge_node);
>>> +		if (!bridge) {
>>> +			ret =3D -EPROBE_DEFER;
>>> +			goto out;
>>> +		}
>>> +
>>> +		drm_bridge_get(bridge);
>>> +		dp->next_bridge_valid =3D true;
>>> +		dp->next_bridge_list[count] =3D bridge;
>>
>> Correct, but the drm_bridge_get() slightly far away from the assignement=
 is
>> a bit misleading. I hadn't seen it initially so I suspected a missing ge=
t.
>>
>> I suggest to do it in a single statement, for clarity:
>>
>> 		dp->next_bridge_list[count] =3D bridgedrm_bridge_get(bridge);
>>
>
> I think the bridgedrm_bridge_get here seems to be a typo?

Oops, of course! :)

As you probably guessed, I was meaning:

		dp->next_bridge_list[count] =3D drm_bridge_get(bridge);


> Anyway, thank you very much for your efforts on the bridge lifetime.
> I will fix this in the next version :)

Thanks!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

