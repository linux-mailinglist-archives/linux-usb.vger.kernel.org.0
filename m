Return-Path: <linux-usb+bounces-21973-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B996A6A891
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 15:32:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAD7E1882E0B
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 14:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9ED6223321;
	Thu, 20 Mar 2025 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="D/k9m3Dz"
X-Original-To: linux-usb@vger.kernel.org
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDBD1DE8BE
	for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742480563; cv=none; b=CPxaEC5MTTqx38IOloaitbqmg4WWhJaWN00TAuB/uLZ05f74xrzaLhkMrXS3j5DkzDo0kI/1QHledeFRG+Vw70QwJIH3BzFEWHo+8oj1cN8/jh4bTKS6+WJdxwV0/E8IpeAwKXcvMZcWvUIjUcDAq88WUSXDZPI65rnzBwGW2DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742480563; c=relaxed/simple;
	bh=P0rDjUxalCEVmHCqkLvkMIxmQ9WobTr7B/5ynW+8ddc=;
	h=To:cc:From:Subject:In-reply-to:Date:Message-ID; b=clZp94BxzBD+a2mPh3vperp7vjMUXrBWoU3I89KX+wOB3MKiZAYiI6JUwoCTbFRnrrTObmZv/C6DQ5zmAhiftjXy3AwXdl1P11Ls4QHWIE5S0w8W/SyCgiGFiwt0IqV7gdnU249SEIDytU+cSKEit/Pg3wHoUwUOq9n2AyUGZcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=D/k9m3Dz; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Message-ID:Date:In-reply-to:
	Subject:Reply-To:From:cc:To:Sender:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=EbYClFpNxlkf8++JID6Bx+0fhosFrchIBKOTtByRYyQ=; t=1742480561;
	x=1743344561; b=D/k9m3Dzg7ngbUzANRHquvuN1q7yJOY9RhZFabrkyD1YYb3gnjs670LGqfFMN
	FTqiylwttENnwK0BDCPxgVO9A/C75SyqoU7oVxt95TI9BjqluhS6e9BHsYB7np9Da8JiJyFMzyEcP
	X3xCl6kX/l1FHQ8fZHEbDINyn7eguwl8BEIrFZ3ZVomkSxrSFNi+2jwqg+NgvOaAicNDeU+6MsDWT
	hrn41gI3WXCIJT2xdtfXLDW6oeWVINgbOqReQ1Iz7SBOY86yaoDVEVhHTMW/fEVYBgEzPR0kC2jyy
	x91HCR38PMMs0EWhzCpjxfAB1pmc2Oo+wQOHzvtD41v6jjVjTA==;
Received: from 30-11-165.wireless.csail.mit.edu ([128.30.11.165])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rtm@csail.mit.edu>)
	id 1tvGn7-003I3S-Kd;
	Thu, 20 Mar 2025 10:22:37 -0400
Received: from 30-11-165.wireless.csail.mit.edu (localhost [127.0.0.1])
	by 30-11-165.wireless.csail.mit.edu (Postfix) with ESMTP id 6EAAD1C706C8;
	Thu, 20 Mar 2025 10:22:37 -0400 (EDT)
To: Oliver Neukum <oneukum@suse.com>
cc: Alan Stern <stern@rowland.harvard.edu>,
    Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
From: rtm@csail.mit.edu
Reply-To: rtm@csail.mit.edu
Subject: Re: use-after-free in drivers/net/usb/hso.c hso_serial_open()
In-reply-to: Your message of "Thu, 20 Mar 2025 11:47:49 BST."
             <60516f6b-fb96-4fe7-8767-ebb63758d099@suse.com>
Date: Thu, 20 Mar 2025 10:22:37 -0400
Message-ID: <30227.1742480557@30-11-165.wireless.csail.mit.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Oliver,

You are right: the crash goes away when I revert

  commit 29bd3bc1194c
  ("hso: fix crash when device disappears while serial port is open")

Robert

