Return-Path: <linux-usb+bounces-17804-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B809D6651
	for <lists+linux-usb@lfdr.de>; Sat, 23 Nov 2024 00:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 706D7B20A4B
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 23:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0D118C932;
	Fri, 22 Nov 2024 23:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUJKNc+O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2509F18A94C
	for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 23:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732317945; cv=none; b=dd0p+5upcPncZywujixyrSQ+254mQ56oA694rfXgLxwWLabH/SwIB4isV7JF5lFuo7C/1YTFeKe+QIWHFjLTgfP3+mSp5JurNvWxXgELtRATTCyNqdtN+I9voDP/eeECQrlotVpRB3MxZJS4HptZipRc5pVs26WONGYLni7D/3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732317945; c=relaxed/simple;
	bh=B8ogBq2IPlB4kJXBIxx/vS7gf8ugWHhSBoxLKEAw1ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bZ5F6Bro58yDcY2VpjXCBo9EE3472t/guiAdKiQag1B4fmhpn+NamtB1v6TQfabo038NiEjwLzHcQd7ijh3oTh8V+5sfYIFDxciRzINfrgRbrrJJNYHmqcQ+0GX+g0u6xpryl3MiFPUd3ZGVeX/ICiU+CRGyJOagegOAteriA+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUJKNc+O; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f84907caso3021122e87.3
        for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 15:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732317942; x=1732922742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBN4AgADOE6RIwqF2NqT1kxNXOFGXkxVVWI6gjEdz4k=;
        b=gUJKNc+OIONB4t7fqK17hmUaX9cortYQvc35nw0YvJQE/ltiT60z8hQrdlapJ2AMAk
         GiBY35yDfSIi5SFN/6pDSpIZ9/0BHX8nYf/tjmHphoy4OkXGC5vPubpsXNpv2rxCiSqe
         juTOKmmj5hVRiZy2CHxZ5eK2GoEa8pzZUlXCMk/GNUi/lCjIysnMKkXidzgLDqCGePGZ
         kxHpKyxfQKkrAjRl113AEAzxV629O3COQ8/GJec4rr5e4ExaXSQAnjYdvRmim/XBBRz4
         ZAlnrY1g4QTrHwNAJcDi+hdsyYSvGNG/lTp5/VA1vdR8i9qdIM1tykYwVCcfgRYvd6fz
         t/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732317942; x=1732922742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBN4AgADOE6RIwqF2NqT1kxNXOFGXkxVVWI6gjEdz4k=;
        b=lrDUmHn1nbgHj+dj0c7I7Zqwd9wtGry9n3s0V6U4gNfqKZ43FEhFnsGAGil9/WDtaZ
         ZEwIAb+qqifM1Atp+iDWexEciumoOHyXf9Lo+GisYoGuRbJB5ek1AKERrGy7jUkzN0Dc
         oV+bBvtVGowPp+dG6vVb+AfaA10KdkHxJcUxuGdjVVLuOSvj8pvAoc4Qy+FvWcFFtq0i
         fw4jFn/WYmZlG0yr5Oi+IqqWrJ0VJUQ87km9yhZfzHlFZCgieZwsmSTqpREpvUy+Mg3c
         zA3GnssNL4WM6klNTvz9sd1+V9+E0/VOrXRBhfr21BT4MGPcrt/JqCQMCBzQtWBuLsqX
         Zo0g==
X-Forwarded-Encrypted: i=1; AJvYcCU/NHpTYoKkSLeBo+gRUMqREzTVkv9rXHjAO+e8d3Mv1nxafekdyRM488GvXVGHZshC3BdX15wY5QY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE59YPijEe4QdzdzC63jyp2ym66tLyK3eFkIeaK8viPvnAQJGf
	uRmO/5uiVasLXIIDIjNjpRT+pkSoH4wx3yQUopIpwt0Ynx8eQOz/us3KoQ==
X-Gm-Gg: ASbGncvyya9vcPu0VQ2ayQDASR229WiZ11CWXfonLVQCRLQBXcsXWHda3VN7s8J6xzE
	Bw1cnfB5cz0wP5ULXk1zmRNQAqT9FsZ0TFlhw8yoCAhi16kuuiHssIND0ZlMmjVhmHBcEhqaUru
	/Z5ymyF0kGUQWuuFWO1yvkFTvN9L/GRCLuZZI2sdbcRO4TneJ1i1qoMeJetvmSY5W5n3JJbAiD+
	nZxTBiLt7hJdtGAXh7cKaqJi/+ZM0XiBoIO9dkmUDvr7EOFAkueUaH2CfA7
X-Google-Smtp-Source: AGHT+IE2F3oSJIxMnc2Cz4hU/sn3aEeHEzhuv2wL9y9efrjX9fClOlZzogHh3NwFMU4cGuZizrTCpw==
X-Received: by 2002:a05:6512:3502:b0:53d:dbe8:e393 with SMTP id 2adb3069b0e04-53ddbe8e406mr159946e87.1.1732317941911;
        Fri, 22 Nov 2024 15:25:41 -0800 (PST)
Received: from foxbook (bgw29.neoplus.adsl.tpnet.pl. [83.28.86.29])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2489d92sm602794e87.193.2024.11.22.15.25.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 22 Nov 2024 15:25:40 -0800 (PST)
Date: Sat, 23 Nov 2024 00:25:35 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: How are halted endpoints supposed to be handled in Linux?
Message-ID: <20241123002535.368f1d72@foxbook>
In-Reply-To: <eb3bae13-dd89-4c84-a4c9-4fb49348928c@rowland.harvard.edu>
References: <20241121001138.23a45f6c@foxbook>
	<20241121000216.kif557p3p6xyahax@synopsys.com>
	<b34b5ea0-2804-4692-bede-70ba9065c86c@rowland.harvard.edu>
	<20241121112653.06ba4ee5@foxbook>
	<0dd70803-a074-4859-8cc9-5bd210d12536@rowland.harvard.edu>
	<20241122135733.3d040c0d@foxbook>
	<eb3bae13-dd89-4c84-a4c9-4fb49348928c@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 22 Nov 2024 14:28:58 -0500, Alan Stern wrote:
> Bypassing the BH might not be a good idea, because driver's
> completion handlers expect to be called in order of URB completion.
> It probably wouldn't make any difference, but it's hard to be sure.

Valid point. Expecting drivers to deal with reordered completions would
be quite unintuitive, potentially laborious and bug-prone.

> > > Note that some class drivers treat -EPROTO as a fatal error.  That
> > > is, they don't retry and their completion-resubmission loop breaks
> > > down.  
> > 
> > Well, that's on EHCI.  
> 
> No, it's the behavior of the class driver and is independent of the 
> type of host controller.

xHCI has been doing things differently for over a decade as far as I
see, and it seems to implement the usb_unlink_urb() rules absolutely
literally (restart when everything is given back), except for the BH
delay problem added later.

Maybe it was a common "idiom" before xHCI, but it seems to rely on
undocumented behavior, and other undocumented behaviors exist today
that sloppy drivers might depend on.

So I don't know, it seems risky either way.

Regards,
Michal

