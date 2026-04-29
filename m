Return-Path: <linux-usb+bounces-36712-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKisLXZb8mlYqAEAu9opvQ
	(envelope-from <linux-usb+bounces-36712-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 21:26:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63379499C3A
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 21:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6680306B2FE
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBEE34AB00;
	Wed, 29 Apr 2026 19:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROE+yuW2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D5C35028C
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 19:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490656; cv=none; b=Dh/a5b1HI85OGNjlf8G8q5N22DlSD+iyQYfr3SwsUBYCweA09R66QHTM1v67FpHb8ssglF1SeY7ONxgpwoiiT6h4B1R7DKfSyenA/0FXCNPD26IqVrs96kdyEuWxRvZioTwM9RTOj9lFoZ8WRNbRKjK1G71HVcYonU30pwQcTng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490656; c=relaxed/simple;
	bh=i1zf52zqHd2oA9nS1fgnbiAwGj1JkkbMXOVYP9i6Em8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NK5OpvMRL2uo6zkQgDaj6zLarO61tk7+HV5n6VxCMyug2dyHSlsSPLbnovR9d56+HQm2ipkKhuW1hu6Ge+r1oyJIdE8jkC1ccuhxV2uhV9AcD9WBP467QWiVte2gTAss+OVr+ffSd0Iwfr8LA0QbR/tysxS9mR3NPiEhCjwrAqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROE+yuW2; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38e91b06006so1103431fa.2
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 12:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777490652; x=1778095452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+KvDUbHyMLABdz/Z6srfkmx1iurx18zTvn8LksBANo=;
        b=ROE+yuW2/GvoxyeOjtHD+f12wNdS2WHRQPGdRSrbT++PGGFzrtMN9W1XZSTgR699qV
         0KSBu06jPRiJoQKN5xqwuI+YTO7CCpH2YTja54fyHtxfJsnRtmvuu8ELMLhxlPDWD4dk
         LTMb0yFIj/1E/qXwTLN/pG+M1p7pM0V+ENAJRPfA9kjrK/f3SzENwHMqUS7PsPaC2C1s
         W8BzLwG4BL5laVpy65FQqDt7X4LO0/XrqMa1gw99PVYOXq4Kx1SNFxPeJBjVRcMeYme4
         G6K8gAYoMwJCVIp5Rl7BLdWZ9meY8QqaW4brEc96W4XW41O9P+l0RXSZMSvS7EWKnQ/V
         mkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490652; x=1778095452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K+KvDUbHyMLABdz/Z6srfkmx1iurx18zTvn8LksBANo=;
        b=mfDYD2h5bpu3bNV6/wftg3W4+jtWkGrgujfUzFL37VBBR/5u1XLsHBWvjOq+MGOaJR
         +hlWFMwc0eflLsh0JLSXX+iSWZaIHEErRgKxYoot3R25VXeUXl0oJQFSBRJFRA4yJUh5
         N3MwfeRr7dSlZf1eboHmFAh91sxdWV3XPDHiBFv59tg59EsN7RwSZRqhl6F35oW/4kjz
         0dGlbwx8AOyOVSavlrwHh+KH3JZYkjS+TOqLynMln8rY/ML9AdnczslXN5NEMeleYy87
         Y7bHThDUHfTMdO+9cY/Di8lW/YKI7Jtpgamz76ISJK8B8qqhUScpY2kHs78j5btdTBlN
         Q2wg==
X-Forwarded-Encrypted: i=1; AFNElJ+Ls5PQHKAW+QNT0QHCzeVjg1fI+D+CfYjIyqxZMxpKPa3zKsy36BEcQ6i9Fbf3xz284/KM85pC52I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6nq6qPu7nfhbpFo9PK5Jo+R+EODBLsYcxcHJVUDakQMCpjGqd
	5iZQxu+R/Stl7kOOrkuQKyjBak55bhBJfHU0CVcoQK9rAxsgi5qdpmFW
X-Gm-Gg: AeBDies9fDeNhSy0Xx3pP5t3lSxt3MsEDdhmtIBwIUvVYkNsZE8eHRzehSuyfH/1PAX
	7RZ0dSnAFzm4hB+zrZ8ZEWGQTOog60y9ArNjcNbauTAfEdve6AHXoh62nPVoIyIOQD+baipWUYh
	AwIDk9OUlTkUxa5nBDkHZePGLTh9VdfpRjA7SSEeTtoRl7SR3mx5cxtJB/4v6mfrACRSy0gCDwp
	ZKeKLNR4FaAcV2qvnp44Kunbz7N/UbPJ1/FP8YtIPHep5pM1IUc0gjvuYB3HE6PxeXcqIblyI9t
	r7+0Ch/cOTjUIkRvzBMV4KCJqrXSqadibujajI9X/lSS5r3BW0M5Oa+3mX24VLVPiUV6H7WqUSm
	XFLMw+NjLfNICvxUpEyypc5TdpFtB/5gD0eeiUwhMX17WdpLmfXdv6T13osy5G83rWV0NAbHL1i
	FzTIgckwoNAnJju3xXRw4DbTomefJToN9rouFlvrkRJZY=
X-Received: by 2002:a05:651c:886:b0:38e:9667:f21a with SMTP id 38308e7fff4ca-39240f70aecmr31078401fa.20.1777490651901;
        Wed, 29 Apr 2026 12:24:11 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3924f9484e3sm7561031fa.5.2026.04.29.12.24.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 29 Apr 2026 12:24:11 -0700 (PDT)
Date: Wed, 29 Apr 2026 21:24:08 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Brent Page <brentfpage@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: TT budgeting for EHCI; accommodate 1023-byte full-speed
 =?UTF-8?B?aXNvY2hyb25vdXPigJNpbg==?= endpoints
Message-ID: <20260429212408.299826a4.michal.pecio@gmail.com>
In-Reply-To: <a3176296-bf99-4486-9310-0b70f28c1ba7@rowland.harvard.edu>
References: <B66AE752-B09C-49B3-A829-F7ABB36FB250@gmail.com>
	<32291bf6-0c9d-4fd9-9dd7-489f7e1c9f02@rowland.harvard.edu>
	<20260429113604.2204b646.michal.pecio@gmail.com>
	<a3176296-bf99-4486-9310-0b70f28c1ba7@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 63379499C3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36712-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, 29 Apr 2026 13:56:01 -0400, Alan Stern wrote:
> On Wed, Apr 29, 2026 at 11:36:04AM +0200, Michal Pecio wrote:
> > The host must schedule SSPLITs assuming no bit-stuffing to prevent TT
> > buffer underrun on long OUT packets. Assuming minimum/no packet headers
> > further minimizes downstream idle. TTs are required to buffer this.  
> 
> There's a difference between scheduling and budgeting; it sounds like 
> you are mixing them up.  Roughly speaking, scheduling refers to when 
> transactions actually take place whereas budgeting is concerned with 
> when a full/low-speed transaction's SSPLITs and CSPLITs take place.

I meant "scheduling" in the sense 11.18.2 and fig 11-61 use this term -
deciding which uframe to execute SSPLITs in. Of course it's practically
equivalent to "budgeting" the downstream transaction, so fair enough.

And what I really meant is that OUT SSPLITs must carry 188 byte payload
each and their count must be appropriate, that's all. If EHCI HW always
sends 188 bytes (if available) without babysitting, that's great.

> > (BTW, periodic transfers should occur before async. Could the TT run
> > out of periodic, do async, then get an unexpected periodic
> > transaction in the next uframe? What happens?)  
> 
> This can't happen as long as each SSPLIT transfers the smaller of 188 
> bytes or the number of bytes remaining.

Yes, but per spec transfers are budgeted based on wMaxPacketSize and
actual SSPLITs may be shorter, while subsequent transfers may still
remain budgeted into a future uframe.

So it seems that TT must cope with gaps. Maybe it's allowed to fill
them with async? I don't know, I haven't found clear answer yet.

> > Including packet headers for SSPLIT scheduling seems harmless unless
> > overestimated, but apparently it's not required. TTs must cope.  
> 
> Again, budgeting not scheduling, but yes.

As mentioned in the followup correction email, it seems to be required.
If nothing else, it ensures the 16 transactions per uframe limit. Not
sure if blind budgeting solely by limiting data bytes and transactions
per uframe would work as well. Probably not worth finding out.

> > BTW, does ehci-hcd support scheduling CSPLITs to Y0 of the next
> > frame? It's an edge case which likely won't occur with one 1023
> > byte endpoint, but it may occur with more periodic endpoints and
> > unlucky bit stuffing or with periodic BW limit carefully increased
> > for testing purposes.  
> 
> It does not support CSPLITs in Y7 of the current frame or Y0 of the
> next frame.  This is one of those limitations just mentioned.

Then I think it doesn't support 1023 byte packets at all. 1023/188=5.4
and if worst case bit stuffing factor is 7/6 then up to 6.3 uframes of
transfer time. Completion in Y5 or Y6 and CSPLIT required in Y7.

IOW, you play Russian Roulette with bit stuffing if you enable this.

> Adding support would complicate the driver considerably and yield
> relatively little benefit now that xHCI is so widespread.

Fun fact: not all xHCI supports it either.

Regards,
Michal

