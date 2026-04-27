Return-Path: <linux-usb+bounces-36535-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nrpkEuE972le/AAAu9opvQ
	(envelope-from <linux-usb+bounces-36535-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 12:43:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B91FD47124E
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 12:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC28F300DF46
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE033B2FC9;
	Mon, 27 Apr 2026 10:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOWq3WGm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1787245005;
	Mon, 27 Apr 2026 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777286612; cv=none; b=d+s2g5hKg5uTCLr/DzShb+PJ1q8LyB/xf/Au2JBmNtipO2Xm3MjAPhXBmwSBsc88N9+1R4I292N0pkXN0ehRlRCVD6ndLA27xZY9oBLTRSEOeO0tYurz5bJy04FteMZbDiBRgXJtM4mVar3deJp8T+aCYKpCxVLX5wTZxo36Y70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777286612; c=relaxed/simple;
	bh=G/DLaEqy93Ybg6SinwWQRZD/XgjlayO/doMcLjsYuiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEd/l30RWF6eSjT062LeQ1OkdxKYjRL4r3BHr0PPDaXrl6f1rX+rbU9o3FBOsRIvYLnToKa8kvMnP+clzN9U/ZSZtA883eV5YABCvgvr1KxT7LS9+PkEww3BOPrdZyVYg2yYUQRztCLiQCEbsH10BAqtPEiLeI6U5It7U2meLeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOWq3WGm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53826C2BCB8;
	Mon, 27 Apr 2026 10:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777286612;
	bh=G/DLaEqy93Ybg6SinwWQRZD/XgjlayO/doMcLjsYuiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OOWq3WGmPy/i7Dt1SLCG0vZD+cJBGCr9ANDB5K/N4FhQaUS7DN++w8SR+hFmQj2Sq
	 jx1/i0KF+1Jp1Fk27qLzga7RdHdZOvulNbxLrEnHRiDBTcb+kVhvCtsfHPTfDgj+ZR
	 Nw9XU/w59pWRyRsERG3mlH3fHbPq4F9O2LTjWQva8dK2lu5C7NN2vaOtFmGYrX2d9K
	 Nf/TIFbC3nnQg4EM1WsSVkk+5UkV1MzYb+lqxkDRe+YNmZCkuXVMz37krJreJuCVGI
	 1klaz+gVkwXMJQn/Ke2/hQqxm11k0JdauaFCj/YtONaO/cTp5CIytdXP148Sj9POSt
	 hoSHwmaoF+xog==
Received: from johan by theta with local (Exim 4.99.1)
	(envelope-from <johan@kernel.org>)
	id 1wHJR2-00000000107-3OUV;
	Mon, 27 Apr 2026 12:43:28 +0200
Date: Mon, 27 Apr 2026 12:43:28 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/4] usb: serial: mxuport: extend MXU50U support and
 runtime controls
Message-ID: <ae890AUeoDcD7yIn@hovoldconsulting.com>
References: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
 <acolFoqcYDuxwmPX@moxa-ThinkCentre-M90t>
 <acosTjk_TV6r_uz4@hovoldconsulting.com>
 <ae7aF6CjtEEOe6Dq@moxa-ThinkCentre-M90t>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae7aF6CjtEEOe6Dq@moxa-ThinkCentre-M90t>
X-Rspamd-Queue-Id: B91FD47124E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-36535-lists,linux-usb=lfdr.de];
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

On Mon, Apr 27, 2026 at 11:37:59AM +0800, Crescent Hsieh wrote:

> Gentle ping on this series.
> 
> It's been about a month since v1 was posted, so I just wanted to check
> whether you've had a chance to review it, or if I should resend or
> split anything.

The merge window just closed so I'll start processing my queue again
shortly.

Johan

