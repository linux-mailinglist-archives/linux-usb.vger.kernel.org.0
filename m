Return-Path: <linux-usb+bounces-35779-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IED1HdgGzWkjZgYAu9opvQ
	(envelope-from <linux-usb+bounces-35779-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 13:51:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB447379DDA
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 13:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1622304565E
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 11:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B633F54BE;
	Wed,  1 Apr 2026 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w37MrRxR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1433AA515;
	Wed,  1 Apr 2026 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043615; cv=none; b=bqHZuDpNfefwbprDHPpuSwNAQJDTZGW/FfMaesTWV2UaQHIClW24V2Ia3wux3+3YgbbcVADL+bevY2VJHoQKA+pkwHx+0YEFLpRW6YrrqGjsOHr8dbQeCgT0vWaBcC28HuOLsiVQQeaL9GK4MxJBbsLxxjq48K0KylrEagNlPvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043615; c=relaxed/simple;
	bh=XlSqL9Wm+6Z9+Acc8ltGM6i6MGIKmWXA9moHzQiqt0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtubVMg5mXxpWLaeOvUmBCiRUPRztOjDwtVAEo58FUDLfEI0uVB3WyhdaZjOLMCPINvhnFRmgcu0bzfnpB9DOWxwSfaJ1Uvs7JIxZToiISRB+gkOtA7GVx9XRlM+ZruKutWEnoRc1DjoRz+jB5aUNYFgI2HZPW8+WpV25V6l82g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w37MrRxR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DF3C4CEF7;
	Wed,  1 Apr 2026 11:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775043615;
	bh=XlSqL9Wm+6Z9+Acc8ltGM6i6MGIKmWXA9moHzQiqt0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w37MrRxRIRsR4HsVxhCduVrBQ9/dsHB9+DGwNDfg2VQxzvCwSriLAND1AUFRkwVr3
	 gcf9oHsmOCKS7S7uVMYVkxym+KKubX9a0bWl2WEhnOiF2CW6HQE2JxTsdyNqRKFmFx
	 F4gFcHhcTa85OCAR/wLCmmQ3Qqer6isNnUlVU9Js=
Date: Wed, 1 Apr 2026 13:40:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kees@kernel.org
Subject: Re: [PATCH v2] usb: gadget: rndis: validate query and set message
 buffers
Message-ID: <2026040110-neatness-germicide-d4e3@gregkh>
References: <20260323080845.40045-1-pengpeng@iscas.ac.cn>
 <20260401113410.66427-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401113410.66427-1-pengpeng@iscas.ac.cn>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35779-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: EB447379DDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 07:34:10PM +0800, Pengpeng Hou wrote:
> Hi Greg,
> 
> I have not tested this against an actual RNDIS host/device setup yet.
> 
> For clarity, v2 did not change the code from v1; it only expanded the
> commit message.
> 
> What I was trying to fix here is limited to two current-tree checks that
> are missing today:
> 
> 1. rndis_msg_parser() reads MsgLength from the request body but does not
>    verify that it fits within the actual EP0 request buffer length.

Yes, that's a good thing to check :)

> 2. rndis_set_response() validates the host-controlled
>    InformationBufferOffset/InformationBufferLength pair before using it,
>    but rndis_query_response() still passes the same fields directly into
>    gen_ndis_query_resp() without corresponding bounds validation.

Ah, so that should be fixed up.

> I do not mean this patch to claim that these are the only issues in the
> RNDIS parser.

Oh, I did not think that, there are loads of issues with RNDIS that are
not covered by this patch :)

> If you want runtime testing before considering this further, I can stop
> here until I can test it properly.

Yes, please test this so that we know it doesn't break existing systems.

thanks,

greg k-h

