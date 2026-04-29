Return-Path: <linux-usb+bounces-36676-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDynCWXH8WnnkQEAu9opvQ
	(envelope-from <linux-usb+bounces-36676-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 10:55:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAC449164F
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 10:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 748BD3040A88
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 08:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A863B95FF;
	Wed, 29 Apr 2026 08:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYB5me19"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D781DF25C
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 08:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777452891; cv=none; b=go0Xbu86SJRPc+3+zEX1EnIBW8SaTpOvy4qIE/a2k5gTyvpjJcgG/3LdABvoiqsMIzQ/+0mt2FiWAkC20d6DqhEM02xKrHBPZZfBRx3CVPe3Hjb6zwzHjC9P4s58b+UQRpXOSGWL48MjcPEkO0gPVQWcYygY2HQLX/uo8/H1vMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777452891; c=relaxed/simple;
	bh=rFL8zZeALAWX0sL1JjYXAZfdQRS5oB6weeWKXIdZN1I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S/xajBip1XMCL2ncV6yAwmvEltBDx/v6qO8Xkk8VOqJE206UHKtWmgYR9NLMeuKXYg9xfqaJvHmrwzbk7zclxixQRdqL4uCQ8vQQ2sCYpYOqFM1WOtOkj3jxgoD90jYhk6E1NpckHTrsHAkt4ruQEEiQL1quEJEdftd3fFwFeeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYB5me19; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ba840146so109921885e9.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 01:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777452889; x=1778057689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7xnryUCB/v5J0ugmTYtLPymla+7Z+8S1aN3GqJpabw=;
        b=VYB5me19sIp0z4TNsd/CXFzmCgMNdhmzWP/NFMBQRW5AjO+LV72Sh2LjWpKPetAw7m
         p3Qs8Hx+HhsOUveX6va00V9APpqyfjWTYgTrVksFklMLNuOh3Budf69FIAsKODa+Ala4
         E4QV31rvqQzbV1qnmXDpvs1S6LAONzeWnU/o519Gr8RuBbFjWu0lqR71VQ99JdbK4wIx
         snSrlBj46ruid7Xewtjmgur45c5TlwecZKUJFEApQmpAQYjySiYdXW6SiIcuIDolr4yS
         WecYo01WHmowYwmdZTnaFwyk5SvBkC1mbbkJ1mr0Pxg8Rjk6fBuDELg0kjXyeNLSqqB4
         Bpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777452889; x=1778057689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d7xnryUCB/v5J0ugmTYtLPymla+7Z+8S1aN3GqJpabw=;
        b=GO5/GbxCK93ina6twTz5t2tt5GXDipxm0KtC/p7bE48NbvQakEM4J2oJYjxalusMHw
         K+YCH+vUktN30ccF/kyCxm+QlIzRAmuDdyTSD/jkc96RJR0xPYFr5iEQbeuefczgEysq
         /+20HwuGGJsYZTbKM5ALZjIxO8qD4Ud77/1exLRBAby9WycfKLBUzMs4/CLk1Dt2hUfp
         zAlNe3g0sTg1GO5ElsHBEypkkgoM4D8qsEGJQrRyO+K8+xi92XBsq8RaYqXtgtOYuxQt
         8BCkWNLxRm0qHSTVg6GfjwWt+Fv+JZ5EgMXuHy7YneySrO+n6Z7eFpCplHKUB9gK8FVY
         7Imw==
X-Forwarded-Encrypted: i=1; AFNElJ9GjxqwxdMM4VlQPoeu2ZkNCKuux6lO3ivY3OK7vqr98/03skvyW1ERAGHKFSKa/awVZkT0/ZUE+uc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLS8lcL+7s2MoOHlYJllgtzBr4u8bckjY9nQebJkN3VQlf26Qp
	MFTFbuSjzZaintvZeCBAZRKiLWsesbsGvQLjKMCiK5EQFvTnd/qCn22J
X-Gm-Gg: AeBDieuIBo0AdDyKxQvej76/Ncg+5sJaWGFPs4uz42ayLt1pI79Vj0CPTRUQoHCa35V
	3fI3aik7m6II4QlRFDSyQeCJONz4Ml0BhvKZd/ko5Jmzs0hw96s1a9LpjawMsCZgtbhM5t3Zjh3
	z6s2saCozGbQutD23ynoR8YInqD59LaF5KMtn28ZJm3WJNjkSSxuKquL7RKKEsHtLU1W2z3Vh1E
	VS2Hh/VI38HpNBAO8TRi2IRx30T638ne0g3PieP9i3Pmr0f/j6ctUic+EygkxZn9tVw9emkRkCe
	VBZfzdFPneZfe15HZOE5eK4KJ781q91uMCATxpNgsKxTTd0H4HXTx4TIeU6vGS9Ol4k4+rScH0F
	U37/5lFSStrfMXsTDOHSWVBzYtWYw3FzXG2BYq47kQbEqkh+KYBFc69vXDCGz1bP2c/UFuckUzN
	0P0YShaSL64U/z3EUx3EWA7fCbaKfVqi+WhcfmM5idu0m5wlaM0dIFssxfFqcCv9MKfiY0syFv+
	uw=
X-Received: by 2002:a05:600c:8582:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-48a77af3ddamr73694725e9.4.1777452888461;
        Wed, 29 Apr 2026 01:54:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc7a376sm40747555e9.11.2026.04.29.01.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:54:48 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:54:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: Maxwell Doose <m32285159@gmail.com>, badhri@google.com,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: replace strcpy with strscpy
Message-ID: <20260429095445.11b7302e@pumpkin>
In-Reply-To: <0643586e-e665-4592-b941-2868fca84322@google.com>
References: <20260419213638.38291-2-m32285159@gmail.com>
	<0643586e-e665-4592-b941-2868fca84322@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7BAC449164F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36676-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,google.com,linux.intel.com,linuxfoundation.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Thu, 23 Apr 2026 12:23:09 -0700
Amit Sunil Dhamne <amitsd@google.com> wrote:

> Hi Maxwell,
> 
> On 4/19/26 2:36 PM, Maxwell Doose wrote:
> > The function strcpy() is deprecated as it can be used in buffer overflow
> > attacks. This patch replaces strcpy() with strscpy() to improve
> > security and stability.
> >
> > Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> > ---
> >   drivers/usb/typec/tcpm/tcpm.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index 8e0e14a2704e..69574c5e79e1 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -725,7 +725,7 @@ static void _tcpm_log(struct tcpm_port *port, const char *fmt, va_list args)
> >   
> >   	if (tcpm_log_full(port)) {
> >   		port->logbuffer_head = max(port->logbuffer_head - 1, 0);
> > -		strcpy(tmpbuffer, "overflow");
> > +		strscpy(tmpbuffer, "overflow", sizeof(tmpbuffer))
> >   	}
> >   
> >   	if (port->logbuffer_head < 0 ||
> > @@ -841,10 +841,10 @@ static void tcpm_log_source_caps(struct tcpm_port *port)
> >   					  pdo_spr_avs_apdo_15v_to_20v_max_current_ma(pdo),
> >   					  pdo_spr_avs_apdo_src_peak_current(pdo));
> >   			else
> > -				strcpy(msg, "undefined APDO");
> > +				strscpy(msg, "undefined APDO", sizeof(msg));
> >   			break;
> >   		default:
> > -			strcpy(msg, "undefined");
> > +			strscpy(msg, "undefined", sizeof(msg));
> >   			break;
> >   		}
> >   		tcpm_log(port, " PDO %d: type %d, %s",  
> 
> This has already been fixed as part of [1].

It is also 'not a fix'.
strcpy() is fine for copying literal strings into arrays.
With the kernel headers you get a compile error from strcpy() if the string
is too long.
OTOH strscpy() will truncate overlong strings.

	David

> 
> [1] https://patch.msgid.link/20260310094434.3639602-5-aichao@kylinos.cn
> 
> 
> BR,
> 
> Amit
> 
> 


