Return-Path: <linux-usb+bounces-28575-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BD3B97CEB
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 01:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5F6519C7D5E
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 23:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD8130FF32;
	Tue, 23 Sep 2025 23:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cjlrYfyY"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A062FF141
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 23:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758670712; cv=none; b=WMm8eSznKe9oxKw4YbWSH7un8XTwormAIZ2H2hUCPj3H7zo+27iMQTFGSPSaIeZfcUphGefopnsgTOOeVhUe5uZlZeBgZQPNhg9Zg+uOifX1zQA50ewqmov8GZ9qqUpfSoTdBP/QEGxqEX6PU4h2YeTuZ8ARXCPrzeLTqs1qRcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758670712; c=relaxed/simple;
	bh=/3WcKn80XXf6nan1lCaLIbylKt6HJQw68rJepU86uT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jS4e71/e9vc9qoV69z+oM7kjuvw2xUBNl/az2/hCihCPDR5Ba+uvLVItVRQ9CujWJY/hUyevaUegFWLGXYzXxdhJBDN5PKPDDH9BH+ml0XJELaK7zJUU2/AHuERafdbvirdADrVh2uGqoy7rNi9Im+zmlNxxNaX1/NnEcU+sCtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cjlrYfyY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758670709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/uuMM0xLOGxLfbxqniNIAdFMc7QKfBFng3gt4+uLkoQ=;
	b=cjlrYfyYM+O3RLc5qiaylKqn12uzphp6xJuIjbyMNzrt42r0F1JrrKaj/uyyLitzyFCn85
	CySxf3OUXSswu0DN1Ve/4cqllRw9GILAqGJV4FCatwikBdOAYoTmBVU+NhwVXS1VIUwzPv
	aVON2jC/6xHX6uDdb39wThn0cC4G988=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-V9QgdNaCPN-YZm0oznN2WQ-1; Tue, 23 Sep 2025 19:38:28 -0400
X-MC-Unique: V9QgdNaCPN-YZm0oznN2WQ-1
X-Mimecast-MFC-AGG-ID: V9QgdNaCPN-YZm0oznN2WQ_1758670707
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-62f9731a4f9so6244193a12.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 16:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758670706; x=1759275506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uuMM0xLOGxLfbxqniNIAdFMc7QKfBFng3gt4+uLkoQ=;
        b=e/E2SefACV/mmmOajnDLhHxGv8bLScmxjNVVe/daxyeAf8pa5P/h2gZ1T6lKIM2Zu9
         Bmn5+tAXa2pU6CvsHHkE0N1YGprNtf2HZKsa5EA/+WIYokEPbbwz0PjVBcOLg4kdg3lc
         N7bxVMcQH4P7hyRVAi8EqUho46W5u8L2IiMaDU//QLBQ4HqpfqdCmv3lxIKEc6wEPTBl
         dTT1JWRiXtxjpQ12USAFzSW0DRd4IWZjs5vZOyXvSVPSSVn4CAvcBdUfg9TtKPUuZka5
         jCflxQwfwZ2SkRBQ17UoYUT1uMAV5NT0CGYYt41uqrxg76xl4lS40FF+a2UEBWX9Ssc9
         nsOg==
X-Forwarded-Encrypted: i=1; AJvYcCXBfuzNUv0lI/ZdLt9mlnFJOlKF6vHKG1wPfzpTFO2LvkvhJQnv8us60CSQJcUo51o9JWS9PPGd7w0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAnYL4RE2LyB5Ci4VJ66DMk/ghpuV3lGsewZLo1Va3ZRqgwpAL
	lifCGjvMLIG/orOWkLh3Hq4v9qQ0Zt6z2q7XFzkzalbcDBIQr6RYVwCoZkQLRNYLCMDKX+HPd6B
	UCQy1k3uthkw7Cxv893akSJ8irkF+5yXWQsqyBX07L3KJlclfJ2i8Sp1nPW+BJGWVcs1pbCyncF
	dhXddnZL2H6oNsWSZ4wp5p/bhodu9vFqq6tH1kZsC1/KSVFFI=
X-Gm-Gg: ASbGnct9ZaR4Lcvjwlc0D2LGjFJaLGqefsARAXvJLE1LwsbBBQJq9TJs4gjnCHbvY3k
	ncPBfuM9rpci7OOUuBihWsFcwaKr3+XBL1eZ3kqFUs1hJut0hYt9E/udv2zqAwt9CN8uQlgcdB+
	YcFNmnhwFuxGaAI3dX6+tlV85+4raF2oSoSmAO2DNfAkvNYxmnimni
X-Received: by 2002:a17:907:1c19:b0:b07:c1df:875 with SMTP id a640c23a62f3a-b302c2033d3mr406667766b.56.1758670706358;
        Tue, 23 Sep 2025 16:38:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk3/1I4PXZi4R6ovX6yX2UPx6dYXxY3NvIilMqDU3auk9daLMwCgXTETaUDFSLe0sWzQlfr5kzWopjCBID8PU=
X-Received: by 2002:a17:907:1c19:b0:b07:c1df:875 with SMTP id
 a640c23a62f3a-b302c2033d3mr406665766b.56.1758670705938; Tue, 23 Sep 2025
 16:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2a353817-f1da-4e7c-8b2c-0853779ec054@datenfreihafen.org> <j5dtkmnu55ycmqpaseazots7mevqyt5lafclvguxj6oz5r5cts@n563dsnvwuu7>
In-Reply-To: <j5dtkmnu55ycmqpaseazots7mevqyt5lafclvguxj6oz5r5cts@n563dsnvwuu7>
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 19:38:14 -0400
X-Gm-Features: AS18NWCDhXJt3fjtOycAWKBORuZpc7nsvPw6Hg7_H0HrU-XDN_ZZxWC4VIjhYMM
Message-ID: <CABx5tq+U_hcmxXDCGpTawsu5C0bDknC=p1Rq3FrtVuJq9gj2Pw@mail.gmail.com>
Subject: Re: Call for Participation: Embedded & IoT micro-conference at Linux
 Plumbers 2025
To: Sebastian Reichel <sre@kernel.org>
Cc: Stefan Schmidt <stefan@datenfreihafen.org>, Jan Lubbe <jlu@pengutronix.de>, 
	stefan.schmidt@linaro.org, linux-embedded@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, RD Babiera <rdbabiera@google.com>, 
	Amit Sunil Dhamne <amitsd@google.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Tue, Sep 23, 2025 at 7:03=E2=80=AFPM Sebastian Reichel <sre@kernel.org> =
wrote:
> I would like to present / discuss fusb302 (or other chips handled via
> the TCPM framework) using boards that are mainly powered via USB-C and
> not having any backup power source. This kind of setup is often found
> on Rockchip boards (e.g. Libre Computer ROC-RK3399-PC, Radxa ROCK 5B
> or ArmSoM Sige 5) and quite a pain, because a hard-reset effectively
> kills the board power.
>
> I would present the problem(s), what I've done so far to get it working
> to some degree with the upstream kernel and then discuss how to improve
> the situation.
>
> I think to become a worthwhile discussion the session would need some
> people that know the USB-PD specification and kernel subsystem, such as:
>
>  * Heikki Krogerus (USB-C maintainer)
>  * Greg Kroah-Hartman (USB maintainer)
>  * RD Babiera or Amit Sunil Dhamne (Google is actively working on
>    ensuring TCPM code being compatible with the USB-PD specification
>    and they were unhappy about some of my changes :))
>
> P.S.: I'm not sure how the CfP for the LPC micro-conferences works.
> Please tell me if this mail is not good enough and I need to insert
> something into some system.

You need to submit a proposal to
https://lpc.events/event/19/abstracts/. You'll have to create an
account, and there will be a "Submit new abstract" button at the
bottom right of the page.

I went through the process for a talk that I submitted: "Fixing Clock
Tree Propagation in the Common Clk Framework". It's related to this
work:
https://lore.kernel.org/linux-clk/20250923-clk-tests-docs-v4-0-9205cb3d3cba=
@redhat.com/T/

Brian


