Return-Path: <linux-usb+bounces-27168-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C53DB310C9
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 09:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B2837A819C
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 07:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A6D2E9EA9;
	Fri, 22 Aug 2025 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjHffGjY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441D32E229D
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 07:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755848957; cv=none; b=ssp94ds10HEoPNCZlJvwptnWTtcPHrdL5oxelLvxn/ae6rjvfSpwum5ni9CLrtdUe5F8/iuJ5N350M/F5DAS908lIsm3GDRCXFO41D/RiTvi1mzt8zbCUGNwE9shZ8aWImuIeC6TFaU1+XY9tMunLsP5HYgsTt5hp/M7AF0d4Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755848957; c=relaxed/simple;
	bh=fAICbwJDGVd4dVTp0+K/QEGEC6KT47t4HJSCVzcUPo0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J1WdB2CvtigIf+QfTD2gdD5fOy6ouk28DNaqxOlsRcr6YAIB0MV+w0LGrM1Y7WmKknfisEDd7clmI0RWJ0cpSI222NPOhv+TVhXWT35PWbdMl4RtgmAkKilgOr1OYOMy5dmNZADJgtNPDMIWEGv4b3djKYgn0nHH6Kwvv+LStkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjHffGjY; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f2fdfdffbso412391e87.3
        for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 00:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755848954; x=1756453754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fk7MhHjTk3+rvRHENxDPNrzBFC4VzVJB98pLRd9G59Y=;
        b=YjHffGjYqTe/ottI9XJiyv2Oq+HAaEVBBj2mm8GaohN+LM8UOm1XIz5Uez5eUiDpt2
         SraFbB8vhR68N+SSblHmUtIuPg+mXr9w+pYXiuuuKV/N+ufqQqgJJM+Ycj4ZTKnwgA41
         kuYGbrRJq4iyi6LzZ7RRrTjkfzYPvUm4YxPNhZ1F2xZd4yHe1RQi0kk0k6Klhr/t3Vtu
         gC90U7sjzChTtRjbCJfGbpc5xaj7cBpgYI7BgsbqEloVPXOhE0U+USthKL4RJINW4UKz
         J87MM/oSIiYnroX2qPt7sJCfrmBs3CobHHpmZUw8IqAAk719YC0BM7m9K/XpULmXpGcC
         b9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755848954; x=1756453754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fk7MhHjTk3+rvRHENxDPNrzBFC4VzVJB98pLRd9G59Y=;
        b=QwnNfzuEAW5Bx9QTT+myHPazugbS4LLav9qormUW9vo4pL4HauETKaH8rVhjVhS/5O
         xEM7wIJ6fOeUSq4AVo/Eux8kpjyWbXOYRcERKRrGj5lnRCQ061GBlUNrZLGmqZHaZmEB
         26zlQFh4Dr9aSjrgf/CfbjNDhRACvDu/WzclwE9NMoeX5n0FLJc1xly4JsIOw0DVsEBt
         js6XM4Siyj5r2+ykCHYxXeBLUZe/JDpwpmOHAjzbMi9e9dtcOE+4xBOU6w+s4nY+653F
         SgY2IkTpLC87G26DUbZN4Zt5iDAm6RDuB3c0ETsN7ya69ieCIvCDVIByuqyRm8lCzy+b
         h+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCX42OGoY0XTCPfdpYzqrixwsjlAD3Q1VmEPV9ssqLIndcYw3pq52HeNitoE3GJFvpxJbj8VLJEG0Ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgHZTF7ylgHlZxeVtRB+vEp8ME53OG2gGDsDixgHkr4mNLpQ9G
	0YY0PYOCtzcDjWSoZLPAcRYUxRhObL27F81ik8m9SF2wLh91X9skgNhfvRoiFA==
X-Gm-Gg: ASbGncsIMdAdTpsMNgdrRaYzLLdYUWi+gKygahSke8wxvh+ctn1STZMbtXdesJxOcR1
	JMowsNJZnFiUlXrRLqT/v2qMdUkjskQmJ1+HBzsjoAZTbZTyCFrygt8ODxVItbZb2GOa5AncZVC
	RuZNbMUdV7CoSx8Nj2Sq8/a/o6aH9BpiPPO6ytjVGeyrmgI59v9f4N6v9eOLXlY4em2Iyl5dZS8
	Mzvn6TSClml5zn1t6ElSJLrc2z4MNAF3cNhd/ZjgfEPYgu5JMm0vNgTHk2j40EQ0jujMdW0hGTM
	rJZr/oIIQOJ/7X0tXXSRGx5JY/hDUcYzf+lSJUPEJxRdu6T+MzR2hb11OU8/ghLUYgNFLRA/B1P
	tK4DXl+Gu2DuDmnU2Pe8RrkZ0JKvRXYmdXnG61k5nbibTlg==
X-Google-Smtp-Source: AGHT+IE889jTE9rG/Lj/GFpW3S0EzZHxI62ld5L2shVJ/8rHL12dbWiiNedwo2xXn5Ju4tnA6bpMww==
X-Received: by 2002:a05:6512:6094:b0:55b:9588:a2f with SMTP id 2adb3069b0e04-55f0ccf9640mr709229e87.44.1755848953978;
        Fri, 22 Aug 2025 00:49:13 -0700 (PDT)
Received: from foxbook (bhd106.neoplus.adsl.tpnet.pl. [83.28.93.106])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3c42sm3323254e87.118.2025.08.22.00.49.13
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 22 Aug 2025 00:49:13 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:49:10 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/4] usb: xhci: handle Set TR Deq Context State Error
 due to Slot state
Message-ID: <20250822094910.1f19267c.michal.pecio@gmail.com>
In-Reply-To: <20250818125742.3572487-4-niklas.neronin@linux.intel.com>
References: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
	<20250818125742.3572487-4-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 Aug 2025 14:57:41 +0200, Niklas Neronin wrote:
> One of the reasons for a Set TR Deq Context State Error, is that the Slot
> state is not Default, Configured, or Addressed. This leaves it 2 options;
> Enabled and Disabled. If the slot state was Disabled, HW would have
> returned a Slot Not Enabled Error, which only leaves Enabled Slot state.
> 
> Devices with a slot state of Enabled must have previously been in a
> Disabled slot state. Both Enabled and Disabled slot states have the
> Doorbell register disabled, meaning they do not receive or handle TDs.
> Consequently, all cancelled TDs are released.

Is there any realistic chance that the virtual endpoint to which those
TDs belonged still exists after a slot disable/enable cycle?

Disabling a slot normally frees the virtual device with all virt eps.
This is true even in exotic cases like using a disable/enable cycle on
Etron HCs as a substitute for Reset Device command.

In more typical cases, the newly enabled slot is a different device.

