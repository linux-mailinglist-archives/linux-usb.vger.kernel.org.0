Return-Path: <linux-usb+bounces-35027-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IEODwZkumklWAIAu9opvQ
	(envelope-from <linux-usb+bounces-35027-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:36:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4CA2B8262
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 368E4307F35C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 08:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA65F3815EA;
	Wed, 18 Mar 2026 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="PyipFHRL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BFA3815D1
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 08:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773822651; cv=pass; b=OYD/jeny0G0zvXcQifQ/4wY+2yINzJ2wG/PDeESK5l+Rz3HZHr6foMkg6fe2xqBKKAvipzCbsl/eYfD6xKIGlirbG9BvdOpq0jq97+iKul5UM99gk6+eqj90qAWLAvXs09DM2ZEJT4f+0jvIh9V/kyeImaXq2EBLl+H5BM66C4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773822651; c=relaxed/simple;
	bh=y5UOcqnH2MD5V2vd60aLTGsn4Lp/YNbijHlJE0Ujmi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzN71XU9/J7z43Uw8Ei8gkj3+HAv9fMJS+jYxizLPH+TUuzGqACvi9cJ+oZH8AOxEa/Hh72vFOLXj3BLnIUPBT76wd3JsDmsP4G6ikXRsPrX8OAVyMjT35LMmi5PICEhO3VUdMbm2znhuLzmlkhqpBn9/2THqp/Bm0rDOgIAZ6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=PyipFHRL; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-66778a3c1c4so2108670a12.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 01:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773822648; cv=none;
        d=google.com; s=arc-20240605;
        b=R2vh75IBxBy5lbYZXtd9pd2JNsiqTk2P+1DfcoG71W//vhZDsuKmVo9VfcBtUgVTmM
         GH4ZqfdsXYszJIxGOIMdlDgUJRmpwyqXiTPBV/S21PknLX8M3HvKwa9Dw/YpccCjDIHN
         u3ee6JtXmcj0xm0qv2IZwTorPActptYJukSYE6Z0wpTpig5XtBYTGsPVg+s/6dP1UxWO
         N77xTKMcuKtcWaJYz3YDD41rTnQyB/8AIMVjeiArRQ10cFa6cpdjduxiZjibUPAjVwKU
         Nk9VaJYYT2h8DXgEYeYwNycAG+W5bbTDNb5aWDsrhCVnjCm58KoIGlqskBJELKC/PCT6
         HfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BbWR2/gQozMOlanUkb5RxqFQxqhUpLHTgJQy5vCFP2w=;
        fh=0q7f+DFzLIKn6xs3BT49SGqTNZHZSr7l07VIxGptIWI=;
        b=cyy+lf/Nmz++FbAID1SGc1V96TPIHPVrHPWr186mBHUanoWMi0SDvUzKmCgv1pKi4U
         dnLKwB0GD1IW9r38foen+U7HwDz8k8VLC7snwKKI94j3CJQuCI9nAzGDziVm/qJtPWxU
         pFfG8KOtaWf0DmosKLr6w7WNSPmwMkReTrmXOsQdkL13OUrjs4wVmZtu/3yn97op2M4X
         j+D96hIqaUbodpj/n78IH9Nf6kmUSvQHUfNhSH19YXd3e/mnkY3RiUijGb3GGL2tM8L/
         jGYmfIVkV0C9Lpsv74jdWhde/M5yfxSBVz/P6oB8CduuztUS+Jl4YSxuAZA4ip72AoIF
         Swmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773822648; x=1774427448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbWR2/gQozMOlanUkb5RxqFQxqhUpLHTgJQy5vCFP2w=;
        b=PyipFHRLOZgpf1CaiRZsSj4hPJBn9Mc/WI6XgbagPRfqLft/8BlFGwjIUaUbUK/W6B
         vw1H6776ZDr+XB/yRF8NHiENlFSxQ0WTMkAZBYSJtAVIFU16kBP2IXbuXDaBRR1IV/cn
         aqK8mp53CWvHeY50lrifjbwUddzECMRjDqqUxD8YzXkaoBm/FAxDkyGWAbSuz3KCDcwG
         ywWhik7+Ic4KUHbmrbQzG7sjKLPuRHp5fJLPhZmRbQhbWsOwgsmV/AHycLX+OJ1UJeUQ
         e6LHP1mkVWKbmZKsKHtWj+UG45IgoSeVqY5z8bIXu/KiUkqQIziuETba+FNLiOloGVfg
         Y63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773822648; x=1774427448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BbWR2/gQozMOlanUkb5RxqFQxqhUpLHTgJQy5vCFP2w=;
        b=GSqgvjtHlWxuZ1favQCcar7XWT+SXKIZXpu5Dot/EDsMynjtew3+oLmQQi75qNGdrJ
         YPZ+ehrIuLoIK4q5QeIWGPbx1DtohxZaF7gf8fJHPc+sZYxlzCfGzfuC8aXrl2uVoBEJ
         kv8nxtYlF/WGw/qWNDHGCvrJIhtcxoxijSmkN1mhV1anX0BNUavYX64qG60Hn4lWAM/s
         23TFM9NRlJTCX4S/jyC8zEcG3eNsf22bv6kq3BYjogLZ4SrV+fPJ2Wra1ZolBkzVYCT/
         zFzSm10Ko7Fmcp5iJYeCuxAZIrJOT8MneZrhB1TmFRWqVo00mRTgQIE8nJzN+FMFVLYf
         8HcA==
X-Forwarded-Encrypted: i=1; AJvYcCVNX/dReUC7ecZRV1ghIdRfd4pUiAwUeLE7dEWc4XeRFv0aKCykdnRF0GW7ThdxlE/EqyxkD6GgWus=@vger.kernel.org
X-Gm-Message-State: AOJu0YxflGh4R/PQ51BrmrWFef69gYUTiSoEhLGXGZ1gqmKc8SZpur4n
	d3qekYWyhDWtdq8WXb58CUhI//dATIeA1vx0d8mOYHlr9tV0e71HXIJo0Q2ZqVZEYO0Ih7aQbyI
	EQuj8U9kVce3SOdH1YQpVrM2ocL9bnQvFU98PPLxD3A==
X-Gm-Gg: ATEYQzwoP2oUazfpKK4+UtwKnWRiovfrBDga5rG1cjJu7iWVOzSbHUaDtrPfU18MCdu
	vk25rm3qerWQMkIIHfpcFRQjMAOUBr2xq0HWDrK3UifisBPb0f/GpuWYwbKX2eRxVbQj5NMuCFG
	Vcql7lAcW/9Wx25yBC9EmaxCrDVCd1XEZYO63XQhm2RJSs1+9O2Wv4WL1CmaXFbmVU8nUAOeDVH
	UfisLveOW2VmgnnVGa46Ut4bqYwqUl3ZVPC9ZjETu/2cP1Z2dQVcUwR6MOddRVH4NWvfyTfrHwW
	WrXdOMEQ
X-Received: by 2002:a17:906:560b:b0:b97:b6de:8b70 with SMTP id
 a640c23a62f3a-b97f4a83971mr100061566b.45.1773822647758; Wed, 18 Mar 2026
 01:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
 <20260317-husb311-v2-5-03c17c986abe@flipper.net> <20260318-able-goose-of-downpour-db3bbd@quoll>
 <d925c15d-add5-4f2a-8eac-fa7dd1b56bf2@kernel.org>
In-Reply-To: <d925c15d-add5-4f2a-8eac-fa7dd1b56bf2@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 12:30:30 +0400
X-Gm-Features: AaiRm51FSOw7GXPkE6PrP7Z08J3AwH80SUW7rhgBPEdKkIl_8cJ7xjS_zqUlAVs
Message-ID: <CAKTNdwH7RswOSBZyVKvsHfhZ3-xwyDs7ywOHuafMFb1-xNf0PA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35027-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,sntech.de,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[flipper.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,flipper.net:dkim,flipper.net:email]
X-Rspamd-Queue-Id: CC4CA2B8262
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 18/03/2026 09:17, Krzysztof Kozlowski wrote:
> > On Tue, Mar 17, 2026 at 10:08:02PM +0400, Alexey Charkov wrote:
> >> Rockchip RK3576 EVB1 board has a Hynetek HUSB311 USB Type-C controller=
 on
> >> its Type-C OTG port, which also supports DisplayPort Alternate Mode.
> >>
> >> Add the required DT nodes to enable basic HUSB311 operation.
> >>
> >> Note that for full support of mode and orientation switching, the USBD=
P
> >> PHY schema may need to be expanded, such as in [1]. This is left out f=
or
> >> now until the respective schema is finalized and merged.
> >>
> >> [1] https://lore.kernel.org/linux-rockchip/20260313-rockchip-usbdp-cle=
anup-v3-1-3e8fe89a35b5@collabora.com/
> >>
> >> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >> ---
> >>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 20 +++++++++++++++=
+++++
> >>  1 file changed, 20 insertions(+)
> >
> > DTS patch must not be in this patchset. Don't mix it.
>
> In case I am too vague: by don't mix it, I mean - separate DTS changes
> to independent patchset. They cannot be combined into USB posting.

Thanks Krzysztof. I will split them out in the next submission. I
think it's important to first agree on the use of fallback compatibles
and the best way to handle the (already queued up in next) ET7304
patches this cycle before their bindings hit mainline. Then, I can
rebase and squash/split everything as required.

Best regards,
Alexey

