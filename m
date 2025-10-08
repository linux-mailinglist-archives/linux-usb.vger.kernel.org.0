Return-Path: <linux-usb+bounces-29006-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FD0BC3747
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 08:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C128E4E8CFB
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 06:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2E12DECAA;
	Wed,  8 Oct 2025 06:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bs5YvANP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5CE2BF016
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 06:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759904466; cv=none; b=mOpcwvMs7qJrijA16oeY++9g0D8MM0vqwP34G9evXFSd5hHMN2zoK4TgTwWLyM8jg9yhbaF0fhsQN2zOy2OUwb1MGmNXpMB05dt0b/NVHSSh5KJ1UMbHoyOf+i1SFA1LzBf/hi884jbyPH9vUvq6Q8heAk5KpbIOX99m6EPj7vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759904466; c=relaxed/simple;
	bh=N126oxfU8CB/Z/KfJJ25j5usrLom9As8SZR0QXbXq6E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nYtCXa12llB9I8axlSv05N5FmiYjcQL/1NWyC+VZRepZxXxB9it4ulvxL/pNWZJAobQUEsl7QIiQ6JD1KdYl2Oqvyyz5v+6qmFsuEyof9t6zlj7+QgRtcSI6BIELglPJrt1kAJJ3YimqD27TfRoDRzX1ACmCJ5yg514Yoy4vrRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bs5YvANP; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso2334227e87.3
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 23:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759904462; x=1760509262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXdeOIlNt41GOXTqIXLtw7txEKMs3lnhagD2W9H46L4=;
        b=Bs5YvANPksB2Ukggre3QGP4LJM0L0+/+YHFdyPDaG++/B+zNn950Bd2vYCfVhDSL+I
         n1IsSN8IHcxLOVu8xxtFpQZ1/YBALIS88QUZQGJyeQkLmrKD2ANDNNsLgE4lN0u+JPg0
         2IbYg+9Guz65DJeaLO2a6btSucf5m4Q7eGwxHClHpQPnrqA4jH/t8e4k03s9LPRvsB6N
         pHB71wdXu1ZC4MGOG31A4Z7FH/KwCFbjMvxy5Kmoh5zE93PocNV0KGMb8fTm+B2UEMsh
         xZELay3PDBb81VbUim+GLWkDI9R5U49pf1JTIS0EGLmOgpVNtE2vCTVPulczaNyuA3cr
         H4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759904462; x=1760509262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXdeOIlNt41GOXTqIXLtw7txEKMs3lnhagD2W9H46L4=;
        b=nKHXck6yi4gnIZdYxM7yn5FIWCXDaRCk+rSmLCSoxhPduufk2SXf0DIzka0mrH77Tk
         3HKKLLtiQC5Ze9f1vOiDDuFh7uqqLCEr9W7zA9x4/xmMUpf3y7WR6hy2Hk1dL6TTG34i
         hLeov7daFV+nDgneIqaiw/EC7RzQeZ2T3U+dxZNJthTE4AAnQzleaw1L8XUhf414NsIa
         3dwG9E+jJNHLnUNi7otG/XFyJYEvWFI+lRJyhjUlHA/5bSpo0Cd+InLhsnJbCGslsk48
         SGqQm9Y1Dc+If+vA5ggbo07TVsXbW5i52k7pSHKmmmFaMz22RDur+WzPLYlG6r8060ms
         WaRg==
X-Gm-Message-State: AOJu0YxYS8MGSoD0c3PSEpycduWpi3yJ+GyCg4YBmfVLrC9BTNMAjDxq
	xSCM7DpTr6Vy7gI67gY6Po3M0ku61XL7poU3jSj9KS0i8/i4gPSUuiXl
X-Gm-Gg: ASbGnctBL6EnV98Eax5y9Zs1aHl7xBl7rojYKl5YjegNmgBi0AAinuUTE1Wr65jTDqc
	Nq7XgU7Ju8kKr2Mb01HfXDAeErvlD4OWqYAiBwDeytRZjzVaDOsuKwQb81xP22XEKkSUDVqVeSS
	YsQ2wxCZdU2WYOehRt0QNoTRHT673C9DFS+rEVK9tTiDYrOhjKs1pZTnVWP6NqQU/aI4qS7quuv
	yOpzKbcvYuS+svxneb2X8a/2Vo7HipK5uwiLFdL/16toYmKgPKreV4BqsjzBDm7+xUu0jHUnI+t
	MhAShzZOFY9vdfQ2/m6yHaz9gSX2h/VliwHM1qzYB+UW8/poTUkAzJU5sOXk6N5McvJ0qJ4ogaD
	kzadmMIV/JMt/xZQfTRBWBbKh36qu15ZAz6pFjVNzFy/1M8J3wSKSktpWAHlOkWCWXLGraw==
X-Google-Smtp-Source: AGHT+IHrUy7H4L08z4Ynpc01XEkFnHjSGub5khCTp8fN/0b+zp5Kbo0V86XJg4KUOk4WoDFiTUAU6Q==
X-Received: by 2002:a05:6512:4015:b0:57b:517c:bf19 with SMTP id 2adb3069b0e04-5906d88ec80mr616662e87.19.1759904461503;
        Tue, 07 Oct 2025 23:21:01 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0113f16esm6908182e87.46.2025.10.07.23.20.59
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 07 Oct 2025 23:21:01 -0700 (PDT)
Date: Wed, 8 Oct 2025 08:20:55 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Arisa Snowbell <arisa.snowbell@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>, Mathias Nyman
 <mathias.nyman@linux.intel.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB
 merge
Message-ID: <20251008082055.5646dadc.michal.pecio@gmail.com>
In-Reply-To: <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
	<20251007231709.6c16802e.michal.pecio@gmail.com>
	<CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
	<CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 8 Oct 2025 03:15:31 +0200, Arisa Snowbell wrote:
> The first bad commit seems to be
> [719de070f764e079cdcb4ddeeb5b19b3ddddf9c1] usb: xhci-pci: add support
> for hosts with zero USB3 ports. All USB-A devices stop being
> visible/detected.

Hmm, OK. Copying xHCI people.

So the issue is that there are some USB ports on the motherboard where
devices work when they are hotplugged, but nothing is enumerated during
boot, correct?

Are all USB-A ports affected or only those limited to USB 2.0 speed?

If you look at hotplug notifications like
[    4.612030] usb 18-2: new high-speed USB device number 2 using xhci_hcd

the first number (18) is the USB bus number. You can then find the PCI
address of the xHCI controller by looking at the root hub (device 1):

$ lsusb -vs 18:1 |grep iSerial
  iSerial                 1 0000:0c:00.0


Can you reproduce the bug without rebooting by connecting some device
and then reloading the xhci driver on this particular controller?

echo 0000:0c:00.0 |tee /sys/bus/pci/drivers/xhci_hcd/unbind /sys/bus/pci/drivers/xhci_hcd/bind

Regards,
Michal

