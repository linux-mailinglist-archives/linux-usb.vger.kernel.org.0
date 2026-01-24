Return-Path: <linux-usb+bounces-32682-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOjYDZpXdWnYEAEAu9opvQ
	(envelope-from <linux-usb+bounces-32682-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 00:36:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA3A7F476
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 00:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C6BF300E73D
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 23:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7780B280033;
	Sat, 24 Jan 2026 23:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDqU9qOM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97D2273D75
	for <linux-usb@vger.kernel.org>; Sat, 24 Jan 2026 23:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769297807; cv=pass; b=CFNMnc9dd0s5qMWikrDPvDY2aqV82j7ehRgYCKKXwByCorEVMm4t2Y5qAum5CfCOajiyXKgqZl1EsZwBa8q4RMsB/ouoqCzC6V2SjcXMPOFza4pQ7WNBLFCbLIgmogYOughx23EoPSH4KqV5ukTanc5peuFET8OfXgRxQIoPAVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769297807; c=relaxed/simple;
	bh=ZaHznb2eN64DbWJ7gM939sh3G2lUK8wsCPW64wOURj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s4Wkxew1B15r76JKzu5t6HWiQrrCucfSJh8ei/PyRc90g8FDkEEuzJ2AnuZmXLt4sK0Eni882fH5G/uf1g3smGpbtNLQm4/K8m7BOFj95xQgaHPIkVJOSTYwBP/t/tAsIwid5Wk/TZPRPJsBCFYefO0EoQHnMjF6fFGBeMTJBPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDqU9qOM; arc=pass smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-8947e6ffd20so42999746d6.1
        for <linux-usb@vger.kernel.org>; Sat, 24 Jan 2026 15:36:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769297804; cv=none;
        d=google.com; s=arc-20240605;
        b=Ttbg8QODR+hISlclZXtUwUIZB0xNKelxnLMR3grJP6Ti/RxsfxTBoHfF7fcrjvwXO6
         VkSt2VwjJB3YJm4WFy9mo7QIRoOnTrCj8zlFH/fGUcuBM2IbqyzUuE/M5svL6WxRIzBH
         Ik5/xnKgxas9K32vzw/VjEnTt8X9iDQ4ah90dckidj6vb9fthfustuCpQUCx0ZFuSknw
         wjB9TmDe3/QU+ZRePcNzmm+j+A0HlXGRzis27Yls4KC6RNrZ7VKlRRcQd4s2xREkSZck
         Qj4Q9N4UiXQZfY8SdktNa4FXoVa1url9OrVGcA3k+JjQs91VvzGxDIqL+hLh35HNLkTd
         4uBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZaHznb2eN64DbWJ7gM939sh3G2lUK8wsCPW64wOURj4=;
        fh=KeQVD4RlFYIRkVx22c5jxFolGHGdd5SoQLys1cVubhA=;
        b=i2fjL1HvcwhDdChMF3R+sqQ+BhD9w6lxtyfuz1caWLXgtnsgBgwiaRozmutmfK4jbt
         AiSwFQW1XwAf6SDsMg7/oIjHGaiifc/xarrHJhyDpLp/tdRCIRo2efN1okBnbiuRnKxo
         U114DtxPhCx1FtdGPpTgUWKda88YyB2Y+LxAUkLL756mWrUdUGvKtJhZ8C7R+uHxEsNl
         tMNmgyBS6FABg0bOwwwdbKBDKpXj3BSnPsYfnBtb27App9WpbjaW3n7gAoM1UQVYscOr
         ih1nb5+7BGQ9lXb+m6po+uuwmba+JSCZ8AlswDO17ma2D0JFq6nUz21z7HROABMo1ud8
         KDoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769297804; x=1769902604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaHznb2eN64DbWJ7gM939sh3G2lUK8wsCPW64wOURj4=;
        b=BDqU9qOMlM3CmSl/swRB/GQfaxATaE54nzYNGfcc5mudpbtBzqol9FQkCfeIjIMBZl
         n+PRgxNPhMFXmF3zftHmCdTN49pySumbMwlr6KGFoNLDYgFxJzspeOn+5gvTWO0TJDdF
         zNzu/s9umns3hiGRhOVOfTV1pzGGBcG23G61rHtCOz7M9HhC/YZoiRsDngElmZC3+xx/
         tp/iMNtvLmYJNHEunyzlYJmPyY8lxIywQxvj4WEkMlsYmfJ6KTk3930UsrP2TDdqkrjV
         +t93WJdiD3/squxmuFWoMbcDwegSQdYvpS8qjTXr/xF5hRzy9zLGdl0CKL9UQ1so9TsH
         izDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769297804; x=1769902604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZaHznb2eN64DbWJ7gM939sh3G2lUK8wsCPW64wOURj4=;
        b=KumMnVwBZP82cR+5omS+qhT7pXK/xI3tKGypIukpbBuLaJ8wFHjHtvbtmyLc76SLas
         CWXt9lJFLAXL8VVZoSwJFp6sFb9PBcopdBShD/Dvf5PIqg9kkzJtFvKjJxzOnP1Tihga
         0I0nSjcNyalwl3Kgs/BscKpQN9J2jdpANheqzvO6OwyJkD8spsvoHACQR3pWo4fXTa9g
         9BGwzWVSLozmuwavKeVztA15ku864vUIPS+YMeaJ2W7Zl4ghBX/UAcQjY1RTPeqcfhtc
         ZJQGuljiAwr2ER9xiCPzXND2Of9q/Wdl+apE8Oc9mH382R+ZwBuFYwmxLmyEX+dvdjkT
         OlQg==
X-Forwarded-Encrypted: i=1; AJvYcCWqA9A3Ro579Lh/rNQvFgELm1nZceC7Pd3lO21+uJ10MtCoIw/ZhHRVhkAMLlK7F3rljcSLtH947lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YweP5xqofcya5a5Ip2x0PRgHXWDA6h8MnidXJ3JPs4GaRytwdRg
	TuuBjLKBqz6G06046c78iR951ycZfQ800iojSt7Unv2J1iwYGeDBcBETTbcWA2+hbHCsq1L9EW6
	mGxMRtQN4PdWCaeZqCqIqlh4qxsNDYfk=
X-Gm-Gg: AZuq6aJr9b5I2zb+Fk7I5huLB44zVoLPJ2Rsq6f/oWCmowg/NF/jGgR6twiNXsJ50AN
	3J81Uvje6b6/qQPZ0D8WwX8OGhI0TXh3W6WfaoFd0L+jVwZzQFFg9Eu+9XAhuK7NPLCkevDOVO8
	YXoh2lZ6EDpydYmpLP5NyTYYZA+vG9PwJDev1srMJUFXzFxUdp6RrEHEm2E3rSoKygTLu63WkGQ
	dMBmxIGb4WRxnuWv1Tyx9/Dgh5gly8WMoJoRFHK7bWRTHRwJZjbJQLoFfZvEb20cS1cl3l2CgZs
	uEg1Bt55XyMIlxneXN7IzLkAggK0Cs9LfT00Ql8z0k2pdx+eDL+6SYofH67afjxDYa+DwXFEKrH
	scis7l2FBBUk8VPU=
X-Received: by 2002:ad4:5c43:0:b0:894:48f6:3cc6 with SMTP id
 6a1803df08f44-894b07fcb94mr1744906d6.71.1769297804564; Sat, 24 Jan 2026
 15:36:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124102042.112101-1-enelsonmoore@gmail.com>
 <aXTHhI710LK1EsTG@smile.fi.intel.com> <CADkSEUjwCmowmo_AwZ7TNS2gDt0CLz6buvfjjXz7BrLfuokM4Q@mail.gmail.com>
 <e91dfc01-373d-4d3e-9dd4-9fb3be92f756@lunn.ch>
In-Reply-To: <e91dfc01-373d-4d3e-9dd4-9fb3be92f756@lunn.ch>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 24 Jan 2026 15:36:33 -0800
X-Gm-Features: AZwV_QgNvugEcJHinRroZKzzvHFL5kaADOzGROZA6gf-VsJzgt5_ETpYnZSqXbo
Message-ID: <CADkSEUhf5Dpy=yFNQBksEhKjwj-+n07ujADmVHFUv0go5pYbhQ@mail.gmail.com>
Subject: Re: [PATCH v2 net-next] net: usb: remove unnecessary get_drvinfo code
 and driver versions
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Peter Korsgaard <peter@korsgaard.com>, Petko Manolov <petkan@nucleusys.com>, 
	Steve Glendinning <steve.glendinning@shawell.net>, UNGLinuxDriver@microchip.com, 
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Oliver Neukum <oneukum@suse.com>, 
	=?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Deepanshu Kartikey <kartikey406@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Max Schulze <max.schulze@online.de>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>, 
	Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32682-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,korsgaard.com,nucleusys.com,shawell.net,microchip.com,fintech.ru,suse.com,piap.pl,gmail.com,pengutronix.de,online.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8AA3A7F476
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 2:23=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:

> It would of caused less confusion if you had just sent a follow up
> patch for smsc[79]5xx on its own.
That's good to know. I'll do that in the future if possible when I
overlook something.

> We prefer lots of small patches, they are easier to find time to
> review. Combing patches is generally the wrong things to do.
This is also helpful to know; thanks. I had assumed the opposite was
preferred (if the combined patch was fairly small) to reduce the
amount of mailing list traffic.

Sincerely,
Ethan

