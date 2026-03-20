Return-Path: <linux-usb+bounces-35243-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNwmJnkZvWnG6QIAu9opvQ
	(envelope-from <linux-usb+bounces-35243-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 10:55:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5142D853C
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 10:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EC8A3108275
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 09:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5911037DEA4;
	Fri, 20 Mar 2026 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ux7sY9yw"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BE433D6D5
	for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 09:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000319; cv=none; b=XLtJTLYKg74rVHnSN2lfj1utQ1jvuIVNjrGKxrXxXOZfpNgb1gLyCY/vvx3PYaLPAye0WwVxjebtza7sg79XNy033A0iGw8cdsCtyPpm+FzZFZ/r6ovXO+9v7bh/pNx4Qsy2geSTExgUsnlfZU+TOzLMd5kB2DJs6ECftw0DmAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000319; c=relaxed/simple;
	bh=tBusV8I1xKXUrGEu9BjwwnL+Ldksq8Sarqj0TThaMqk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ewlSNeIT+9LZyOTFXKohYrX8o4OSybIJCMFaoZ+1LnANxy/JOy02xeErpCcILosFa5qeJKEkP+bWlzY3q5R9KSCCFyTnoxwug9W5J05kliV8A9PUrQDUXT8eMUBzlSWpbktoE1iEG52y6sSJ3qZueuhcAq8V+4oSR8fO1UjqBfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ux7sY9yw; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774000306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SB0KpBn5A09Moyx+zjJpQCHUxGkKOb8xwpecR+YoJT4=;
	b=ux7sY9ywu+wS45NR3bq7PywwA4yYp30v4K9OZ3Eua2QuPZ2luZmhd+98gprsJzH8xMB6Nf
	bXJjA8h8o5i/Y29DqWrnoMESdqi7RX+zRDB2jAHBO9x1sk9Lwda/m2n2LHrDjmm2dXUlqt
	i6aWySuiFz498jMm/x8VCqt1OVKoXpU=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 17:50:50 +0800
Message-Id: <DH7ILSL8DXBO.ZR74CL1QEUBU@linux.dev>
Cc: <dlan@kernel.org>, <gregkh@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-usb@vger.kernel.org>, <spacemit@lists.linux.dev>,
 <thinh.nguyen@synopsys.com>
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, <huang.ze@linux.dev>
References: <DH7FXPBMB1K5.28IT6DZQ280ZV@linux.dev>
 <20260320081826.1331721-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260320081826.1331721-1-amadeus@jmu.edu.cn>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35243-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[huang.ze@linux.dev,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.880];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D5142D853C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Chukun

On Fri Mar 20, 2026 at 4:18 PM CST, Chukun Pan wrote:
> Hi,
>
>> I don't think it's a good idea to tie this optional VBUS regulator
>> implementation to the SpacemiT K1 platform.
>>
>> While the K1 SoC does have a DRD controller, current boards in the wild
>> (like Jupiter[1], OrangePi RV2[2], and Banana Pi F3[3]) all route this
>> port to an onboard hub[4][5]. IMHO, managing the downstream VBUS regulat=
or
>> via the onboard_usb_dev driver is the correct approach for us.
>
> I'm sorry, but I don't quite understand why it's necessary to use
> onboard_usb_dev driver instead.
>

I think it's better to align the driver with the actual hardware. I'm not
opposed to managing any regulators in usb host/device drivers. But if we
do have an onboard hub, and regulator belongs to the downstream ports of
the hub, then it's hub's job, right?

>
> The DRD controller is connected to the onboard USB hub, so it can
> only operate in host mode. If all downstream ports of the USB hub
> use the same VBUS supply, then what's the problem with using this?

It does work.

Many boards leave gpio controlled regulators always on, that's what we
want to solve. If we have to choose the parent of these regulators, why
not put them in the correct hierarchy?

>
>> K1 platform currently does not need this feature here.
>>
>> Considering the role switch, I think it would be better to hold off on
>> this until there is an actual board/user that relies on it.
>
> There is a board without onboard USB hub,

If such a board really need the regulator, IMO, your patch is the way to go=
.

>
> such as the OrangePi R2S.
> So this is possible for boards that don't have onboard USB hub?

OrangePi haven't released the schematic yet.

That's what I could find [1], which seems similar to RV2.

    &usb3hub {
    	vbus-gpios =3D <&gpio 123 0>;	/* gpio_123 for usb3 hub pwr and output =
vbus */
    	status =3D "okay";
    };

[1] https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.6-k=
y/arch/riscv/boot/dts/ky/x1_orangepi-r2s.dts#L762

>
> Thanks,
> Chukun

Thanks,
Ze

