Return-Path: <linux-usb+bounces-34559-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIzjEHdrsWkuvAIAu9opvQ
	(envelope-from <linux-usb+bounces-34559-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:17:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 448BD26449A
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DCDCC301AA93
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 13:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AEBA2E5B2A;
	Wed, 11 Mar 2026 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KwIxzNEI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E03425CC79
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 13:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234633; cv=none; b=nJemfKWLep4F+XXLjrkRzddvWosmD/uI3xt78MdtoOD+KcFgJLLTRVx/gahdWrWkSpQu2D76tcIwYsX+ZQpMxkIP9hjQ8EKTRyT+czz8Au6uiZdB3t8FXKR6SIRPycJWDrJI6IYuZBnwJwo6shre8AYwpa3ujCUaxHj/1hd8HNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234633; c=relaxed/simple;
	bh=ZCjsKcKrd5cM7xc0gKPL5+/ZPrvnCW7/RoFaa9cMHac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFIVV2EmgX1i1XQSJs2/8KKJPe6LY0Zc/2BpjEtyhV1f+7pDRir1fgMeFn5aCDO531yWc6OaBXXAGOPTEvAcSC3/T9xEUh/PD1eSZnbtaoaxt7A98MCwm64UrYAwn81Moum5JRWNE9VcICOLgWMNlU3xrVXqlJhVWUCC8Wj3F8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KwIxzNEI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A8AC19425;
	Wed, 11 Mar 2026 13:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773234633;
	bh=ZCjsKcKrd5cM7xc0gKPL5+/ZPrvnCW7/RoFaa9cMHac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwIxzNEIkllpIBdg6FBHftwd6/ngFFC5bpQatK0BOYZxG6vkRPKMEWQ3PvI+AXZ4y
	 zu2Ea9/06AMfIxVb9ADKJsNNSGqOagKh2pvE99DEkC3cH8FBbKGP2uFkd06TV676rV
	 iqQnajlJmsJ033ww9iRN0r9/BGT/YoCvxw0KM4a4=
Date: Wed, 11 Mar 2026 14:10:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Rebello <nathan.c.rebello@gmail.com>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 1/2] usb: typec: ucsi: validate connector number in
 ucsi_connector_change()
Message-ID: <2026031109-scrunch-aviator-0e2b@gregkh>
References: <20260219164925.3249-1-nathan.c.rebello@gmail.com>
 <20260219164925.3249-2-nathan.c.rebello@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219164925.3249-2-nathan.c.rebello@gmail.com>
X-Rspamd-Queue-Id: 448BD26449A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34559-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 11:49:23AM -0500, Nathan Rebello wrote:
> ucsi_connector_change() uses the connector number from the CCI as an
> index into the connector array without first verifying it falls within
> the valid range. The connector number is extracted from the CCI register
> via UCSI_CCI_CONNECTOR(), which returns a 7-bit value (1-127), but the
> connector array is typically only 2-4 entries.
> 
> A malicious or malfunctioning device could report an out-of-range
> connector number, causing an out-of-bounds array access.
> 
> Add a bounds check to reject invalid connector numbers before indexing.
> 
> Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
> Signed-off-by: Nathan Rebello <nathan.c.rebello@gmail.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index a7b388dc7fa0..7109d3bd39b4 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1345,7 +1345,14 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>   */
>  void ucsi_connector_change(struct ucsi *ucsi, u8 num)
>  {
> -	struct ucsi_connector *con = &ucsi->connector[num - 1];
> +	struct ucsi_connector *con;
> +
> +	if (num < 1 || num > ucsi->cap.num_connectors) {
> +		dev_warn(ucsi->dev, "invalid connector number %d\n", num);
> +		return;

Shouldn't this return an error and have the caller stop what it was
attempting to do?  When this is called in ucsi_init(), the
num_connectors is already parsed, so how can this be wrong?  Shouldn't
these values all be verified in one single place and then if any of the
descriptors are "incorrect", the device rejected at that point in time
and not require "deep" changes in the logic here to try to find these
types of errors?

in short, let's validate the device once, and after that is done, we can
"trust" that it is correct and not need to check this stuff all over the
place.

thanks,

greg k-h

