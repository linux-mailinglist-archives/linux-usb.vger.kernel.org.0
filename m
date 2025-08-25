Return-Path: <linux-usb+bounces-27234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49377B33792
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 09:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2D453B8E11
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 07:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97309199E94;
	Mon, 25 Aug 2025 07:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a74rQYgE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69871393DE4
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756106161; cv=none; b=cj7WczSQVYN0mk8Nz+kzvIL8xYRDGc1MFkd/3EP6ULWWqCScmw4y1pG38GRDP4DmRSnUDsUc9hvdaCnbjYSLWwnER0Bz6gJkeW5/raPeDUfyrCGO5eyEqHD4Gn26VSbm0kSeuOmGi0+tON3P4JdxvyyhtAeYve9DG/d00+IanlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756106161; c=relaxed/simple;
	bh=uXSnhe8W2AVbP2vnHrNQGR8eAqyfSIEu5SsLO6jRh8o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mZDNU9+XhRu0NvnaZz32JVatK5+QT3sby2MNwuTrvZnrS6uwcYjOelxoKLZzsH0VYmhUyFSQuqMlJs5BacrJsm3hXm85tOv3vVnCyvHL/f9yLiNmXNLkejL8fE1rigAh8mhPFo5HYQJ1ySCbx/OzXUC8RJl0glRR5KLh9Cckisc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a74rQYgE; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-333f8d24c6fso30002201fa.0
        for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 00:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756106157; x=1756710957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cR+8LvVi57TD5yB34AYwEXou3QzdqqOAMGG0TPLdTew=;
        b=a74rQYgEx9Z7F0Msp60myuXONBtjICYqoj1waeaR3N/OHK55MfTpc+vcyg5tKuyw5W
         ibYZuarVVbMNdkyfXhZoLbR1rMytNXLlzWuk4Mfz/+CAnK7t7MN93z/WNcMcDinOI/lR
         5MtahfUsbJv5GEFhk2yzNsd34QbxO//dkxcCxjJYmXBvCb/fOyq45QvFBNr6Qs39amTO
         m4yUtIZErz1M13Q7jophxu+nr20mGH8RJ8sWQB1kzwmNplf8jHqMMkhLmVpryxm/mDC/
         4DAzslKeGlcXkMIz6ahGbPr9TnpKwGztdwhIVZFjmEDq+4S/u0r0qSpiokFMdrXGx4xD
         UfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756106157; x=1756710957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cR+8LvVi57TD5yB34AYwEXou3QzdqqOAMGG0TPLdTew=;
        b=hdjdfyO5Y0ZOBqmIky/lPjeav0yjBHrd93s9tp8F7y8/lXVZ93CJ8tOUALtSuGjSCh
         QHAc3zSiDS26bzKWy/Vyi6n2HlA1hyXehU2gBxxc9mpMU/1zuWPKJ0+tFZD1ek2e8E/O
         FzSUQyUjjXh90hd9+69f2fXEiQpgWDqBWBn0CGzwnpx08t65o2vxHSb2PjuE90fXXQG9
         1dihyxDaEjDHBH5FuB0V4PgZvhs68ndNGpTwNvV8HqG2EX4Zi7IAW42vFf5B195xB7vc
         PusoHLxF+iy21/vbWgIWBgNZ8daLZNfzg7jR57AcYZAhkRIMHoBrwkieSch9OuvtVdCJ
         TbLw==
X-Gm-Message-State: AOJu0Ywv2EF/cbizqyN2qUSadTcijEilwol2fHHzF/wpx2PlRURXillE
	O8yzx9ciQWPUuZBgheRm7Pboh+FPVop1olQk4CH3xzFur2lv2M7RledP+/Ox2w==
X-Gm-Gg: ASbGncuAfDVxnrDbcz1UCG3biKWtk4ajnW+HAHuaeo+k5YHzXSFGfrIRNTrigDTFR1z
	1b9RMalMixCSqEPpLn1yJmDOe0LIkHJIMk2NyJzANHvvrQBMKXZkhv5PbgJr7R9EWybuaGIDnQ5
	sqA+qTHXhPFAj4YXcbLjzxv5soIgd186B6UcNcR0JMkLnkVkaRP2et4S2SIs8C5A2rYs3fQv7Ry
	WHw0tPs4gn6QF2OkRcJXMM4bRTqj/IhJ6+CUO23wB10vXMwgK/zmpSOZV3CedBz3hSckCqj3rJq
	+7r60W9s7n1eddVMkoNMUiAZWYmHadQKc1CjaSJ2iqPQRDKLBy7Hzg2yhHaix+HDWEQUlmjcNjd
	f8LUUlKtwsg9k6B4zQ5nyNFn5cda4T6FVnck=
X-Google-Smtp-Source: AGHT+IEEv1GPlyTPPRU4YPd2N3tl1xxr/gqs74tPBWLTgdBNVZyh2szM4Rf0BeXdwqS3sFSSuWV+dw==
X-Received: by 2002:a2e:a553:0:b0:336:7cf4:7e95 with SMTP id 38308e7fff4ca-3367cf486a2mr2841611fa.42.1756106157055;
        Mon, 25 Aug 2025 00:15:57 -0700 (PDT)
Received: from foxbook (bhd106.neoplus.adsl.tpnet.pl. [83.28.93.106])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3366fdea6eesm7524271fa.44.2025.08.25.00.15.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 25 Aug 2025 00:15:56 -0700 (PDT)
Date: Mon, 25 Aug 2025 09:15:52 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>,
 mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/4] usb: xhci: handle Set TR Deq Context State Error
 due to Endpoint state
Message-ID: <20250825091552.350d027e.michal.pecio@gmail.com>
In-Reply-To: <20250822101514.3a730f4f.michal.pecio@gmail.com>
References: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
	<20250818125742.3572487-5-niklas.neronin@linux.intel.com>
	<20250822101514.3a730f4f.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 22 Aug 2025 10:15:14 +0200, Micha=C5=82 Pecio wrote:
> Set TR Dequeue code is pretty dumb and it will jump to the first TRB
> after the first cancelled TD (or something like that). If the endpoint
> may have been running when Set TR Dequeue failed, is it guaranteed that
> trying again won't rewind it to some already completed TD?

Answering my own question, rewinding back to completed TDs could only
happen if TD cancel status were TD_HALTED, but it's made TD_DIRTY here.
In such case xhci_invalidate_cancelled_tds() will perform trb_in_td()
check and find that another Set TR Deq is not necessary if the HW has
already moved past the TD we tried to get out of. (It may still issue
the command for some other TD, of course.)

BTW, if the HW completed this TD, the TD *should* have already been
given back and this patch should have no effect then. But this is not
guaranteed, because fe49df60cdb7 ("xhci: Mitigate failed set dequeue
pointer commands") turned the TD into No-Ops. (Note that the contrary
isn't guaranteed either, since the xHC is allowed to cache this TD.)

Perhaps fe49df60cdb7 isn't really right? It's not illegal to complete
an unlinked URB due to race with normal execution. Sure, the condition
discussed here is abnormal, but callers won't know the difference.

And in the ASMedia case mentioned by fe49df60cdb7:

1. The unhandled Babble Error makes no real difference. IME, after
   a TRB Error from Set TR Dequeue, the endpoint stays stuck anyway.
   Some other HCs also get stuck similarly, but without TRB Error.

2. Babble Error wasn't handled because the TD had already been given
   back earlier when Set TR Deq failed with TRB Error. Perhaps that's
   the real bug which deserves fixing?

The ASMedia TRB Error case:
https://lore.kernel.org/linux-usb/ZsjgmCjHdzck9UKd@alphanet.ch/
https://lore.kernel.org/linux-usb/20241113002658.0a031681@foxbook/

> Is it impossible that the TD we tried to skip has been given back and
> the endpoint and/or slot are being disabled right now?

It's not impossible, but if the TD is given back and no other TDs
remain then nothing more will be done, so no problem.


In general, this patch looks like an improvement over the status quo -
pretending that the command succeeded and then unconditionally giving
back the TD, even though the HW may still complete it later.

That being said,

1. I'm not aware of any known cases leading to this situation.

2. A loop which finds and updates the TD_CLEARING_CACHE item already
   exists, so I think it would be better to modify this loop instead
   of adding another one. And the loop prints some xhci_dbg(), so it
   would be nice if they showed up in this case as well.


Regards,
Michal

