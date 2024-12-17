Return-Path: <linux-usb+bounces-18581-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A42B49F4826
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 10:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1618216EFE8
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138CB1DF969;
	Tue, 17 Dec 2024 09:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B9vUcwB+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E361DE3D7
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734429370; cv=none; b=fXvgBCwfVwuaLeHYsb9G8U9vunz4CKKH9Hn4Iu0R9VD/go4fkdFhXNlKjsUKMy6PoqMObE9PEDFA+WZXzVSfoiA0lYbnlgnrOl/TIF6qM3qk8HYlvYiO6HgVe4tST9FJxjs82XRn3WC0ljRhPaxNEN+GuyyBHcayEQ4Ek57xKuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734429370; c=relaxed/simple;
	bh=ge4negb55PbWDmYEPobjfL1powU8dYvYbF4dLTRqwHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJ3cC94TlgDyQFE0QygXMhu4NOyVFAcWm/mgKHwPn/xKvhneMFE6gLv2uj3iBhON3ydaHISgf9DHoipTGSV8ASqGEdDYYZK6yytyz0T/VRlH3QW7/lOFi94p730OXp7zwR9Oh3jCcL8UPKhO/1H5D+sGa84dGG4HLy9wgUMqJpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B9vUcwB+; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aab925654d9so665565166b.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 01:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734429367; x=1735034167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ktBWOmm5eWNSvVVaKZtk+5y5SA891nVyn6hrHeCUqLg=;
        b=B9vUcwB+BscXzuhyhEjAXtTDAad+yUI4KT4rpJslpg+Tv1rH0DajE8Liqisu8e0IPG
         Sn4xhBfrdvObVaczs+6OZLlwK069wd+96vecrD0EWejtDYEBCqACi0ZcLfIu31SjyakT
         phRukN2BCXIKm6GuolwJnboJY5nUBTdT3+kCnexElrNSSygzvQ+YBN4ahH+jF5p+AhxM
         Vd9oRhTUCbIyRsfkfBUSL6EHRVZuP/D3IXG1P1rYSCD2R8ypEAyPQ7dZCguVLpV2aJ4n
         QSWOSqJWSiQAAwgfB08H0tglOPHYavV7jeJo2TD9rQEDO13CZK+hw3iFnBU5+a0UD3ro
         dubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734429367; x=1735034167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktBWOmm5eWNSvVVaKZtk+5y5SA891nVyn6hrHeCUqLg=;
        b=wSztKOGz7Pof2Z+nPf/KQtVnKTM7ibo0kPQzJ4jIXE5FO/J/m/OF1oP6QGl35KKXCR
         adOsjmz2QkHG2zIFkkRQq2FBnEBQfrmioJgyPpMTX6lW/iCzdc6i0aOVRwonmR9hpIzf
         ccjCR9CmrYnhFIoZ2SdLa9+wpGuSSpkrE3K8nUuEZS0PSjjn1H5BVqZWg0ZtyTFayCv4
         bo8srDxQKIO5zxyE7JVpdk5lrnx1DVxmXyqJg+UDi7BT/5idHEZQTFdAz/42snASd5r8
         yQMiO4Ncn35XQtDfUPmBbHCtsSRSDBjmXJXu4T1ioFgnOI4luvYk4J4w+YWWKaBMQw29
         5tlw==
X-Forwarded-Encrypted: i=1; AJvYcCXvk8CJzlG/5gnA+Av31VvuAmPvBvck/S5hjq+QKAd2ixrKXNDLJYml1N6zxurX2qNEYkui83P7cDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3OCjOpytrXhROtPguBeirHK4IsM+sKG5RjuXoNCzDkW3Uajmz
	OHq+jV6c/PFyx5D/urTv6Xfn920yizD5vFbV23KSIseyR88SWbQpBcZocp8hosM=
X-Gm-Gg: ASbGncuEMPUgtrny2qLWMDET/+xXnR+IsmxXKSa86FtCO5yoWSuWrmEBcvWMZlE2rNc
	cmv1GvR/Xzsi5QGl/pX0o723zJ5IQ8ACi7+Vwx1MPomf5lgyy3C6V0MClVE9QsMC7Zu01Chb41W
	o8u1GEr92UqEFrunvS8MmlhVEEOOMltWBJDx4C5u5NwSyxi6d5tZf1sZwC18cBmRyLpu8XlTYbN
	16BO+6/nXqrJgA3CNBAxLWYWy2295UfH4Nhx/7oisVRxEjvuIRBv11hMMhM8w==
X-Google-Smtp-Source: AGHT+IEUZaU0/Awym606N8/wdYVyY/wGpsM9GjraBbgN4fSUr2PSr3dAz2t2Z4ZbqmuJeOxA0y9Q8Q==
X-Received: by 2002:a17:907:7743:b0:aa6:acd6:b30d with SMTP id a640c23a62f3a-aabdb885391mr312516766b.48.1734429366822;
        Tue, 17 Dec 2024 01:56:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab960663ebsm426005766b.43.2024.12.17.01.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 01:56:06 -0800 (PST)
Date: Tue, 17 Dec 2024 12:56:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, emanuele.ghidoli@toradex.com,
	parth.pancholi@toradex.com, francesco.dolcini@toradex.com,
	u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 1/2] usb: typec: tcpci: fix NULL pointer issue on
 shared irq case
Message-ID: <5260fafb-0b1f-43d5-83af-a61b3b179a1c@stanley.mountain>
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217091208.2416971-1-xu.yang_2@nxp.com>

On Tue, Dec 17, 2024 at 05:12:07PM +0800, Xu Yang wrote:
> The tcpci_irq() may meet below NULL pointer dereference issue:
> 
> [    2.641851] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
> [    2.641951] status 0x1, 0x37f
> [    2.650659] Mem abort info:
> [    2.656490]   ESR = 0x0000000096000004
> [    2.660230]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    2.665532]   SET = 0, FnV = 0
> [    2.668579]   EA = 0, S1PTW = 0
> [    2.671715]   FSC = 0x04: level 0 translation fault
> [    2.676584] Data abort info:
> [    2.679459]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    2.684936]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    2.689980]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    2.695284] [0000000000000010] user address but active_mm is swapper
> [    2.701632] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [    2.707883] Modules linked in:
> [    2.710936] CPU: 1 UID: 0 PID: 87 Comm: irq/111-2-0051 Not tainted 6.12.0-rc6-06316-g7f63786ad3d1-dirty #4
> [    2.720570] Hardware name: NXP i.MX93 11X11 EVK board (DT)
> [    2.726040] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    2.732989] pc : tcpci_irq+0x38/0x318
> [    2.736647] lr : _tcpci_irq+0x14/0x20
> [    2.740295] sp : ffff80008324bd30
> [    2.743597] x29: ffff80008324bd70 x28: ffff800080107894 x27: ffff800082198f70
> [    2.750721] x26: ffff0000050e6680 x25: ffff000004d172ac x24: ffff0000050f0000
> [    2.757845] x23: ffff000004d17200 x22: 0000000000000001 x21: ffff0000050f0000
> [    2.764969] x20: ffff000004d17200 x19: 0000000000000000 x18: 0000000000000001
> [    2.772093] x17: 0000000000000000 x16: ffff80008183d8a0 x15: ffff00007fbab040
> [    2.779217] x14: ffff00007fb918c0 x13: 0000000000000000 x12: 000000000000017a
> [    2.786341] x11: 0000000000000001 x10: 0000000000000a90 x9 : ffff80008324bd00
> [    2.793465] x8 : ffff0000050f0af0 x7 : ffff00007fbaa840 x6 : 0000000000000031
> [    2.800589] x5 : 000000000000017a x4 : 0000000000000002 x3 : 0000000000000002
> [    2.807713] x2 : ffff80008324bd3a x1 : 0000000000000010 x0 : 0000000000000000
> [    2.814838] Call trace:
> [    2.817273]  tcpci_irq+0x38/0x318
> [    2.820583]  _tcpci_irq+0x14/0x20
> [    2.823885]  irq_thread_fn+0x2c/0xa8
> [    2.827456]  irq_thread+0x16c/0x2f4
> [    2.830940]  kthread+0x110/0x114
> [    2.834164]  ret_from_fork+0x10/0x20
> [    2.837738] Code: f9426420 f9001fe0 d2800000 52800201 (f9400a60)
> 
> This may happen on shared irq case. Such as two Type-C ports share one
> irq. After the first port finished tcpci_register_port(), it may trigger
> interrupt. However, if the interrupt comes by chance the 2nd port finishes
> devm_request_threaded_irq(), the 2nd port interrupt handler may be run at
> first. Then the above issue may happen.
> 
>   devm_request_threaded_irq()
> 				<-- port1 irq comes
>   disable_irq(client->irq);
>   tcpci_register_port()
> 
> This will restore the logic to the state before commit (77e85107a771 "usb:
> typec: tcpci: support edge irq").
> 
> Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 

This commit message was not super clear to me.  It didn't mention that
it's tcpci->regmap which is the NULL pointer.  (Obviously there are a
lot of other NULL pointers, but that's the one which will crash).

Here is something you could add to the commit message:

   We cannot register the IRQ handler until after
   tcpci_register_port() is called.  Otherwise tcpci->regmap and
   so many other tcpci pointers are not set up and it leads to
   a NULL dereference in tcpci_irq().

regards,
dan carpenter


