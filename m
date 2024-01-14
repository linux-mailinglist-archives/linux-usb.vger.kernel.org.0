Return-Path: <linux-usb+bounces-5030-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B736282D0CE
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jan 2024 15:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C65A1F214AA
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jan 2024 14:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CE923BD;
	Sun, 14 Jan 2024 14:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwjTb73i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE362100
	for <linux-usb@vger.kernel.org>; Sun, 14 Jan 2024 14:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50e9e5c97e1so9836067e87.0
        for <linux-usb@vger.kernel.org>; Sun, 14 Jan 2024 06:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705241212; x=1705846012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qzZV7MF0Rnu/DhX3pB76kqvTKJmHOBEyGs9xjEgXNE=;
        b=UwjTb73iVkgmE1QB627yRejeMlkteXGzzCgf1Q2W99Kb+ImZKOcCaIu+hAcDgsabyW
         Zb5YCB8z8+wUnHJvd1gXAh3tMUeWzIqrD7VFj6EZS2mJky/eLzt+DIXUIJWFP1ZPZz6W
         Qnn9Tloo3rRefOM09U1Yty5TbnuwU9gYegfZ92Q73eWHruThMStx2b0YZm7v9tdr5AAe
         sgUrgj1zL610zgLz1+sCwmjJ4sRtUKCKBQLk0bPixGCP5xWh20qhFdkBkc2u70dgt6fV
         /6mhqaMkrbKhAcBe15lELsbsohal4xtPEhe2L5CH6ZEldBEbxr9YrjVCMprwO0E4yHbo
         k1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705241212; x=1705846012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qzZV7MF0Rnu/DhX3pB76kqvTKJmHOBEyGs9xjEgXNE=;
        b=CkC8Ru/Rm5k1SYQD7HVp0xX5QWQchxb8t5K9bqkfUWWTbE9igFk1Cird3FAYQhLBvt
         +lvN8+N8nq6lrghBZGGEfYpXBAIgWGiyAzu9nJIxjmkzif70YFi0eNasYMIlpnKKldKD
         AG2qPXiJdBq6Cm5RWL+M07EG0Ayn+P1MdMHGuA7N4klQJVlITk3TLfmYi434C/iTU4bb
         aExgqMINKLKqgP7H0FAWg+aCl12PsgR8feZSBEiUqNQtRPFeMkPTCw4cJW1++bilJtN4
         NbKdLVwPuA7BrDh1EE4hJ2pxArtyejWKdDNT+kmRypWsD/iHY3i9RLSNC6SHzLkCKl8w
         I4PA==
X-Gm-Message-State: AOJu0YyX9/RZNDWm+RY0RKdm3jUZbLCyT3/qkCtZDbSV1u6PTr09YkPl
	aepzpXz6IS8zObhtoINr0wD+mpmgpVw=
X-Google-Smtp-Source: AGHT+IHe7uwOPDmPf7ysu4mIk++LvGZovQEZRh5vLXPTWkzA9IwGdh0CNUXWOB9SGQsswlMVhVhZnw==
X-Received: by 2002:a05:6512:36cc:b0:50e:b5e5:bc4c with SMTP id e12-20020a05651236cc00b0050eb5e5bc4cmr1541476lfs.50.1705241212337;
        Sun, 14 Jan 2024 06:06:52 -0800 (PST)
Received: from foxbook (bff170.neoplus.adsl.tpnet.pl. [83.28.43.170])
        by smtp.gmail.com with ESMTPSA id c27-20020ac25f7b000000b0050e6451baf0sm1150841lfc.53.2024.01.14.06.06.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 14 Jan 2024 06:06:51 -0800 (PST)
Date: Sun, 14 Jan 2024 15:06:47 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: "Transfer event TRB DMA ptr not part of current TD" spam after
 USB disconnection
Message-ID: <20240114150647.18a46131@foxbook>
In-Reply-To: <20240113214757.3f658913@foxbook>
References: <20240112235205.1259f60c@foxbook>
	<20240113214757.3f658913@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Mathias,

I found that the code which causes my problems was specifically added
by your commit d104d0152a97f ("xhci: fix isoc endpoint dequeue from
advancing too far on transaction error").

Reverting this change removes the disconnection spam on my two NEC
hosts (different boards but same 1033:0194 rev 03 chip IDs). I have no
other hosts available to try at this time.

It also resolves similar spam and subsequent stream lockup on one
particular pair of host adapter and device, which suffers intermittent
transaction errors for reasons currently unknown. With d104d0152a97f
reverted this device loses frames as expected but keeps going.

So this surely looks like the right thing to do with my NEC hosts, but
of course d104d0152a97f was done for a reason, which apparently is that
some (unspecified) other hosts really work differently.

Thanks,
Michal

