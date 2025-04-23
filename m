Return-Path: <linux-usb+bounces-23372-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 646C9A98814
	for <lists+linux-usb@lfdr.de>; Wed, 23 Apr 2025 13:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC4947AC2D3
	for <lists+linux-usb@lfdr.de>; Wed, 23 Apr 2025 11:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F83254B17;
	Wed, 23 Apr 2025 11:05:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC32A12E1CD
	for <linux-usb@vger.kernel.org>; Wed, 23 Apr 2025 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406349; cv=none; b=TYKj1Mu+M88U4nqQ8IOJea6ckyKRscQIxf9OU1FIIdvh8YaH3UikUsnOGwYWMiuejoypdl2V3bIGdVczrqCLJ/znZx46++R5ty5AExjFN2a0BUKdp/WxUGXFIxYtk/BQpukDKNQkm3Od8k0TMZZt26dluafEdgq3vh5SS9kH+Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406349; c=relaxed/simple;
	bh=KHNId/hHYaC7mNYYagh72y3ETMnfXOoxkANjMnk0HO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FB6Q5lUVDp5d5OZwdf2seS+Ni0msDZocg5zNgunJy17q5VYrt+cN+hgcI+E1dwvHcmFGjrNNrMBTD95bwM3Z5fbJ1iCqiwUNII2FryH++0U+0m8jmSBn4xUTQ1I9dV1CSi7kpd9qk476dJIc5hwuOiTVRZvwc7SUQSxBvJWRVZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id 4EBEF233B9;
	Wed, 23 Apr 2025 14:05:42 +0300 (MSK)
Date: Wed, 23 Apr 2025 14:05:40 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] usb: isp1760: increase buffer size to avoid overflow
Message-ID: <20250423110540.GB857@altlinux.org>
References: <20250422230000.GA857@altlinux.org>
 <rdsyrsjl67rjhkuatkaggnrfcruvzcxlwnfb6jgqgh5ninlnmj@hy2ofl7jlhei>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rdsyrsjl67rjhkuatkaggnrfcruvzcxlwnfb6jgqgh5ninlnmj@hy2ofl7jlhei>

Good ${greeting_time}!

On 2025-04-23 09:30:48 +0300, Fedor Pchelkin wrote:

 > On Wed, 23. Apr 02:00, Alexey V. Vissarionov wrote:
 >> isp1760_field_set() may access the udc->fields array beyond
 >> the size of DC_FIELD_MAX up to HC_FIELD_MAX, which is (now)
 >> bigger.
 > Where exactly does the problem manifest? There is no
 > comprehensible bug description here from you..
 > Though I guess isp1760_set_pullup() call site is concerned?

Yes, when called from isp1760_udc_init_hw()

+ When isp1760_udc_init_hw() calls isp1760_set_pullup(),

 > Please make sure to run your changes through checkpatch.pl and
 > the compiler first.

Mea culpa... Sent earlier version.

There should be only one warning on "Comparisons should place
the constant on the right side of the test" when comparing two
constants.

Updated patch follows.


-- 
Alexey V. Vissarionov
gremlin נעי altlinux פ‏כ org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

