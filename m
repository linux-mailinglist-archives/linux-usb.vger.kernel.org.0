Return-Path: <linux-usb+bounces-17983-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0689DF780
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 01:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90AC21627B8
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 00:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69094AD5E;
	Mon,  2 Dec 2024 00:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="rsIAOXCD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EBB4A01
	for <linux-usb@vger.kernel.org>; Mon,  2 Dec 2024 00:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733098615; cv=none; b=fiFKvceXK+6VOm4OPgUEGU/TQUoHLExHALnDpHxqcVEb1KNfX/2qY/S2/7ojbTN3FTRVSJu/6Q42IA2VTP/7j+ZFyfMEjCfltF9+l5dJAgGvLD+NWURbUox4SsnDhPzh3DCPcnFUHbnE1M3REgwkxT5apZqU/E2Nm4c7g2sPvxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733098615; c=relaxed/simple;
	bh=450luPz+W2htBwK6D18AcbLFM508RCXa1JvCxPcBVwo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lswXHaFml5500JmZhefkC6CZPoFLxPtGRPJZ3hvM8rHZqkMYVR+XOJqpOBA9LWi1YkQsOc4JIjgaOWDJtNl0cK8f91bgW+tkccRj3bXGWRPasTKvvg3fVUL5peyqbpjhM45s66EaKsnk9bhMI84XkYTQMAS9szporHAYb23XGCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=rsIAOXCD; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733098598; x=1733703398; i=wahrenst@gmx.net;
	bh=LsLrPVxdPPM88Lsuw9W4JxVinjdPLNWv/2GSWcv7fHg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rsIAOXCD6SDPCPzhyuNo3WnPYNEMxC4P0mbPErZ8sIpuz2GbjfwIb8OVKD2SAXA0
	 fA6WQoidaMIhSQRGVWnVyrZFt16NSYEf1kR27THkT48ADSxqriUiqOSLLjTwqfYfX
	 WzJzgebEy2z6bq24cqifpasfPyDB8y3ZbX6sQluWeooCMM6w5J0RjoT1931N+buYy
	 +QfVEBRPpzY9K9nKqh/o7GTt4T2D47i0mFnTDzKQaubAKpeNNvFOtEEJvvGGpyNf8
	 hnhIGNSGnwLmJBY/a8dbKoXS6wqHJpCaCY6d94RSfBCxRZPXebLVGwCEz26izLitP
	 jtGqHdFK5W5dE14wzw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOzOw-1t1J2g1slg-00X5KM; Mon, 02
 Dec 2024 01:16:38 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
	Douglas Anderson <dianders@chromium.org>,
	Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/3] usb: dwc2: Fix HCD issues on Raspberry Pi
Date: Mon,  2 Dec 2024 01:16:28 +0100
Message-Id: <20241202001631.75473-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GZb6XypkJ2trclZRcE3wdoCOXnsMwh7WXxoEQxLIUWyrxO0MvCq
 bbgRMP8ZPXPAYJNI8f8LvtlECdnkhnfOSVC+lu3u+TDL2EcJcPOSHh4fwhbHiEy1AV93+yN
 vLlTKX4O1IT6MT5csY6GtTqyHz3ISXeOLsG8uJ6x7l4zm+gNXydx3GKtZnD1MYTky4OyqOa
 yVhNUZeGSdiTAMnIRqNkQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W0K37wS3vf0=;g5CYaqlhzi9kxXOEWJ1H9fA9+lV
 vaRSCnM0UKe9y0osLlWumG1BlrTmv8DwQr1Bzi798Pmu/ogV9OucrjLDLC7LQ1T2uclWO4Q5s
 wckyS1si1QIDbuivsckUL6nErbstyAr2s53gOXrliCLSXHg9B1pdpfcYj6JrSpT5qzayty2hX
 9PFfxCXt9tM+lt7VT2zs1YTlMCQHF2k94yYH+JblGMcvg1g1JeiEe0sMaAiUYfrw6THs4fLtm
 kXApuhaunKbpQGsLdlBMPvVBlsw4At49ZvhF1wRTxvugkQp4JMaDTd1SoMeun9Btw5l7zlRn3
 LgkEeMpSTn8YMAljhLKrBMieCDNs1hrBYwGV+Pci3I/QwOvr4X+Zjm9JiIRG9PzSfmVgbvtUr
 RtYtsKXYFvdk0n8KqtxPCympxH9l87dHUt99S6iJ+fwf4YNkLgA5nkLzw4PJ/zEontK8kTZIy
 z2BzEqYKPlJjL5pYXayZjt2SRypzHRkXxxU5gOGn0EcEOlSOSBExJ9Y9cFQImJIlyj6RA5Jlq
 niIgHasz1aDO/elf/FAS5RBYJN60BAEBCVdALTWQaiP5TljgGN3VSYU8pc9XQW6r2XhZHBd4a
 18zvRCBe88KrTh4S5f34Li2LON1qyPrI89mnUEvcI8ZdwkqjdTQc6yKVJ0413gwryop2gFNF8
 sbKih5HY92Fr4lGxhicOoGRsrSzM8xbTkMAbtJqS4GEMhj102s2MR0LH+sr6dd2M5ZML7Z+vt
 5UwjRxoyTYRF0Kt5rbhx//ZCqoYyFjFkGMeYbqeOy+iaZSD+orGsIKLsXrj9ijIHM6I3RYt4O
 7NtaVZGEtiDnjm0iVl+Wi0ei/U21wPJvvg3j15/6eUNIg+Ua/kGR4GTvqSsvj6K4sRhYHFp25
 DYPPQ4KKhIziZEfAlt4vZfkSIqT9AGW2NvVEDG8CRzsjVyVCXCRjl65xG928UDk/zADZVR5A3
 agE2Ij/p6QRl25tQYY4kOKxlQWuxxxTfra+2EXP0LUarZJXXzU/AME32STLZAWkQsgsSLSWeR
 g8yNQzdKe3t4Uky2WnwHu6rpnxApRqKCi0VVd1W3qFbk7wkNOa2Wp+ist4Fso9UXv8kVL1Qo7
 ypmOZr6Xwo8G3rBMdfwuDi8i+ybc98

This series address some serious HCD issues on the Raspberry Pi.

Stefan Wahren (3):
  usb: dwc2: Fix HCD resume
  usb: dwc2: hcd: Fix GetPortStatus & SetPortFeature
  usb: dwc2: Fix HCD port connection race

 drivers/usb/dwc2/hcd.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

=2D-
2.34.1


