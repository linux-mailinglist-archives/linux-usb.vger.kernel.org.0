Return-Path: <linux-usb+bounces-36460-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGcpOm6i6mlF1gIAu9opvQ
	(envelope-from <linux-usb+bounces-36460-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 00:51:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEF54583E7
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 00:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D42F303A9F8
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 22:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8552037B018;
	Thu, 23 Apr 2026 22:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oEFWk4kb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7638F37702B
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 22:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776984657; cv=none; b=cNreQJmhUvVRVuQvdEnsgHtX7AHlXNqRJox8bqnrPtFzf0Z13N8B7c8m/yFzeDcniava7+O9cgJ2IHcHYvb6CoK7o2VT6nAM7GfOOpP0QzJ89eYRdOBlAz2T1F7MuVWvTigjHjN/xEt0jNpspDFxhoRpoOqyvg7xGiOIRD8FjjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776984657; c=relaxed/simple;
	bh=sBD6hfqqD5vDkj/PJwKkm6tZsvxEyPBUfmc+YlBlfto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ea1a9c0Y+tx3WtPBvWgdje0b2lBJLHxim13TD8oawGW6cqIOZCvfm9A0Xd76FuPD6Mm9Dw/JXKj8T/8KKociRF1OPy4TE9Mf38TWSJeSi0HXtbck6vd/08tLenCjR2uMQVGMCCeLSKzWmwe34pFaWK4EVcv1wswen2ZWC0MAWaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oEFWk4kb; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b6b0500e06so11536312eec.1
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 15:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776984654; x=1777589454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lMXf2gnDkRB+s69+bOFp0A+RG1TpxXUu3x/474wh+4M=;
        b=oEFWk4kb9Y+LpS2lovqmq2xpNyf1AMEppZm6EoS2eSuvAs3sHB+31EjccXeXn1r8Mm
         /ehvnFLlDulsiw0h9ah4pP/jFrHB/z8w/nMQcbH4x/NzWaR5mizGidbOh7X9j+r7pc4y
         Zr9szlMaYiufXY1WwGnzct5yPok27ORhmXgTwK01fjuC7uIg45Tyo2e+xkNHTLq/F+LT
         WmIHSb9qHNQQ0awVbUBBBUztXTkf1CwkoVm2YQ3X/M1/PHky4AF3CTpJ05QmeGJKjSDh
         jZIZAWRtZQUcANs1YUlT90bB4TO4x+T3mxmW/GmBGSs1SfnIv1pID4i4LE2idACC262X
         LOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776984654; x=1777589454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMXf2gnDkRB+s69+bOFp0A+RG1TpxXUu3x/474wh+4M=;
        b=gNXilungyVrHqiB34mQW6Lmbs9sdJZawKQOtPVU3GHxBOJZ7YSUQRzq1/1TieGgW9j
         4PiEMxXe41iULqLeT1F+uup7mPlfvPEic4l65X8CVDjUhddBEpuUBs7HYjlga9i0+XaQ
         y3rSr2OFZ4aT5x49ne3GH3HblZLJPvR3q2rNRn1/qSpNLdlKK5tiKS3OmdYevHhRtBsV
         Z4b59JECguyqp9d4AyZvEWTfwmp7A5DyV0QN63u/HEXJqY8jXeK9tALToyrH2GqtU/2A
         2q0oVmzIZidalNHwSkDX+30RR66O1CLKAq4eyI7E2T9mQUaN5Rki4ws+XQDm4AjT33p2
         H5jw==
X-Gm-Message-State: AOJu0YyFkREMMaqocNlPVu6kpSpqI+NOwE/mJ+QlfuHQhpdFHl5TxcaK
	7Mlr/7a+6mtYO7ChhBUQVwUVLneSHJcFGrc85wlQ3BwX3LMqVtrMfltUwetzMh9XUw==
X-Gm-Gg: AeBDiev7QR2dFJXbEir8zOLtr4167d/zqZvoI8gwjY3x3hGAdDCpzKnKMk9y3YsAB58
	lgi4DWu0mF/hAyxbIS11+pA87sY9PhPtuTSOpTB6qN8JICTUmdbaxga9s8WjPETvgAPm4tNQdB1
	CJddEIMLNPtTRFXjg7o4467RT2myq98bMnnf5VR9IGgvHohPmmVR8zMHAk4TBjqaz1c2osydTM8
	jmlBvwrTh6p+M6R77UnrTfL3pb/kwAyNZSbfOv/C2slA8unRLhCFitEx6ql8YSL4cHT3YWVskvu
	Ju1UEn0Y9ArMMNaPcbUAzxmHnN6ZHU8BJv9o1G1jAN+0MgI7cNLouR69nKOXrWQAu6il3VRzB8p
	LaB6DLMTSQl2+Ws1vhqseX8ryz0fgdUK97m2dZo/Wm2SMemDcUKBHCWatYi9D0anJaVVN8sXXeT
	I5Y4y+Zx9tFItnltcadIxWfArNnKkTvs9ztdbag3P9eLgk6ZLdOCEWSddGoQLIy9nIOMj/nsk9L
	JDiefy+ETuNIIsUuY3+KyoHnhT5f3sJdtCL16+9a7X53mM=
X-Received: by 2002:a05:7301:1f01:b0:2c7:5a7b:e8c0 with SMTP id 5a478bee46e88-2e4657714d1mr15215495eec.12.1776984653739;
        Thu, 23 Apr 2026 15:50:53 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:5cd3:e624:64db:3649? ([2a00:79e0:2e7c:8:5cd3:e624:64db:3649])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cff04sm28541858eec.23.2026.04.23.15.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 15:50:53 -0700 (PDT)
Message-ID: <d9f89db5-e2be-4326-b57a-c8213eea675a@google.com>
Date: Thu, 23 Apr 2026 15:50:51 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: tcpm: fix debug accessory mode detection for
 sink ports
To: Xu Yang <xu.yang_2@nxp.com>, badhri@google.com,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 m.grzeschik@pengutronix.de
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com
References: <20260420030317.425022-1-xu.yang_2@nxp.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20260420030317.425022-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36460-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 7AEF54583E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Xu,

On 4/19/26 8:03 PM, Xu Yang wrote:
> The port in debug accessory mode can be either a source or sink. The
> previous tcpm_port_is_debug() function only checked for source port.
>
> Commit 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into
> accessory mode debug") changed the detection logic to support both roles,
> but left some logic in _tcpm_cc_change() unchanged, This causes the state
> machine to transition to an incorrect state when operating as a sink in
> debug accessory mode. Log as below:
>
> [  978.637541] CC1: 0 -> 5, CC2: 0 -> 5 [state TOGGLING, polarity 0, connected]
> [  978.637567] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> [  978.637596] pending state change SRC_ATTACH_WAIT -> DEBUG_ACC_ATTACHED @ 180 ms [rev1 NONE_AMS]
> [  978.647098] CC1: 5 -> 0, CC2: 5 -> 5 [state SRC_ATTACH_WAIT, polarity 0, connected]
> [  978.647115] state change SRC_ATTACH_WAIT -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
>
> It should go to SNK_ATTACH_WAIT instead of SRC_ATTACH_WAIT state.
>
> To fix this, add tcpm_port_is_debug_source() and tcpm_port_is_debug_sink()
> helper to explicitly identify the power mode in debug accessory mode.
> Update the state transition logic in _tcpm_cc_change() to ensure the state
> machine transitions comply with Type-C specification.
>
> Fixes: 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into accessory mode debug")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>   drivers/usb/typec/tcpm/tcpm.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index dfbb94ddc98a..1ee00025de56 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -732,9 +732,14 @@ static const char * const pd_rev[] = {
>   	 (tcpm_cc_is_source((port)->cc2) && \
>   	  !tcpm_cc_is_source((port)->cc1)))
>   
> +#define tcpm_port_is_debug_source(port) \
> +	(tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2))
> +
> +#define tcpm_port_is_debug_sink(port) \
> +	(tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2))
> +
>   #define tcpm_port_is_debug(port) \
> -	((tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2)) || \
> -	 (tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2)))
> +	(tcpm_port_is_debug_source(port) || tcpm_port_is_debug_sink(port))
>   
>   #define tcpm_port_is_audio(port) \
>   	(tcpm_cc_is_audio((port)->cc1) && tcpm_cc_is_audio((port)->cc2))
> @@ -6360,10 +6365,10 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>   
>   	switch (port->state) {
>   	case TOGGLING:
> -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
>   		    tcpm_port_is_source(port))
>   			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> -		else if (tcpm_port_is_sink(port))
> +		else if (tcpm_port_is_debug_sink(port) || tcpm_port_is_sink(port))
>   			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>   		break;
>   	case CHECK_CONTAMINANT:
> @@ -6371,9 +6376,11 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>   		break;
>   	case SRC_UNATTACHED:
>   	case ACC_UNATTACHED:
> -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
>   		    tcpm_port_is_source(port))
>   			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> +		else if (tcpm_port_is_debug_sink(port))
> +			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>   		break;
>   	case SRC_ATTACH_WAIT:
>   		if (tcpm_port_is_disconnected(port) ||
> @@ -6395,7 +6402,7 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>   		}
>   		break;
>   	case SNK_UNATTACHED:
> -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		if (tcpm_port_is_debug_sink(port) || tcpm_port_is_audio(port) ||
>   		    tcpm_port_is_sink(port))
>   			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>   		break;


Thanks for submitting the patch.

Please can you also add changes in run_state_machine()? I think we can 
replace tcpm_port_is_debug() in SNK_ATTACH_WAIT case with 
tcpm_port_is_debug_sink(). Also, similar changes for SRC_ATTACH_WAIT case.


BR,

Amit


