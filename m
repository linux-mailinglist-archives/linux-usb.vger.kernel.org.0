Return-Path: <linux-usb+bounces-16547-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6B89AB5AF
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2024 20:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C008B23EC2
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2024 18:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0141C2441;
	Tue, 22 Oct 2024 18:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sakK2pBZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B1A19E833
	for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2024 18:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729620111; cv=none; b=rWp5TkskXBcEUKwuOPFTqmUwFQzDn6yHyw+OKb2CNwrf9R0e/zAnxMbmwlDtJ7Qp7sCv2VNbpqgR+1pfPG/lI6cBk9qcQ0EGlYV0lUsHgoVn2oMnWAtAVSwPyxnxDfC7A3sDKbWD9ai2xUd5j/zNw2C85a0e88ajelFi0fJWX9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729620111; c=relaxed/simple;
	bh=qj9s+TlyoF6/4XQ4apP3gcn/QrBCT2Bd9VpWWkqqhTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7PnuGvW4o4AYbp1W7wFQILKd+TY8sJe8UY16TBRW38aFWRUPLDDIXDNQtHR+PuVwKX0lN3O3SvGpQjsr9s74afcGkrbreneKg1CJFgDnDZTK9+qufrKg+6dN9Tsy9yvukVZx2kSaMBVxYyjAmcUtHqeqnfEYkIeBRLu3pn22Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sakK2pBZ; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3a3bb6a020dso21786465ab.2
        for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2024 11:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729620109; x=1730224909; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6KwyxFHJObIfxtBe72RIvOFef4RBsdXTROVtbhwV4DE=;
        b=sakK2pBZUJtPNKMVrzfUKSBrM7GNEnNw1rEGjJ7uCUFl2Eb4lJghrH6dtsVRscm0ZY
         5cgXDOh+R5vhyFpGZXC4LmrHCpebEYG8bDyniqziHe6l3OxPZdkPUQKBA7vPP0M0izIm
         m53RKZe7jA7MhdUE/y34XGxbjZz7mQoaZgcn9HjjOHkg3ww19I6ezznDJG/51vRc8OtJ
         hBgCksbWjiK3uIbq6H6I82FZ8Km8hUsnqxovU6+TCqVOuyfGf0We8D+79IVp+5CqNhUp
         V/PoBhjzNIT7YDDXGClgz6cEUTeT6qKGhFki6j3xz3uTYL0MacAD8L4ICOcYmwEney/w
         v/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729620109; x=1730224909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KwyxFHJObIfxtBe72RIvOFef4RBsdXTROVtbhwV4DE=;
        b=Ju5M6tkjKXWyKANu7PCx4NzQsgNTY3Owcjz7cEntIvRRrnkfEgeCL53OPZaoKJ/PLn
         o8qiPiNlCzXWE+r1dSz4SI3zGe8auyFKh6fW8gip5dmZj5onk7yA2/QyGZWwJCI9EmJa
         dqlVn3d/DDqlq9wYdxpWh8kN/ZF+2Ese4EjTLa0DKp3OPyqvdwCasZO/d7s5FhoN3+GJ
         HZ6NcDDSsC2/QmIsKa9l7e1KPffDqtcp/lhFMdEm+sA5RwNJ3wMPlBYYK+Xu78DjK/g5
         9zXEJ5feGM/C1j8ggxW+lbHmSEIe+NdTrpxXEHE+y8YNObSwHiLUErEHqDX39a7imBgX
         1OkA==
X-Forwarded-Encrypted: i=1; AJvYcCWhZ6jfwba0HABvACzWPIw4BAdV+Vazif81xVeSj74Sr0kHEF5ZjXbOWrJMIqRScGsVLM5f3e9nra4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCntQMvKrYfdDK3otRYFEFXuN1H4wN916yxkJ0Q9eGhhtUw1qC
	RPKuOzknmrgPXCaD9GV01CbwsdTKSx7/0XZblJBVL+QPUpBKJopnf9C8Glt0DK6OYGbWE1LGPzI
	05p65EkKiXpzTzy+w5R0CJAlJuKpQQO8UfNX8
X-Google-Smtp-Source: AGHT+IG05Vqilw7VV5OMEzSH5hQ98MAtYxfN8wwemNCj9NsIDc6fbdCakSTnhWuaA76hbHaURK6y5VlAtgr3DQN6miI=
X-Received: by 2002:a05:6e02:19ca:b0:3a2:f7b1:2f89 with SMTP id
 e9e14a558f8ab-3a4cd7eb5b3mr38603175ab.18.1729620109425; Tue, 22 Oct 2024
 11:01:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <GVAP278MB0662D8077733604B9B103187974C2@GVAP278MB0662.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To: <GVAP278MB0662D8077733604B9B103187974C2@GVAP278MB0662.CHEP278.PROD.OUTLOOK.COM>
From: RD Babiera <rdbabiera@google.com>
Date: Tue, 22 Oct 2024 11:01:38 -0700
Message-ID: <CALzBnUHxA8MTHyuWhOOF8GOoohsSz9KN54Aw=CiiJiu9Jz_Bew@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpci: Add FAULT_ALERT handling
To: Yanik Fuchs <Yanik.fuchs@mbv.ch>
Cc: "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"m.felsch@pengutronix.de" <m.felsch@pengutronix.de>, 
	"u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Yanik,

> +   /*
> +   * some chips asert fault alert, even if it is masked.
> +   * The FAULT_STATUS is read and
> +   */
> +   if (status & TCPC_ALERT_FAULT)
> +       regmap_read(tcpci->regmap, TCPC_FAULT_STATUS, &raw);
> +       regmap_write(tcpci->regmap, TCPC_FAULT_STATUS, raw);

Would it make sense to register TCPC_ALERT_FAULT to the alert mask as well?
If TCPC_ALERT_FAULT would be the only alert to trigger an IRQ, will tcpci_irq
still run if it is masked? i.e., can this patch only read/clear the
fault status because
it piggybacks off of another alert?

Best,
RD

