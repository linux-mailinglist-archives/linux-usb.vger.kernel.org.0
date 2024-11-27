Return-Path: <linux-usb+bounces-17898-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 788619DA495
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 10:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 269AC161DF6
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 09:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABAA191F79;
	Wed, 27 Nov 2024 09:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f58oXJrc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9546E1917C2
	for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 09:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732698892; cv=none; b=FPUXLFg8XnWgc7O7BDfC9YFbxvRtFc48dPudcaUPpMh9tV1At0rAusYZ0wSjZRVFe0ewmHq3f7RWX0v9eAPdf9aMgVXKGPiNgXrJRZTQakMLpZMe984rJtUsK9rJYP/KKPD61sI5rrV3Vu0NEYsPUzi2BCUncehnlcpfnREfWmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732698892; c=relaxed/simple;
	bh=+QE+M24fNM5/eVgcefx+ClWRg9PNN6EZ4F6IgEgRY4g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fgy6OoDCWLXGe9fpXPQdmXzamYZroo6FEraVOPMD8TavvOF4dSmy2W9oDEJRNx7t7tBeihp0EVIQrkX6lircZDYVshGjesolOE65MDHBoQnoyNVORdmEdJqSz1WWtniB87tetr3m3FUZK8OiAqUUbbKDG12b+9ATbCTSZ27Dul0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f58oXJrc; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e38866c8b2dso5774501276.2
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 01:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732698889; x=1733303689; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+QE+M24fNM5/eVgcefx+ClWRg9PNN6EZ4F6IgEgRY4g=;
        b=f58oXJrc8lnjIGfDOvL15743MzywrfVR+L7INW9TL//JKqhjWL8qYjdWhPjtM7JAAC
         6Jd+JoE6AJqnoLiXDQDewCaPGecm7enBU+R9sGg8BRzxB/5fylGsQyIaL2UMZdWzlxny
         U/V+Ju4O4Zt9G3FDQg22zm3ZS/IWcJ8mO4UF/Yy6si7NRG/N8TxumaGGmoqYRg5XuFu2
         LVutnPGE4irEs0Ba5XLIAg6PK3C2CQnkgBU1V4ITncBkcasyqie9wqHVCSuPl8NHqKwA
         NFZqhwrYDSsnXwhAGvM+4q6SpPOVZCV45DiBPezitXYMVF3skN68gRwdMxzcHMXB2CNS
         HN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732698889; x=1733303689;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QE+M24fNM5/eVgcefx+ClWRg9PNN6EZ4F6IgEgRY4g=;
        b=LtsgKe/ksq+2Mf0PM6SlsJsdncz1tSM5/kOt6Vp1xr6AcJVs9GfyGIyIDLU0HcTZtf
         9o/vusMRX2LB180gwvMp5kaf9bL+6dZZMGmb8CL60t4TDy3VDnwMGvFc2dlrR1WOi6Z+
         NIuexqgdL0B+oyJGqbB0yBtRwnBWtniAjbSX+IlKWhyV9XWUX7f+kv/8ubKhL5XeJVDn
         DyxFmnTFN4EQABDgneAiUachQWLUSAE4CFhKCCpBBxjSF5nhhr2Fr/+dpLJiBRjfP6GO
         1FRDn2Lgf4ZuB6AHEM0JFyfgbuF/rkP0YJbHbUjPJs0IPMMlqNohT5sTTp3ttRT5vto/
         gy6A==
X-Forwarded-Encrypted: i=1; AJvYcCVmtmY0+QPgK/6DU89IsPgebLgy/at3gJJsx4mzFOqXUoMG4ZNbyrIMYwdF8x+nG3hC4d8n1oCQLAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkPh2XF/A57+qm8JYloXppdi7rqYN7iigRPUhEwIvOJU7l+PVg
	MuN63SQgPaWUh8NAH+8rLZJiVRatFfvcHC6lihrYxM/9YWO/xDEg/fg6bjtp6FJr9aBXdkGIk+L
	a7OuDnZ859/yvON015/dftcC6N3Q=
X-Gm-Gg: ASbGncsuqDfUuOQvZQRAaHLs9eOa3D8IrEUc7wTV0D0W0m9nCytm97InGlUANOG9+bP
	fLbuqiN+xIVozivLiYv0UGwncM4+uu8I=
X-Google-Smtp-Source: AGHT+IG/x+629epGOKSzNYyowLD5NUlws8HX63cTL/LRg95Yx1vti1JfWtGKqHg9v8wCPaFQEZvVa0rHipd7dxpY+pg=
X-Received: by 2002:a05:6902:703:b0:e30:c0bf:4227 with SMTP id
 3f1490d57ef6-e395b86a605mr2120725276.2.1732698888148; Wed, 27 Nov 2024
 01:14:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Homura Akemi <a1134123566@gmail.com>
Date: Wed, 27 Nov 2024 17:14:37 +0800
Message-ID: <CAC7i41Nz4KW9EE4hD_oiotK5B9CwaAmWs34ePk0F1KhbUYFiwg@mail.gmail.com>
Subject: Re: dwc3 Disable Compliance Mode
To: rob@gnarbox.com
Cc: felipe.balbi@linux.intel.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

I hope you are doing well. I recently encounter this Compliance Mode issue very
similar to yours with a dwc3 gadget product without a redriver, there
is no obvious
clue found. I found your discussion here, have you find out what cause
the timeout
eventually?
Do you have any suggestions on debugging this issue? Your help will be much
appreciated.

Thank you!
H. Akemi

