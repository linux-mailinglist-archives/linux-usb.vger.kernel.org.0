Return-Path: <linux-usb+bounces-29086-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EA1BC9030
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 14:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47BD83A8547
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 12:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C782E336E;
	Thu,  9 Oct 2025 12:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAqYBPV4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B192D8DD9
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760012962; cv=none; b=f2LqymMzPNq7VAv279FnQqBybgZipqRi/aIW/XwcFA/fLO/nJOE4W1W9azntI/sjQg1nS5moKI9KCWfLy60Xp3RUY1EyNtFRUplIowEP96ZOkAoeepn8ApMKJDPvrC0w436yaNz49V+jyD6QmsIQdNbZjzGoJjGanhvBnJc0IQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760012962; c=relaxed/simple;
	bh=VzdC46ij9og/QMv5wDDGRQOuoWac6/8T3RkbIGb96os=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E3D8uqHZMs6BO74bKdPGHZbx364JAQ5Yqup9T6oAMlEyYvuYPXGNI91kWuuM0zNZnQ048LCyxnOJ64g1ayqCeLt3IU1sQ4thXNdY6dx3zZZsgds1WGNEw3hNUDYIRnLv+tXS++Jhg5Q4sll3kkXZ5MIfRrDuf5oqVByUaQEs/Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAqYBPV4; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-637dbabdb32so1708192a12.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Oct 2025 05:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760012958; x=1760617758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyW/MRHSFiY33jmW9b/P7thbCXCFOf6rw+BoiTwW0Y8=;
        b=mAqYBPV4K+Vi0JlCaGrcNj07pW7Q5UXJvCzqVKqHBzag/tEGXxVK04Tsc+aN4UqC4Z
         4rWVfJBmkkZWd0uBnHjPW3FVgeUcOEigl9GWyOrHRdS/TYOVX7SzC/KxwpjcUrXw7hTX
         7/bROlBQHry0+vQk6ZbxZdaJHAuVJvjGdkw05ikiH3Pk/tSCAvQoqOKrtKgK6NkRSlMK
         oLvlZs6Q0Fph1pS9NE7ci1j4Dyz4VPwywKmoF3IUr6Vay9FYqLvg1Il1PGWejyDKjbb1
         5EBqi0hbfBFXH3gpOTY/AVbQoIIFXgyCwwaTiPxTw7w+MZZXuQ2uWfMOJlm6AyETKwVe
         Uhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760012958; x=1760617758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyW/MRHSFiY33jmW9b/P7thbCXCFOf6rw+BoiTwW0Y8=;
        b=npCZbw5ZfuEU+2dxKct5j9QdL37lQywPcaex6MEZctfnty78nhaodGNt8by9kpOzHO
         0IeK0v0q0MgLgsajgkjRbZME/NdLXGaqKhkkD/yCb/exYNCEVp4z73k4n6/kM+89E8/E
         jhAM829txHVpwAxe94gdTWMm7e7eFwb4MsdEL7YUZVF/TijKQbJ/ULwJ5mdvl9a5RYT5
         6OeqWQfzdKiYX5IT8J3xYNZDj6lhtSyy8AVggae2x+tQHxjDZsL5DWXOmOsVJOYUQi57
         KGBGtHHCe+YBvD0Ul+2CoH22dfYkHkNkw+668sPcs3JV/Gtj6daqf8k9B4anZPCXq0J6
         dpfw==
X-Gm-Message-State: AOJu0Yx6kNaQcubOULbtyk+0cNcgWq3YrM9OEmDnK4x0X8SYI4iZ/8kZ
	p4JUiRVZBNCDyNRJDVassCkW5DBuHjiTeeP2DGvZrOEqnbUD4ja8UeCWMVOBwg==
X-Gm-Gg: ASbGncs+7cLKLkCzz/ukY0jv8/xQuNxUNa15/tI43tHf+5zv0LtOtb9m98Y/iFHognf
	SJgl9zggNR9oNSwcZIqR7Yv+jkJvPFx2oeMb/4HMNwRFwFtU9qyopzrZl9CzRkE+p84d/JRke4l
	2AEzqCysbCzwd/JVLR+HCH9PD9Rzk9O5QFMB7qipnY1FV0L/ltJjwe9C0TVveF+leHwoA6D9hTS
	MAZCckf6F72o7W+FEm5RsPhnHROUPlJr90C6E9xRFBEj6L+KAXhN44eGrftLK8r9/RYOFQ3mkdx
	Zrlf0Yl+4H2i+0Sptu3fLj7yCtY/YuMDw7QvC42Q5IFrcmSWSMP9p5bcQXyCLf3r+RmXB2JerH5
	QLjVjELwDrdOdJAiQV1kGouGpSX0gvEcths9VPAnw3gMKtxrVYu3hSzAkx6R5ObhUumvTJw==
X-Google-Smtp-Source: AGHT+IEUFt2opNB1FkGPRiWGkz3n+VBsnJz1zaUezVI3q1ZBqp6vQVbi/Nvy0LOYCR/GmfXBoc7uag==
X-Received: by 2002:a05:6402:51c9:b0:629:e50c:b058 with SMTP id 4fb4d7f45d1cf-639d5c52cdamr7113841a12.28.1760012956991;
        Thu, 09 Oct 2025 05:29:16 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f30fb7dfsm2279630a12.19.2025.10.09.05.29.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 09 Oct 2025 05:29:16 -0700 (PDT)
Date: Thu, 9 Oct 2025 14:29:11 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Arisa Snowbell <arisa.snowbell@gmail.com>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci-pci: Fix USB2-only root hub registration
Message-ID: <20251009142911.6069c164.michal.pecio@gmail.com>
In-Reply-To: <CABpa4MC-pij0Fczh-mH3zc+Ey2ALX70OfxX=cG4om7R6WMdRBg@mail.gmail.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
	<20251007231709.6c16802e.michal.pecio@gmail.com>
	<CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
	<CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
	<20251008082055.5646dadc.michal.pecio@gmail.com>
	<CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
	<20251008130532.49922d58.michal.pecio@gmail.com>
	<CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
	<20251008223406.13f16f19.michal.pecio@gmail.com>
	<CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
	<CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
	<20251009131444.2c221922.michal.pecio@gmail.com>
	<CABpa4MC-pij0Fczh-mH3zc+Ey2ALX70OfxX=cG4om7R6WMdRBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

A recent change to hide USB3 root hubs of USB2-only controllers broke
registration of USB2 root hubs - allow_single_roothub is set too late,
and by this time xhci_run() has already deferred root hub registration
until after the shared HCD is added, which will never happen.

This makes such controllers unusable, but testers didn't notice since
they were only bothered by warnings about empty USB3 root hubs. The bug
caused problems to other people who actually use such HCs and I was
able to confirm it on an ordinary HC by patching to ignore USB3 ports.

Setting allow_single_roothub during early setup fixes things.

Reported-by: Arisa Snowbell <arisa.snowbell@gmail.com>
Closes: https://lore.kernel.org/linux-usb/CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com/
Fixes: 719de070f764 ("usb: xhci-pci: add support for hosts with zero USB3 ports")
Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---


Arisa, does this version also work?


 drivers/usb/host/xhci-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 13454bef14d3..cb7f5dd34333 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -580,6 +580,7 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
 
 	/* imod_interval is the interrupt moderation value in nanoseconds. */
 	xhci->imod_interval = 40000;
+	xhci->allow_single_roothub = 1;
 
 	retval = xhci_gen_setup(hcd, xhci_pci_quirks);
 	if (retval)
@@ -643,7 +644,6 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	xhci = hcd_to_xhci(hcd);
 	xhci->reset = reset;
 
-	xhci->allow_single_roothub = 1;
 	if (!xhci_has_one_roothub(xhci)) {
 		xhci->shared_hcd = usb_create_shared_hcd(&xhci_pci_hc_driver, &dev->dev,
 							 pci_name(dev), hcd);
-- 
2.48.1

