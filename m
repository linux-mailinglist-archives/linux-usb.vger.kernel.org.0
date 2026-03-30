Return-Path: <linux-usb+bounces-35643-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDz0LWotymkA6AUAu9opvQ
	(envelope-from <linux-usb+bounces-35643-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 09:59:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ADE356CDA
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 09:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3B413040189
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 07:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207133A6EE7;
	Mon, 30 Mar 2026 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIG5LWb/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515C63A9608;
	Mon, 30 Mar 2026 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857297; cv=none; b=ngsvaKP5mYL9wR3bXdZRpIDIRNfnWmGfpxtS0g7Z+vg8ALtZ2R0kZPKU6OLyjOihoXMG35qZZYFcqon93LH9kYL59Lag0y4NJ0T2DDgTEeDzylkfnPSgmYu1F3ngX6xUDTD1ITyAHZ6Ya6ax+vOGvxaxzV04wYwlkajvdIVV7Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857297; c=relaxed/simple;
	bh=l5/Zj+J7tevyRJRt4WrFIhGJGbHvHM0BxEqZ9idIL0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzCxoSjrBayc+H3Mi0meZpoxqxVwUz4zm0MtxM4TswU06wayc1Px0W07Tsh3+rPt+udfq4AlFDC1Y70yuw7QH1YooVkDgjLet4U51tI2/0uP0hVTiZOL3Uo9x8XlIuADbS7E+33HJG/ROzEymkZYVL7grg/hROPm3dYPPxGePm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIG5LWb/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32BAC4CEF7;
	Mon, 30 Mar 2026 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774857296;
	bh=l5/Zj+J7tevyRJRt4WrFIhGJGbHvHM0BxEqZ9idIL0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RIG5LWb/ouOGwcl7SrAvkAHZ8v5m41QglTaKF/XFVQKfPePSiy+tcvuvhF4wVg4t+
	 qZ7OEoNyfw6OIVr4r8bXvzSx/ow6dT8QA4GGsAI0FmFXfcX6Zyfs4v3DDchfn5RdRO
	 tNRDJk5XzibsGuOdx4fvnZtADVbUsXcJlBsV3X8H1mogmbadGu73Ggkzuapik1gSUS
	 EI5rYfn405YYxt6OHi2xRUt97c9l1rX/kbyRrbXMQ42cfc+62kAdWDkqifCXMacnFZ
	 gAu44ln7mw7NKK9WcNcyLur/V7wwpCyMQcEpyQfMkYsVE3lgSce9o3x39N871USXHP
	 XcITiaLf4pRsg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w77SY-00000006icl-1h25;
	Mon, 30 Mar 2026 09:54:54 +0200
Date: Mon, 30 Mar 2026 09:54:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/4] usb: serial: mxuport: extend MXU50U support and
 runtime controls
Message-ID: <acosTjk_TV6r_uz4@hovoldconsulting.com>
References: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
 <acolFoqcYDuxwmPX@moxa-ThinkCentre-M90t>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acolFoqcYDuxwmPX@moxa-ThinkCentre-M90t>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-35643-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: 24ADE356CDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 03:24:06PM +0800, Crescent Hsieh wrote:

> Gentle ping on this series.
> Please let me know if I should revise or split anything.

This one was posted less than a week ago and is still in my queue. I'll
get to reviewing it in time, but you should generally wait at least a
couple of weeks before sending reminders.

> Related firmware patch:
> https://lore.kernel.org/all/20260324024635.349522-1-crescentcy.hsieh@moxa.com/

That's great that you've already pushed the firmware.

Johan

