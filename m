Return-Path: <linux-usb+bounces-37443-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LTBD5XQBWoPbwIAu9opvQ
	(envelope-from <linux-usb+bounces-37443-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 15:39:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E70B5426C0
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 15:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EDF530238CE
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 13:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4893E3D89;
	Thu, 14 May 2026 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqsydmcP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857833B47FA;
	Thu, 14 May 2026 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778765951; cv=none; b=pKeBO3JeylKyp2a1yv+YRhlBlDPGLbvB2PWnAbfltxV0mHARSZL4vEViTjbkkAPoTbXwNAVpWfp+nSVbY74TR41xT3CI0XjBPVX4ZeRzYnBrWxUHEH/ow1QYDIOfwxpaNO9cRVpWfJFTG0SQKm87fexvv4dOSumfm/GwfPxiwo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778765951; c=relaxed/simple;
	bh=vNkcCbD1XMZKKWzRhQKmlztbHvbK8FwSkh/CNdAz2ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4Z7OefR2pEiF7KV7WGodPxYW8aWqk6PMmPwH3otLzvkKQY3K6OlqiOum3tbaiB4J5EJqXRzPEIbPPhOs9YYpV39bfYKjlu2SnDIm14K+Z2odJT6C9SiH+mH+pj4yRL98I4Asu/BskQAdk/PN7NjWNkOPULnQLVHkUumVu5Bxy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqsydmcP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F150DC2BCB3;
	Thu, 14 May 2026 13:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778765951;
	bh=vNkcCbD1XMZKKWzRhQKmlztbHvbK8FwSkh/CNdAz2ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqsydmcPtTQALFUsUtvf8aA3uu4Xvf2ZvvrqTN0NIibD714aqEWVHjqWpSc1zBQjk
	 tgGpEVV+1jEYOML7V3vqo5KZZZZt5EJxXyY26Nn63tTBbYMaaMAdCMvkF7E3lh0H0J
	 hVA02HYim+b7Gw2FIzKCNwq6dCBxJPp0gwrx3Ki6O+B8DdohoU3hLftSFUzmfT6BT0
	 ZLOSQ1knQGZHSWkW/yS0geZZ2cI4cpPPNiQXKMR1z0vLp0Ay7hVHh3Y4bSnZlfwgTI
	 yNq6D5wZ++TKajU+y9jSvHQ/H1Hs45AHA5vrOmicUCYoRqPjfO/RAPryVr7bdsoxu+
	 qv4W/ymkEGYxA==
Date: Thu, 14 May 2026 08:39:07 -0500
From: Rob Herring <robh@kernel.org>
To: Pawel Laszczak <pawell@cadence.com>
Cc: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: cdns3: Add cdns,no-drd property
Message-ID: <20260514133907.GA173132-robh@kernel.org>
References: <20260514-b4-no_drd_config-v7-0-18cc40e363fd@cadence.com>
 <20260514-b4-no_drd_config-v7-1-18cc40e363fd@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-b4-no_drd_config-v7-1-18cc40e363fd@cadence.com>
X-Rspamd-Queue-Id: 9E70B5426C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37443-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 08:00:51AM +0200, Pawel Laszczak wrote:
> Introduce a new boolean property 'cdns,no-drd' for Cadence USBSS/USBSSP
> controllers to support hardware configurations where the Dual-Role
> Device (DRD) register block is missing or inaccessible.
> 
> When 'cdns,no-drd' is present:
> - The 'otg' register and interrupt resources are not required.
> - The 'reg' and 'interrupts' properties are restricted to 2 items
>   (host and device).
> - 'dr_mode' must be explicitly set to either 'host' or 'peripheral'.
> 
> When 'cdns,no-drd' is absent, the binding maintains backward compatibility
> by requiring all 3 resource sets (otg, host, dev).
> 
> To achieve this, the schema is updated with an if-then-else logic
> and 'reg-names' use enums to allow flexible
> ordering during validation.

No need for a property here. This should be implied from an SoC specific 
compatible. Or perhaps just implied from the lack of 'otg' registers.

Rob

