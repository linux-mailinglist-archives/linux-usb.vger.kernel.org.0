Return-Path: <linux-usb+bounces-37656-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E3GIErIC2pSNQUAu9opvQ
	(envelope-from <linux-usb+bounces-37656-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 04:17:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 145435765BB
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 04:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7983F3037167
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 02:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D033164BA;
	Tue, 19 May 2026 02:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="fy4Gu/oj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E201628C009
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 02:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779157034; cv=none; b=DLt8kIA34Aq6p3+LZRcJF82ws1Ksq2Ro9VrSrdkkwrITdQboW6Swayqan8k5KSH2Jg8Rjwt8rhFHqG7e1sRSSYzHsLiOHPZ39GMONYIN9yz3OWHDCA1yu3h9BBSzL9uN6HQTUNu5oBD/T4Ul3d/jMihOk18GGpltYM2ZbdwNOsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779157034; c=relaxed/simple;
	bh=d0IfN6fB3ZR41HCeEgUrCOcqH9ZRKkYvqLxgVaXP8Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7gNB5LkXZLVSN4y05pe6/EM1hnTtNsN1UNGBJdM9OQYb3WygEGyL7zcTUUPCgZjLn48LM38F2xm45AfaYCQr6XhYc9uTslsC6SFWL1FFkCdc2TandoC3iPGMjsHuHG9Ys80OTGv/cmo/NxR1qN5x3eF+obwPkBYDu+Xf43+sWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=fy4Gu/oj; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-912475287a5so332551885a.2
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 19:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1779157032; x=1779761832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wGZ/xMhGgJ5MQggUQR/5EbgnmW1gw56m2Hv2YL4UFGg=;
        b=fy4Gu/ojxjc9kD4Q5UnGPWA/iAIJpl46ebhXejuLLotyQwTyBZRQnmh4lPfhVUH9am
         ytsWlwlJ2B+bRt/IKk3fJthqzl8nuPpwVG8okCMF0++hakc08VIpQTIJCUGwSX9BxtGp
         eYw/EGOmsSv0NDS7qWqMApVpRuM9ZaRxiOtOP8NoqBr56oWV5518fLQxDwRm/8aTl7Zh
         I2yviiG4wap3npCH0jXNeG3vGCt62PPl1b2F0cCTbNmWS9I7JzxLdC4n6iUei/gfQkGF
         NM4xF42lO3fCzSabi4k6Q+3xfiHY0wciKJYly4B/fd/zCp4AX3vUsMj/oXSF+L8VKIin
         Y7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779157032; x=1779761832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGZ/xMhGgJ5MQggUQR/5EbgnmW1gw56m2Hv2YL4UFGg=;
        b=Flg3E+XJ41DlXBDVibyVl39DSSUaAZV/SVMvhUZ7LQgAHJ05yaxk2l2Vv1tREl1a/G
         qDy2W/1uVBwUu1Z1kQ6D6YqULDAfDtNVcOROIT46gBDLhHFV88Uo5UDspkzawbERI4Q9
         XNDbtrgp67GEV2lUk2pl7nuEAouwwkeZdyJ/WMeJ9WvRnMWn2iu7ICSN3Tcq4mShPRBp
         P320jdYSqyKEbNyRi0HJIonIdKhA05aaZzRiaM1sT3X+FtpRiB4DEwPzqFEwJmohDZoW
         2CTj4CEjfw3PTDCv6tp8lIB+10oBkcTEBqbWlnyHNQSiP269InzB8C4vo9Uu/JViLAgs
         ScHw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZTdcRAXfyreaBY2wZ/Z19q3tug2FvPnGs7cM4CB8midlkTx0jcI/GnPacWJm5kcENyPyEH0X88E8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDt8hufZD9E7SUTbd+ADp3Dh6EhOFr0h4RAXrwvMI5xVAOQGZA
	I79h80YQuITB5F+MpTUZGak/o2aGaSEpalJqvYXog4CMA20uS609siMjT2Qhhb+PXnNVGWQRN0+
	JEs4=
X-Gm-Gg: Acq92OEJZLg9Oua1NdpaBMZM0SWmIkUaiGepmYfrVW0F8i7Gk2yfPDuXyOv/1Ln8N0d
	UGWgM73h/B8S2stmFbw45KXWCCR4D6xF5YPh3215zH0n1KWPTlmVqwxaF5ua/l3ebwBV6XnxmM0
	n8au8ctFSrGtUoz94bvLKJ4WMK6/VlwKpn1NGLPHT6zWdjVevSsBline41HMxHVU1ivr6VwGp2T
	Kiga+c7DSxe5OwSqqMuq5esQOJdZmz7kOckhaBiWJW2EJX/WalljtCL3HB1mrAuoOnY9QPGJyZo
	ZYLLYGGAtV3+KKMx/0aNrnKkx46qgQXJ+w+ub3jje2/y0qCc3dDSq7Fm3Tyn6+PXjSVosPRWIHY
	J7nh6lTC98TiWt4hunxW+qAbPi7DK84uF3scKHWEkhQT5F9dsHmBgzVrzySpJvJwAoWt8mmST9C
	VxnCbH5k+FOiDMMToqB/GMGi/XrM2W+o4Kjbu2kN4IazE=
X-Received: by 2002:a05:620a:c51:b0:910:79bc:6082 with SMTP id af79cd13be357-911cdd4c713mr2656401685a.15.1779157031740;
        Mon, 18 May 2026 19:17:11 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bab3ad15sm1667627985a.16.2026.05.18.19.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 19:17:11 -0700 (PDT)
Date: Mon, 18 May 2026 22:17:08 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: pip-izony <eeodqql09@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, Chen Ni <nichen@iscas.ac.cn>,
	Sebastian Urban <surban@surban.net>, Ingo Molnar <mingo@kernel.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: dummy_hcd: Reject hub port requests for
 non-existent ports
Message-ID: <90be600b-f188-4abb-8f54-7e6f909bf606@rowland.harvard.edu>
References: <20260518234314.1889396-1-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518234314.1889396-1-eeodqql09@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37656-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[harvard.edu:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 145435765BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 07:43:14PM -0400, pip-izony wrote:
> From: Seungjin Bae <eeodqql09@gmail.com>
> 
> The `dummy_hub_control()` function handles USB hub class requests
> to the virtual root hub. The `GetPortStatus` case returns -EPIPE for
> requests with `wIndex != 1`, since the virtual root hub has only a
> single port. However, the `ClearPortFeature` and `SetPortFeature`
> cases lack the same check.
> 
> Fix this by extending the `wIndex != 1` rejection to both cases,
> matching the existing behavior of `GetPortStatus`.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/udc/dummy_hcd.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index f094491b1041..f47903461ed5 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -2134,6 +2134,8 @@ static int dummy_hub_control(
>  	case ClearHubFeature:
>  		break;
>  	case ClearPortFeature:
> +		if (wIndex != 1)
> +			goto error;
>  		switch (wValue) {
>  		case USB_PORT_FEAT_SUSPEND:
>  			if (hcd->speed == HCD_USB3) {
> @@ -2248,6 +2250,8 @@ static int dummy_hub_control(
>  		retval = -EPIPE;
>  		break;
>  	case SetPortFeature:
> +		if (wIndex != 1)
> +			goto error;
>  		switch (wValue) {
>  		case USB_PORT_FEAT_LINK_STATE:
>  			if (hcd->speed != HCD_USB3) {
> -- 
> 2.43.0
> 

