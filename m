Return-Path: <linux-usb+bounces-34642-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNniAd5SsmkzLwAAu9opvQ
	(envelope-from <linux-usb+bounces-34642-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 06:45:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BA526D6B6
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 06:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B954830217C2
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 05:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8783352C3C;
	Thu, 12 Mar 2026 05:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cjnq8/12"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534E52BEFF5
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 05:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773294297; cv=none; b=KKSSdgaoGbAV0cDen9eBwR8j2MsrsKTpeo6SoggQga3dM4x66A3eE1Qfnwdmi5h+zv2A6ldGJJ70XtLnUetFimc22ec1eMLDPUov+Ax47bv2qbYLa5jmd8E0pS2g2BjOL/fAREYIM3yytTAZjcZKrYThV6xV7ZAwTT/hXP1Hqhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773294297; c=relaxed/simple;
	bh=plQPnkX24Ie8eoo5MxPmiSZOV+ea0wJ0YoTH3bOfVsU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LD8KhA8nigmWauKjlPR57k21aFebpvuThPl7PAgoQEMTk5IiX9d8Ss0yXhjtPvkLKSGHeGkI9l5BJMAxaDIQc82kTJ/g9ep65j48B7rc1MFYoS3XqzSGzvW9z9fFgHewwNSXtRLhsxgzB5WRsstAGkygAHMvqyWMYTVw+MvvtMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cjnq8/12; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5062fc5d86aso5962511cf.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 22:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773294295; x=1773899095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+JxKcny85mr5pkMQsUXmSvdbuKjvM3Zfr5tgNsatks=;
        b=Cjnq8/12sxw/JPRR1wawGaKJ9HyMXHBSmJhvESyNKzaek8HhLJqCXjuaOFFVWGUpF2
         6h3ezqmXy6M0NJNJXhMtHjjn12V0cO3VUlr/iteA9tQdhLsw0D/kL1gVoHwHawt4SO2N
         UltY5cLcLq6r2nyx+5DWTnNK7yVUKOGoLQrXeYDyyp3P3J/Txl2q1gwV4VgW2fs+0Dup
         A6XhYUuFsdG9YXICitVdClfFSJ0ke9jsLr6jyyM+KXKiJTDrdjGD7l9oVnIeFQzUoyhg
         vd9F8Hi+4kv3bovRGYI6x7fLpa/vU4Gd9Eu3fvX8PtAyI1idAFWL+JxRZcLZLoeHikYA
         PB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773294295; x=1773899095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z+JxKcny85mr5pkMQsUXmSvdbuKjvM3Zfr5tgNsatks=;
        b=rWUVkvByg9FTRxplJBVJ2p6h5+jUjzcemqNx4YfY34CA/dYauyGV4hM/vVK+mu6xbx
         Dtn2tzzIk0SjiNsIPmSUkvujxkPFqh+Ykt7YMKiMI5hFEJU3Zds52CJGhcSrY3WyXiVT
         Z+aLrTvGfU2oRSn8EAhQYZta+60w6c2dEH0TfSSOM6S/02mInVqqz4kD082nCiUjYL4V
         x3O3rq82p0Bh5V1mhyVeHQ3QB09WrBmiDuyxMGYQwIxaLa0fceUZTmxtdfh5eFVhkMru
         Qybmp1s4qq9ibTxP6ZXfkaLapVCUwS3hK46byPxiKuvuyiR33ZxX+zWM1gaoQanoL56c
         cfgw==
X-Gm-Message-State: AOJu0YxXAdRKctJx4qpRNYUXQW3OaJgLLR02o2ZEukDIwJZGE/MlsrLU
	WNZKliJjYlf+dqZyMX9qqbK7Z3b9Oon7iuugUmkLP/MP6xurfSkdJy2aObZ8x3Vc
X-Gm-Gg: ATEYQzzWr/bgTbu0lsST6JXezUeuFCJCMez5x59ZKg685FZJ5pDj1ti9R9Sse/Prr84
	ahOLP6xWO9BdHWM3EJGtT2bw4V4Azc9AE8f1V76C9w8juswJbGb75IcRuXSWOc0kPbeEJv42sug
	iV0koFZtKhmL1ZCB0rdjJ9oTEaUkcIFsgUHp5slh8Kxqye5574Az+gEO3hy3Y6zq3IrNUktNwmh
	Gcbwj5Sz7CBtnYSbm2cO0coAh3h3PXXp6l4ZZ6wHAgOkBfP4mtmCUgNEhc0ySZ4IZ9aHpW2I7gV
	Pr8HexN7ESs4FuAvGTG0ClPbK3AEqZrkQK+JMg59rsGOlxJwkC7RpSAGgk3qJ77M3vpPVh8ybYq
	7+Hl4pZATTqqLqP9peovotzBbQLkyay8rQ80xjrSsXkLi96zAD/zes3zCDEFWLGcRuZx6YdJlZB
	gkEEK07aUdsOazwG06nI7P0RpZ5vs0gv2Tr+ZmHXwy4F5S0IFQFtbst/ItRK8OsaSAqcpNl8NHO
	JdEAM2ykoo0s8cxu1PS+adumXzAYAo=
X-Received: by 2002:ac8:5d8c:0:b0:509:d76:fe5f with SMTP id d75a77b69052e-5093a0d3959mr62261941cf.17.1773294294832;
        Wed, 11 Mar 2026 22:44:54 -0700 (PDT)
Received: from localhost.localdomain ([129.170.197.113])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a116d86sm25911771cf.23.2026.03.11.22.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 22:44:54 -0700 (PDT)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: linux-usb@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	kyungtae.kim@dartmouth.edu,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] usb: typec: ucsi: validate connector number in ucsi_connector_change()
Date: Thu, 12 Mar 2026 01:44:43 -0400
Message-ID: <20260312054443.573-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <2026031206-many-halt-cb1b@gregkh>
References: <2026031206-many-halt-cb1b@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34642-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 96BA526D6B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 at 06:03:33 +0100, Greg KH wrote:
> Yes, please do that as we need central points where data is validated to
> help keep the code sane.

Thanks. On closer inspection, ucsi_notify_common() is not actually the
sole entry point -- ucsi_register() also calls ucsi_connector_change()
directly when reading CCI at the end of init, and ucsi_yoga_c630.c
calls it from its own notifier.

The true single central point is ucsi_connector_change() itself.  v2
adds the bounds check there, before the array dereference, which covers
all callers.

Will send v2 shortly.

Nathan Rebello

