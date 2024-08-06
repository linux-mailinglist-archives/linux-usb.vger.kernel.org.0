Return-Path: <linux-usb+bounces-13158-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DAB949824
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 21:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 810761C21F31
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 19:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6791613A256;
	Tue,  6 Aug 2024 19:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lsitec.org.br header.i=@lsitec.org.br header.b="bloV91mV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18AA47F4D
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 19:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722972143; cv=none; b=sRsxXjQ8Ni30hGn2lQ1XzrqgW8z8sMvHN8N8dHh5pTcH8R8P3vkcnDFa5Ors8R317oT2aKuIo7gDoLZERhE+vm+ufl8I79vAO6Lk/TA858UOFno3hXcb5gvJRdgPocB8vaIet/HYHoWqu9EkdqXLBfLj8f5GLGwa5kE6ZEQhvmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722972143; c=relaxed/simple;
	bh=MV8K5bnXCXgWBYR4tENTPoxnkAa+mxoeUZamd030duo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=UkW3C3FwAllewIoqyDm4QoDOlVZ/WAfm28OpROJgFZsTA69JrZY0OeHnnFLMEhLJ3tOuz7pQpLsgyu+eNfQ/afRvrz2ZiWTqPoFAGbetjdpp+8siMzddFpn4spkjPMtAUDo3eRbInkTx+v9pNe4PsS6oXD2dXFSyGzPXTnOwsCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lsitec.org.br; spf=pass smtp.mailfrom=lsitec.org.br; dkim=pass (2048-bit key) header.d=lsitec.org.br header.i=@lsitec.org.br header.b=bloV91mV; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lsitec.org.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lsitec.org.br
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so10495091fa.1
        for <linux-usb@vger.kernel.org>; Tue, 06 Aug 2024 12:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lsitec.org.br; s=google; t=1722972138; x=1723576938; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MV8K5bnXCXgWBYR4tENTPoxnkAa+mxoeUZamd030duo=;
        b=bloV91mVfRwTwSrHbzECZM+cWQsqH806PYRBXkLcUamJaLkmQ1st9gj8x3F7ayrvAH
         lPgmOZKzv8mU7bLueEOnT+w4JRDTxUaIG6k8SM9dWhekwbaDAOpzrH3wACjZ4+v6GlIl
         lyg0DGvOz4kZoF4ZrSIkPZ+gcscx2m6XxU5AWB0wxObS6BV+K3S8dfIowbGuCneeoGil
         RH0RIBmWII+2HzfItlgl9daU5zBNldzbLaF5b3bQ4bga9fYag+Ss7UyBHgEUt4iPmUIs
         5IV+LkBflOMqR1Nxnn1AXKuKczGqDtT2v+ex8/GNTA3mmjVHkAx5/myiPjOoaTDhgdGd
         H2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722972138; x=1723576938;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MV8K5bnXCXgWBYR4tENTPoxnkAa+mxoeUZamd030duo=;
        b=a/rLt1KWz3FPAihIbKrlVEezt9NORQlsqi0730TdMHHatGYmHt0O/ghQ77qUrzZgnY
         MT5/s+AhrZaqKUlYQjpqXqvL2x+PVR6FMYcW4O8wIfsV8adWLrr4Zq2nhaXtKiyExhIf
         VYOEgFqMJ2qwnVVCLsFnjpauaOrc5R4K/D5nW8NWDXSCuXbLmQnI+QMNrg/smnNMwmYK
         egg8uEERv1VLH1SrnlALlrZ9iomPg3ZIRveDGt9RjuxBPvK9Y2OTOpdSZ8W6WZW9/64L
         8C9cBiXG8SZRYtTof6joK9lFcMapoafPZoRWkfqeik/n5tO0By9BMpP2FTVu7GlU3Hbm
         DZLQ==
X-Gm-Message-State: AOJu0YwMUOzjiajyu8lLD7XZ8WIgu/v/tzZRE8AYsjWuKNddoWYmNY52
	HOucuMiCp24dvRcmON31QPNVHNnCh27KUkq+Zz7udyhgpzcKJPM+PybMsMlgzTn4vD+unZzkAdD
	7koDCUS8NFfZT8PXMROVCF3NynXZUu8lzw0a5u5+/rSyu4zB/06qG
X-Google-Smtp-Source: AGHT+IFoerJugdit2TJ1rAt1JvsFrjIw6d+M1DEMjaXv14/dw0W0jJQxoAJqlg8bjOkoiaZ+TILP+1IFQtOmU1l45QI=
X-Received: by 2002:a05:6512:3d89:b0:52e:7542:f469 with SMTP id
 2adb3069b0e04-530bb306eefmr11487055e87.0.1722972137799; Tue, 06 Aug 2024
 12:22:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ana Clara Forcelli <ana.forcelli@lsitec.org.br>
Date: Tue, 6 Aug 2024 16:22:06 -0300
Message-ID: <CALWWSVGV8vj+tP5H+DNfE5G6hZnHq8PtCbKTK8AmiZwxVFzqeQ@mail.gmail.com>
Subject: Issues while implementing DWC3 on an Actions S700 chip
To: linux-usb@vger.kernel.org, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset="UTF-8"

Hi there, I have been trying to reply to the last thread but for some
reason my emails might not have reached you.

I was trying to make the mainline kernel work, but the system won't
run without the Debian patches. Is the 6.9.10 kernel from Debian's
testing repository recent enough?

Many thanks!

