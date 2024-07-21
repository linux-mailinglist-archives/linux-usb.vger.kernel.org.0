Return-Path: <linux-usb+bounces-12296-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B579385C5
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jul 2024 20:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FAA01C208EF
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jul 2024 18:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35402167DAC;
	Sun, 21 Jul 2024 18:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de header.b="DjIR1hoo"
X-Original-To: linux-usb@vger.kernel.org
Received: from shout02.mail.de (shout02.mail.de [62.201.172.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0713F567D
	for <linux-usb@vger.kernel.org>; Sun, 21 Jul 2024 18:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.201.172.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721585759; cv=none; b=t+yN2PEB95W8kptXeOgxSjrRm6zcUdGKpaz47J4elJcUdCc5J5qt7ghl4vstyqqF1+xoBwpsLM8JeRs+IlJwuuOtTzAnu4I6XNVX8wFdY2emSdzwHWhnOoEnpsofaj7hnxqdoR6xU+TMEVxY6ZL56kORkM5tXthJOIRrfG32OH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721585759; c=relaxed/simple;
	bh=Bba03MPkHtBjDGBFQL8Wa4743qmhJ6F8wmagHR2+Ngw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ouf0iO7cNRnkALU8THXd3Es5Jy9uceRzreMYsi1giG2SVg86DaDcyt7Y4svF4wtWCIXb+n3SFA/aDyhp35rt1SWKVN7tIEaTAdM+9cKclrpFLb/9s9LQCDg3uDNKZ1DjwAD6JEaCRybY9yQoONn2YOmlCHeH+eeCxcBD/SiSMcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.de; spf=pass smtp.mailfrom=mail.de; dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de header.b=DjIR1hoo; arc=none smtp.client-ip=62.201.172.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.de
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
	by shout02.mail.de (Postfix) with ESMTP id C5184240D54
	for <linux-usb@vger.kernel.org>; Sun, 21 Jul 2024 20:09:13 +0200 (CEST)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
	by postfix01.mail.de (Postfix) with ESMTP id ADABA801A9
	for <linux-usb@vger.kernel.org>; Sun, 21 Jul 2024 20:09:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.de;
	s=mailde202009; t=1721585353;
	bh=Bba03MPkHtBjDGBFQL8Wa4743qmhJ6F8wmagHR2+Ngw=;
	h=Message-ID:Date:To:From:Subject:From:To:CC:Subject:Reply-To;
	b=DjIR1hooo1tFd6vhCFYw8FbpfLFvjHZM/0NlCRCNT4N8HG/DLY1UHVNIJ6B/8j79A
	 QMm09Jp9t5qYdjY/6sk7ZVgqiwsRJ6B9WZgDXKk/zvpSih03aLt8kvY3itHgVyHu0P
	 S71tCYjdwysQBIbfPHwBE+fzTLygF9zCNElByy8PCH9l7yxMjZ3vOZbAYb9Fdsx+A3
	 6DQZ2KI3/r0GHLqtEFDJADShaM3k6vSlUhyvIGO2tHUfjVod259gA+isFDQPk3Kl3u
	 XyX9tOSYXuHH+gXcTZ+KjmBl/9FWoV+5JgB3OjjzX//dJFF+mfs6dOnYFmDeWCb3+P
	 5X5hPdbxBbIYw==
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp01.mail.de (Postfix) with ESMTPSA id 798B3240AC3
	for <linux-usb@vger.kernel.org>; Sun, 21 Jul 2024 20:09:13 +0200 (CEST)
Message-ID: <fbde5b4b-6640-4cc9-b39a-7eafcc0d29ba@mail.de>
Date: Sun, 21 Jul 2024 20:09:12 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: de-DE
To: linux-usb@vger.kernel.org
From: G4bandit@mail.de
Subject: cp210x VID and PID of my device are missing allthough the should be
 there
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 612
X-purgate-ID: 154282::1721585353-E17EB338-FFACE709/0/0


Hi
my device with the
VID = 0x28e9
PID = 0x028a
should be supported by the cp210x driver. But in fact this VID and PID 
does not appear.
See the output:
alias:          usb:v3195pF190d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v2626pEA60d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v2184p0030d*dc*dsc*dp*ic*isc*ip*in*
alias:          usb:v1FB9p0701d*dc*dsc*dp*ic*isc*ip*in*

The manufacturer recommends to use the driver maintained in the linux 
kernels.

Could you please helps me? Or maybe upgrade the driver?
My system is a debian12.


Kr
Gulam


