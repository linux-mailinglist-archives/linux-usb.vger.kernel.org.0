Return-Path: <linux-usb+bounces-21535-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7B6A57FD5
	for <lists+linux-usb@lfdr.de>; Sun,  9 Mar 2025 00:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59838188C1D4
	for <lists+linux-usb@lfdr.de>; Sat,  8 Mar 2025 23:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081901AB6DE;
	Sat,  8 Mar 2025 23:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AziU1q+u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B74A199BC
	for <linux-usb@vger.kernel.org>; Sat,  8 Mar 2025 23:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741475776; cv=none; b=Ob/ltuM9GW8lNKEih1OIyQJakp+e0e87X1WAYxdB8CmNyNqbz/URnxFWhKb6yaj3mBPdABVZ54kffchsqrTftussw2y4RFcnDLLfB/A3RX8dBi0Kn1W9kTvqbjZ2kAOoRfe+u7AXD5vKE/IAey7Ovr70dd8DBfplAYlMy2pXdcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741475776; c=relaxed/simple;
	bh=z6H9a5G0BjuFxefqh+u+00XxgalVEKxWxNnkMuUn1iA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=c7I7JRL7aeA7sFCMP8ScGLLG1sW8JObCO6M0hX6TkMDiLAaN7DIyoayoaqmkoSICGuIS83NzgqxZiDK2axPrO42CWy7aZTZWjCuxmJKOg0ho4x6mVjJzZkUzy8krmHWLQFxDQeJpwcOVokM3wcYc+Y8OzDkCgmYZ4rG5lQAz9yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AziU1q+u; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abfe7b5fbe8so437467266b.0
        for <linux-usb@vger.kernel.org>; Sat, 08 Mar 2025 15:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741475772; x=1742080572; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oOg7WSGS6fQ0152nsQH54Rg97RgtkSzIh17S+3ovAFc=;
        b=AziU1q+uA7r1wp7/ksVZ8XxiMrNds1DSlvJUoDWFW16Di5x8sXVAGVjWzBdnUYqgfF
         M2Fv+fmfqHL+3fqWV88j8VRCOvZ1TeiZsMH6tiroL0rRjCNFJ+6RRmgSExmxF6Dq1TCw
         nbyJRAQQUa+EpS2yn87qP1KZ93sQNtMRJXeC8XCqeRLEQFDaX0Z6DYfdJrZ22CYbssei
         ZUFtBoYr0uMGCzT6nukN5HaNN605QnjhuVF3QghE1SJuriCrdSDGiTE6z4hZfzCJY9Mz
         MfCyNHIQl/QQ7HsJ4/qyMfzndXWSbaGEgdPz6GX7IBrmsvVYeRZnTLjVn6Q+CzchiaH+
         9jbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741475772; x=1742080572;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOg7WSGS6fQ0152nsQH54Rg97RgtkSzIh17S+3ovAFc=;
        b=wfadjJ3MLeZuYIHDrXKvhAuRl43xt2m4schf+6ytfOrxGzcA0fWaVZlrOoj1J3zvwE
         Npn1+V+P0P7aBwCIJBCHgUl6Jo4wgr42idyIGZaiLUm9gcxeZbxg9VXdI1BCxpd2QHQZ
         WwMIz1+AwOXS1jhOEV9VjSHROfZLjeoM8LVq+6BluEKJjhrXNnyRsnpnE+Tae1SSwJuY
         8KZ21Q08+t3e05dPTyaKYU75O6tAvPrmONWHqy4NfynF1/6NFR6MqB5kGQRUGK+YTrLu
         mhbODgD8H+23pZZfTPribgNKW2izC4hrZs7ShzZroMU+PJHNP3Xc2c4xkLI7hXuJOtSg
         T2nA==
X-Gm-Message-State: AOJu0YyHhbWnIxnKmph5AzOaPDBf/hf2sEFxu9IfDk+bG4wrPFvwQrIV
	6NSoTgfBssJoZubfuUK84UEzdPNDNBaRa/PF9PvmN9SwD30uFPyK5T57CDkE9WUZ0+uHrlIRZF3
	ImIb8XBEnMPblU0SWOPTscx3GoAZvUg==
X-Gm-Gg: ASbGncsDZB8aL/Q3CJqYBpay5+XgcvYTpak3Sln0AUlJYyPqS88SVWDEbm5apFwNwXO
	BVKh3l+Zye+ur2Dp8mOBBKPttHjIfq+Nk7/p18Q/6JTJmjxSjhQ2xTuepS7IkiMXz50ohFLN7KB
	JkBUukW4YR5CB9oQAEtQ7w404JhQ==
X-Google-Smtp-Source: AGHT+IFcQJKW2VVZxCWZFw+ELNjKtLK7iSabIseX0JCBX8I4NH5hEqd3d0+ZgCKQldLjLFNy3iXiX1ENlXePZuIWBXw=
X-Received: by 2002:a05:6402:518a:b0:5e5:b572:a6d7 with SMTP id
 4fb4d7f45d1cf-5e5e229bc4cmr23975747a12.6.1741475771450; Sat, 08 Mar 2025
 15:16:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: James Dutton <james.dutton@gmail.com>
Date: Sat, 8 Mar 2025 23:15:35 +0000
X-Gm-Features: AQ5f1JpxrD4r_HSsKSi4BMSaChTg3XsTjDgF4p0fMc03rLrZZWPeEDY9hdnWbXE
Message-ID: <CAAMvbhHOzPFBtbE9w1oZUWSWY4NX6ZKhpfNzzV0eOjw+eQ6-DA@mail.gmail.com>
Subject: USB PD typec EPR Mode
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I can see that the Linux kernel supports Fixed and Variable PD modes,
but I cannot see any support for typec EPR Mode  (Bit 23 set of the
PDO)

Are there any plans to add EPR Mode support?

Symptoms:
lm-sensors:
sensors  reports a PSU connected with a source of  5000mV when the PSU
is actually sourcing 36 Volts

I will probably implement it myself, but wished to check, in case
someone else had already done it?

Kind Regards

James

