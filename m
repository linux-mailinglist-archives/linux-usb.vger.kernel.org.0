Return-Path: <linux-usb+bounces-21510-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CB4A57280
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 20:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B3BA189A4E7
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 19:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6857423ED6A;
	Fri,  7 Mar 2025 19:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NbW2XwWj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7984FDDA9
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741377090; cv=none; b=oS1xzOqhXc+q+HbpaejxgEjm3QFDXQRfVxFnqo3BItKc4HZcnmzAAnM/UEK0XYphf868THmpELMtmJthbhcSAmVv23rToNCuSCaVP+scR/bbB+lXgjrokh6XTvXN2AaUmRpJdL0eLHvK4i1IB0DOvODAp27vUyVSukOzoqTjbAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741377090; c=relaxed/simple;
	bh=DIWtNK0/73Tp14vlsnzpFPmis/W+TpJ+G7ZVFgBV4K4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY+dr3svH1CTEgjVVX2og5kEnwa9elOtQE0yrjin59/Mi7MEaKjrX6ORytXUYSko7Hh5L4p5kgNUaCkqej2NQILcKnbnt9Mj8jLqAyDX2BeABcWAyRLMZA5/83QD7DxgY6Xe9C9Pq6kqL+8tVFdfaYaS+7KabRNrBaxza6NEeM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NbW2XwWj; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso3259815a91.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Mar 2025 11:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741377089; x=1741981889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0vxeJ91cIahvPFsZ/TUnYjZG0BU3sHhaPEfqVVFDFQ=;
        b=NbW2XwWj8SixwvXitTHs8JlOk1X65a5xcxIjW/ikzJ20QmYQC2gp81i4Cn5DTREWnU
         npInFUv2HcN+l6R6MWRo9Tnn6yVv+u9qhC1PYP/ke/gwWZgHfXDXgfSf8uuyh3k0iI+m
         u5SxaCYly3Xvz2O2S+qmwTu79REerargAdB4X/gX6eLX40RdtVMXAf2XQL8QWHLuL7xr
         V88ZnDE9ktDcPw2+LAXJFWnIMbEt+XFoBqSEZHEi8t8suUaUDt4uHYsK3Audk0Af3JkL
         q7aYpIcmcrZynFEFjwuQkLg4dqWkbYojPsTg46c1UGZXkyHzXDdzvO6/m/+9aC7LhNKR
         JkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741377089; x=1741981889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0vxeJ91cIahvPFsZ/TUnYjZG0BU3sHhaPEfqVVFDFQ=;
        b=FiDJvRYuc+pOUjS9OIl6/hgeTASuwezrQEdHz+xl92FIHuG3jTkZOE4WxysC36kitH
         AG9qafsVikrqIMItS18GODBqm6/Ylf5yRKfiEctnywVwreGAuSg2ZfIYkd19PgMVC9pn
         12ZM1mzOnTe6LB/EA6uqZ8pjusI9zGjxGlSHAJZsoh71lNJWfYiN9YBRUVDF6i38tNhl
         rvHmzu8y75QQvAk6ZiPaJGg/PqjvyDKIRNHm4t3n06CoxosPKnFMj50mYXiJ8i4W8fEx
         QTnmXiiWlZkWMnf0kdL1VeS5z9Xn3VfnLx0rnB3mub0ryV3j98N2hl0LQX3S2z1cCvot
         wrYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW50y1rQcceyP17r66GeVV7GyuectuDErps3Gj7Gk4ZjTpagTsmBondKs621GaAuC5y0GN0QNHEC2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI7XPAnLffQhxFERKUkOU4dJi13Q5DTQK5q4eSj5hIs5dBjxSO
	bMJH4PVEizrr7mCXgrlM9C88cu7kj+2VBH+cU83R8AmqmSXXevtyBO6ug6C08LgB30lVVklk7Ng
	FPRSAe4Kp7aaPmaVV/X4smKSS30GwjjiN4lUpTg==
X-Gm-Gg: ASbGncuF5JjhwMLQVEb0/L9vB/q8tgUpErintMid7RiNTFVXWCrWAFVDPk3FFBCeGR+
	Hw5R+VF14OTN1PbWoTPhd5NSlpU4IgZNp+Vs4p4+RsAHwDsx/oXxUmsayqQikiJ2toB62lITDgw
	1eaDCrgdPX51YcSuWvdNzVyMRRfA==
X-Google-Smtp-Source: AGHT+IH4Wpg5uTuvEjCppI+SSHGZ9QA7hC9F+4K74GBw5+jVeQ1H/kZBYBQf5cw61pm7FTEJp+iAMqFFaLciH8g3+zE=
X-Received: by 2002:a17:90b:1d84:b0:2ee:c291:765a with SMTP id
 98e67ed59e1d1-2ff7ce77c29mr7469398a91.8.1741377088779; Fri, 07 Mar 2025
 11:51:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219181556.1020029-1-ralph.siemsen@linaro.org> <20250226082931.-XRIDa6D@linutronix.de>
In-Reply-To: <20250226082931.-XRIDa6D@linutronix.de>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Fri, 7 Mar 2025 14:51:18 -0500
X-Gm-Features: AQ5f1JoWaLOl0ZjijIjOgwzx3_177Kjyj88yLqLIwYi0VFpiqFBpb-h1H7TnkV8
Message-ID: <CANp-EDYH8YF7ga5oRPrawhiveSVwW0w7YosHGJWuCKd4TaApDA@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: gadget: u_ether: prevent deadlock under RT
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-rt-devel@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>, 
	Frank Li <Frank.Li@nxp.com>, Ferry Toth <ftoth@exalondelft.nl>, 
	Thomas Gleixner <tglx@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

Thanks for your reply!

On Wed, Feb 26, 2025 at 3:29=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> Based on the backtrace the problem is within the cdns3. The driver
> acquires at the beginning of its threaded routine
>         spin_lock_irqsave(&priv_dev->lock, flags);
>
> and then before returning the URB it does
>                  spin_unlock(&priv_dev->lock);
>                  usb_gadget_giveback_request()
>
> so the lock is dropped but the interrupts are still disabled. This makes
> me wonder why using threaded interrupts at all since interrupts are
> disabled for the whole routine but then others do the same.

I also wondered why threaded interrupts are being used, but I don't
know the reason.

> If you look at dwc3_thread_interrupt() they have local_bh_disable()/
> enable() before acquiring the lock and this is what I would suggest
> doing here, too. The NCM is probably not the only one affected but
> everything doing network that may since it may recourse into softirq.

Thanks for the suggestion. I had also thought of doing this. I also
noticed that the "cdnsp" driver has a similar fix in commit
58f2fcb3a845 ("usb: cdnsp: Fix deadlock issue during using NCM
gadget"), which was also backported to stable branches. So I will
prepare a v2 patch to do the same for "cdns3" driver.

Regards
Ralph

