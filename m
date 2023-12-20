Return-Path: <linux-usb+bounces-4421-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F199819FCA
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 14:27:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BECBF285A63
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 13:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC622D634;
	Wed, 20 Dec 2023 13:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="J6n34k67";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Im9WNxp5"
X-Original-To: linux-usb@vger.kernel.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B69C2CCB4
	for <linux-usb@vger.kernel.org>; Wed, 20 Dec 2023 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 690DB5C0003;
	Wed, 20 Dec 2023 08:26:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 20 Dec 2023 08:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1703078819; x=1703165219; bh=nEV/Ksy9HU
	V+q3K0PUTwUMLHhFqDOo3lGpeHQH+ufpE=; b=J6n34k67NDop3VLMTTxt1RQwP/
	fHlso7zWw/NHseL9JitRydpDUsxM5y3L8yRR1KiZ43hDplU0Nydl6KMSlArUA9pz
	WaGaOcFdH+Xv3KO7qWIiWCYFlNyJ1bo3Tymohi37gbOw6G+3vEGs1m70yt0aVeOt
	PpTcjLh6knBXHi/og2UMcKPJyS+BySgjesQ5ful7t7VnR5/1RrxE6pp4YokTIPt+
	EfUhKB6Dnh18/ies1qPiDxgvV+gM6YRPYTyxYBUFg3LW0f9BayamijpFQBJPp/3/
	PtujvxrgO2I6X+23Jy7Wkf27iwlwH5YPcKdmlNHjk9f5zInlI5dH0+pKu4vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1703078819; x=1703165219; bh=nEV/Ksy9HUV+q3K0PUTwUMLHhFqD
	Oo3lGpeHQH+ufpE=; b=Im9WNxp51zsKQmh9jNZms/OJmJYNLXbGhQPiQsvVFV4A
	ZC6a+m5Oy92nOXNJXgjruRfNMmZl9+gOD08AuRqDYFrykx0nQVsxqdSqF+0uU8sq
	pipse1T3Zg5nejo9H+B7NMittwl82IpShcWYoH58MbrIZGsLKUEfBh11nMQw+MyE
	OZH7DdWbivMk7WMvCfQ5aPtTuE7fdt9ppDRvR2/CEvvj+Yz4HBLu8Hsbi8g0hDoG
	6zyUtpS/o64CUZsbKAX8NbmYm+QIPtgr1KDdFkIp09lrd75ef85sXxKvxFxXZ97D
	5G2MKgQ6Hhx4bmsmFVxpu4uixu080iL5sqwF62ne3g==
X-ME-Sender: <xms:o-uCZTCBAa3EG5tu9uG9A-ycuIVdldra1BpDlIKpyrUrQSX6ExcsNw>
    <xme:o-uCZZg96wOaxOi4FRWQ7nCIIjpn1WNSYjszvoYUfB52bGqykwT0HXbGENU976p_A
    1zfh1SwlO7nHA>
X-ME-Received: <xmr:o-uCZekhAJRUTpSIhhUo0pRZ0fQ74SuT-LXqlEcKS4aHXz32XgVt6jR-1yvejEvRce2dcdp38jEzGYU8i-PiOo1B84OOrniNYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduvddgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:o-uCZVwyNbgTFPv3qn4rGmTkuKSt7Uc-ycuCPSVJE4Oy8ecDSACfwQ>
    <xmx:o-uCZYTd-KpZS9kS2FOokmfcqtpKGVPvTiBWh2t6ayO95zrlUzOoFA>
    <xmx:o-uCZYaFkZH_Z6yKik1Zu2qqgFjXHIPnaeM2vdNUHfbgBEfaqnJebg>
    <xmx:o-uCZeM8jqoGU_IGX0AWwLCf8ZYoD-UKchKBA-LLk05PdHtO4stmsQ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Dec 2023 08:26:58 -0500 (EST)
Date: Wed, 20 Dec 2023 14:26:56 +0100
From: Greg KH <greg@kroah.com>
To: Mark Glover <mark.glover@actisense.com>
Cc: Johan Hovold <johan@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB: ftdi_sio: Actisense PIDs constant Names
Message-ID: <2023122011-commodore-deceit-565b@gregkh>
References: <AS8PR10MB4424F3366DA20492BA9B1605FABAA@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>
 <ZWB5VtdzyGsROpuO@hovoldconsulting.com>
 <AS8PR10MB442424BD43EE4AECDDC93F1EFA8EA@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>
 <ZXq4A-Uht67KcJNV@hovoldconsulting.com>
 <AS8PR10MB4424F8DB8AE222C7075514FAFA96A@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR10MB4424F8DB8AE222C7075514FAFA96A@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>

On Wed, Dec 20, 2023 at 11:17:40AM +0000, Mark Glover wrote:
> [This patch] changes the constant names for unused USB PIDs (product identifiers) to reflect the new products now using the PIDs.

No need for "[This patch]", right?

Also, can you wrap your lines at 72 columns?

thanks,

greg k-h

