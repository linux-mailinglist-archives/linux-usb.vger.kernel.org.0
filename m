Return-Path: <linux-usb+bounces-18833-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A399FD415
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 13:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C345161FC1
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 12:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695641474A0;
	Fri, 27 Dec 2024 12:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2Y0RsZVA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC6579CD;
	Fri, 27 Dec 2024 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735301338; cv=none; b=Wz/sBaPTHGlON+LjtrZ5GVLzak78VIbEy/8sjMnsLKdyP+wXDVxnyNoHbGQFScHp80A9m6L5Ys/Nbiyb//AtvuioB7dNAIPZkvUwb995oiKcfJod1KklA3qroWnuR9ntSWq6xaoV4SzRLe5kRi5/N9NU1+P+JzH2MpfZrZE8IfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735301338; c=relaxed/simple;
	bh=ZNkKISz/JcV1MmV4s5+diOFcGx1Ne+cnIkJiSUcM7nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcXvYhj+74kYtUg/3A8JFdg1Wh0PdylfrQ4k5EUZfAfAu9ECC/Jvyobo6nVLkuiE8DvB5TESh+tqxuKiC4jRwwMdXaY2BcUBesczuWfGDFeG7J6zDAYTLtPb03OwVg5CW+wCJfw7cLbDrrhNZ/0VOAGbtt4N22+9heYMlhY2zts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2Y0RsZVA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F038C4CED0;
	Fri, 27 Dec 2024 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735301337;
	bh=ZNkKISz/JcV1MmV4s5+diOFcGx1Ne+cnIkJiSUcM7nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2Y0RsZVAxjxxvWd53IRQ0IYmd7KApF1NVBAMWdqawfHDR6eU268HKLQ/lnWEBD75J
	 5LddzW3sdoH/2g7LFzJtgFlD+FVF5HcxVa4FMESytnpGodd9YUJYtICOks48Zrg/qG
	 vTztmAfol5XnsirTjZ1X2hOuAxoyd5v89PCo7mMo=
Date: Fri, 27 Dec 2024 13:08:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: Re: [PATCH v2] usb: gadget: m66592-udc: Add check for clk_enable()
Message-ID: <2024122743-rimless-waviness-d49a@gregkh>
References: <20241226013301.683202-1-zmw12306@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226013301.683202-1-zmw12306@gmail.com>

On Wed, Dec 25, 2024 at 08:33:01PM -0500, Mingwei Zheng wrote:
> The APP-Miner reported the missing check.
> Add check for the return value of clk_enable() to catch the potential
> error.

Again, please read ./Documentation/process/researcher-guidelines.rst and
follow it.

thanks,

gre k-h

