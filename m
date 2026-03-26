Return-Path: <linux-usb+bounces-35479-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K7xHCbSxGmw4AQAu9opvQ
	(envelope-from <linux-usb+bounces-35479-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 07:28:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 104F532FCE6
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 07:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1AED303774E
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 06:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2073B4EA3;
	Thu, 26 Mar 2026 06:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcmG5SSX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580363B38AE
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 06:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774506464; cv=none; b=aSLQQ/Ci8jUH+wBqri4o4cIda9B73oZVzIlOR+74jawA/yTr82Ek9E8L5AGN+bJo7eg1XfIfxp8HjFTEifylqrlIS518ECUChbKqYXrd9Y0RWoUv+JSUtiyFN5abUudwkTPIaIkVf930cye+vip4Th8lH3Gk20phAPPby03o8BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774506464; c=relaxed/simple;
	bh=t9KoS2RsfIogwqwcowCvWno4HLPDxGzBqya9ZfulrOc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gJfpPBX3OD8axeqikxL9N7k77CpXYUrTRDJp+zOCRugMThIVnW3Y2hvT6aSRhCWGsvql5KmkDU/aNelc/rPPUD+JbdiF/87ykLU7yC98J5wBx6k1zddW3IHfcGdPkoz4hyslnnT5oyEFMJvYkQ01LqnL0Bm/J4cHgdsgdAhjAls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RcmG5SSX; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66aed966c7eso601390a12.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 23:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774506460; x=1775111260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqeDJ1IpX+MOxp/pGIYBD1tduTELPWeLDwKkLbtAg34=;
        b=RcmG5SSXPLtukpl13Sj3xVRUTG0FfbIbyj1tPXVuNXAy1zaM+6eDYYO3podsPFA6RZ
         gTWFtwj3zz9u+zUIFFDRaH9Aa6xtm3Br0CuN2570esuZxV7QKoyRHZoHnjkDdAvU+nZC
         fxVc8Xq5N6WbCuBxNnGE7p3IKbXmQj7j6DPzLbNuWMTnTAyk/0WZzdMlmfQEcTEUmTm5
         AwAGmWT0dZAXLYR1H7t7FdRIe/nXaBiNMbzgcrKBD1PV1kn6iog2A5xpu5Im0i6VpHKP
         ZMvTsbVCFvQGXAJWfN6AbY/UeQLQOXrlwZcgxzqZaPUapDZDe0UgQnneZJjSZoCINbZJ
         4KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774506460; x=1775111260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hqeDJ1IpX+MOxp/pGIYBD1tduTELPWeLDwKkLbtAg34=;
        b=TkeE8B/3lGl1ltGCWci0ke2G7/L/oiaRVFdkVOjWX2H0oGMA/AlKNSoXVcUqVmuEX6
         Dt+qgZxCPChHsAWCx0kWd+PyM4EPdeFh8xfYPufWS5zCFXliYeAdwxQQQXCukpLX1Rcs
         gl9XW+ZwfHL1f2wrr493q94CqxJLAQyWzn6EO11X1TVX8iyOg5a4k9bblX99a7gDRwOA
         i7wdgE90Fmchg73APDIVoRAjvN7Xrgep5G2pJbekpwbcAVqp/TZ/tQ75HeFbfRfGLy83
         KY6AwPaGVgazkZ1fWDOUikIz4xyjTiF3zyIphSOl1yRrD51WQEa6jz54oBo6FVOCvE1G
         Lowg==
X-Forwarded-Encrypted: i=1; AJvYcCXqIr3UxeZV5VnVz8R4juh6mKNsq6aHqrALXZCfQBpqIXlxUumc6RIW9f38dMow2c6wos5VpD5LSqU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz550yHE74z11ujsDsjWaVVyTh7A/47br9wMXyh79Gk98x0LDBu
	mgbmW99jbh3ZPBOEO3A4yeH5iSDqtLjO+rhb/tL5TwN4iQisvrcFAR0J
X-Gm-Gg: ATEYQzxkfsf6qu4Q92w9vZuZtdBSkJ0lfQXohLXfTjxtronxLCqLUDZOZE+6U/OayhP
	Zel2kK2Ou01hRN1YBZCzfG6lzXk8mQ/08Ok00d2eXeA+pmTVC60PrQrlIp6kv1yv0LKI92GuwDy
	reR9DqYFT0OACCQlWA4KTpcG0Z6RiSuA/QFxCQMgNv05zurgu16q6qrvECVTqs49kDSgM4IMIjz
	FbmaVXohbNIngx0W4TlmGlBEF91lCMAB98u5LKbDGACKSJ5Fl3r6j1YCu1vmYC3drX2zwVorqhV
	T3bfbL/IlVN9mtwEGl21Ci3174b3SFjuTK8Qm4DK/h6NCfiKx9JpLgZO4zDZhP0mS+h0fjZs1S0
	8D/CHLW1Xdq6getbIA0nUBZ0FKLRm5PuSM/ma11SH+6uuKiAYchUmPA9qKzPZoMqMCCQWvgMs9l
	Jeg8xTFPpOe1H+LBhQyGvH8X/GJgPgnLnMbtI=
X-Received: by 2002:a17:906:7316:b0:b9b:2456:989c with SMTP id a640c23a62f3a-b9b24569a89mr80938566b.6.1774506460067;
        Wed, 25 Mar 2026 23:27:40 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b2029b0a6sm76678366b.27.2026.03.25.23.27.39
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 25 Mar 2026 23:27:39 -0700 (PDT)
Date: Thu, 26 Mar 2026 07:27:35 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: translate ENOSPC for user space
Message-ID: <20260326072735.67707e66.michal.pecio@gmail.com>
In-Reply-To: <20260325145537.372993-1-oneukum@suse.com>
References: <20260325145537.372993-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35479-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 104F532FCE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 15:55:20 +0100, Oliver Neukum wrote:
> In case of insufficient bandwidth usb_submit_urb()
> returns -ENOSPC. Translating this to -EIO is not
> optimal. There are insufficient resources not
> an error. EBUSY is a better fit.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  include/linux/usb.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 04277af4bb9d..815f2212936e 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -2075,6 +2075,8 @@ static inline int usb_translate_errors(int error_code)
>  	case -ENODEV:
>  	case -EOPNOTSUPP:
>  		return error_code;
> +	case -ENOSPC:
> +		return -EBUSY;
>  	default:
>  		return -EIO;
>  	}

This function is used by serial drivers in syscalls like "set/get modem
control" and apparently also "write/read data" in cdc-wdm.

So when they fail because the USB I/O failed, does userspace really
care whether the I/O failed due to insufficient USB resources?
Are those syscalls documented to return EBUSY and is userspace expected
to handle it better than EIO in those particular cases?

I would assume that EBUSY means too many processes are trying to do too
many thing with this tty at once, and that's not the case. My recovery
might be to find such processes and kill them, and it wouldn't help.

What real world improvement was achieved? ;)

Does it ever happen? ENOSPC applies to periodic URBs, but that code
looks like sometihng that would end up using control or bulk.

Regards,
Michal

