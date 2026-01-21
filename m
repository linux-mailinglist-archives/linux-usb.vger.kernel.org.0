Return-Path: <linux-usb+bounces-32600-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICeRHUMUcWkwdQAAu9opvQ
	(envelope-from <linux-usb+bounces-32600-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 19:00:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8725AEA6
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 19:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8D178AAE080
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 17:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8907496907;
	Wed, 21 Jan 2026 16:52:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7C14968F8
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014364; cv=none; b=sVAZA9FSF3XzEmt0YLHnEwtw6yUYSEz+AHUENjvq0ptTjNZ98CngcYmoZKFxMu/LXDC7ivhI9h8tK9g6FFIb+e6/2PLC8nBDU2Q/fXU9i3kEgXUAKUVZJnK31NU4OOvrqPUNVPoKsPun5d50+50ITbzUhyMnE7PHiOOHaPibAp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014364; c=relaxed/simple;
	bh=b3ogj6jd4gJyBPweVAwHafFvv24RTzuF9Yh/ufegu6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7BV0ujnWDyz48q77dQxLsmcBnGImwlXlQ5dnDYtlIF0WW3PcjHmcyAlPaf2c1QIlmGqkaCghVQ6svLRDsRj6La8bErJrE6Lc3DTVEsihX6tMFDHfQ8fHm+rUCd4BgfKMXCF9bCC2S+j9vTjBfvvjEen+oGyVfNGAAvX7Z+uzxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56624fea96fso305535e0c.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 08:52:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014361; x=1769619161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOHs6ISbQt2/MtdrNsjI0sr5MDVl1C3NbAZup7ReLuc=;
        b=jNZumyJGKEXbKwvIzt0i15dcAXHXu2xIb0gqJCtILCDxVCacJ5UzjnPEbKAcseu8co
         uNpeKajiWBpj2VpoJVhYg99qFtM+3pniWBTkbh7QoNuL7bHKEGhpKHSyya9X0GTY3HDY
         KyeLYM6RkOXWWiwqdQ5uMLZde7AX52ZsjECYjHjfFYV2r4+SSUbKfOH028WzKZGwD7Aw
         mR9f4cY7/A7CpRW+zR9ndxEtzpGlH2R5N0KLoUDWaq8dAH1fJV+b+8oJxzIitFMqpxEA
         G7MydbgxSuNyJo2K0/Ckp/ZxJJGf5DAFEawSjCpPNyRYP4f1tYg2MjAnz6U1tFCZthnY
         t5eg==
X-Forwarded-Encrypted: i=1; AJvYcCVvzxRFZ2aukHa3Z36WqyuKI21STAGV23SPK+sOV49vxiYvMrR0bzZruI6gy+FkTqzLR+8vvk1ox9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsJt5amrPdVZRdib9zNW/or9z9Y+PPL0tFP/RK7um2AWYI8WIg
	Two1uvl03VGyeTzOQF08GGv2OfqSw9WUv0YPy229s5h/22Q4atd75c4Jf8F89J8J
X-Gm-Gg: AZuq6aL7DYr+u2Gyl1coCv7dVOUxNvAidPg+Gq+jat8ow/yYV3f6T88DxEze+aKGUHb
	yMqTcNjWS5SmbDODLLEBJR/rSfgc2EjD2J2sawYZxp0EW6297mufP46+wih8alycSsS2nUU4hKK
	2H236sCxtUIO6Yl4tuhdTgdwn8wD/wqS5/2DhDlvKqGZyrQ72P6V94S7LzGe2FVnjJTgD65HvoF
	foqbgNJdCdDDQAYrv62VGn5Ne3+ThyfQIEHkcFhfrtmVlB4oi6TXEXa+mRNrbBqev/G9zhoqMHs
	HG9jFDWqJCqwUd8rLhQlsrPVGegwDV45dJ+bp2ymE/T7W9nV+AYUr2AWpFuXEK+eko1C66Bov1+
	8anVFkviqSBSA5oP9HCJhSULW/FGk96oQ27q6ARk8Kpx5mAwftdpbWlezdl9KDapwiT1pRVa4+F
	55TCDQm31WwBpgWMN/Aya/vPXwkoy7dsS2LQvqNZQA9pt/fZkN
X-Received: by 2002:a05:6122:4682:b0:563:70b2:a5aa with SMTP id 71dfb90a1353d-5662d11eb02mr17476e0c.8.1769014361129;
        Wed, 21 Jan 2026 08:52:41 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b71016b4sm4167525e0c.17.2026.01.21.08.52.40
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 08:52:40 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-947fef8ebf4so746762241.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 08:52:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfGlJMmfGHGayvbBLp4wtdfgLGmVEk4LRrbQyOVEc/cs6EnEguINjsOa3hz5LZs5rYm8UDTOs3tW8=@vger.kernel.org
X-Received: by 2002:a05:6102:b12:b0:5df:abc1:e6b5 with SMTP id
 ada2fe7eead31-5f532eb9f05mr16958137.17.1769014360523; Wed, 21 Jan 2026
 08:52:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212193721.740055-1-david.laight.linux@gmail.com>
 <20251212193721.740055-4-david.laight.linux@gmail.com> <CAMuHMdV3WAxshZL9gw4+NeovX-9FjUZrk+coUAA7+=y6GmPECA@mail.gmail.com>
In-Reply-To: <CAMuHMdV3WAxshZL9gw4+NeovX-9FjUZrk+coUAA7+=y6GmPECA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Jan 2026 17:52:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUo_Xow2YwMaDzPUW8w-3O12nqguzvoR6ij0X3R+syvOA@mail.gmail.com>
X-Gm-Features: AZwV_QiSJroxALjrxdsqpeoTTwWrxn5dVEZ7lcW3LOyG_OvHN9voWIpFHqxAP7E
Message-ID: <CAMuHMdUo_Xow2YwMaDzPUW8w-3O12nqguzvoR6ij0X3R+syvOA@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] bitmap: Use FIELD_PREP() in expansion of FIELD_PREP_WM16()
To: david.laight.linux@gmail.com
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Crt Mori <cmo@melexis.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Luo Jie <quic_luoj@quicinc.com>, Peter Zijlstra <peterz@infradead.org>, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.24 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32600-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[gmail.com,rasmusvillemoes.dk,vger.kernel.org,bootlin.com,huawei.com,melexis.com,intel.com,quicinc.com,infradead.org,kernel.org,davemloft.net,linux.intel.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email]
X-Rspamd-Queue-Id: DE8725AEA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 21 Jan 2026 at 17:50, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 12 Dec 2025 at 20:38, <david.laight.linux@gmail.com> wrote:
> > From: David Laight <david.laight.linux@gmail.com>
> >
> > Instead of directly expanding __BF_FIELD_CHECK() (which really ought
> > not be used outside bitfield) and open-coding the generation of the
> > masked value, just call FIELD_PREP() and add an extra check for
> > the mask being at most 16 bits.
> > The extra check is added after calling FIELD_PREP() to get a sane
> > error message if 'mask' isn't constant.
> >
> > Remove the leading _ from the formal parameter names.
> > Prefix the local variables with _wm16_ to hopefully make them
> > unique.
> >
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Oops, just noticed  commit 2fb6915fa22dc552
("compiler_types.h: add "auto" as a macro for "__auto_type""),
so you want to do s/__auto_type/auto/g.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

