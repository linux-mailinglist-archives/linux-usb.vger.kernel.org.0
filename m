Return-Path: <linux-usb+bounces-28562-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CABB9730C
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 20:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AC9E188AF4A
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 18:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEC42FFDF5;
	Tue, 23 Sep 2025 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=it-loops.com header.i=@it-loops.com header.b="VeLNgTTe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D6728A1E6
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 18:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758652061; cv=none; b=TwH1byTRHqNzwzWZDp62hhcOBXvsfIb8qA+WfJMnUjOVBm9cda630++LXdsSuGotXiZXTWqVG35rtfK3tesa0CjQcmBQDX6TObCpThiyVPbBHoUVtrzHQLpNeAzvhAKXv9GSqOWxE/UgxZZ8n2pKl7me5wFG7JJQLaPed13qyjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758652061; c=relaxed/simple;
	bh=B2I7BMkD4cph2NFAZzAQb5SqiLpv7TdzbGiom6kBVf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=f0+dF+52x/ZR0hMSYyLTgvkoDXVRCTTBjmfuWANFNsBBf6Izdm3GKH42LrVtoplb6ru1+lcioVo0+UfinwhYdE4iU/50w/U2Qe2j8JP8lh5mQPU2c3xUVTBeW/B49umSVoziILnGcIZM+oM6FZdx4ooLoNmJr4eP6X7LW6wY0GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=it-loops.com; spf=pass smtp.mailfrom=it-loops.com; dkim=fail (0-bit key) header.d=it-loops.com header.i=@it-loops.com header.b=VeLNgTTe reason="key not found in DNS"; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=it-loops.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=it-loops.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso9267104a12.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 11:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=it-loops.com; s=google; t=1758652057; x=1759256857; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2I7BMkD4cph2NFAZzAQb5SqiLpv7TdzbGiom6kBVf4=;
        b=VeLNgTTe9D2WKQPiLHNDyRPhVF2RXSe5byB72fMM60VNiiwCr3dDLjjqcIsPtHTXmo
         mQtI4g0RhZIxVWizO6Hlv/hEC+RPfYXQxmSC0Zzov51729bEfO7Tnb7e7NIn2WtFDW5n
         oyeRRQYhmusZi5wjv/yxoBTsI3eXRvTJ3hPCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758652057; x=1759256857;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2I7BMkD4cph2NFAZzAQb5SqiLpv7TdzbGiom6kBVf4=;
        b=LpcgWG36PRoPC2rsNoj4JzspVHcxROnGfQGtlAaMPqt8umFCnfSbboidaZMoE+QqfW
         bGp18DQV+SG66PrBGtHZAgXym/TfofRoeuOyPrzG+Cg1de32uW3U+6i4TL/IsD+9PGWb
         v58zAs3RVp65LCadJuMP1RuQ9leS3h8kBGr1AHdmql7wNJ6gctrSOv2RbEnr6PzHN8k2
         MuUpMIPtPABQmwMBx9rn39Ev4hzzDDvDzr1kT5YyFvPqYujLOWsB7A46LkVP9shh/xC2
         dMnCOi8+Pl3cDmUUZIdT3qtMJyvflb+VAv89KlE7PtesuRwoewUDw5VjLfQZ7rAwD/CS
         CrNQ==
X-Gm-Message-State: AOJu0YxYH8lc3lre7fAidqUtYwkcouPKpW0Y9c3JIMh4Dk0JFTzwqMzY
	K9w3LaaqK3EKw/k754aFh4swk1jdFzutPmpVXGT9Vh1jx/LZ1cQqfgPBO4eTSQYvvwJuiBIq+hA
	75e+RwjxydxNHIgNCMBTAbvoAz2XzsRSClmNW4QSq0ncceFWt39is
X-Gm-Gg: ASbGncuJEANHJKWcvjfs8xVQd8gMz9NsyvCm2zRivAF8sx/y7YrWFUpg/L12+28lobc
	z+TsUEJ8OmcM0l9b2+qvS/8gmLHFPzsy51Ra/m/ktRCybih6bydeQKov0rUn6efkCYDOUdcMzCS
	Kz9zMPZ48WnTtQYGxmy/Wzbhq8oOraegeAyII9FYGjtwtGnaDliPzMRXVoTiIXIb+c5cjdz4UXx
	sHaHAnezsTfHsBtwI4=
X-Google-Smtp-Source: AGHT+IGkooS6azPgxSmQyI9xvGFwQQn5z1eg4GE7k3WR87iOIjzoFqRtqrh/SuZJ2Xh7TIl7kf29xSeNt1tpQGynv7o=
X-Received: by 2002:a17:907:9726:b0:b2c:dc13:89e4 with SMTP id
 a640c23a62f3a-b3026c84ee3mr350128066b.9.1758652057422; Tue, 23 Sep 2025
 11:27:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALG0vJtX5EdNYJ6=Fiz=uiAN6ur=BDj39UpYnj0OWSSLQdDgxg@mail.gmail.com>
In-Reply-To: <CALG0vJtX5EdNYJ6=Fiz=uiAN6ur=BDj39UpYnj0OWSSLQdDgxg@mail.gmail.com>
From: Michael Guntsche <michael.guntsche@it-loops.com>
Date: Tue, 23 Sep 2025 20:27:25 +0200
X-Gm-Features: AS18NWBmb4Nq64NVg5X9_UyiPc1rlXBlRutErzi7bCNtKPuk3BPdME9LETHWY78
Message-ID: <CALG0vJv5ExA=ricY52-jL0GhkZZAbQEqTu476aC6C4ApxoYQ9g@mail.gmail.com>
Subject: Re: Kernel panic after return from hibernate if thunderbolt state change
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 8:11=E2=80=AFPM Michael Guntsche
<michael.guntsche@it-loops.com> wrote:
>
> Hello,
>
> I can still reproduce this issue with kernel 6.16.8 and another
> thunderbolt dock. After resuming I more or less always, with a few
> exceptions get a kernel panic.

I just tested this with 6.17-rc7 and got the same results.
After "Suspending console....", the screen turns off and caps-lock
starts blinking.

/Michael

