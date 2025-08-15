Return-Path: <linux-usb+bounces-26902-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4349AB27B63
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 10:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D43711D00A60
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 08:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C952E2494FF;
	Fri, 15 Aug 2025 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b="rl+WmiLi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.valdk.tel (mail.valdk.tel [185.177.150.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE12248868
	for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 08:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.177.150.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755247161; cv=none; b=urWjNFHVjWchyKNyLwmHgx3bT4EuPc4LB16k2KQIXYyDgsfoVBIAmenmpyP884FJV12fsjV9wBgRWPonggnqyPqYq7Hgef/CVmLp0LWZJZSjEGDj8lMJl4CUyY2sdGeYRX+qdTQwDAHQNEwaperX3iQ9RAl5xgULipu/ba2peK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755247161; c=relaxed/simple;
	bh=2N1jVzxZrvjzu6LY+cs2Y9xqsHsOn/xC0klMkiSE32E=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=jv/n7Hoc/T4CcPuoSdfQnMfctV6THmD4ft86FJ4tkcfc0uII/CNlOjjW8FYqTWlTL/FAc67gAkE/xebf0rspdKhvM8fN/ILsylkTMjhxdrRwfAxD62qoEQjLXmjGxqBXxlfaJONNZRlzrIDn5FyXcPNf2o9cGjkMa8azH2HrrCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru; spf=pass smtp.mailfrom=valdikss.org.ru; dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b=rl+WmiLi; arc=none smtp.client-ip=185.177.150.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valdikss.org.ru
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CAC131BC319C;
	Fri, 15 Aug 2025 11:39:03 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
	s=msrv; t=1755247145;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-language:in-reply-to:references:autocrypt;
	bh=9cDWjsvi/ee8s9N1y6cWZWYEWLtZgUO7D+ZdqwX5QKY=;
	b=rl+WmiLiD1cNfOL1/ze3UFIK/KBlxZWuFySnBvZs8kTRuotRYHrsic+kGtZzPqwMNr5sDw
	btoO4cb/BbL5T+GLM5x2k9zgQ7b0xyl4J0ENGTcPoYu3j+G348n5oYuVHQZbOnFhynoV5j
	JfvLZxi6yBc1iPRraPdNCrXaExlt1ETCaoYpoN8GTcOflctQ50oY8hFF4F3is1jqG8Pt63
	vykTJPc5T4F9I8FJ/z7YWfiV2bYTJQC497FxjLeaHMoUah1nrwnx6Ux3s3J7F6GfDNnoPV
	XsnP8PubwSmG2zvuyszZsboGjnpiwD6llgrMAdajIRZ5UCnNhzf5X0LXQ2g23Q==
Content-Type: multipart/mixed; boundary="------------qcqX0BNvSvlhJvrVxHKLWlte"
Message-ID: <2bf5c54e-7dac-4673-a696-e09eb8d459d5@valdikss.org.ru>
Date: Fri, 15 Aug 2025 11:39:03 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB 1.1 Full Speed OHCI slow/high latency
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
References: <3fe845b9-1328-4b40-8b02-61a879bea6df@valdikss.org.ru>
 <6017298f-fc03-41c9-b0e3-a74180f4c9a1@rowland.harvard.edu>
 <f2c433ae-f9d0-4beb-a2c7-84d2fd68e02e@valdikss.org.ru>
 <d41d8488-9438-430a-88ab-f845df3655e1@rowland.harvard.edu>
Content-Language: ru, en-US
From: ValdikSS <iam@valdikss.org.ru>
Autocrypt: addr=iam@valdikss.org.ru; keydata=
 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
 OEcVmRU/pw5/zoQyQg==
In-Reply-To: <d41d8488-9438-430a-88ab-f845df3655e1@rowland.harvard.edu>
X-Last-TLS-Session-Version: TLSv1.3

This is a multi-part message in MIME format.
--------------qcqX0BNvSvlhJvrVxHKLWlte
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.08.2025 7:40 PM, Alan Stern wrote:
> Yes, but I can't imagine why delays would cause a NOTREADY, OFFLINE, or
> UNDERFLOW error.

The laser printers roll the paper with the constant speed, they don't 
slow down when they have insufficient data.

If the host doesn't send the image data in time (and here it happens 
during the print of a single page just as it rolls, as it is too large 
to fit into the printer's RAM), the job is marked as failed due to 
underflow of print data.

It's similar to CnC device in that sense. Modern printers wait for the 
full page, but this printer is from the era when RAM was expensive and 
could not (reliably) fit the whole page.


> Either .pcap files or the usbmon text output for both of these tests
> would be good.  But set the number of iterations to something very
> small, like 10 or so.  No point posting a log containing thousands of
> repetitions of the same information...

Here you are, check the attachment. It's a 30 times loop.

Also tried the speedtest.py on an old HP T510 thin client (x86, VIA 
chipset, UHCI), and the speeds are fine.

Avg delta: 0.990 ms
Min: 0.870 ms
Max: 1.984 ms

My guess it's OHCI to blame.

--------------qcqX0BNvSvlhJvrVxHKLWlte
Content-Type: application/zip; name="usb11-usb20-capture.zip"
Content-Disposition: attachment; filename="usb11-usb20-capture.zip"
Content-Transfer-Encoding: base64

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
3L0V+sGmfHKOuok8mieiWN3oiTMBojpKnvZ/zxHFYu/b/VY+US3+jzwyg7FYrCR5fX8BWUQl
W/PITjwgfzFA9B4lTmdefXzeHnLmIYOjhNKmZM0rsYotD1HdJxUWFRTk2ZaFCbcEG99KbuxJ
bWwTebKeAfnpAFETJc5cG08nN/ZQ2pSseR67nCyLFuIXPjUWpYUO223Rp8lFy9MWLc8ajHxh
C9GHlDideZmLIoOjnNKm5F7Uk08EZNq+7VyeTTEMeqvFEPZuCdvm4shIO3H5iNEJ75awbS6O
jLQTuM8f83e/QpZl58U78dsRfmNkpJ04edToRI6NkZF1wgfqifiFnx3lF0UGi/rSFvVlDUb+
zXai45Q4cy2KDA4fpU3JvSg6YW+3bNq+zbLrUI3zeKBDoye+GCzK7nTeeTxfLf6PPyOD/Y1P
HNfnQ/6Nr4voMFH8rFty5lnx/Z15yGAexrmOtBIPY8H8+DXvXEjt6MysT8w86MxEhnLNM2Yi
v3uoiBqI4ufW+y5xz1s7IoOjIHnmuuexYEFyas1QasuJZXdJZKSSrUMpydQrky7ZOiSUXEhI
bnyXunNnx8w7R0Z05wsFdMCLq/JGsjuU+fogI319XhzJfr0zJZGRSoZGeMnQiE7ydjAlmepk
uiQyOsl7QV7yXlAu+W+Q7yQyUskDl3lJZDSSI+N8J5HRSV4Z5yWvjMslfx/nO4mMVHJjnJfc
GNdJdoX4TiKjkzwd4iVPh+SSF0N8J5GRSr78Ky+JjEbyYJjvJDI6yaYwL9kUlkt2hflOIiOV
fBLmJZ+EdZLeCN9JZHSSOyO85M6IXLI2wncSGank7QgveTuik/x7ku8kMjrJlUlecmVSLumd
4juJjFRyeIqXHJ7SSV6d4TuJjE4yPMNLhmfkkvMzfCeRkUqenOUlkdFI9kf5TiKjkxyM8pKD
Ubnk9SjfSWSkkh/N8ZLIaCRbFvlOIqOTbFvkJdsW5ZJfLfKdREYq+fo/vCQyGsmXlvlOIqOT
rF7mJauX5ZJHl/lOIiOVpBVeEhmN5Ooq30lkdJKbq7zk5qpc8rU1vpPISCVn1njJmTWd5MQ6
30lkdJLT67zk9LpccmOd7yQyUsnRZ7wkMhrJb8jLdhIZneQl8rKSl5JTJZJ/GPNydRIZqeSn
lpeVREYjebzQy3YSGZ1kdyEv2V0olwwa83J1Ehmp5GEPL4mMRnJvMd9JZHSS9cW8ZH2xXPJU
Md9JZKSSpTt4SWQ0klYZ30lkdJKlZbxkaZlc8lAZ30lkpJJLZbzkUplO8m4l30lkdJKPKnnJ
R5VyyR0+vpPISCWv+XjJaz6d5FgV30lkdJJXq3jJq1VyyWdVfCeRkUqOvMpLIqORPFXNdxIZ
neTZal7ybLVc8qdqvpPISCVb9vKSyGgk/TV8J5HRSTbX8JLNNXLJMzV8J5GRSu7az0sio5F8
3s93EhmdZIWfl6zwyyXf9vOdREYqueLnJVf8OsmFBr6TyOgkHzfwko8b5JK7GvlOIiOVvNHI
S95o1En+0sx3Ehmd5M1mXvJms1zyhUBqXv9fPxe6SSIjlZwMGJJRZ1665GRAJ3muNSXp7Jgp
iYxOcrjVkIw6U9Mlh1vlkhFz3p/ukshIJYc+MCTn3SWRUf0+2ZaSdHbM+n2yTSvZ3mbc+by7
ZHubXPJbY17/A3dJZKSS+4/xkshoJH0dRicfuEsio5Pc18FL7uuQSx7v4DuJjFTS/ph/dyOj
+n2yk+8kMjpJ6uLf3chIJfd08Z+TyEglp7sMyYfuktNdOsmJHv5zEhmd5GyPIfnQXXK2Ry5J
vca3oKi7JDJSybFeQ/K+u+RYr07yQp/xLSjqLomMTjLYZ0jed5cM9sklZ415E3fcJZGRSnZ/
npLsn3OXREYjeWzAkLzjLomMTrJzwHg3zrlLdg7IJb93mZcpiYxU8t0v3fZLv2tkNjEv15Gc
9z9QSwECPwMUAAAACACKuA5bdhxXDmcGAADbMAAADwAAAAAAAAAAAAAApIEAAAAAYnVzMS11
c2IyMC5wY2FwUEsBAj8DFAAAAAgAZ7gOW/u7QJwfBgAAJy4AAA8AAAAAAAAAAAAAAKSBlAYA
AGJ1czQtdXNiMTEucGNhcFBLBQYAAAAAAgACAHoAAADgDAAAAAA=

--------------qcqX0BNvSvlhJvrVxHKLWlte--

