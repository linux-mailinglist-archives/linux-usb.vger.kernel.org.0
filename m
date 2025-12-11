Return-Path: <linux-usb+bounces-31381-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE8FCB5013
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 08:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA7B33009A9E
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 07:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CD2299AAB;
	Thu, 11 Dec 2025 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xF60Oolx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A3222068F
	for <linux-usb@vger.kernel.org>; Thu, 11 Dec 2025 07:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765439055; cv=none; b=YDDRYmhawty+Moj4+UkN1C2VjLA3ex12RgWBbpwTrXsGfw+ivG+jt1FyniA7z1b5gfWVQc6Zjh1xrbK2NMZgDFOALcDDjdtWu65tDRnBWPyIRv5elgii+kGVYmsx8riqnsgHfEdxcx0By+1byLwMmyHuos6xkY1qEvl0I5iqALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765439055; c=relaxed/simple;
	bh=+nLvnvd/TcPlWyDUi4sC0649/vYg6Fyqw8hlyGbLylQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y+EQUZ7+01VGEZPNELzqbAXenkir/KmVf2ZiF7hHdT8fOzmtELZCSUAZsm1Ej42zG4gQIEFBql9fumj3kC5f5FiPpTc/HS9vDc+HlJKOwck+tRC3V0U9uZqxcJ5fnC5rcQKGcsWrZ87dUzfpYnwPN4ncbv2Qa5iJz7pC7Lit71E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xF60Oolx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso8863125e9.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 23:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765439052; x=1766043852; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7PTY0JPAENNEp01Gq3EaTeFE6LLPntXWdMybRZFQEXo=;
        b=xF60OolxdJWy6D5IW50vasWgw6SPhPzPoHFfSQ92nzS5Pz2jfItvvr7ADyr4x2taR6
         m7BBkhZnneXK+vaHYw0OGfvg1pxf2s4Of/v4X+HWEjGmrN5dKtWEqTJzZdMunThTzV97
         VK3vqHzlUkMT3q2L4YdLhR+5qmvVrXIgqHwzAbabhuPu65O6cS+PH3HCIbx8z14qyd+J
         i4UbymuUJPwCVhoasnTmdlpf6GApP19bGYb9tM3nJQPptL7N+94riAcCrM7R0V+W/fAq
         BgIxoBFVeDjVyvhsf6O6V/LzOTJnYrNqu6AlWojmW8DhKLzX/QD1GKyGEl3ulanQHxN8
         Xb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765439052; x=1766043852;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PTY0JPAENNEp01Gq3EaTeFE6LLPntXWdMybRZFQEXo=;
        b=txuRAD4fYtXQy9viZ/zFyk9obktcVY3VeE6TM13qwKrqYgK7Y/NBueITNOGT1zzQD3
         r/KGzqjwtHmrhGEO9gc+jZ7LeVQCdMXDqqq4SxSTkE79jjycxPMYGNSYhDm0iLnfNTpq
         /tFrtOzOTMmXF++WSgajRNRDU1690dVmCA2T7XAM0MVDsaxW34+adomVKBb/A/akOrnd
         FpPGZ/xyFHsm6OJGEqVCdEzJhnqb4QkUHTMCDJwNe+1rqkG8ME+Afhi4kULjiE7DZYb+
         iggHXHXp4h8iDKvO+4ypZnRQufAwYqJCs2O7uN6VHJ+mgXT4qMTD9c+GPyaKbsAHIU8M
         PuOw==
X-Gm-Message-State: AOJu0YzOCxsexmkKhoRzrnJYCxTo+IgynLrHKnblAtnEQoCBoWwKsqFd
	tvr/6yUVFZGqEP13ZZXkZ+IN9dF2foDMNGdWTKvTVYU2a1dgRhBZ8SZD/ET4Sj+uepU=
X-Gm-Gg: AY/fxX550gMzaMT3vy/+rK59V7mbMsvjnrEywzPQTkZyjbEJVBHPVYgLsSKSJ7rEFKJ
	ZfaiubmYbGJyTp/U8rjSvi5vxy/rTJFZjMm3f/nyZHjLn7oxHdvsSubDSjIJjTg+Oie6gx59iDM
	qbbLrmbGm+2gyOpkkwIhLVLl4pacy5iJZhXqcW0w7gLFcafEfDINmtnO2RkTCDgJ/1FLY4O86q0
	WSmawYh8x30yuuaRCYPg6LKXY/KA646qP1Uvc4T9vylFDelCQ+vYbGRzxzjsbk6/cEEiV+QQjb5
	cxWjQEqlZlvNfrIdTaxmLJkuf6gQVXsDWmTE5Ps7UW1oMQH6Ghocj0Gn+IHhA2N7LEseg4G8Vlg
	xKir5PNRJGJkzDFuaKCLFCvPwe4ryonjmHOL4wAzAkypek91oBRNIq78AXYvtXAxzGakbkhZ+R9
	y47mFExSVkok5o47/d
X-Google-Smtp-Source: AGHT+IGxtqWP87wJz85Ka2QmNNb9bbiBp9C5m5Rc6onDLrqvEn4ypOsYvbG8b1spWjQO0iyL913GOw==
X-Received: by 2002:a05:6000:208a:b0:42b:2db2:159f with SMTP id ffacd0b85a97d-42fab242bdamr1334057f8f.12.1765439051634;
        Wed, 10 Dec 2025 23:44:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a70379sm4137033f8f.11.2025.12.10.23.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 23:44:11 -0800 (PST)
Date: Thu, 11 Dec 2025 10:44:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pawel Laszczak <pawell@cadence.com>
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: cdns2: Add main part of Cadence USBHS driver
Message-ID: <aTp2R8dGyrW1XglR@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Pawel Laszczak,

Commit 3eb1f1efe204 ("usb: cdns2: Add main part of Cadence USBHS
driver") from Jun 2, 2023 (linux-next), leads to the following Smatch
static checker warning:

	drivers/usb/gadget/udc/cdns2/cdns2-gadget.c:1239 cdns2_thread_usb_irq_handler()
	warn: 0x10000 is larger than 8 bits

drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
    1210 static irqreturn_t cdns2_thread_usb_irq_handler(struct cdns2_device *pdev)
    1211 {
    1212         u8 usb_irq, ext_irq;
    1213         int speed;
    1214         int i;
    1215 
    1216         ext_irq = readb(&pdev->interrupt_regs->extirq) & EXTIRQ_WAKEUP;
    1217         writeb(ext_irq, &pdev->interrupt_regs->extirq);
    1218 
    1219         usb_irq = readb(&pdev->interrupt_regs->usbirq) & USB_IEN_INIT;
    1220         writeb(usb_irq, &pdev->interrupt_regs->usbirq);
    1221 
    1222         if (!ext_irq && !usb_irq)
    1223                 return IRQ_NONE;
    1224 
    1225         trace_cdns2_usb_irq(usb_irq, ext_irq);
    1226 
    1227         if (ext_irq & EXTIRQ_WAKEUP) {
    1228                 if (pdev->gadget_driver && pdev->gadget_driver->resume) {
    1229                         spin_unlock(&pdev->lock);
    1230                         pdev->gadget_driver->resume(&pdev->gadget);
    1231                         spin_lock(&pdev->lock);
    1232                 }
    1233         }
    1234 
    1235         if (usb_irq & USBIRQ_LPM) {
    1236                 u8 reg = readb(&pdev->usb_regs->lpmctrl);
    1237 
    1238                 /* LPM1 enter */
--> 1239                 if (!(reg & LPMCTRLLH_LPMNYET))

LPMCTRLLH_LPMNYET is BIT(16) but "reg" is a u8, so this condition is
always true.

    1240                         writeb(0, &pdev->usb_regs->sleep_clkgate);
    1241         }
    1242 
    1243         if (usb_irq & USBIRQ_SUSPEND) {

regards,
dan carpenter

