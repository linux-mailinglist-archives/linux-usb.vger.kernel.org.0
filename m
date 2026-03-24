Return-Path: <linux-usb+bounces-35381-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIgyBtVtwmmncwQAu9opvQ
	(envelope-from <linux-usb+bounces-35381-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 11:56:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA488306D9F
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 11:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC8C93036C56
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 10:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8753E5590;
	Tue, 24 Mar 2026 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZqMMrl8x"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEC83E5561
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 10:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349742; cv=none; b=R3KC5voG64H82csxqtSh4lVk5jyBqyRU7AHiZc2a60ZPqIwF1b/zBabHOiz2JPUHh5rgGwR9k0971xczzQN2ZP38xLOZkZPB/PBJs+RMo9Zd9y5q4tO7UahU4MIqk7oPSaK2UdoKAkg7klDcYrShWX876KvoAcnfY4TX5il4phI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349742; c=relaxed/simple;
	bh=sLQZhDZ4zfKL3KMw+uhbkshm4IkyJiw+IqmRHu5BB9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qL7az3aJuRy+EyhQGmxssLm8CSe+8lQJSIzYHfS0bp2/YPtkGl7j1aRQPk6MOYisL7iVa8p7GxeHxPw06g0ZAkhKSEYV5pG5PlrJsgqxHYWUArB0O6fNKL9eMzNp/z17D1zSXEbWvCyf0LlZiglKaAoVtzSC3n1nRPM4a4osMZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZqMMrl8x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774349740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MY6iLsjB9L+Xv0WNhKxBjkMgh7h5hjUsbdFwykEGnvw=;
	b=ZqMMrl8xGsA56VTXEspC5O2i9ZoMHoa3lgHqrvAOEccr8abJws4YlYFqpftgadFgwVraog
	QnN+sGIM0qdEE3mmOUtiyv7bEcI/IkssPSCFl+q0/7Ea4Wnmo1WFfHsumcFhQmPUTpcK9V
	IEP8xbZg1vJ+4bzidAH/nwtAxr70RQc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-500-Aw7D6Lt4OrqZMTCPOPnRBA-1; Tue,
 24 Mar 2026 06:55:38 -0400
X-MC-Unique: Aw7D6Lt4OrqZMTCPOPnRBA-1
X-Mimecast-MFC-AGG-ID: Aw7D6Lt4OrqZMTCPOPnRBA_1774349737
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 298A81800561;
	Tue, 24 Mar 2026 10:55:37 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.225.158])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 98B7919560AB;
	Tue, 24 Mar 2026 10:55:33 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: mail@birger-koblitz.de
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	kuba@kernel.org
Subject: Re: [net-next,v3,1/2] r8152: Add support for 5Gbit Link Speeds and EEE
Date: Tue, 24 Mar 2026 11:55:23 +0100
Message-ID: <20260324105523.385444-1-pabeni@redhat.com>
In-Reply-To: <20260320-rtl8157_next-v3-1-1aefeca7fda7@birger-koblitz.de>
References: <20260320-rtl8157_next-v3-1-1aefeca7fda7@birger-koblitz.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_NONE(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-usb@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35381-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.dev:url]
X-Rspamd-Queue-Id: BA488306D9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
r8152: Add support for 5Gbit Link Speeds and EEE

The RTL8157 supports 5GBit Link speeds. Add support for this speed
in the setup and setting/getting through ethtool. Also add 5GBit EEE.
Add functionality for setup and ethtool get/set methods.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 3b6d4252d34c..bab8e10e5f99 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -6343,15 +6356,20 @@ static int rtl8152_set_speed(struct r8152 *tp, u8 autoneg, u32 speed, u8 duplex,
>  			r8152_mdio_write(tp, MII_CTRL1000, new1);
>  	}
>
> -	if (tp->support_2500full) {
> +	if (tp->support_2500full || tp->support_5000full) {
>  		orig = ocp_reg_read(tp, OCP_10GBT_CTRL);
> -		new1 = orig & ~MDIO_AN_10GBT_CTRL_ADV2_5G;
> +		new1 = orig & ~(MDIO_AN_10GBT_CTRL_ADV2_5G | MDIO_AN_10GBT_CTRL_ADV5G);
>
>  		if (advertising & RTL_ADVERTISED_2500_FULL) {
>  			new1 |= MDIO_AN_10GBT_CTRL_ADV2_5G;
>  			tp->ups_info.speed_duplex = NWAY_2500M_FULL;
>  		}
>
> +		if (advertising & RTL_ADVERTISED_5000_FULL) {
> +			new1 |= MDIO_AN_10GBT_CTRL_ADV5G;
> +			tp->ups_info.speed_duplex = NWAY_5000M_FULL;
> +		}
> +
>  		if (orig != new1)
>  			ocp_reg_write(tp, OCP_10GBT_CTRL, new1);
>  	}

Does r8156_ups_flags() correctly handle the new NWAY_5000M_FULL value?

When 5000M is advertised, rtl8152_set_speed() stores NWAY_5000M_FULL
(enum value 11) in tp->ups_info.speed_duplex. However, r8156_ups_flags()
has a switch statement that only handles values up to NWAY_2500M_FULL
(value 10):

drivers/net/usb/r8152.c:r8156_ups_flags() {
	switch (tp->ups_info.speed_duplex) {
	case NWAY_10M_HALF:
		return ups_flags_speed(UPS_FLAGS_SPEED_10);
	case NWAY_10M_FULL:
		return ups_flags_speed(UPS_FLAGS_SPEED_10);
	case NWAY_100M_HALF:
		return ups_flags_speed(UPS_FLAGS_SPEED_100);
	case NWAY_100M_FULL:
		return ups_flags_speed(UPS_FLAGS_SPEED_100);
	case NWAY_1000M_FULL:
		return ups_flags_speed(UPS_FLAGS_SPEED_1000);
	case NWAY_2500M_FULL:
		return ups_flags_speed(UPS_FLAGS_SPEED_2500);
	default:
		break;
	}
}

The new NWAY_5000M_FULL falls through to 'default: break;', which means
ups_flags_speed() is never called. This results in incorrect UPS flags
(speed bits = 0) being written to the USB_UPS_FLAGS hardware register via
ocp_write_dword().

When the device enters UPS power saving mode at 5000M link speed, will the
hardware receive correct speed information?

The follow-up commit defca1127dd51 ('r8152: Add support for the RTL8157
hardware') enables support_5000full for RTL_VER_16 but also does not add a
NWAY_5000M_FULL case to r8156_ups_flags().


