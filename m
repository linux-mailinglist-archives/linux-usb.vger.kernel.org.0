Return-Path: <linux-usb+bounces-4888-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E92782854B
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jan 2024 12:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27475286B5C
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jan 2024 11:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD49374F2;
	Tue,  9 Jan 2024 11:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="HDtb3QiN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oqs7wPPK"
X-Original-To: linux-usb@vger.kernel.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BA23715E
	for <linux-usb@vger.kernel.org>; Tue,  9 Jan 2024 11:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 041543200A29;
	Tue,  9 Jan 2024 06:43:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 09 Jan 2024 06:43:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1704800603; x=1704887003; bh=9bqqhUhuZ4
	sA7T+t5eybJCRiYUjTU7QDBFVdxC2Cfo8=; b=HDtb3QiNbo8ISKynyVX/3zTEdU
	DVRAbUYbpWx8p9pvXXRp11SLbk5ysD4+8MMTWiNxZohaDHVWy4t6hLUoDElXxb6l
	upd3LgmaaI9Sl7IgEfG5Deo3Ql6cHwuIS61LEcDKCmRM0y4pT2Zp56rZigToWxIZ
	ltpYHpzzqsMtxRJlJ4eT+NcVMYJIo47oLyvCHyZOaht6ejOGNSKZKPBC4vwHpMpS
	Kl6JQZqyrXIeBADb8Fd1tqZsEjReczIijPm0WtFZFWL9BeNdBs1VeIVu7PYrGfaz
	NBlKWGXwHisMcfPYHc9C08cJ1IKgpPIayqQK0VPfWtySd+9SCFEZCU3XQtwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704800603; x=1704887003; bh=9bqqhUhuZ4sA7T+t5eybJCRiYUjT
	U7QDBFVdxC2Cfo8=; b=oqs7wPPKI+YZeIB8Q7jdf6Zf+LAQpXoZGyvZPlZ2RndB
	1ZaPV2YKEf0H14a/68zIoo5bxpySlEeEtH0RumTNdenjgWkCcrDU4rMpwIavzs5J
	F2Oys0A7rUJFjEUqFWAiVT/kczAftjsvq0G3a7cvEAEtfLt3WhC9tAKn753HLq2k
	fKB7wRy/QmaelEnOHBO48XaagmYWSt9ETPnLV9X5WBIsWGSegCuEZbGY7fNDCG1G
	6WRrKRhkIn57IBNrMqktnqv+ZuijBbzuy82aLxFRHVx8kucwmlZQZP3Yk90HQo2X
	dsUND1i6mORaoR14Ec75eYC67y6aVmn+VtAbEjOlYQ==
X-ME-Sender: <xms:WzGdZQAXBrUNCszoKKn79pGSiu6798BDCsx1W6cU72dhkhCSblGQSg>
    <xme:WzGdZSjnNwicCG4_c2NzkzJzVh8dajcwTLYk5lP6aPARmb3LfaWiG3JlfE21B6c8X
    R4GDNkXjQBtLQ>
X-ME-Received: <xmr:WzGdZTm0u3kwG3AjDevS-w-AcFBU6kq-9QhihtSVbPwzIDbuLFkLHM6Y0KJio1-uvewGLDZqaYxCuVAh8sGeFvJ77oRPHlA0AQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdehledgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekje
    euhfdtueefhffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:WzGdZWxeRlB3NVKTdxGyVyfMLIGHPz57MhmhMRZjYhko_UuSNynQmg>
    <xmx:WzGdZVQAn1Yh_ItberXeQYrndBvgOouxcp1oiyqgns0D7LrPCAfzqQ>
    <xmx:WzGdZRY4VWIU0bD8htsQa3f3S72BQL5UzWXitGRbfKtOrSGG0gRUMw>
    <xmx:WzGdZQdEouBl2A-oZ9W-21isK6YEhG54DEmQLyuIoyggJXmp5qqayg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Jan 2024 06:43:22 -0500 (EST)
Date: Tue, 9 Jan 2024 12:43:20 +0100
From: Greg KH <greg@kroah.com>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 218356] New: NETDEV WATCHDOG: wwan0 (cdc_ncm): transmit
 queue 0 timed out
Message-ID: <2024010910-robotics-unbitten-3605@gregkh>
References: <bug-218356-208809@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-218356-208809@https.bugzilla.kernel.org/>

On Tue, Jan 09, 2024 at 08:44:30AM +0000, bugzilla-daemon@kernel.org wrote:
> I am using Linux kernel version 5.10.110 and the USB 3.0 interface. During the

5.10.110 is a very old and obsolete kernel version, having been released
over a year and a half ago.

Please try a newer kernel release, the latest 5.10.y release is
5.10.206, but really, can you try 6.7 to see if this issue has been
resolved by now?

thanks,

greg k-h

