Return-Path: <linux-usb+bounces-36022-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PbHIZY41GkksQcAu9opvQ
	(envelope-from <linux-usb+bounces-36022-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 00:49:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DBB3A7EF1
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 00:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AF213025C67
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2026 22:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BD839FCB0;
	Mon,  6 Apr 2026 22:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bB0AkAbq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7C239657A;
	Mon,  6 Apr 2026 22:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775515791; cv=none; b=Cipwx+6OjaLoFxdgF+klQ7B+x7pcCeZ+VuF7+JbLew9lmNJDmjFD4vSL1kPXpyo4ivaA/rB6UkSTwsom7lE4+wjw/5ELUgaj+BQhEI2BYxr5ZJ5CZF0kW/YaK+BvUEmHCP06BALuiP6t3th8VliqInE9yTqO4O+p06NX17D+BsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775515791; c=relaxed/simple;
	bh=FyE5chWO2fuq/tQbfJ07wSv55K/bw5O7LsX5IWssCPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSQsxqyfNg8sEvlBNtdFswq6RriJXQlTJoMIH/jr/PmDdHL7sdXo77YW2ritvA0mQ91zJwCFdBO1LWUboe/Momjp/E9foEblFBS9asxJ1NWxfGHeX490gCH9UxxnVeQyQbp+5H4iMsVpYCgRCnQoxzcNqlcWMQGDNQfa0RVoLjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bB0AkAbq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81021C4CEF7;
	Mon,  6 Apr 2026 22:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775515790;
	bh=FyE5chWO2fuq/tQbfJ07wSv55K/bw5O7LsX5IWssCPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bB0AkAbqbIU4DzATNBFiiP9iCv4p81N4QtyPb+DniD8jmcwOs5QsI/ouikq25ykXU
	 AjnXmDxqPPZB7GUe14SEIY05xVSNR6h/OpVzoXGquU3Kq2dwpPX/g8UgLLewFNRXFh
	 s2WUoNzX9WnG3/Z5a/ewYug0D7RE8T9gA7+CUud/eQ1hzYuun0JRr1oe7G8P60aQTF
	 +9hctQZulm/+8b/6nC7XwHKo5TgUDRYWagF5RtVAo76KOXL96G+DhdzAM3X53eEr4p
	 f6nBhggrwT/a8rNhKTF2tSsF115+3DSAuHmVercSVVeatG71l079zs1ZVJDu4fLDjH
	 FLO34HF2dDLaQ==
Date: Mon, 6 Apr 2026 17:49:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jameson Thies <jthies@google.com>
Cc: abhishekpandit@chromium.org, akuchynski@chromium.org,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	bleung@chromium.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org, krzk+dt@kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH v1 1/2] dt-bindings: chrome: Add cros-ec-ucsi
 compatibility to typec binding
Message-ID: <177551578813.60654.5045933666200538178.robh@kernel.org>
References: <20260403223357.1896403-1-jthies@google.com>
 <20260403223357.1896403-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403223357.1896403-2-jthies@google.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36022-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F1DBB3A7EF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 03 Apr 2026 22:33:26 +0000, Jameson Thies wrote:
> Chrome OS devices with discrete power delivery controllers (PDCs) allow
> the host to read port status and control port behavior through a USB
> Type-C Connector System Software (UCSI) interface with the embedded
> controller (EC). This uses a separate interface driver than other
> Chrome OS devices with a Type-C port manager in the EC FW. Those use
> a host command interface supported by cros-ec-typec. Add a cros-ec-ucsi
> compatibility string to the existing cros-ec-typec binding.
> 
> Additionally, update maintainer list to reflect cros-ec-ucsi and
> cros-ec-typec driver maintainers.
> 
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---
>  .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


