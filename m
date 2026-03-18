Return-Path: <linux-usb+bounces-35032-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NOVIAppumnnWAIAu9opvQ
	(envelope-from <linux-usb+bounces-35032-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:57:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE93D2B892A
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCF60304601A
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 08:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1F73988F1;
	Wed, 18 Mar 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="afTqvm77"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A08A37B3E1
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 08:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773824219; cv=pass; b=Yd7TAZHuaEd/YLM9xCvI/XzbAyIrCnS6ollNtk/Qjdih63yn4nWTFZyvi5jyN//2GOjWzRuIjaksqPxrs2T1dHs9OFC6dFhAKqmVFnAqflq4hTScVQw5IHofDEZl7OANV3gHm4BajgQmn4yFG8D/wqDGzRZ/B/4zxvjEyhHHcX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773824219; c=relaxed/simple;
	bh=L53pObIS0rYVHm+piAwTMbQG38WFZI9xZa3E0ELmHKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UB2EyyxISNQ05gR8lwwsuY79hxivT3cZMDfk833Se1uVLKWDz06UZzcH89ZjE8Qfh4ShDIErYu99ffKpVdDQTuozL5fkZDOlKz1EB5qrt+Sq9zkGwd5ZnRnGHGaObdmuC8CHaepcBOJlN+QlwK9OhOw45FQgB0DNKBt+ZONgCO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=afTqvm77; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-667952a44dfso1601681a12.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 01:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773824215; cv=none;
        d=google.com; s=arc-20240605;
        b=DCHy8wX2Qy8z4UAKfvADyW7u7Z/9ri3arnstZeWOq7d2Fna+EW1XGaF0LVg51FvH5i
         OkOpRd702Vqr3zCC0wVibszta6J6RVqw/essfiPoQIbxS0j9ISpu88gI4C8wqOH2C8WN
         CMYBl2PHKy3CokGDdi9DPR+oktF/hvFgxfFidmgo245OQv9FY4cV98Qg+Hb5u1EBnFZe
         2D5nEu4YEDNULilfrt0URQMEKiauNqQhQi3WeoFrRhU6YskQbgkZV+TCUD8z4tsvPCFn
         f2H4H6ZEm1B/OLSAGROQ4o8rWBKbZd8G21zm1f6k/GgvWTi5wDv71c4fyYjQxuZGyJJH
         vIhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BiHpCwGFAOs/wXB6PtDSepAcPps28mvRmd8j+A87AOk=;
        fh=rltyMGJ85gJz7hXa9rjSl3X1Mkr6xpYj1LoiGFLHVmM=;
        b=h/pvNJGfwSylO1PRvM+crFaqKDugWLPVAM/3X3VJYQlAGcYjM0IL/3zTkLf2CsgjYp
         98dvrdyBZzleHnsZvGCspyMN2hEehp2WHCfayJVlgU/q0etC8JoSIKaIbfQfdidYQ9fh
         GipaL8p4SRehncj5doeUCN9zXMcIPXkL+K7pPoRpD81gG4kRnNvSA/d2ZBNhOIXGDtfY
         4TilQKLxOyoMz15BmYsLdBxkg8naQ9k2K4Eto7YOJ89kI7cpcUcDSsR67c2FPI5PiTCS
         C9l6liOMD+NRkrjbO6eoN72hhJaGCRfZRdcUWgnT51wd5NabUd91BdUt8BEjuvYViDbc
         vJEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773824215; x=1774429015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiHpCwGFAOs/wXB6PtDSepAcPps28mvRmd8j+A87AOk=;
        b=afTqvm77EZBe9MDhzsOB7rzORylsTETQIndsnzjA24hK9joA8atogvXra65QNrJ2YZ
         2phQ5WwzIXpoO2D3pt+yjKR633IW9/kf3ifE5MuVbt/NDKFvbpJyjWqg7lCXimFVl4Hm
         FvlY3ZYSGCZFns6FUA/RpCKdYIM7R1kDRA/8UN//1edUNapMOB6QnU4opvflNTHS65Pv
         MihTEAFz5MnCz+aOeVfCJDwn1nWeViV8PSQXdGI/22dFWQc05JbqtYGGNEmdtbAVbQaI
         HiSJGvTaeDVi3BFHubORqwReEtWSoH4QRs8wYsLFWsGFOxiZ3MAmVZVPdx31CopNle5o
         ihXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773824215; x=1774429015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BiHpCwGFAOs/wXB6PtDSepAcPps28mvRmd8j+A87AOk=;
        b=fUJOyCaP7TtG0n6fQVPXaE2o+OUIjyu1D2MZKB5BXUqp1EKf4HeVu47VhLF/cbOj+1
         g+BkbQdFJtSXHKcRaVqk3fARuB0FRnO4Q0SWSBWIhNylz9v5q+0FWTd0812xC9rN9b2t
         gcb55+01IUlUR5vqE25vaz1DP/mnrxq1Yn3Td1P5pwmr6phKij1OgnPQTea08adYUt5t
         0QYAbEkvPV4fVf5WJl+NxUzCQflWsRTWY8hE4kPhRsF9Kt1FCIbBL4cvbiYRxj2zGHaV
         6Hk8vxm7VmHBwKaZoZtteJ8CqpuTogAtJJNQ0Dks7xEtW+OXSGkiZ4yXPJxF34D2KZJ0
         2YvA==
X-Forwarded-Encrypted: i=1; AJvYcCWNoaRhOJs7P6giQj7/W4JSJej+Om5s1qgNP/puZptYkGXx71zqXYR96IcZTWnLTaUOsEg5if5Y74g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz7oGDYixpBiqAAb3J9i3oDXJKc9dhprK7yTmDt9VL+01bYxYJ
	27LHPezvaVGhQz+0pJloWA1J+hSzf09YCeHPb2aqWM4zQqbaimtxtEi+jioQSctdVeltwNqlNYm
	+j3xtjMX0X3O+GvMCvpfFVYc01R6XYKW9FdyyBmCjBjbT4fSbn6hYGxUhzA==
X-Gm-Gg: ATEYQzze0o0x9eBibGs9A/jdGtz4t/EfL4jClmeQZQ28Mt/wzQ1zdOQ7N44oCAkq23t
	TpG3r2dG6xnyCoccww14J3IoUh9QpAJ/vqsJWZO808IbrYrlhX44BRJ6+rCIpidTc7I1Om75I1C
	3wBplymUTIr0/HkJOWLyHYbYOIlBy5f0pjYfbkyqk7BVkCD2T9QObNm6liA1jpfrl7cPfZH42br
	hmRZyMDEkEEl5Lb5uEc/dafCZtu15JxAUvy3CZLpCO37FE8u698fV/0yHafr1PtTu1NKbMwN74/
	75K+dzJK
X-Received: by 2002:a17:907:c02:b0:b96:edcd:cd04 with SMTP id
 a640c23a62f3a-b97f4b16f67mr130546366b.49.1773824215550; Wed, 18 Mar 2026
 01:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
 <20260317-husb311-v2-5-03c17c986abe@flipper.net> <20260318-able-goose-of-downpour-db3bbd@quoll>
 <d925c15d-add5-4f2a-8eac-fa7dd1b56bf2@kernel.org> <CAKTNdwH7RswOSBZyVKvsHfhZ3-xwyDs7ywOHuafMFb1-xNf0PA@mail.gmail.com>
 <c816a7b4-5237-4732-85af-26b70dce57f5@kernel.org>
In-Reply-To: <c816a7b4-5237-4732-85af-26b70dce57f5@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 12:56:40 +0400
X-Gm-Features: AaiRm51Z1zxcom6oGEe1zlWDtcLo4AbRjORqgQ25Zd5ty1p7g_jEjtaNn5KvnQ8
Message-ID: <CAKTNdwE-d5c9gzCxc0sXErc-M6TGdsf8M+ZZ0yoVAH9h_bqTkg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: Add HUSB311 Type-C
 controller on RK3576 EVB1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gene Chen <gene_chen@richtek.com>, 
	Heiko Stuebner <heiko@sntech.de>, Yuanshen Cao <alex.caoys@gmail.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35032-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,sntech.de,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[flipper.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DE93D2B892A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 18/03/2026 09:30, Alexey Charkov wrote:
> > On Wed, Mar 18, 2026 at 12:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On 18/03/2026 09:17, Krzysztof Kozlowski wrote:
> >>> On Tue, Mar 17, 2026 at 10:08:02PM +0400, Alexey Charkov wrote:
> >>>> Rockchip RK3576 EVB1 board has a Hynetek HUSB311 USB Type-C controll=
er on
> >>>> its Type-C OTG port, which also supports DisplayPort Alternate Mode.
> >>>>
> >>>> Add the required DT nodes to enable basic HUSB311 operation.
> >>>>
> >>>> Note that for full support of mode and orientation switching, the US=
BDP
> >>>> PHY schema may need to be expanded, such as in [1]. This is left out=
 for
> >>>> now until the respective schema is finalized and merged.
> >>>>
> >>>> [1] https://lore.kernel.org/linux-rockchip/20260313-rockchip-usbdp-c=
leanup-v3-1-3e8fe89a35b5@collabora.com/
> >>>>
> >>>> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >>>> ---
> >>>>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 20 +++++++++++++=
+++++++
> >>>>  1 file changed, 20 insertions(+)
> >>>
> >>> DTS patch must not be in this patchset. Don't mix it.
> >>
> >> In case I am too vague: by don't mix it, I mean - separate DTS changes
> >> to independent patchset. They cannot be combined into USB posting.
> >
> > Thanks Krzysztof. I will split them out in the next submission. I
> > think it's important to first agree on the use of fallback compatibles
> > and the best way to handle the (already queued up in next) ET7304
> > patches this cycle before their bindings hit mainline. Then, I can
> > rebase and squash/split everything as required.
>
> These are independent problems. But if you want to connect them, then
> here you have:
> If I review the patch, Greg will take everything, defeating the purpose
> of my comment. So as you can see, I should rather not review them to
> achieve one of my goals.

I thought that having the DTS user with the binding that introduces
its existence helps the initial discussion. With the DTS change being
as minimal as it is here, it's definitely no biggie though.

I appreciate your guidance on the fact that Greg applies a series as a
whole. Will split up.

Best regards,
Alexey

