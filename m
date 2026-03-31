Return-Path: <linux-usb+bounces-35738-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOeuGcDxy2m5MgYAu9opvQ
	(envelope-from <linux-usb+bounces-35738-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 18:09:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8351636C640
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 18:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD2BD30B5C34
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 15:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815DC423A7C;
	Tue, 31 Mar 2026 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IO5nyiN4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C69410D3B;
	Tue, 31 Mar 2026 15:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971982; cv=none; b=ee09sYkNqrmO5oeaYfngm2XodhA4d8dzfQ4YIF1h39Dcqa4p82v9EsYeIOPvs/LYin6ge/seHYRvE5CDxGqky4wXbO3wFEoRpPjMXqpv5s4yFLmiCmyjACq1Yf4tYLXWeutoDtGyNR7fepShuQ0cxKb3IXWdsqltWsUwVldXRyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971982; c=relaxed/simple;
	bh=+O/D4dq7l0PcK3ZNxXWbcQrfbfts/LXvkEblCFjW1XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOHM//fTasZMrkLuSGGQt4GfTxVN98Y1AhIpBcY7+l1OmYGul5RnUmTsdfuxa/KXBVGU3RdmK3ZkedqP29KOdQTYvSeWY+pWSXLjViIxGzAtvdaAUX1Xyr1rt149EGzJwr+yxQvYy1j//gkNhnhFNQ3MkcxYwZvk8oK5ZHhstUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IO5nyiN4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7CBC19423;
	Tue, 31 Mar 2026 15:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774971981;
	bh=+O/D4dq7l0PcK3ZNxXWbcQrfbfts/LXvkEblCFjW1XE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IO5nyiN4mY7ZedYXsGRoy8PzbWNeO57ygH3Iz6Kf2qPt7tRlB9ZJjsaIO8dnX+zii
	 CrITy+eeAPoOBXmkVzn0ernd8R94W8CsZmC2DsH8oWvaavhXXDDhgWbnYYjDBoL0eS
	 uD7Dwq/dc0zHP5OiNA3fwOEElthkqTFPcSCheNJ9nUlutpAZq5cNQDzfX9HCNRjXKY
	 e+7BjgpnwfNVZKNWPDL+u2XKFcKERL1oXhZZOaudNoY3GplpkYiErf0w6KJ4MF6A6h
	 3KFlwey3PqbwELn+YNoQbazH8XErBAg+rcz6d44vOwnJ7nYr3kl3CX3aLBDCfObIN0
	 CabEP0sPyy50Q==
Date: Tue, 31 Mar 2026 10:46:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: amitsd@google.com, kyletso@google.com, krzk+dt@kernel.org,
	badhri@google.com, conor+dt@kernel.org, imx@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] dt-bindings: connector: add pd-disable dependency
Message-ID: <177497197535.1298549.8741687393452368913.robh@kernel.org>
References: <20260330063518.719345-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330063518.719345-1-xu.yang_2@nxp.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35738-lists,linux-usb=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8351636C640
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 30 Mar 2026 14:35:18 +0800, Xu Yang wrote:
> When Power Delivery is not supported, the source is unable to obtain the
> current capability from the Source PDO. As a result, typec-power-opmode
> needs to be added to advertise such capability.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Fixes: 7a4440bc0d86 ("dt-bindings: connector: Add pd-disable property")
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - add acked by tag
>  - DTS patch has been picked by Frank
> ---
>  Documentation/devicetree/bindings/connector/usb-connector.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


