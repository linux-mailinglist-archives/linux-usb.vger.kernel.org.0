Return-Path: <linux-usb+bounces-14840-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7140297090F
	for <lists+linux-usb@lfdr.de>; Sun,  8 Sep 2024 19:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F9011C20C10
	for <lists+linux-usb@lfdr.de>; Sun,  8 Sep 2024 17:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B95171E65;
	Sun,  8 Sep 2024 17:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=webcom.xion.oxcs.net header.i=@webcom.xion.oxcs.net header.b="Alr7xi4l"
X-Original-To: linux-usb@vger.kernel.org
Received: from nmtao101.oxsus-vadesecure.net (mta-131a.oxsus-vadesecure.net [135.148.117.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7911C01
	for <linux-usb@vger.kernel.org>; Sun,  8 Sep 2024 17:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=135.148.117.228
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725816913; cv=pass; b=Rf7cOq9NOSMDqniEMhgRNzD+eK0MXeeu/2scbxILbYd/vD6Ae79/8OKdRQB9IklWr6XP+qS7uqv+Ar913j5o4kvxcMTk93JoWS2c/d/g1+gtMx/t2a17suuy8Yrop5tofYvKKa1w4qm/ulTat18YRzmV8wOKtRJKvCimO+rNoO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725816913; c=relaxed/simple;
	bh=O6V9H5eyIIj+ZtiiR01PI0i0jkyZhprqF1u6c5sukxA=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=L1B8KGZvnSiF5+uBgwqelUK41Y2IqTsQjssYgccvyuOshG3V2GP7XRr7c7BlTbju4ZhY+IYVJWfonKWLssypO9gPrWXSWqEepXqU72L1RB1Tf6OM0VFdCDF0w92SYvem30TLc0FQk0WYT8Px+fwcwclaVyq3TWTyEP21Ukmf7YE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensat.com; spf=fail smtp.mailfrom=opensat.com; dkim=pass (2048-bit key) header.d=webcom.xion.oxcs.net header.i=@webcom.xion.oxcs.net header.b=Alr7xi4l; arc=pass smtp.client-ip=135.148.117.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensat.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=opensat.com
Authentication-Results: oxsus-vadesecure.net;
 auth=pass smtp.auth=3@311702 smtp.mailfrom=sbrown@opensat.com;
ARC-Seal: i=1; a=rsa-sha256; d=oxsus-vadesecure.net; s=arc-202309-rsa2048; t=1725816891; cv=none; b=a+/d8Gn1F00oH6GhJYlRk8GBgyDE2cgUZuWfvb4BQDG92KYxSSHtdoRwqvknnuClQf+aAUZu95oVJ5NIS8q5riPSAf9bqm9oX3AyvvAmTLHcuzLxpFo8sXomRTafFAdeGfMnnrYL1PsFAO1TxGdra2Ufn9vRUmTaFMbVCdgAYjlfuBmzxF9L0bIx0BI6iXbd0Y+kxpSzUQfhzUpPWMTE1XpeLa58wzoa6WWO1rSEZ5ALbmIvMyEGFrl451K2sxA3cImerR4v36QqYAjJcTxI+qdIPwfGhhm68x7rN5ih3mGddODqCD7DQ6FV770kiBVn5ROc6rw9CimA/lsIFHWh3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=oxsus-vadesecure.net; s=arc-202309-rsa2048; t=1725816891; c=relaxed/relaxed; h=from:reply-to:subject:date:to:cc:resent-date:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post:list-owner:list-archive; bh=oFf67DdN/uo9gmQvE4MCYp+CJ2YUhbQ4nhyphvCI530=; b=mJ31yokUhDdwUxKBjMTD6fZj3k4Nk4HebePrEcPNn2zqy5A83R1KKrskZuqd3sAncJLZtFm5bFrnrGK90HFwxGrmmLkuOZHhsem3SjNoH4jjOtaXcLIo+lGazhLuab9Nkgx89lFDAYNCibK2fRsjgpK6TG1RaA93fEXtiLgKdJEoxpKg4usxw6HOOOxQkSEboe0eFRDh//RaukPZKS44QfL6ff0TXCMhTnZPVwisPHCDaiq3g9aNlXC96/D6c9YEtQQ7809HQHLNuuEd0KqRc2QplLe83BIHcJwWEbHPVphspdQHRQ+9m+TeTHqSKh8uG7q/MdrgH9EMNIkXkzajsg==
ARC-Authentication-Results: i=1;
DKIM-Signature: v=1; a=rsa-sha256; bh=oFf67DdN/uo9gmQvE4MCYp+CJ2YUhbQ4nhyphv
 CI530=; c=relaxed/relaxed; d=webcom.xion.oxcs.net; h=from:reply-to:
 subject:date:to:cc:resent-date:resent-from:resent-to:resent-cc:
 in-reply-to:references:list-id:list-help:list-unsubscribe:
 list-unsubscribe-post:list-subscribe:list-post:list-owner:list-archive;
 q=dns/txt; s=mail1; t=1725816891; x=1726421691; b=Alr7xi4lFjLkz1W9aefVV
 1qZx91B+ehCjWttklq2AqAF8pizceSwR5ZPq2hwq3st1yx2WhGEnUn8SyjhcUOm5AbrVNnA
 kPtFunNxd1t0taW5sBg1s9nOK98D8b2xTUU6Db27UaCj/1fqFD8eKUqL4vn08Hwq0HhkJvT
 ptocaXwhw1hQHop7U2ybQwP0ar4zoiXP2B6+rS6qHbU/rBhwnx5U9SCDJLH92E6wN4bnHSF
 bsbshHP4KRPMW9x33PZzAy6OMzC4slOdUNSGr72+LCptRkfRcTWtbCCpkeqn67OoMQD8Mi1
 BejYigEbHbiC/yoeLJZVdqsNOHYtRq4oT+zbQ==
Received: from proxy-13.proxy.cloudus.ewr.xion.oxcs.net ([50.77.43.154])
 by oxsus1nmtao01p.internal.vadesecure.com with ngmta
 id 779605eb-17f35551540ecceb; Sun, 08 Sep 2024 17:34:51 +0000
Received: from localhost (localhost [127.0.0.1])
	by opensat.com (Postfix) with ESMTP id AC66F8F40301;
	Sun,  8 Sep 2024 11:34:48 -0600 (MDT)
X-Virus-Scanned: Debian amavisd-new at opensat.com
Received: from opensat.com ([127.0.0.1])
	by localhost (nm-server.opensat.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djc3LeTkS4Dn; Sun,  8 Sep 2024 11:34:46 -0600 (MDT)
Received: from P340.lan (P340.lan [192.168.10.2])
	by opensat.com (Postfix) with ESMTP id 918128F400AF;
	Sun,  8 Sep 2024 11:34:46 -0600 (MDT)
Message-ID: <2cebd02d4fcfbc7c72d3daa4e0112c69baca0aba.camel@ewol.com>
Subject: [BUG REPORT] usb: dwc3: Transaction Error while doing iso output
From: Steve Brown <sbrown@opensat.com>
To: felipe.balbi@linux.intel.com
Cc: linux-usb@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Date: Sun, 08 Sep 2024 11:34:46 -0600
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

 Hi Felipe,
 =20
 =20
 The problem was encountered using the wsjtx packet radio program in
conjunction with a Yaesu FT-710 ham radio transceiver. The FT-710 has a
dual uart and sound device behind an internal hub. The uarts are used
to control the radio frequency and switch between transmit and receive.
The sound device is used for transmit and receive audio.=C2=A0
 The uarts and sound device receive (input) function as expected, but
the transmit (output) fails.

 =20
 =20
 I distilled the failure to the following scenario:
 =20
 1. Using aplay to send a short file to the sound output succeeds.
2. Opening one of the uarts via "cat /dev/ttyUSB0" and then sending the
sound file fails.

 =20
 =20
 Wireshark reports the iso transmit failure as Protocol Error (-71).
Ftrace of xhci reports it as a Transaction Error (0x04) returned by the
dwc3 controller.
 =20
=20
 I have tested this on a RPi4b and RPi5 as well as a several Rockchip
boards. All fail.
 =20
 =20
 The dwc2 controllers on the USB-C connector on both the RPi4b and RPi5
do not exhibit this problem. Nor does the dwc2 controller on the RPi3b.
The Intel Comet Lake USB3.0 controller on my desktop machine succeeds
as well.
=20

 GSPNSID values for the various boards:
RPi5 is 5533330b  BCM2712 / USB:RP1
RPi4b is 4f54280a BCM2711 / USB:VL805
OPi5Pro is 5533300a RK3588S USB:soc
OPi3 is 5533300a RK3566 USB:soc

 If I insert a USB1.1 hub prior to the radio, the iso output succeeds.=20

=20
 Below is the usb tree. The board is an RPi5 running kernel 6.11.0-rc6
from https://github.com/raspberrypi/linux.git
=20
  /:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/2p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
     |__ Port 2: Dev 27, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
         ID 04b4:6560 Cypress Semiconductor Corp. CY7C65640 USB-2.0 "TetraH=
ub"
         |__ Port 1: Dev 28, If 0, Class=3DVendor Specific Class, Driver=3D=
cp210x, 12M
             ID 10c4:ea70 Silicon Labs CP2105 Dual UART Bridge
         |__ Port 1: Dev 28, If 1, Class=3DVendor Specific Class, Driver=3D=
cp210x, 12M
             ID 10c4:ea70 Silicon Labs CP2105 Dual UART Bridge
         |__ Port 2: Dev 29, If 0, Class=3DAudio, Driver=3Dsnd-usb-audio, 1=
2M
             ID 0d8c:0013 C-Media Electronics, Inc.=20
         |__ Port 2: Dev 29, If 3, Class=3DHuman Interface Device, Driver=
=3Dusbhid, 12M
             ID 0d8c:0013 C-Media Electronics, Inc.=20
         |__ Port 2: Dev 29, If 1, Class=3DAudio, Driver=3Dsnd-usb-audio, 1=
2M
             ID 0d8c:0013 C-Media Electronics, Inc.=20
         |__ Port 2: Dev 29, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 1=
2M
             ID 0d8c:0013 C-Media Electronics, Inc.

  I have the wireshark pcap and the ftrace, but I'm not sure how to get
the reg dump at the instant of the error. I can post these files if you
think they would be useful. However, this appears to be a problem with
the controller, not the driver.
=20
 Lastly, I have one of the Taradov usb sniffers. When I hook it up and
attempt to see what's on the wire, the behavior changes and all I get
is continuous log of:
 Sep 06 09:21:58 wsjtx kernel: usb 3-2: clear tt 1 (9021) error -71

 I have the sniffer output from the above and can post it if you think it's=
 useful.=C2=A0 =20
The sniffer performs as expected on my desktop machine.
=20

Do you have a suggestion of how to proceed?
=20

Steve WA9OLA
=20
=20
=20
=20
=20

=20
=20
=20
=20

=20
 =20
=20

