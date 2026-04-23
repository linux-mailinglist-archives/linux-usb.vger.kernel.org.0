Return-Path: <linux-usb+bounces-36457-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHx9GERy6mnuzQIAu9opvQ
	(envelope-from <linux-usb+bounces-36457-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 21:25:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD022456C82
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 21:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3CC030474E4
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 19:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98293921D6;
	Thu, 23 Apr 2026 19:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u1JyEJ76"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E7638F929
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 19:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776972194; cv=none; b=UAWEnQBp2tMP5zvXEUvpWygdeWzNmRoLxcact82YzchQvEGJ9jG2DpvsrPlP1CB02ZfRpIl+w13UwTtIr8fjRH20p8+69kzMlLinltxCDMjZdNkQoB2zarDn2/3RF0KbMjwaBiZkjZxeoRcKF/f0prePLLqNZvU+QHW9UTb3iEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776972194; c=relaxed/simple;
	bh=UJbZV/Bn9GKnU8ZhrGpz91SwhraLH8FknNu9AnV+LBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RyDuKok+AEoo/mznElWuDAhDti9q5/rudTXW0wBH//PGJrMenSMDq6kJYusWyNldPS7G0mdDKxTTsnhCJKfNp+Da4OsavjE/JDxqEFBdcqSQqiL+vB7DzFK/dmSQ3X1fZSBUjwYE7WC4fBZLD8NcA1eD/8MqqMacNPLxi1jt0ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u1JyEJ76; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso7486302eec.1
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 12:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776972192; x=1777576992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KpgheG35eXYQ8GLWRj5xPRmyPNvWWR7Dhs0tlVfh9Ts=;
        b=u1JyEJ76LuEfYCQs6Aw5SnVJWnnRFUNilob//uGQGyk5xH8AqCbBFJzIgXfE33IDmJ
         zn1He6D+JU2Ao1f2oHM3BPgS1gGqciY6hVkjxY9fa+yqR21Fg++3fze1tC0Ok5hhJtsJ
         idycThk41Pt1/GBqP93bR6i7cR9eBislrma0cEpLkiOYWE7aacnUgYu1whUuQ6KAZQsc
         hpqXFTSxaDZFRPEPzMg7bVMLLimXJshHFktz3lf3oIF7KQWhpup54P6BGydV1vEMeDEp
         sGSW+9DXXo6PNrEa+26xUhjg8NKYkqr7Y9SywLH4kS1Knnv1wnOXYkpDgLHN55pZVLWu
         7lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776972192; x=1777576992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpgheG35eXYQ8GLWRj5xPRmyPNvWWR7Dhs0tlVfh9Ts=;
        b=ITF1nLJF3aTkbRIkKeZ1AECdFmrZCNEX1BTw2uU/expMOJTfXZjbBOWfYNWuWM6I3l
         VOSDCMBsdUm9zlmFuOlm2Zii03PVKS+dJvDtSmtOIPXr3f7/ENgVFuXwBkm1BH3DyN4N
         XF7EqczLEe/gujy1yUlhFz80q9hwa1tRfcO190lu9FXKW65qO0qAJJV8XyeJZTIhZL9E
         KrxFn6+Kb60MbRzpAubC2uKdljfSfDuDz/7GvWcSKS+BULPCpmpHulSbqDxhkQ/LTbW/
         nis0qavFR2hCpz48SXWAxCT5EpJCxE4lLqtIoFJlHr9a2h3N5w+1lP/oR3WwFEmTlce5
         Iudw==
X-Gm-Message-State: AOJu0YzNDhr/g29fvsVcSkomOceZVqlF8jEG5pVkmaOcPeTgB76ykGxH
	MUDG36K0SXzNS8OM7oSeZjLnTNl9Yt17CdHgV+4EIXFijDPyxcriy38Nm4crQ+qZ/g==
X-Gm-Gg: AeBDieut2WVB7O4xc1yyd5KPPDYnLHyZwFBpbV7X0BWKjKlZqGLxdDwSh+mwYf8b/LK
	NFckW1wuYpRec7eK8JDgWkBtIrkvNrDZpOoxu17f1tmTfI7tsTFWdcWQSCDjrsqe34tvT3hkCuE
	aX3hpCOmZCTcNXujpCuRJ9dNcAfYpANgVfLvOORdwvqdwxzWiU8tfwEqH+ZyzkkzJkNJTCKdi5L
	wxUlOSjFAwQjbTSApKxRWPpGTHDqW0fgGWLFmO7Gha6IdFki9FcVhnBx7XTUuUDG57Ra2u+Auoe
	hXRDvohR2khiLNMs067qRVbwZkWI39Jos03KEirKS0M2CY9KtPFx43jTWDAjTWkjyIeJiZ10cOr
	8mSF2pGx3UW/rDXyv46TDGHNylHQQoDZy40UyZP2ycgTInB3FgNnvPt7bd9HzkkQefQlhcQxef9
	oPK0HGn9XUkauAu/T7feXW5yveowE/Obonb04Xn3Nsyt1p4P9iwpMAKMXRk2WrXvThIuxWRtk56
	2HF1QKF4szet95m2Ft14plpnepTl78lKsjUaZFjb2XBYB8=
X-Received: by 2002:a05:7300:220d:b0:2ce:25be:c8e8 with SMTP id 5a478bee46e88-2e477c9bb2dmr15432034eec.17.1776972191260;
        Thu, 23 Apr 2026 12:23:11 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:5cd3:e624:64db:3649? ([2a00:79e0:2e7c:8:5cd3:e624:64db:3649])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa244csm28207739eec.2.2026.04.23.12.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 12:23:10 -0700 (PDT)
Message-ID: <0643586e-e665-4592-b941-2868fca84322@google.com>
Date: Thu, 23 Apr 2026 12:23:09 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: tcpm: replace strcpy with strscpy
To: Maxwell Doose <m32285159@gmail.com>, badhri@google.com,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260419213638.38291-2-m32285159@gmail.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20260419213638.38291-2-m32285159@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36457-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,google.com,linux.intel.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: AD022456C82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Maxwell,

On 4/19/26 2:36 PM, Maxwell Doose wrote:
> The function strcpy() is deprecated as it can be used in buffer overflow
> attacks. This patch replaces strcpy() with strscpy() to improve
> security and stability.
>
> Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> ---
>   drivers/usb/typec/tcpm/tcpm.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 8e0e14a2704e..69574c5e79e1 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -725,7 +725,7 @@ static void _tcpm_log(struct tcpm_port *port, const char *fmt, va_list args)
>   
>   	if (tcpm_log_full(port)) {
>   		port->logbuffer_head = max(port->logbuffer_head - 1, 0);
> -		strcpy(tmpbuffer, "overflow");
> +		strscpy(tmpbuffer, "overflow", sizeof(tmpbuffer))
>   	}
>   
>   	if (port->logbuffer_head < 0 ||
> @@ -841,10 +841,10 @@ static void tcpm_log_source_caps(struct tcpm_port *port)
>   					  pdo_spr_avs_apdo_15v_to_20v_max_current_ma(pdo),
>   					  pdo_spr_avs_apdo_src_peak_current(pdo));
>   			else
> -				strcpy(msg, "undefined APDO");
> +				strscpy(msg, "undefined APDO", sizeof(msg));
>   			break;
>   		default:
> -			strcpy(msg, "undefined");
> +			strscpy(msg, "undefined", sizeof(msg));
>   			break;
>   		}
>   		tcpm_log(port, " PDO %d: type %d, %s",

This has already been fixed as part of [1].

[1] https://patch.msgid.link/20260310094434.3639602-5-aichao@kylinos.cn


BR,

Amit


