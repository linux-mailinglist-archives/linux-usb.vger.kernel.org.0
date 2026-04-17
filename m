Return-Path: <linux-usb+bounces-36294-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENHnNhgl4mlX1wAAu9opvQ
	(envelope-from <linux-usb+bounces-36294-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 14:18:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BECC941B2A8
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 14:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 854B8303B78B
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 12:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD5B38C2B4;
	Fri, 17 Apr 2026 12:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPoeoUv9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDE12F1FD7
	for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776428293; cv=pass; b=GOeBLWYtkgxUjJRqdUIIQg1+hPyIXVF9jOCOOTuL0AlPZh2VfCW3/K7K2jB+WAz5qzyyJU0dj3cog0/u2ukYJMZ8ad8nxSsDWU4lgabqGuU0FZC4mTW18lJ98LyNZzMxOd834a5yXuzQnpXKvNvz8LJTEsT8z4WONbs2lTYJD+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776428293; c=relaxed/simple;
	bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUHC1dZ7tFe7px50lc6mO9szB/xw3gLg3+YUG/onUetVVmnPldiPbd04PvQzKsZsKpfWaFX8ozYV0enqISgzgCl3PFfd+T4Cv2pGTzoKUNvOdXtczXWWL/xtRhXvXsBXAi5KwW1PrWq8G8EU8V+V2OaPECg5BjiMWjAfcXDN4AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPoeoUv9; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6058a955e04so431203137.0
        for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 05:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776428290; cv=none;
        d=google.com; s=arc-20240605;
        b=asdAXFlvcEO8UtwZTF62TIyDpTE6M7MA1kQpuXQ/wWTUMyp+0MblYxngk/KDY/acXi
         mRBFeGNpvOXIqxKKb1XTs1aJN6Wz+EF4fnQRGMJ1NudQA9iM2+i9VskA3foo4nUBF7Si
         y/oQ1r5UKhzsVQlNpejbpVWAG7+84p5n68xV6mOaN5mhc8WjPp8OOqRJ7pIISUeBX2i8
         DIXVYwBuISKo7+KZ37EqhXydFbm6ywZSL00awUT+tQNtqmUIsjYgMFOn49s9DeX4lbOk
         j02xtRrQIngWMNaX7FArBQi05DBL1bA0GsXiTpcluTfLN6VWQdH8YLu3LgLy3qhRACMs
         eH4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
        fh=OfVSg8+ElVD5mOJ/2pXB7wO/broIwXxD0zIUD9YmvWk=;
        b=V0W0kWAVsFdIpb5c+2Dgu3iSiymD3TdVwa9KGEmc4jvPxiQp4XFA9WddsXZwgHVRBf
         gTYdb/BO0gUhq/yHBWqPbIYx7qSsweVlOvzn8UX39miwvJb2fln/Ld/AwLliCKrtO3Qe
         yoLnAEt2cptfOqtTw4ihacR+ZgciIJPHQDG2NTQRLMbzsS6+hz+kYTLK918Eukb7orET
         t6gQ3mh5/Bibfz2OojahUOeATlHvAvjmM5ORyDbRJuH4twgMSWv2Ap06VzKOlzK4fiz2
         P025ChyrFcSz1DlDCl6muURnDVMC2l7myfs3UiKZkI6wiAqB800e5HcY4gVM2PdSsiB1
         AmxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776428290; x=1777033090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
        b=XPoeoUv9rScmaUqyWQSiJvbKUuBXj5IvwkeEqO9qwZ1N1Zi26m5ypKnq3nMAlaiYvp
         HRIvAeWMTy5Je01JKcws131EsdO1TlblBN5Bd2NEHLiQxfdcKktowfgkqPo0DikAGUVi
         Mw6OmIJmza7Py3pduhFODEECv2mWyb3eVYr/jo/uhezfe4JKBmPaC9IZpBaQCHnYJ9ZE
         aAvel87EGnyXYXuKqL0Jp533QkuODAexk7kG7BS8vz45SLwXeKNzzrMgRQjh49ISXri7
         +LlSIr9toOl0nKqPBugE4BsQFu+Nj6G+H5lYNG6cCeLfrZJcyC21i23D85qY+6rGlltG
         6ykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776428290; x=1777033090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
        b=nv7uHRBEzuaN4xFavfLckXFww2RH1m33VHLGTyNKG+Nr83vLu+eM4eUM6oKCLNxt0W
         ETbGpif8bYsVfV5sMsJZ8vmyCosVPmFCct8CX2PfRoxYHUoFS/YWv4hyYTGzldCFjsvw
         yO0I8NQh7XtyRI8nCPdOkiJ3wyUY2i/xYVJ9Svi6xc5XD2/uEwkf/ohjj0aHRitmE9ab
         NCQdhxjiZbBGQ8/qySwWyfV3qQQHQzn3E7Ox21A+4OOEuHi3IJYA/gnPzU7gNIHSwZCU
         zu6JYTD5mpVsAVT6xwVmEAEv6Ld+2P/X3m10Z5MpT+Rq2yRAv+501z1gG5WgN8bbGdRE
         eF4g==
X-Forwarded-Encrypted: i=1; AFNElJ+ZhS6dlBmCklXNCiXkW+649PM5EPTRvZq3fDazYI6r6K0ToT4q2jpE5WBn7xy39pA2WgfSOXBb80I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxosvPal+MoUenVhB6ulcD1gjXS2esFbUlYy9l/GiGxDcXoubc3
	cmjDWCU6z8dZye4R6RrLuAPiiCqX5EVJkrqY8tZJfdO+4C/rb3HyVkARckZlrU+kb4SmuEHjmAe
	JTriCIf4//ODz9SqGCgAxek5hAfLn/hY=
X-Gm-Gg: AeBDies5KqwM7RS3YxivQP20mSBr/ns/xe51BNdFNzyp8BuF9yH3OwpVPPzrtA+9fy8
	c4Ud0ZDN/C/KO48ans7utFSOeGhAuyEDoVTUdfC9Kvs34Vh2uBry6Pgyu+1EoRIj4fF5H3ngVFY
	KLD0NUpNC9E+Ki8JX3wdI90+XPrggCkzllI2Zua2QpfHvOUq/Tq1vy/V09g5UBuf8Nd8TvwLZDP
	CY/0OhR4zgu93KyLjsv4/DzcsJ5m29CscgzXDl6subG+BLhKhOgIAplA6BnNyxpEZ+n71d+N8Dn
	LUC74tOO5MzseyJe2Q==
X-Received: by 2002:a67:e703:0:b0:602:afbc:ae78 with SMTP id
 ada2fe7eead31-616fb89ea6emr791230137.2.1776428289898; Fri, 17 Apr 2026
 05:18:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com> <20260416-hpd-irq-events-v1-6-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-6-1ab1f1cfb2b2@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 17 Apr 2026 20:17:26 +0800
X-Gm-Features: AQROBzDTVswzyUjJ6xkXYjkzbvzXgr8nk22CVU17PBSoxKtVUOrPnYmdya4d4B0
Message-ID: <CAH2e8h4rLZB3E8Rdwy_LtfwtwAKZCOgL18fRFVqGBx32Cm2N2Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Nikita Travkin <nikita@trvn.ru>, 
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36294-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[42];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BECC941B2A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 7:22=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
> the DisplayPort driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>

Best wishes,
Pengyu

