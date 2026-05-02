Return-Path: <linux-usb+bounces-36848-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMGFL5o69mnFTAIAu9opvQ
	(envelope-from <linux-usb+bounces-36848-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 02 May 2026 19:55:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC9A4B31ED
	for <lists+linux-usb@lfdr.de>; Sat, 02 May 2026 19:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F21030034A3
	for <lists+linux-usb@lfdr.de>; Sat,  2 May 2026 17:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E846A38758F;
	Sat,  2 May 2026 17:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIgwAhY/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFA4337699
	for <linux-usb@vger.kernel.org>; Sat,  2 May 2026 17:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777744521; cv=pass; b=SEzSgvHIGf9k/Xg6/gg8sXH6ENm7e13Q6m+YZeFShrm3vey1eD3diYXqRokbT9oNlJk52bp4aZzEseBbM5LmtCGFCr95nFcsYBf1zcgGc0BGBvSQzuhM5taC9MxmNk4AsDqnOqPQqr13FJ+eW4TJYfl16G6x+RgEvwlTrRI3Hco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777744521; c=relaxed/simple;
	bh=P4J4SDo4bzmgeVa6s8Us9qEytCzNnqhMvTPTIrQiETs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BdKjUck+Lz++kwoIkuyWaSadSZq7MnubqM3W3kcQl22YgtSR10vhJdD4TID5ULi47LKV6DySNaRHvVFigeaaOK1iVrO2N/K92Hx0s+DX+Z45tkVEFZ1Rr27HE6Qrk3zrIqgWr8ACwHM4ltF238IT3IF8kUe3blEmmMjgCh2rKYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIgwAhY/; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7baee75f874so40161567b3.2
        for <linux-usb@vger.kernel.org>; Sat, 02 May 2026 10:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777744519; cv=none;
        d=google.com; s=arc-20240605;
        b=M75eb1SlUrXY9AWzdV6zNcElkv0Y2AxjBbfwf6mOxjP7rI1LdEQGTV4sy82WS/TzJl
         LLwYDrckvj1hkER0dUlnJDOAVnyfXf4OMxd5S6Jw97+gjf009aqklK4k6dlTj6LRhfTj
         Mcq454JXtqebhMTtQuoqTwdEEr0ZztC/RGMeZ9Asjo6G3mMTnNRDUmC6zmHzW2xOsuej
         XHyZjEAt6uArX93FmlXpASglYB+l5uQpDq48ewJOAaTwKrGk9egOZes6/ISbvzBOalEh
         OCHZp3+5Eb31QDU7ON0mZ75wnhig8fXJ18oq/JtJj5WUBSiCW0h/VGP4zP4TqcXW6Gfl
         EEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ev8IyTTMLXaZuuXCFyPzvb/PhlVdfC1G8D4cNo2j91Q=;
        fh=m3kMK+8hLg7Az/x45Jz+UYr6QDJ69x+rnefpMpYOQJY=;
        b=jRdlgX8MzT18ugjKSjYzpKmGFp0HWlitAbdCxEY4PxAkRot2M12YrvyumLzLIpKsOY
         LsyM+N8A3vAb6/R9f4fjnTzZaEgCNgNcZFr6eRZQEJ4xtOCbmNtxEE4Fnu8GFDUNZ+8S
         bKyOQCesQKgWzIt7x1sZ5MuqvIXDhifLWE+y/DL9W3j85wrX4+tUvExt5gCsahnVjMNC
         I2zKaBGCCkRRt0vyZY5B9SDKKFsFiJBqhqIk1Y1LsTZcFSFH4De/nJIAozVNqnIPpnNe
         gF6L1YWruhtJN+Z0gMu3bz/+1dyjhCmZdzpkMLI9SXFo8wQfGWJ44dZX/EABB3jFEHPY
         jOuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777744519; x=1778349319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ev8IyTTMLXaZuuXCFyPzvb/PhlVdfC1G8D4cNo2j91Q=;
        b=eIgwAhY/WzgzBkB1p7AgOtAnL4n3I/skKY9cCMgXx43iBKzDNzcoqoE+wVkJCKmLF5
         dBWlpGyHGFhsbOAzkujQyoEj2Ip7Pket30ocwsXwN9VHS3IqX1X3WWqeBzUgUnTccWhI
         54SWktZVVsQrU6cofGMwqjjlymRQkPXSSMbWU0z3D/LJMRX27Hxt+Ka1ncdvD/ocxP0p
         F5tlFhE2EUxWsFIOCimrZF5gzZdcmfVew+5X3fi6di8Hgk5C39Vxk/MPcKiAZI4FC67m
         1DzaN4BL1OKBX+TCenZHCJb2sn2KCR+xWdxZgVSZ8PGKhr24HcZ5/XSKTC6A4Vy/nRkN
         zwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777744519; x=1778349319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ev8IyTTMLXaZuuXCFyPzvb/PhlVdfC1G8D4cNo2j91Q=;
        b=dUvwjQMIzvj2l0js0LL4SGxESu1/0N8dCPBjMaBVtQxBaZEsSiByp8Ue+HWUImBKWD
         3WNN62W98o4pOd49o3MQnK5fPM9VmVya6U5/1E3zMvzMu3R6s2A5oxPsg8/Ghn8Bf+p0
         cOpQCob9u7rgwL5xAY1UFMelbIXa4jhMp/Hd9KCf1vNsd4BzbBZ7Qt33l96SqLkt3FRz
         VOrC1X3bDqnjDMnlLlxsOjcrh3vLPt9Xjv5w/m/sGXIcxaRCmR2KYh6sqYYVOufH5j6c
         ZNrV5jnHRsglX5iy/GxhdrEo4Z5Fd7dqHgKJtoCcRM7xGSFjtFrszM85BCX0zt4gF+In
         2rMA==
X-Gm-Message-State: AOJu0Yx14Fl8iEXg5X3bwNYZrlm1Q8oZeA9Qp44K4wJfhs4skVVzfrby
	bBlVqV4FsNnq0FNrzd8Zj7MrYZAHBAZTwq91uDz4CdlRFGq1Ba8rUVmWmcfhciFJuas/78wZmvi
	HdxpatsFXrcdTbPiGfizTixh1lDu8W28=
X-Gm-Gg: AeBDiev8fsCO83/3NIpoavMyS55wE6bL5CFuvA0Tw+duazPEaYc0Q34pFqOHy0hxAQI
	NrUJWC/4/OJblb9NzxUJm/5efNVk9P+uD795SuCnt7bKQ4Em93TRqmLCf6u3wVsZSKLedgBdIkA
	EreGguQPWB0+ju0vwrM/dW9zMgM/QQKxfBJGPeIAHtTB1TiOPxgsziFIuT7Q09FRp0DVhpQiCtN
	YADLRJzz3HMeiWA6T1dSmZ2H3tXdY5OzgCHsQfsIEqRWSYp77TO/eugBXvkMH5TQ804/jJDT+WO
	6LKi6u62TvwP46JkpHrk3Xcv0mk2ASF6IYPNEebvZe9w5CIT3Mc0AAopFA==
X-Received: by 2002:a05:690c:dd3:b0:7af:6904:3f3f with SMTP id
 00721157ae682-7bd77170409mr36446997b3.45.1777744519382; Sat, 02 May 2026
 10:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415032335.2826412-1-michael.bommarito@gmail.com>
 <20260415045246.GR3552@black.igk.intel.com> <20260415123221.225149-1-michael.bommarito@gmail.com>
 <20260415123221.225149-2-michael.bommarito@gmail.com> <20260427053537.GK557136@black.igk.intel.com>
In-Reply-To: <20260427053537.GK557136@black.igk.intel.com>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Sat, 2 May 2026 13:55:08 -0400
X-Gm-Features: AVHnY4L_1u4kS3SyeJ9fEQk3Eh0AKAKdWXFllmXlsTxskd_CuDXnT1HZk0Q5VCs
Message-ID: <CAJJ9bXy1PaWs_x=8sbFUR+MPCrctPhCM8kLjftRNHy2Scb8Mhw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] thunderbolt: property: reject u32 wrap in tb_property_entry_valid()
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Mika Westerberg <westeri@kernel.org>, 
	Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BDC9A4B31ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36848-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 1:35=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> I was about to apply these but noticed few stylistic issues so can you fi=
x
> those and send v3?
>
> On Wed, Apr 15, 2026 at 08:32:17AM -0400, Michael Bommarito wrote:
> > entry->value is u32 and entry->length is u16; the sum is performed in
> > u32 and wraps.  A malicious XDomain peer can pick
> > value =3D 0xFFFFFF00, length =3D 0x100 so the sum 0x100000000 wraps to =
0
>
> It's 0xffffff00 (e.g lower case).
>
> Ditto everywhere.

Sure, sorry for the slow turnaround.  Coming shortly.

Thanks,
Mike Bommarito

