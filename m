Return-Path: <linux-usb+bounces-32684-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKj1Nt+FdWm4FwEAu9opvQ
	(envelope-from <linux-usb+bounces-32684-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 03:54:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C84617F89E
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 03:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65C8A300D17F
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 02:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B5720ADD6;
	Sun, 25 Jan 2026 02:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvMahlos"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E938425776
	for <linux-usb@vger.kernel.org>; Sun, 25 Jan 2026 02:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769309650; cv=pass; b=YhQVhLqgjNX6aJUy8+LsJDNW7AtsIjQIBco8N2KuAOG+Y8YHgA0mIfUTmpOANmYiTA8BuipI3N4h/2LhfCZrh8/Csr0pGebnUmWZZ/U0MeaS/ejyminZQ5vfGoIukj5Ig6G0tSW3O8HzhNGVwoRaZTXfn1RkPCijRz244HuEEy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769309650; c=relaxed/simple;
	bh=IYHtsqgFcIUIvfYQbQe6IeYMlZr60r15jL45TpHiEIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k6AADAHQcXOMRV5GL5rSOJ37088dW9RSq3/sWR0TfnBcORijKd0Chrq+bL3e8YGs2Nv31SgZipceoiptMEb8JuNfkzJuEX3wgEv50mIfieuZsA0XJCMg2KvYm/fIGvttsAsmKboHEAu/k84sz/lzZkqA5EOtkM6BS6f5Ospp8Gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvMahlos; arc=pass smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c5384ee23fso399429785a.1
        for <linux-usb@vger.kernel.org>; Sat, 24 Jan 2026 18:54:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769309648; cv=none;
        d=google.com; s=arc-20240605;
        b=D26WvdBqD8VKiwaDs5dRlui+crGZNdRL+45Y3LVxUZc2Hfadwtx1gTI2tl8bM2A+8G
         fORCGfBDkli5A7iunA9/Ag8rzB/zgfuCf7yKWbwihsFK+VGAQF8jKH75k8rjMIWKxEqp
         24/mEa15U/m6xpgfcvVl8n8gUz0K/vHl4sjuzDfO175XpULTzkdRofFl+OWPLrutLTot
         ITlO1xEjMncBEyvHTr4BRRoNdnGQsLrfwT5Gko8XtzjorFZ73HgVCyEjMHAYwHh+xPXA
         wDH0Iiu8mh+O0t0KF8ogBxlyy/0ZUGljg3MVuCYa6fSL082V6gn1pZZmHWMKSBmsXX/E
         Qb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IYHtsqgFcIUIvfYQbQe6IeYMlZr60r15jL45TpHiEIQ=;
        fh=FUbNFE0PKWFVPat4HeYdNWZxrT5ANk+3Kjdm+TjOcPg=;
        b=dB9OlJ6Ff/SVkPrF13ssFiYb3DOgGXLAYANT/ky87qX7mgSS2j04VPfuN91Gqze/13
         f9aMz58EOBKx6zUe8HO3YaS7ly2TerY9oDBOKDKvptrn9q6wQA/FBYISTsm6EgqYaiRW
         hc8URbEBldlxERQAHTKmpPxxUraAdm7GYVyQYxnczq4hEPkuUVkKje4Yc8LyNZyWFC0A
         NKEzwymluG56TDaIpr/Ppkd2P8dngpRkPava3QONCoi1yGB6Z870wHK2wrBmzL9cd5Lj
         pmEtBYU9xjtI36J1hvuV5LAugLyk7GPV+OMTVlcYL8ArkVSd5b3KfKVfJ8Q9XXytaEBg
         3Q8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769309648; x=1769914448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYHtsqgFcIUIvfYQbQe6IeYMlZr60r15jL45TpHiEIQ=;
        b=MvMahlosfmiu9qXX45IgvGREP0NfgTiEhyhG+av4sfaiIpgRXC7776EGKoKQsGtZpR
         iSqHcisuY5TiLDSVFrZBYV50LwO0kU3mXEmIeTw0FRLlpUkVvCFD6S8M7eSk1oXC/iFo
         IhLCWC9uax9v1QUjx5hDM683NIhifMuA3QyDAFiraEYwEqBemaMHg+TyEc3t4J4UtxaY
         I5iAzvbhHBU2Xa2MnTlWOGMP7FxmD84A4DT0gE0QjbqqO64j4XyfDk7uSWS96zCETmIb
         3cTOlrQa7/V8Sdf1Uo7wkQJasR11T/rYcV/5oOKkuvnXzZHJqpnGgLp9cb2KhRZmWP9N
         HBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769309648; x=1769914448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IYHtsqgFcIUIvfYQbQe6IeYMlZr60r15jL45TpHiEIQ=;
        b=D/FWeRG7vpTuarvsetUU7P8GrOA88Dq076zhGEmkuVAl56FS/xXy3D4Fqq6bw+0TRq
         cnXwrBPZqDJTL6mKgCDHdXSie51Off6reGvvjIubA5QMjjVC8R0wzhkRbdMBHx9GMtae
         tMOv//KDjPC5YwccO/ISOci7k9e6X1WVS6YAN8ySQAcnaaUvpmCZFpWkWa6bicvrUy9B
         RfhfRi288uCswvyZWyqWqf/hzF2gz7QRU8aNqfBxVnr9bJqgJS5dHb2Y2rfUXyDAw35E
         OeH489Gc1dNH4OUYnw5wDHPaxP4dkL6ii9cZlWj2ZNS/AGOTTXaIVf5CXNrqiW0W2WWW
         g5fw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ2I0JSstbZZrPPt61wjUnrgpJxoNdfQLVIfbLjMUuUsAgGI7raAg2QC656d03OSBhkT5Jsg98I9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJX73GGn0HdmVBs4+S2weJ0S0fa3AXUD66dg8M99LTla5WdWDU
	q1fkVMPzRoy2qxEVuMOleOfQwWubMEpDduXAcDY0Q8JILieOSHVRdsvSnVkpSwb5Qrue4dFVwRN
	Tl8TPKim76pGR2Yz9Zb2d4+ZgRQ1ffUg=
X-Gm-Gg: AZuq6aKAisLeXl3P+U7KuehOYeqUu9ZhtOByuKA+9oGTQMNBf+BuKq6pNXx4AjrNlON
	Ai08wrAuM76af3PSOvg+Z5okRL/cw87Xe2zqDu/bXI65Fqc6H8dYKB3Vysot6IbHivQfRENZF2Z
	V1+TOVXSvO3O/PWcmINd/Kly7cM2S2bznrOc2z/tt04kUIvHIxTqTLJfy5oIE1nsdBejCEUOD2t
	XXT8wvw2Ifz4T3MgqoA3sll+w39WBh+rEe52Tsqur0n+JoQuDzuwIEaSYYpyH6M6Z6qFriGqQLB
	7jXwdt0FEqaOCnORqCJwjWdoTw1P66u0+RMgFX/IUu6N0Ub+dT5LbN+C
X-Received: by 2002:a05:622a:2c3:b0:501:4f3d:1469 with SMTP id
 d75a77b69052e-50314c55495mr7134931cf.52.1769309647832; Sat, 24 Jan 2026
 18:54:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124080136.75619-1-enelsonmoore@gmail.com> <8d17a810-9e74-4ef1-8fa7-3267a8678b40@lunn.ch>
In-Reply-To: <8d17a810-9e74-4ef1-8fa7-3267a8678b40@lunn.ch>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 24 Jan 2026 18:53:57 -0800
X-Gm-Features: AZwV_Qh5Nj-aIJJF_8HJO-NJrZ-96KaDX6vGZ_IV7_FiqKa5dzyv_xJzN9TZ2Uw
Message-ID: <CADkSEUig7Pp66nDx5ch+txDfNcbLj1wRUbC3n4a4pBuc9mBb4Q@mail.gmail.com>
Subject: Re: [PATCH net-next] net: usb: introduce usbnet_mii_ioctl helper function
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32684-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lunn.ch:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C84617F89E
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 10:48=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
> You are doing the same as phy_do_ioctl(), but for the old mii
> code. However, we also have phy_do_ioctl_running(). It might make
> sense to add usbnet_mii_ioctl_running()?

Hi, Andrew,

It makes sense in principle, but after applying my patch to smsc95xx
to use phy_do_ioctl_running, smsc75xx is the only driver that would
use such a function, so it would add complexity rather than removing
it.

Ethan

