Return-Path: <linux-usb+bounces-14227-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 053D39624B0
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 12:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E47FB21F6A
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 10:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F53169382;
	Wed, 28 Aug 2024 10:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b="Mq3q9JOk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EF8158210
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724840480; cv=none; b=IWpbc9s5+tRIU7FihN93U56ObXxEkNl5lEKMN0haRCd0C8NLBE1et64VVTtmHZUn0NUSsSZJEuM3ow0nMOf8kUMlDVNE7fv7uIcxxZHLXQRO8k5F7M9RDUJdQZDNGNgCpbRIPVRMGVrduu8NusGd3HHoOCMzqCDNoJPODqFyeRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724840480; c=relaxed/simple;
	bh=TQJnxHrC3zVZjcKeo68uMhiXHwm8tWQVU5nBniav6sA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ufVY5AzEp1CHk3HBjHROHXk3MA40PNW3LvqbenD8qdaO1iv7D0hnyfX7lAJdJy6Ay/ruJbdThydiIcW5k/R1vmmxKRcK1A3SxayWnnfu6CewKcq1SHvcMa/HzL/XIaTE75sHHzpWsN4T64QdeIKPw8BNfUF8i4BrHH9VuSLB7Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b=Mq3q9JOk; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724840470; x=1725445270; i=mista.tapas@gmx.net;
	bh=TQJnxHrC3zVZjcKeo68uMhiXHwm8tWQVU5nBniav6sA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Mq3q9JOk1NxDRhqsmo7PLottyFtf5GW+cCTJHFmQYFys/A6zhNMQwI+VnZBmErFV
	 1RrMFlCoyC/0YG4Ywp9+JWha7EFbfRezQn6VRUxU+GGdX4fByVKbyvhxrVsCqKstp
	 c+CTp7BrrwUNPTRE6ifaBLU5zfcaZ/dnUhfT177CQMhV7XDAnDBrledBY0ZOI9/FM
	 JsoO1n+uz8ujhlPWGjZyucAceREnfO2I8iRIEEJJJZ5QRqw6VsrpGPPOLOPwNNJg7
	 nMEuzKTSgrh5y6r6efhRQL20t8jB6LQvgiBmg/LC3nCBRUVguyS7pzp+++0m/yARX
	 EqtVvDZFAKo1ykqB/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.77] ([149.50.50.203]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0XD2-1rvXSE2aDk-00tVWD; Wed, 28
 Aug 2024 12:21:10 +0200
Message-ID: <60d7c5a2-bbc0-4c08-8973-5b65b9695400@gmx.net>
Date: Wed, 28 Aug 2024 12:21:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Various xhci fixes and improvements
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
References: <20240827194625.61be5733@foxbook>
From: FPS <mista.tapas@gmx.net>
Content-Language: en-US
In-Reply-To: <20240827194625.61be5733@foxbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lvFi6wq0Zgx0WlXkD7k5rYroCNM+YCfqJ0EGLomZv/z5w+1a2C2
 sVO5cV7CDjOXA1rCwP6pPRt8Bk670Zigi9HmtPa5Pkg+pIY7niClpUexdC+vmRLE4PSwKJ4
 bKFrgLPIC3gVAJSJ5J+XOEokGwxWMjdrtvuG6XhfayJ2Vb0nmR8X+6tHgp3h5UVt6mPDdHw
 HmeLqphWMbMKn4Df0zk/w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pkF/oxqj2bM=;yn2EuN0TqzR6Nj9gpOrNLuhdBBa
 ZwYsQJIV1bRPg1Nc2APXvGl8dkyEPy2J/IH6/9UCHtCsG25/ZyP/U2K6OQLLpXYL897h7+Wfe
 VQeQY8+IqZiXMzvKgk3FW2nytnHeAssUE1RUPNtWX12d80jUajMtI7f8toObbun9IMX4wC22S
 ymgPmsoKVy3L6dd0YKcS/7tmYNUtai7wYj+80AopD3igN73fXUsFfKrh9S9NyUeEiExTGPPcY
 xhARiiHPi6+yz+b9gYcirlft+S5Xo1X2tMNUYDxqBARyqrQfB415NYaH2mPCIYNhgBXtON7XP
 vWmA2obxcU9O0r5JH5n6JwCVx3WglQnoDFjoYlTyQSLFfFtYL9nROYOyNpfEltxhV7B5j6pZi
 VkTLW0E36llRHN6YHLCOXweRXDVhyy8JR8zPsZbcUoZ758xxvJWEHfVgnKZscMdtFH3SKoAvN
 BYb1cIEwsyoK0Kh9MDbHHIH6cs65WW8oqCXtrNtRntMD8sBg6jDb4O7TVl94psslIA5yuqKwT
 YRnR5ie3P90fvONkc4e6OLSh6OUfTacDiq2xzL81uu3Z1mDUK5ksweEU4AxjxMChzfcWxKsYp
 h3hP6jZuBMOr2dacrW/k6YTA5SKq5h4MEEyqxefzNgHbAQ1NRZLEfvONajQ6la4WMlV1fsld2
 WwkHu2CvSmDcPCisAY+WzQhAPPX9IsYwUHv5hvpcviH8NWBIokmZA/hd6qi6ShNOH50Lid56J
 nOSrEQkbAzt7KMRxUuBsU2yOgqTBHo8LvUkQVShzFF6qmUsD9XvColEZh+v4IurqJj7mYO72u
 4Ij9bp7Z277VLSZEvyPVed/Q==



On 8/27/24 7:46 PM, Michal Pecio wrote:
> Hi,
>
> Here's a handful of bug fixes, cleanups and improvements for the xHCI
> driver.

[...]

> All patches were applied and tested on v6.11-rc5, all compiled cleanly
> and worked without regressions with some HID, storage, audio, video.
> Functional changes received additional functional testing described in
> their respective changelogs.

Hi!

I have a 6.11-rc5 tree here (tar.gz from kernel.org) and trying to apply t=
his series I get:

$ for n in ~/Downloads/michal\ patches/20240827-\[PATCH\ *; do echo "$n"; =
patch --dry-run -p 1 < "$n"; done
/home/fps/Downloads/michal patches/20240827-[PATCH 1_9] usb_ xhci_ Fix dou=
ble newline in a deb-148577.txt
checking file drivers/usb/host/xhci-ring.c
/home/fps/Downloads/michal patches/20240827-[PATCH 2_9] usb_ xhci_ Fix han=
dling errors mid TD -148571.txt
checking file drivers/usb/host/xhci-ring.c
/home/fps/Downloads/michal patches/20240827-[PATCH 3_9] usb_ xhci_ Clean u=
p the TD skipping lo-148572.txt
checking file drivers/usb/host/xhci-ring.c
Hunk #1 FAILED at 2829.
1 out of 1 hunk FAILED
/home/fps/Downloads/michal patches/20240827-[PATCH 4_9] usb_ xhci_ Expedit=
e processing missed -148579.txt
checking file drivers/usb/host/xhci-ring.c
/home/fps/Downloads/michal patches/20240827-[PATCH 5_9] usb_ xhci_ Simplif=
y error_mid_td marki-148573.txt
checking file drivers/usb/host/xhci-ring.c
Hunk #1 FAILED at 2410.
1 out of 1 hunk FAILED
/home/fps/Downloads/michal patches/20240827-[PATCH 6_9] usb_ xhci_ Sanity =
check _spurious succ-148574.txt
checking file drivers/usb/host/xhci-ring.c
Hunk #1 succeeded at 2778 (offset -7 lines).
Hunk #2 FAILED at 2879.
1 out of 2 hunks FAILED
/home/fps/Downloads/michal patches/20240827-[PATCH 7_9] usb_ xhci_ Don't l=
ie about trb_comp_co-148575.txt
checking file drivers/usb/host/xhci-ring.c
Hunk #1 succeeded at 2610 (offset -3 lines).
Hunk #2 succeeded at 2643 (offset -3 lines).
Hunk #3 FAILED at 2898.
1 out of 3 hunks FAILED
/home/fps/Downloads/michal patches/20240827-[PATCH 8_9] usb_ xhci_ Print c=
ompletion code in th-148576.txt
checking file drivers/usb/host/xhci-ring.c
Hunk #1 FAILED at 2789.
1 out of 1 hunk FAILED
/home/fps/Downloads/michal patches/20240827-[PATCH 9_9] usb_ xhci_ Clean u=
p and rename bad str-148580.txt
checking file drivers/usb/host/xhci-ring.c
Hunk #1 succeeded at 2563 (offset -3 lines).
Hunk #2 succeeded at 2582 (offset -3 lines).
Hunk #3 succeeded at 2635 (offset -4 lines).

Are you sure these are against 6.11-rc5? Or did I screw up on my side?

Kind regards,
FPS

