Return-Path: <linux-usb+bounces-31956-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E40E1CF7E13
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 11:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2294330205F5
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 10:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E36033D6C7;
	Tue,  6 Jan 2026 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hernandez-ros.com header.i=@hernandez-ros.com header.b="HsH0acj6";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="QOHcViMK"
X-Original-To: linux-usb@vger.kernel.org
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B913385B5
	for <linux-usb@vger.kernel.org>; Tue,  6 Jan 2026 10:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.27.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767696247; cv=none; b=JA44OJboihmGtEfVdEkE4o2ZHU4onSSGl1zOZmY9+gj06Tq1oT4R8no0gkS62xCpU2l9XOW5akwmH5CcTvf9jmqJkCQIHYxWRYj0GkEu6K/J8CJSrOgplJg0Dkl2+qiIsxqyWGi/WFWAQjAW05IJ2Yk59dLW3kyocF4URDNQfS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767696247; c=relaxed/simple;
	bh=SznOKpIVP+cCzD8uoH96XRn/r04yVT1LNOjexKqXMEY=;
	h=From:Content-Type:Mime-Version:Subject:Message-ID:Date:Cc:To; b=A8TB8kX/ZrdN2znRToR8gGfh5FBdTKOAlw7cvE/s3+bbjmRMmyW117Fyh2X9/didh8aGM9WuW/pDw5FIBgKMAi8f3Rwi7BS3tIFozi9jND+GNUaR1jZ2mBgdD9z2OXiJUjoPuFJGBV+cd8NV0qaKqYSh2zRHUfACnsp0UchT0rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hernandez-ros.com; spf=pass smtp.mailfrom=us-west-2.amazonses.com; dkim=pass (1024-bit key) header.d=hernandez-ros.com header.i=@hernandez-ros.com header.b=HsH0acj6; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=QOHcViMK; arc=none smtp.client-ip=54.240.27.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hernandez-ros.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-2.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4vmhj3boyfilqttfply4nxrhvlvpcgyy; d=hernandez-ros.com;
	t=1767696243;
	h=From:Content-Type:Content-Transfer-Encoding:Mime-Version:Subject:Message-Id:Date:Cc:To;
	bh=SznOKpIVP+cCzD8uoH96XRn/r04yVT1LNOjexKqXMEY=;
	b=HsH0acj6eHzJdp/6IPKmqtH5dGNwTQYjBTmApbJRCOVYF+gaEGoAMKiyuGPlG/6+
	Pw7vmHR+8CspH8Q63vJKmEAUduleTl6eqcE2aBFkLu4zgl2XIDUJnEneoRh0k2l/e2S
	9E/7Yx5D3/bp6F/XdzMZLbgyMQrfqjNLr3llVDqM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767696243;
	h=From:Content-Type:Content-Transfer-Encoding:Mime-Version:Subject:Message-Id:Date:Cc:To:Feedback-ID;
	bh=SznOKpIVP+cCzD8uoH96XRn/r04yVT1LNOjexKqXMEY=;
	b=QOHcViMKZe1PCUwi2uNrTxKQnayGyMMnQAMArUEjlnK1N7eSa9YhJX1t9aT5FvNN
	YBpXIg6h+bQTbbLF9bzv6oTN+GQbGEMAdQ5CrVvxNTqh2WwUl2fmIpFtnzGTKvY5VFO
	SPSDID7PWy0Je92ThdUBIN3p9ak3vXOIOfSLVSuk=
From: Ignacio Hernandez-Ros <ignacio@hernandez-ros.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: USB/IP bug report - dmesg filled with to usb_unlink_urb() when using
 two instances of same device
Message-ID: <0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com>
Date: Tue, 6 Jan 2026 10:44:03 +0000
Cc: i@zenithal.me
To: valentina.manea.m@gmail.com, shuah@kernel.org, skhan@linuxfoundation.org, 
	linux-usb@vger.kernel.org
X-Mailer: Apple Mail (2.3864.200.81.1.6)
Feedback-ID: ::1.us-west-2.HjGwZwg5MFiEpu6H35PNuAp1STds0CnEvbYH/ASzZjo=:AmazonSES
X-SES-Outgoing: 2026.01.06-54.240.27.33

Hello maintainers,

I would like to submit a bug report related to the usbip-host module. =
Here is the context:

1. I=E2=80=99ve two equal UPS devices attached to a single Raspberry PI. =
The Raspberry run Debian trixie and is sharing the two devices with same =
VID and PID but different serial number and port attached (one is at =
1-1.2 and the other is at 1-1.4)
2. Launching =E2=80=98dmesg=E2=80=99 in the host shows this result:


=E2=80=A6
[63386.686712] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[63387.003578] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[63388.688086] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[63389.004953] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[63390.689275] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[63391.006049] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
=E2=80=A6

Every second or so, there is a new line in the log.

3. Looking at the possible reasons for this problem I dig into =
https://github.com/torvalds/linux/blob/7f98ab9da046865d57c102fd3ca9669a298=
45f67/drivers/usb/usbip/stub_rx.c#L635

And the source of the issue (Note: I=E2=80=99m not 100% sure about this =
statement ) might be related to the flag =E2=80=9Cis_tweaked=E2=80=9D =
that is not distinct per device but common to all num_urbs.

Hope you can evaluate this bug report.

Regards
Ignacio=

