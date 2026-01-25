Return-Path: <linux-usb+bounces-32695-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePU2AfWPdmksSAEAu9opvQ
	(envelope-from <linux-usb+bounces-32695-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 22:49:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEE18291A
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 22:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B0B030078F2
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 21:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5840830DD31;
	Sun, 25 Jan 2026 21:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i366CjZu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E653EBF1B
	for <linux-usb@vger.kernel.org>; Sun, 25 Jan 2026 21:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769377765; cv=pass; b=ORvKTHWOWi3OoBScq8j8v+vHmJA1kdQz9Fx/rBol2tguZ6ON7HpqHQ0K9w+Q5tSujrerJri2CWLiBBSrT5KD3E6v+Tybw/zxnDyMbW9dxf9hcRZAqly5bfunXneJicAiiTwJuO9LlkTCg1dBrDsfVL30J1lkNuO4rqCr1ABLq5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769377765; c=relaxed/simple;
	bh=135DjDvKEI2uc25eqDc52rP4JGlGEXtVoqSTMRLtmXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UPyQA1QZj8q+oAdjosYXdT9rszGSXx0/D9Sc1ihwRMkrCFAKTq6g6EDaNsXfcoAgk8RrumW40w6+4gDWeGj92ENfjF4OR/Sz15LXnleE+YiopvUhiWiDVtIYm+uZ7px1Dgr+2uc+wxlFFCBvl4emxtzewLTQsTcq5qjwNbQyeHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i366CjZu; arc=pass smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8c5389c3d4cso457613585a.3
        for <linux-usb@vger.kernel.org>; Sun, 25 Jan 2026 13:49:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769377763; cv=none;
        d=google.com; s=arc-20240605;
        b=M/281N0blVTd42yEgX6LW2HV8JczRHxTRrPf52Y6ZPIUttyWKse/PMObjXHMCR8Kue
         6dqxev7qYnhE+83yLVAKj4qyLC/XxjiuZayUiSNjKrneoow8xvcicT4JMWo2kNbNiqEi
         FnuIp4krEA1rn7X9SxzKtvVc5V77oYVuS7TyF3O53bssL2/bS7OIvRV7uk0dicwp1rC7
         JyF+ELSGUIYF2q8OxqVK0Vz6HOjdLYR9EMCFjYLckqlSpwwrN9TymwL9R90jcdxzfl8c
         GsgO+KvWNTHHFTUq+rm+kNwu22at9KW3Sun/yY9wFTchkts4PNqUfpTiCi1vrzo7BdHM
         q+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yv/cme5pZKdjbm0hQuQgxHCXXEw9AsXBiyyA2aU7fPc=;
        fh=2Ls1Gec5fNdvQ+VRZnHUG6yR8LdIcBc5pQS44x0eUG8=;
        b=aSNk7PiCEmk90H9P75h9u6Gp2n81nIipPmHGcBVKpn+QMqphDK6I86VPyeBaOKqF6s
         trYS71/YNq4H/Kiq/0EbAHIHGOmnMfW6pkct4CQLBUY9iwgSwfRLSwEggpWdskPSnCIz
         r9NealNShxY0/JB2qrk9+yr40h1w5fL+MzhTmj4cB/dvY3p1waiVj+Hsq5xl8Eo1P0Vj
         oXC1nHZuj2c65bzIaJpTFQ2ikrnWfDVbS4wFWGkvj6ylrpJEE5qjneUflf7zaX/7e1aU
         FYlMFSrk6f5uLE+/p6xGFKXt+85EidabCOlWU6JtShZgyB4jBAwweqnU0wbHV4w28MXQ
         llxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769377763; x=1769982563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yv/cme5pZKdjbm0hQuQgxHCXXEw9AsXBiyyA2aU7fPc=;
        b=i366CjZu4rBHDpZwjgq6r9w1zyFTgjyvAiTHFpFpAlREhijBPu4ZK1J1mckv2vgdpl
         8CKRjtWUILChN2sJj8i54H9DQ9PHiXEAU+2B10BYSpGPybm7aqPI5fM68MOw1bksHkW2
         ZALSiXt6oxJwMoDcqrt8FcQ2yUS0xJp0w/7eqbtnj7VVyWWW2fmdA7dkIFn79y4LE+s9
         0IcEUNzdLFVtm6OzcW/iRBSW/FrzNeFssclGTdctuS0KAohy7S4lWE4fwruhIhyn8GZo
         AJWDrVCCtd0Fb2xrJ9iNRdSwb5ZFxhSOsRXlS8Biimc49ADxInP73MA9a8WNjtyX7IlC
         EcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769377763; x=1769982563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yv/cme5pZKdjbm0hQuQgxHCXXEw9AsXBiyyA2aU7fPc=;
        b=ExoZR5cJ/wbc73CYZslZ1zPqm8zG8drqd7TJfMtNNlnbKiRd+q0VEKLVzJ+cmLVyLG
         wPZGNLKhwHXWLk/IzXCYiAZ32P6VGiRtSq2RF6Hq5+1s5GhBwvnIcj10ZepOGT8alW2V
         ZsYjcF9yBfQjaJd53DvWFYq2i0EG3mP+IWM9lW2KV6LgbzKEyTrHb3dw80s5BPvtmja7
         ztAdy/jPZkJsfL6JKLLPx8waLQ8f6+zjDn1k6uKoDkiZe4fz0bDxjXaR8zloka6ffn/p
         C+RyOUmsHlId6qyj1rWPzT9DvlHgjDVqzhFSPtC9RS/WD7CpdNBintSeQxcQAd00YTLy
         fBTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXarOTSZSemcoCGnB46HAnvaBDzHUjIUgPIqjiq7zEke6ozwBhnrfr9n9omzmSGBdkxZVK5rTlUSbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2w732cz24o7DNYkfaaPanafVW5JH91ROFN0W3S68X7Q96zB7q
	1uouAjDr0MemFiuAzb7Mjk5FH4sku0ns+FY7LNxwm34gt21wtor9mDrdP4BopfGQ9W/b4iLwTys
	HGF8gPt/5wMA5iNzZy92tJE1mzengfHCkooIB
X-Gm-Gg: AZuq6aKTq0ICi92QMRcXj3vUHBv3wGc2QiNEijHxlyVL865oc9Ov3ONLEy2cIjprTRy
	RzG6xCjFvx5TrZRTnZIa1dVGISm4/rM/34Uo4yKIqb/+fDlNRFla72kNQgTmWVA6f/8r8QBkmqe
	jdWhM7XHL23LV3JvQGZX4HND+iELWdqk+Frv5PCIbt/213oCUTl1BYhK6bILKeb8EgsuB0R3lQ6
	+K574g7tGY2Js4Ff1Kf9kW5PEaLQvOI3U+aCj/vX0XasFVd6e1WpYkwt91J9mv0EEt2bsK/ZBbB
	EjtGlxX+AlsuaJfkG0uRwn4Xz2m4gWXOmas3e8caQnCqmPHL9H2c8gpxAsyj
X-Received: by 2002:a05:620a:1907:b0:8c6:ed3d:be60 with SMTP id
 af79cd13be357-8c6f9677d07mr305926085a.71.1769377763352; Sun, 25 Jan 2026
 13:49:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125083501.34513-1-enelsonmoore@gmail.com>
 <20260125083501.34513-2-enelsonmoore@gmail.com> <dd46b4ed-f0bb-4b69-938a-90237761673d@lunn.ch>
In-Reply-To: <dd46b4ed-f0bb-4b69-938a-90237761673d@lunn.ch>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 25 Jan 2026 13:49:12 -0800
X-Gm-Features: AZwV_QgN4pJpeNPpAJMIQ3LTcWEwCKbAmO00Ol4_bURVivKxKOSShXCP5azpLFc
Message-ID: <CADkSEUgjx9=tGMuoXUUNb_bnM8Qnk=xV+ydOx=AYNxSrHFm=aQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] net: usb: rtl8150: remove rtl8150_t typedef
 for struct rtl8150
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	Petko Manolov <petkan@nucleusys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32695-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4AEE18291A
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 8:40=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>   Netdev discourages patches which perform simple clean-ups, which are
>   not in the context of other work.
[...]
> These patches are getting into this territory. If you have these
> devices in your hand, and are going to add new features, when we might
> accept them as part of a bigger patchsets. Otherwise we are likely to
> reject them, they are just pointless churn.
Okay. I won't send patches like this in the future unless I am making
major changes to the code. (This is true of sr9700, which I will
continue to improve - I am working on documenting the registers and
planning to add support for missing features that the hardware
supports.)

