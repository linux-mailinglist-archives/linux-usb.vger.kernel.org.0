Return-Path: <linux-usb+bounces-34071-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKUADEFpqWlN6wAAu9opvQ
	(envelope-from <linux-usb+bounces-34071-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 12:30:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D208210965
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 12:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E719C301F5D6
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 11:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB3F386C32;
	Thu,  5 Mar 2026 11:30:03 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D67D3783AA
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 11:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772710203; cv=none; b=qZZRDblrCQr7FV34EP+Sg/0j7ulyzTncn8TuKPRP/R6qyh9Osnrz0JW2leNK2qMs1jMqFdD8HLoe79fg4iXlU8oiFPzdSQAAf/6UM6AGCgzxrNDNdt/thCybXgX8KT9ysh3a0n9izu31wA33bJXOLdzv10WO/+V9pwpItQ+ewwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772710203; c=relaxed/simple;
	bh=i49Cs4XafC1S95n14RluXR/r2KJdT5Jfa5LHpWXYbe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5Xlb0916nBrlTSY77FiRH5owb59qXtGyUjK7FwmGie13LEVdm2EZ3cGQdngJ8GUjEuj1yXVaG7szmG6/S5XtBWT2jGZ83tGXrbT1dUF6XwcThAir4ZGobbFGD4btl3Q3hyIvuit8LFrueIVoVM7cbApLJHoL/BBa9DUTxTy400=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vy6td-0000OG-Ap; Thu, 05 Mar 2026 12:29:37 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vy6tb-003sKU-10;
	Thu, 05 Mar 2026 12:29:36 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vy6tc-00000002JRi-2K2H;
	Thu, 05 Mar 2026 12:29:36 +0100
Date: Thu, 5 Mar 2026 12:29:36 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Matthias Kaehlcke <mka@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, huang.ze@linux.dev
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v5 0/4] Add onboard-dev USB hub host managed vbus
 handling support
Message-ID: <shnrtu77frks3yd5r66tzpeca3bxxuu4jpfaqxzerc3tl7j6hr@4ewe2trbh746>
References: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Rspamd-Queue-Id: 2D208210965
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,chromium.org,linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34071-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_SPAM(0.00)[0.014];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.dev:email]
X-Rspamd-Action: no action

Hi,

+To: huang.ze@linux.dev

On 26-02-23, Marco Felsch wrote:
> Hi,
> 
> the whole purpose of this series is to make it possible to control the
> USB VBUS regulators of an USB hub via host managed regulators.
> 
> Regards,
>   Marco
> 
> ---
> Changes in v5:
> - Link to v4: https://lore.kernel.org/r/20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de
> - rebase on top of v7.0-rc1
> - dt-bindings: fix typo
> - dt-bindings: move example into usb-device.yaml
> 
> Changes in v4:
> - dt-bindings: change to vbus-supply and shift doc to usb-device.yaml
> - onboard_dev: make use of new regulator API to parse child device
>                regulators.
> - onboard_dev: drop hard coded downstream port number and make it more
>                dynamic
> - onboard_dev: drop limiting support to SMSC hubs
> - Link to v3: https://lore.kernel.org/r/20250821-v6-16-topic-usb-onboard-dev-v3-0-6d2b38a5d818@pengutronix.de
> 
> Changes in v3:
> - fix dt-bindings issues
> - Link to v2: https://lore.kernel.org/all/20250327172803.3404615-1-m.felsch@pengutronix.de/
> 
> Changes in v2:
> - fix compile time errors in case the module builds
> - Link to v1: https://lore.kernel.org/all/20240807-b4-v6-10-topic-usb-onboard-dev-v1-0-f33ce21353c9@pengutronix.de/
> 
> ---
> Marco Felsch (4):
>       usb: port: track the disabled state
>       usb: hub: add infrastructure to pass onboard_dev port features
>       dt-bindings: usb: usb-device: add usb hub port vbus-supply suppport
>       usb: misc: onboard_dev: add hub downstream port host vbus-supply handling
> 
>  .../devicetree/bindings/usb/usb-device.yaml        |  15 +++
>  drivers/usb/core/hub.c                             |  55 +++++++++-
>  drivers/usb/core/hub.h                             |   4 +
>  drivers/usb/core/port.c                            |   6 ++
>  drivers/usb/misc/onboard_usb_dev.c                 | 117 +++++++++++++++++++++
>  include/linux/usb.h                                |   3 +
>  6 files changed, 198 insertions(+), 2 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20250821-v6-16-topic-usb-onboard-dev-b8d4d1d8a086
> 
> Best regards,
> -- 
> Marco Felsch <m.felsch@pengutronix.de>
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

