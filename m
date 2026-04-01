Return-Path: <linux-usb+bounces-35801-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLf3KOljzWkHdAYAu9opvQ
	(envelope-from <linux-usb+bounces-35801-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 20:28:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AB137F448
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 20:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B86793041170
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 18:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FF4376BD3;
	Wed,  1 Apr 2026 18:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yrp1Do7J"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEFF345CC2
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 18:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068124; cv=none; b=DhuZQZsJmyTDCGTJx4gk6ng6zELw1E8jm/bEsWsGJBNkfinvmCM8asCw8qTfl63edBnCIzQYswoaTkA2BnHIv6SuyqhP9cXTQn38M9DTNrRnLyDci4tnoAeJlBD67Dd1YnPWSuOet3H2gcdk/aSeaUcJzpaE5zKYppSoERsx3xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068124; c=relaxed/simple;
	bh=UKTZoesvlkUmpVjBnnnmkZu42wFtE56ai+CTDbeVo0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSQpy8fUqso6vxeeT1xpnnILSivv6VhOUcPhmBxWiYe1zWIbbF0YeRsGFnexl5gqMi7wBG8RV8FKBBtYaWT6ibInjSuuj/coByNXlcWxREXUjAxTJ11RLor8TM89qfOuHRaCDXwUiFZgtz8yMRyJr6lbqUKYIOHgNI7TnxwdnZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yrp1Do7J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363D5C4CEF7;
	Wed,  1 Apr 2026 18:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775068124;
	bh=UKTZoesvlkUmpVjBnnnmkZu42wFtE56ai+CTDbeVo0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yrp1Do7Jtlm3JaYt4MYQLVbug9Xf0TkF9KTGkfIKBwnpFEfuMVgNYzKoKzWcbau37
	 fNb3UZyIvitSa6WG7Qjr2cD4+X1I8cwdhybS3UyOAsLxsykKrOnEgbUtrXFZswnl9o
	 dVq/CpIgRCFG2VVi2RXab7sIZbuaaQ7AbWrLtVGo=
Date: Wed, 1 Apr 2026 20:28:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Taegu Ha <hataegu0826@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_uac1_legacy: validate control request
 size
Message-ID: <2026040144-gratitude-haven-f28a@gregkh>
References: <2026040124-unheated-opponent-3c56@gregkh>
 <20260401151539.3441000-1-hataegu0826@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401151539.3441000-1-hataegu0826@gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35801-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40AB137F448
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 12:15:39AM +0900, Taegu Ha wrote:
> f_audio_complete() copies req->length bytes into a 4-byte stack
> variable:
> 
>   u32 data = 0;
>   memcpy(&data, req->buf, req->length);
> 
> req->length is derived from the host-controlled USB request path,
> which can lead to a stack out-of-bounds write.
> 
> Validate req->actual against the expected payload size for the
> supported control selectors and decode only the expected amount
> of data.
> 
> This avoids copying a host-influenced length into a fixed-size
> stack object.
> 
> Signed-off-by: Taegu Ha <hataegu0826@gmail.com>
> 
> Changes in v2:
> - rewrite the validation logic into a switch on control type
> - use constant-size memcpy() for fixed-size payloads
> - convert the volume payload with le16_to_cpu()
> 
> Build-tested: not tested, build environment not prepared

As you found and tested your previous change, can you please test this
one to verify it solves the issue?



> 
> ---
>  drivers/usb/gadget/function/f_uac1_legacy.c | 47 ++++++++++++++++-----
>  1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
> index a0c953a99727..00cc7161db66 100644
> --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> @@ -360,19 +360,46 @@ static int f_audio_out_ep_complete(struct usb_ep *ep, struct usb_request *req)
>  static void f_audio_complete(struct usb_ep *ep, struct usb_request *req)
>  {
>  	struct f_audio *audio = req->context;
> -	int status = req->status;
> -	u32 data = 0;
>  	struct usb_ep *out_ep = audio->out_ep;
>  
> -	switch (status) {
> -
> -	case 0:				/* normal completion? */
> -		if (ep == out_ep)
> +	switch (req->status) {
> +	case 0:
> +		if (ep == out_ep) {
>  			f_audio_out_ep_complete(ep, req);
> -		else if (audio->set_con) {
> -			memcpy(&data, req->buf, req->length);
> -			audio->set_con->set(audio->set_con, audio->set_cmd,
> -					le16_to_cpu(data));
> +		} else if (audio->set_con) {
> +			struct usb_audio_control *con = audio->set_con;
> +			u8 type = con->type;
> +			u32 data = 0;

No need to set this to 0 ahead of time, right?

thanks,

greg k-h

