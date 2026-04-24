Return-Path: <linux-usb+bounces-36474-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN1SOcXf62mdSQAAu9opvQ
	(envelope-from <linux-usb+bounces-36474-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 23:25:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 672C24637A2
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 23:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C8D2301F4A5
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 21:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAE33D47A3;
	Fri, 24 Apr 2026 21:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dY/+1xtx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0AC331202
	for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2026 21:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777065892; cv=none; b=iJKgeX7kJ66yezj/P6dIZBvtelOPhdkTztBuwHB6eY7P/7Is5Bu7UudsV87Wc77V7h0/tTJHtK9mbqN2w0kj5lNUiWuFtFu6QqkcrN64uUzysVSxH17mEPTu6Io1/AOJY01iojNshwE6VegbfGeYg3QNJ6fOw847gkqW4+H6tt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777065892; c=relaxed/simple;
	bh=OOvCfNvP/t9snDp0xVHuGAvs/3wkRapGCm8Nkw6btaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGYBy88zLgx4k+eNubTRI/UhQCwygIHNy20bxNdhmZdjsyrVpqShXPdjgIk1dl5Uo8IWDfkOewOtUylE9tKBhPt19OpnZ3szk+5cyr7/wlF6RUZK+VUy89NRoh9umiiBdHzJ3SoULVz9WexBkxlfhZaiHMimJm/LPrNNTzkDMUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dY/+1xtx; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6948b5b1c53so3476920eaf.1
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2026 14:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777065889; x=1777670689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJNaihlk3IRG5/RkBM+hnzAM1yk0Bb5wvtfDGLFoLmg=;
        b=dY/+1xtx+SuuEEFMy/nyh1hV0VYfqpre0zlY6Bale8cZz0M3edtnJlFm5fXXU9U6Bq
         wWknaXzBWyFeiNwkYLWzb/s2+Vgufruy/D5AiBRb+l4D7q+2veCOoBMPmBt0qwRObXXD
         B9IlaiBBgNbxTvKpwUt6Ht8H28aBqv1U9h08epaK92kdYeAi0BikoLoSBXrn8wYilOS7
         9IAfX83cFuRWTjVfAhRIMTRMf8OKg0mwd3B73rriWJ0EATF4mSnVqcgHmhHNJ7igo0Qc
         FhPux1joKW+DLHLuzXrHq9oQ7gEt4YEJ1PDUkKhLBfVB4Z5gYxcr2dRdCNJgUi50mJA/
         W1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777065889; x=1777670689;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJNaihlk3IRG5/RkBM+hnzAM1yk0Bb5wvtfDGLFoLmg=;
        b=B0Ra0UA3IypLF//Z39QpoW7SqmRvxOc6kEWhpsxHE+eEOOTk6HD4LzJEKOo7BOO1By
         8ENB1APIKA78HxTTmezSF6f5xYlJZ1/+UTnSX/+QMuM0E/M9JIvyyekGaRI7nsCp0vcg
         lhmomT1WCV2gZw4UpgOfdzOzu871r8edEcq9TDO6C7stFYJAoyH9ecf3+aojZpBqgA29
         T1vVTxZoacLcXhBP02InaOYdt47SMwiBuhRAuZKjLcqp7t7vDPLXOFEUbzwmifCigTmi
         PqutHoQcOOiXyg0ZefKdmbllNS5gKyZfaidQIE0YsU3DJEs/Ieq2T3nUy2DR/TDlmfEE
         lRnQ==
X-Gm-Message-State: AOJu0YxpKRcIXQbRhlj/cee6XVrgmD4AMUY0pFGF3KaEHqmKsgz7P3Dj
	gVbzLCPi1wPtn1gTje/ET9giP5HvvYCaO4RhAxP5SE33as6LwCJiY3uGErP0nkUwKA==
X-Gm-Gg: AeBDievoOrxXsQYXnxrFH15VR8CssNcmgcOqdC/qnxzOYLgfNQQNH5hiKrLYYD8uMb4
	TpixYnQjj7aqT3CLaZ5n+ASlzQjNobdhP4DLe/5MiT3s4bZGwALLex+xgS/if9R2cvfGz3QZtRz
	2p30AbVnaaIzKekj0VxX81EkJKW2aq1R9t4av5tbR7oAALmwpjQ21W6S6bW/DRaxryaCuMTuCMR
	bodDqwwRAANnI+gdLy1mFFbo9kPiFjEFq5AZh9s8pA3/rH661iq5DN9KW0Nco+kl/GYKBkL41Nl
	Y4LkZssQ7yCsbs0FhN/McT4k6a/MWaj1GOucvHR4v2FqhXtHF2xis0PBGc+oq8NKZpu4ppT6MQb
	fDMsqBKYoYP6PHE3JcoL+/b/8lyv+1dnF047guCdvcdBbabI+w2gmSbmYQezYKONiJpPwUiDAUl
	sbf+HfCoO44CZr9Pa3H+tHUoc5jcd2086ePwiZKepXmTb+n3gvXFVa+RPERwWg3Rp3YHlCrDgHM
	IK97uogj0j0+EwVNAuv
X-Received: by 2002:a05:6820:f026:b0:694:97ca:9ecf with SMTP id 006d021491bc7-69497caa1abmr10550455eaf.31.1777065888893;
        Fri, 24 Apr 2026 14:24:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:4570:89a0:8f46:c3fb:92e2:2f40? ([2600:1700:4570:89a0:8f46:c3fb:92e2:2f40])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69489e52aacsm9895971eaf.9.2026.04.24.14.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 14:24:48 -0700 (PDT)
Message-ID: <79039de4-aa33-430c-b004-ae98b2541f63@google.com>
Date: Fri, 24 Apr 2026 14:24:44 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: tcpm: fix debug accessory mode detection
 for sink ports
To: Xu Yang <xu.yang_2@nxp.com>, badhri@google.com,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 m.grzeschik@pengutronix.de
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com
References: <20260424074009.2979266-1-xu.yang_2@nxp.com>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <20260424074009.2979266-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 672C24637A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36474-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


On 4/24/26 12:40 AM, Xu Yang wrote:
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
> machine transitions comply with Type-C specification. Also update the logic
> in run_state_machine() to keep consistency.
>
> Fixes: 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into accessory mode debug")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Amit Sunil Dhamne <amitsd@google.com>


BR,

Amit

>
> ---
> Changes in v2:
>  - update tcpm_port_is_debug() in run_state_machine() as well
>    as suggested by Amit
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index dfbb94ddc98a..6d258efae6f0 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -732,9 +732,14 @@ static const char * const pd_rev[] = {
>  	 (tcpm_cc_is_source((port)->cc2) && \
>  	  !tcpm_cc_is_source((port)->cc1)))
>  
> +#define tcpm_port_is_debug_source(port) \
> +	(tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2))
> +
> +#define tcpm_port_is_debug_sink(port) \
> +	(tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2))
> +
>  #define tcpm_port_is_debug(port) \
> -	((tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2)) || \
> -	 (tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2)))
> +	(tcpm_port_is_debug_source(port) || tcpm_port_is_debug_sink(port))
>  
>  #define tcpm_port_is_audio(port) \
>  	(tcpm_cc_is_audio((port)->cc1) && tcpm_cc_is_audio((port)->cc2))
> @@ -5176,7 +5181,7 @@ static void run_state_machine(struct tcpm_port *port)
>  			tcpm_set_state(port, SNK_UNATTACHED, PD_T_DRP_SNK);
>  		break;
>  	case SRC_ATTACH_WAIT:
> -		if (tcpm_port_is_debug(port))
> +		if (tcpm_port_is_debug_source(port))
>  			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
>  				       port->timings.cc_debounce_time);
>  		else if (tcpm_port_is_audio(port))
> @@ -5434,7 +5439,7 @@ static void run_state_machine(struct tcpm_port *port)
>  			tcpm_set_state(port, SRC_UNATTACHED, PD_T_DRP_SRC);
>  		break;
>  	case SNK_ATTACH_WAIT:
> -		if (tcpm_port_is_debug(port))
> +		if (tcpm_port_is_debug_sink(port))
>  			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
>  				       PD_T_CC_DEBOUNCE);
>  		else if (tcpm_port_is_audio(port))
> @@ -5454,7 +5459,7 @@ static void run_state_machine(struct tcpm_port *port)
>  		if (tcpm_port_is_disconnected(port))
>  			tcpm_set_state(port, SNK_UNATTACHED,
>  				       PD_T_PD_DEBOUNCE);
> -		else if (tcpm_port_is_debug(port))
> +		else if (tcpm_port_is_debug_sink(port))
>  			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
>  				       PD_T_CC_DEBOUNCE);
>  		else if (tcpm_port_is_audio(port))
> @@ -6360,10 +6365,10 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  
>  	switch (port->state) {
>  	case TOGGLING:
> -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
>  		    tcpm_port_is_source(port))
>  			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> -		else if (tcpm_port_is_sink(port))
> +		else if (tcpm_port_is_debug_sink(port) || tcpm_port_is_sink(port))
>  			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>  		break;
>  	case CHECK_CONTAMINANT:
> @@ -6371,9 +6376,11 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  		break;
>  	case SRC_UNATTACHED:
>  	case ACC_UNATTACHED:
> -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
>  		    tcpm_port_is_source(port))
>  			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> +		else if (tcpm_port_is_debug_sink(port))
> +			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>  		break;
>  	case SRC_ATTACH_WAIT:
>  		if (tcpm_port_is_disconnected(port) ||
> @@ -6395,7 +6402,7 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  		}
>  		break;
>  	case SNK_UNATTACHED:
> -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		if (tcpm_port_is_debug_sink(port) || tcpm_port_is_audio(port) ||
>  		    tcpm_port_is_sink(port))
>  			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>  		break;

