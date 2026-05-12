Return-Path: <linux-usb+bounces-37298-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECuHGmXDAmp7wQEAu9opvQ
	(envelope-from <linux-usb+bounces-37298-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 08:06:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC7951AA8A
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 08:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 892EC302AF3E
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 06:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37094429825;
	Tue, 12 May 2026 06:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEHWRCep"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC62042DFFA
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 06:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778565975; cv=pass; b=X74calRysMoQhDT5B1LLwPot/oSWdexjyOMG2FKYu62eNmZWSMz6ufdiHlF8aZ0y1gL6tB6dmE6vgS6lAdQMjvdo906feA9qF9Tk8dN7RHaDMIcGuEaz4qmOZOtVxZQpCTQ8UmUYlVjWEjc39C6yMaVubljLn1j+zfctrgxDSUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778565975; c=relaxed/simple;
	bh=yxZL62iX8pebWS6AofBmV9FGACpi7rIEMuv0C7XnSII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlXVcu8HqvzLv2IP5wlWi8xbtYYJy1QFA7QLZzxd4VJU8xi4QP0kS84eCEukTutgz2qCB0dD7DhLsqgWmu+fliY00nuvN/gI4dM2C2gQjXADYN1rXskF8bCPjus3MroEcX5bvcMMBlcaJ0yv9HV+fBMkYAkN/w3nGQmcsNqWv8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tEHWRCep; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f7ca62a3c4so5218786eec.0
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 23:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778565970; cv=none;
        d=google.com; s=arc-20240605;
        b=UapYMgOlBrq4/U/bNAHXf1WMDjdCHSub1FNGZ8TBg0FUwexJWHLWF4kMITpE8PPgXP
         1SH+nxdg05dolEUbvFzcjcrQPUqRt66mphHMAN39t9/dK2pWaxUWx45MXerwzOPStvhV
         zMAg7HlGtem74B05FVPlWUl3tDlo0hqUjXpp2zwbXAUjpLiJM4CVDVSJcFqpcHAAiZVI
         /26bPQM5TPsJM4kFRAtZE/Q5MQeGl0dRbdbCqeLai8Z3yOKi8qvrmO//1u8FrwcNGgkn
         FOEqeVtmblyIzQoXGjakfL14mkA0MsOOYxdo2WhdgmxN+XKEG6TesmWXpaHOqtpqLNrY
         Chzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CrrmqA1MIjLw7p2PiJAG2cpDnb+P9Y0HrkTx6QFkzK8=;
        fh=QswhKyzEQLZWub6zsb/QESxVqmWg93o+mLmYAJbQbfI=;
        b=jYHi8JpHbWmOEtSadqjXVAtXfGvUCXVbb4pH4B30Bwp/y2EptIZwdnqO/m+3GwOzi+
         WV+ysWy/VLgpikwcMBoL7DuKalk9ZESaosNtk3CDucXabQ+ClkIXrVNaHMccYB0C0ifh
         aWRDgbkr4NRObT+QR3V3yulVjwNivaEHS7216IVOXzMzNTwyEL8uLHaLox/GokHPbQIm
         h/lSuF+V/JYyPKg1LhtOunLGSvK/iXjV0rnGU+c3bXLXJAEizJHdgkmG16wNabS/vmEr
         HFvVIadLhuZVz60naClDRtgwWjkadA0sHTzAAqG9XpsCp1oIcANnBBrWcIevud45GDcg
         +Fyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778565970; x=1779170770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrrmqA1MIjLw7p2PiJAG2cpDnb+P9Y0HrkTx6QFkzK8=;
        b=tEHWRCepdx5nmp6yIVCYqQVzLmcrQesovgaR9iEkViVeFajmSrIpSEYelr2lD2XxoP
         xh5y8Zvqn+p86e68KD2mvaQiqYvCBtE5yPAPTikVo2xqoL3Tzv1bOvc6AoLsBX9tMQ5x
         bYKhs3w7Wz6+rTS0+0PdymwNuR6Mrju/sIlosbiQTM7eQulfT33DGAwgDmm2ablH56dQ
         bWpBu7X7LqvzKybeZhNl7lGCCxcAzvLmd3Uqv1PZtG5EGNwdM3TqVIVGnx8neXBuwl/W
         L4ZL2IYFzfr7AuRSPKZt2mLvNKX42PoQwoqq4VK13MoKe4InA0vqbgWOu8BlRN8yU7AO
         0QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778565970; x=1779170770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CrrmqA1MIjLw7p2PiJAG2cpDnb+P9Y0HrkTx6QFkzK8=;
        b=sdf1v5is/xV9ftazs02aytOa5tFZWh4NiUAbpngHSc3fzALJ0iSId2FxtmYBh15xOe
         MRlO5y4ZXIXKqSQHvdzE7pnew4pXnAg3q3PP6AEZ/RJr6i+USArlXACnELjHLHow7Sgt
         7ia6W/0C6ArxCR397bezYLzGwDjAqSzrKw9wY6JPGI08o6cySQlND78iDQ44bq7Hap4z
         eYuV+WBzOKb/nEse+4EETFeEL6NhVS+0pvhSreXvnPw+WW02q3Av1sNAwVBD6Ps7bkSU
         dELrEvy9sL0qX0HszZZrKwC+toC76IkMX398/4lCoSywKbaS9BQN2TLeBL8Kfwz46lDw
         5pog==
X-Forwarded-Encrypted: i=1; AFNElJ8uIZmUDu1HN7GY+zmuphd3ZeNrP8WUpndF62ZTuOxlX0ue9j11sXcn2OTXTjvJv6sBpKWzo0csejg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwYWQKFZa5YoG1QbUk74SjyuPBtKJEWqUh1Nlbfyf+U3MVWeGR
	s3iNn0cuxP7HFZ+otTOV8eUOBmoDouujf3ROXZjy7cCACRRvrbW61B7ErKn4ydXCQZMOvjxX644
	Mgm5rCJzdOeCh4EjwUIzlcvr27AcG55g=
X-Gm-Gg: Acq92OHv0bjkjtS+bH5mqwSqipVLx7Khw4lrKiMig8CmduHJLnq0nz7CT+q/SgDn1g5
	jqSriBAdtZJT4+1rhOX6EahbsBEtHP9kR85c9mju3SRD5zCplEQjUb1YLY93FgyRGoFmqMT00XU
	8c0EjmNlCCnbGu6QscKZzZ0Gh3rYdIfkKVCRLWVErg7RvvN9CcxjClZrCOI0q8WQJqBs1cqVmUY
	hhonJySjTeC9qdxl98M6OG//BMpsP6o5A//L/kFUGZ9Madl6KPljpWGtnnOrJeARbRCnicvhsZY
	c8mimBYL
X-Received: by 2002:a05:7300:d70d:b0:2f5:3f62:37b4 with SMTP id
 5a478bee46e88-2f54c080b64mr13761984eec.8.1778565969672; Mon, 11 May 2026
 23:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511170548.0065fd07@kernel.org>
In-Reply-To: <20260511170548.0065fd07@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 12 May 2026 09:05:58 +0300
X-Gm-Features: AVHnY4J1P3ErzmBnYdLDEn2tVC5ojwqEMUhGov68STEE-MFG5Dk8UXTF_hePr8Q
Message-ID: <CAPVz0n3wcgaXzSLAMT=Yt=+FC=n7ufkn_CAaKNcyTr=a+7bdTQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] Add support for Infineon/Intel XMM6260 modem
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Peter Chen <peter.chen@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BFC7951AA8A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37298-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 03:0=
5 Jakub Kicinski <kuba@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, 11 May 2026 16:56:55 +0300 Svyatoslav Ryhel wrote:
> >   dt-bindings: usb: ci-hdrc-usb2: Document nvidia,external-control
> >     property
> >   usb: chipidea: tegra: Avoid controller/PHY init if bus is externally
> >     controlled
> >   dt-bindings: net: Document Infineon/Intel XMM6260 modem
> >   net: usb: Add Infineon XMM6260 Baseband modem support
> >   dt-bindings: phy: tegra: Document Nvidia Tegra XMM6260 PHY
> >   phy: tegra: Add support for Nvidia Tegra XMM6260 PHY
>
> You need to split this more on subsystem boundaries.

Yes, I will in v2. I needed an initial patchset combined to have a
reference point and show that all patches are logically linked.

