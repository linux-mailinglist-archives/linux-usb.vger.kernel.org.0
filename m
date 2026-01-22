Return-Path: <linux-usb+bounces-32636-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDa6Bl1UcmnpfAAAu9opvQ
	(envelope-from <linux-usb+bounces-32636-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 17:46:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE5E6A386
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 17:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6635931FFDCC
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 16:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBD54DC546;
	Thu, 22 Jan 2026 16:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCIKhS7+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0304A5AED
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098695; cv=pass; b=n4ethri2u/VQ4y0ldBiRv40dIPoVl3QE3RteKBgRNcuoKUd7n9i0unv5496DQadvBa9BdKlyOvnI+5Gvj27uCniJ8MlJ0VOj7pMsgFcLRWArPpz0NJdJCwB0FoinYq/5ep3yi/QcIOTG4F+PDhcRYCJTcV6JLtK+h/k1o0vYpT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098695; c=relaxed/simple;
	bh=ZgqBjrkfkOYhFn67ndZoGr9l9YqTB28pM1ctWdj1+9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVA7pIB0btu1G72UTJr+bRcJ2cBZ7HPdqeLG2zIy3sI3MobCUNL3JsV95tA9P03t/6NXuO/PsR/rb5Ov/oCmA6JlLRBh3HoGZ4lLfI8NqSj3N89KOWVGx6q9G6A0SQPai0eEwszLySCnROYtLA6mGzpzolVDxBPdzEde9w2u8cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCIKhS7+; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4327790c4e9so786968f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 08:18:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769098683; cv=none;
        d=google.com; s=arc-20240605;
        b=QsVdhUbxmyGZWw8mkAYhCXnQs25UolJ45VkDUoxea/udXyDOZIx4LQO4F2I/kn0X+O
         U+jxuakCBAL7TL1haw/0lTERM+f1YBVLC3qq8NNOsAgDjdaFxk392nCnLw7D53c/bPiJ
         8zKwL4UgJKwM70jMfiGVVS4VyRtpNtB21gf5AOJe2rarbTJgsoNt95LXnP2Goy1k+w8u
         x1fnaMbh/DbT6fABJ/e9fBu4At/cQEIfl1AHkp2J+MS2BYDtCjEy5FOnWPAYlEXa5dau
         qIhOmzh2r3e4efPvtZuXi8bJBFynLAGToEJnv3m6xI8etpsowBvy8Mik90CmnrNX73tu
         /fGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZgqBjrkfkOYhFn67ndZoGr9l9YqTB28pM1ctWdj1+9k=;
        fh=MRxiINe9WavUm4+lIs2VmEg5S8YMzRjZEdfBBfuVJOU=;
        b=M1iLr4f5avxTSo0HZGReqdshl9M0xmCRkKgNbWwKSDA2qI7agZ5oW7qWLnJkADG6x4
         IsMRKUPbAojfsx051RL5HMzIDUI1eFxDIw0BC7dN69wbq/d4Cr4CkijZ8UJR5OLjHX0m
         +xovKkSevSUw19d99IFS+73wxUeGM8vc8Bh0PkKzIUfp1azx2hQtwmEMitABl1JXxfA4
         MtcJS+J0JSeNcwKItPumP62R3HMmde3t9lxYR3G7zlBuOo4WgkfKB8MDEiA5xQXfszPZ
         SRHw2gCa81ERSLFim/aYjJwjn7ivblTknf4dXZhtvf5N2maGrtrDjMqaGXvoRdIWs7si
         NVBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769098683; x=1769703483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgqBjrkfkOYhFn67ndZoGr9l9YqTB28pM1ctWdj1+9k=;
        b=kCIKhS7+aHqOI89jcXKBCXXr3IFsRkT1kGV/35LQgZE4c+w0VO+z7HNRvl9ssa9/Tu
         Wm0rX7hFWvOa8eOqfHLFuuieyDoTzPWMpxtfMQSZCwwcHh0/N29D27qdkrBK5VyakXa3
         TlYGzxF04hBu9dPlNlZ7+8y5GVLrXiXYza5+NGOJwKOOyntJQ/rbukFIEK1C4ehjH3TS
         u0xXidXG8m7nj4R4QJRgKdtk+WH6wAWwwPH2O0Zivdekj6I+oBLTQHGTqFICt/GyrlaP
         m6SULOh3UT58nW3ToYJEnGP8QEc+dOOPD+PC+M7BcREgnMVbdkiowO2/vefLIThcttvY
         J6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769098683; x=1769703483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZgqBjrkfkOYhFn67ndZoGr9l9YqTB28pM1ctWdj1+9k=;
        b=tENFjsovJA8hw9tk26VAmILO60IX1f8vZ5L/UZGMAV+P549+E3fSbxOMrtAY8IXhIS
         5YAYDOzQgujeeSgqUvonQQE30FnET8Wnr1OeaQ+VRkjg7RAfTH5fnQgVT0/bmL9tY4GE
         lz3PNvNMiV7FVN8bO1sI5uQ9+aP1T0MB4eNjaL/JkETSr8tZLesFo6szg2Ap9/zwblKJ
         babihr5VugbZi+J9C4OgnxvoDGxkyxxsgRZencdV4e/pGd6WuPkEBKk/9IqZ+IxCUNgz
         +F8kTMOAlcQSt0ziHLlOik3mxTdnaEsynndzlfgV6NgVff0D8d832eaIBCY0XKvCzps+
         sdJA==
X-Forwarded-Encrypted: i=1; AJvYcCUY6PB0UsStMfmP0TnS579QHDNy4KogMMpNO/ksBUnU/d14WEuTZnCFf0Tn2dacIkWAdJSI9NJ0bUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBKBTCnu6GnjHLhz3buBoBYQa4BL3tlQWW5ZfrW8q5rjIYH1v7
	7abuNcyW+4ukfIL+UAJPkfR6I7mgrm5LsZGnctPOCwi5xgbYV+ISIfExwPpGgtZZsDLaedHUsmX
	j+HR8DIOOShytIuEugcswPFcCqM/YkMQ=
X-Gm-Gg: AZuq6aKsetGtuvOlmuboH73nUy2IbIREmhBE2y5cR/kAwPPcW1D7pnpTbqxdu8L1XwC
	5S95xK4OtWyYYSuYfjrG8a6snVCUWJKMwrMsmiwwwXiTCXa9VAQz8F1HzMjb+wxa1WyYGmTqTjf
	eF1+VFJrxufwgxxfXBbmcPcWPfQ6uM6Omp+9GiXbRx3maCRKJM6wkWW0QkULEHRHKbv2Tc/vPKR
	zzzleuCktyLqDYRf6LYEykw+HG1Ea6WEkDKqR+ZXoY8tnC5v8aR+DzjI3n2CUBOjFfCB3qx
X-Received: by 2002:a5d:5f93:0:b0:435:91b8:e01b with SMTP id
 ffacd0b85a97d-435b1607c6emr115009f8f.45.1769098683075; Thu, 22 Jan 2026
 08:18:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122151746.7745-1-clamor95@gmail.com> <20260122151746.7745-2-clamor95@gmail.com>
 <fa42a103-3b71-4151-b44d-573452847f6e@gmail.com>
In-Reply-To: <fa42a103-3b71-4151-b44d-573452847f6e@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 22 Jan 2026 18:17:51 +0200
X-Gm-Features: AZwV_QhHA2uy9Ldl3xAOyKL0jH8x1S78cBP7YqfWjbQwKB6nsAbfuVqdZ-A2M18
Message-ID: <CAPVz0n2xcnvus_u4dYDGL0VcgkWfVOJF7=hKuMPrjsE4UZTNLQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] usb: csc-acm: add Infineon/Comneon modem support (1519:0020)
To: Lars Melin <larsm17@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-32636-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8FE5E6A386
X-Rspamd-Action: no action

=D1=87=D1=82, 22 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 17:58 Lars=
 Melin <larsm17@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 2026-01-22 22:17, Svyatoslav Ryhel wrote:
> > Add support for Infineon/Comneon XMM626X modem that used in many Tegra3=
0
> > devices with GSM capablities like LG Optimus 4X (P880) and Vu (P895).
> >
> > The Vendor Id is 0x1519
> > The Product ID is 0x0020
> >
> > Output of lsusb:
> > Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> Hi,
> please include a full lsusb output, ie lsusb -vd 1519:0020 so we can
> verify that union descriptors are missing.
> (I have seen a full lsusb output where they are included.)
>
Hello there! Sure, here is what I get if I use lsusb -vd 1519:0020

lg-p895:~$ lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux 6.16.0+ ehci_hcd EHCI Host Controlle=
r
Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device
lg-p895:~$ lsusb -vd 1519:0020
Bus 001 Device 001: ID 1d6b:0002 Linux 6.16.0+ ehci_hcd EHCI Host Controlle=
r
Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device
lg-p895:~$ lsusb -vd 1519:0020
Bus 001 Device 001: ID 1d6b:0002 Linux 6.16.0+ ehci_hcd EHCI Host Controlle=
r
Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device

regular lsusb is added for reference.

>
> thanks
> Lars

