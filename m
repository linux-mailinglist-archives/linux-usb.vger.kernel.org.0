Return-Path: <linux-usb+bounces-33064-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NvVOq/BgmkpaAMAu9opvQ
	(envelope-from <linux-usb+bounces-33064-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 04:49:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5095AE15D3
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 04:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59870306BD27
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 03:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7FE2DEA9B;
	Wed,  4 Feb 2026 03:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWo51G/m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7945F2609E3
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 03:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770176934; cv=pass; b=gp4u0ZodDMDf5dYa25Xwnd/ADQcp3h+N8GzalsuOUHCfSUoLeW3QbYWjAlAI8hPRhLH8ZRwh4cHJRA02y6EnzOwU3KhgyIQAsMCW1LXteSMwVUwZviVBP+bA3fPtMLuoeZrQnOpUM1hJ+gIePhiivQHyqaM2/C12B8g99vz3Oj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770176934; c=relaxed/simple;
	bh=uLLMBWLIDDT5SqH7t36Vle/i0dDcCJNJBxb7YsvANDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrneGex5NTv7TjU6T9gAdirZdBR0zzt2CxTUG+d/5eX0AHYiU1Ph0t1aUB5XAPf0AqRzoILWowEvCyp5ZvgEdmf+SyZhXNcHuyo4C62Aa/cLsVV+7Nnkx0pn1V11HPBL5oQ0Yhjz46hPhs0MlW6Q7XT2FmN94PTdW+VkQfNrmaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWo51G/m; arc=pass smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-8947e6ffd30so75965096d6.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Feb 2026 19:48:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770176932; cv=none;
        d=google.com; s=arc-20240605;
        b=CMB6dViO/3bC9foGUhoagEnzaLc4/rKYX07FBVwRXe+HIQL1yfOFyRBneEm4OU+/nt
         aLVKSRlOecrX+jAuL/yA8a2u2Uiy2yNq9WIB01TmrI8CLwWvbrI84BaPWNbsuO4601xA
         rwgEEvoQrEagK48bjUar3F8DnpqT4aDkYfZafwwCv60N9WJbUiLOrzkNyWLuSuz2Zaqd
         eBLChb8TpoLbvxEbj9q9Q6TZRxNEvNb/rCWXX0aqMTdUQnmC5WtnDe/4tR9TY0PYD6yr
         TR8OjnqamsBJZe90Y7HuS81HK/xVjYZBNVtYPyH8wB/I4ZDQ6lXaI+d3rWk5gX4Rkq2+
         R+2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uLLMBWLIDDT5SqH7t36Vle/i0dDcCJNJBxb7YsvANDI=;
        fh=xLPKfRP0MwWQRgc5DUhqlDxKo7VUIjvRHsw6SwmVfsA=;
        b=QUZFmruHBIF0/aG8+SFm/NnbNCDTMj0daJdPpk4ZPZKF+r+SjPwF4uiGmTrTDIKRFu
         I2fmfYwaykJ7+6ntc85AZmqNQ+nzA7xRN2o4vvds6b6/jdsGWkkvon/q4jf3cfqFywS9
         +VDqnafH8xmBjAVpP2LDx3vaeG/piNZb2eGnlaaPrEjIcGdqy1J6F1PeJ+zPzK4ef0Wa
         5333HnZpKQK7hHy31z/s00SiYf86yYsGW5ZJrKe7Hzke5Ub7zp6IiFzNd2NInZ5CfeFE
         M6cOFYhlm0K8/7wvGtk26dvNkApazTkjk7wOyT13l1y6hRAfSCe2N2cMn3cyDZyfIHEb
         SGuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770176932; x=1770781732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLLMBWLIDDT5SqH7t36Vle/i0dDcCJNJBxb7YsvANDI=;
        b=mWo51G/mDAY20nn1T4MJRp1jd0G5acwgYarmAzAA5RORz3oROyOseodYSfROtg7jGJ
         iC3oHoQTE7CcWy3/L2j5ZbArTxNQB4RKpcpWHwwYgr2v9+KK0LUxhqwl0imO/+dfok1U
         48CPei+UqBQxYui1r0QjnVdkdsAasIej0CD4/mZaprPylw+uRnOEslQ4wMQB/uSCMpWQ
         eZle+bRfvxLivYg6UYwa4ixVd5URNGTLvG21ZpZVNw/DNutUVMBseiPCfcRwgzVQGtjA
         fTboTRi/edJtV6CAZIhvEZ8t+A4KPEfEcksf7brNvR/UsKYs1107PJG9TKn6h5YKULN9
         v3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770176932; x=1770781732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uLLMBWLIDDT5SqH7t36Vle/i0dDcCJNJBxb7YsvANDI=;
        b=PX8GhdI8rdmtsxIU8LZD4gVF9wCBuT+DsZTfh90fv0Dlsu/n/4eckRq9fH9DV4TXFh
         hwYRwwXZliKadfdxyTB+tTSAYHztemjwVZ5gllOBNXfGOF8Sf1C4OT+buv32cdkwbR8I
         fabPIsiKItS+Fsls4sSviu191QTS5mJRW0YCAr7A2KisWk6oY6FMlJShbyn1oALnigYU
         efkyPIujahr/toTPc19dNGULshaXh0QSqiT4mGHLm9B8Z8gNjvKc5bfAcUAR2rpGOBMR
         4XM9TqCR9j5WqBPYiTsqoSL4amDZuY5etp1ym361nVwa5dPmShH+Di7Hqls8Fady0+bV
         +uHA==
X-Gm-Message-State: AOJu0YzrtExSOgWxwr2ON2R2Dzsoae7ppy5NApRnV2CEbEFOdwFhX7wC
	fVotPpTgluQyh3b3ImvbJhdGbada2YMAUaVA0BZ2n6kcd/mcfi4xD7R58qkJCAnJIvWR+dqfb5j
	/oJdRezZBMOkIrBU++W8mTVDYgdqQ5aM=
X-Gm-Gg: AZuq6aJSFmWpQNI0xqKVlMFCZ1kbvqtnpXb14dtKpotUATHMfJmKhcew1Gvme72Iq+W
	luOpxIVEgnJaxm4AbnpUecr1bn81OeIDNU7tWXlqwP0QdGIm1hIT2xq2QCYmuvi9T/eVtYZpwPC
	TzK6Gk9WfZmrqWSaYocaAFTjrJ2ziCeU/KM5OfGaF+kwUGgVS7Lkwr4FnNwQeCFx6NssuqHR8UK
	sucYt6DAulVbdVN0VLLK9lTMtxlKcM3HH8bjnwpWyWT/9h0LGbPXB2xOK+8xi8DgACnS3ijJHwk
	/UAwrR/9EFQJc30Mj+u91BFppZC4eTW+jE0UI9Y2CULwIbkSZquN/+iZX2Fj8+ILLyo=
X-Received: by 2002:a05:6214:1bc5:b0:880:1be2:82d4 with SMTP id
 6a1803df08f44-89522119a79mr23496026d6.26.1770176932276; Tue, 03 Feb 2026
 19:48:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203013517.26170-1-enelsonmoore@gmail.com>
 <aYGw80IvE0TG7WOx@smile.fi.intel.com> <CADkSEUgmX1tk-qJ7ee=P3EYcvriW91nVJZ6AFDpVEVjj7O8pJg@mail.gmail.com>
 <aYHEplTvRrfhCRQu@smile.fi.intel.com>
In-Reply-To: <aYHEplTvRrfhCRQu@smile.fi.intel.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Tue, 3 Feb 2026 19:48:41 -0800
X-Gm-Features: AZwV_QgYJisyZb-ild0a9N_26R6AL-RAurLEwPs-lXJwQCftr7xNpwqmfzaHQyY
Message-ID: <CADkSEUjackVDC4+rti_V4XxjZ18YkD_6jdx7vKKkjRErExG0kQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4] net: usb: introduce usbnet_mii_ioctl helper function
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Peter Korsgaard <peter@korsgaard.com>, Steve Glendinning <steve.glendinning@shawell.net>, 
	Oliver Neukum <oneukum@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Max Schulze <max.schulze@online.de>, 
	=?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33064-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 5095AE15D3
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 1:49=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> I'm not sure. This makes it harder to read for no benefit. All non-static
> functions are part of the API.
While I can't fault your reasoning, respectfully, I think that
removing "extern" would just be pointless code churn.

Ethan

