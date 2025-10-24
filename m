Return-Path: <linux-usb+bounces-29625-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 171CAC06FF6
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 17:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 209B63596AA
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 15:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFD331B806;
	Fri, 24 Oct 2025 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EaObn41R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AC92F85B
	for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 15:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761320188; cv=none; b=dcalrnFaBTkJK6dQ4rUnDRFqlcdZ/WLh6ykvzhSEfQGs5iJvwK8YW50mR2N65LggPaEjbTTDLbzN/6BLOypHQArYXP3HERAAHOpQWshmPiJ9ipOxxbCdeT7GZQbErjKPC81zhd9nGB5hKmwO+ga0+n8lsO336F0p7BAZTWv0QVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761320188; c=relaxed/simple;
	bh=c4POsfpSmCeovwXkfa+/5s5a3X9FyKZ4I9A338tJHhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KFZb/VnqaEbLtpIkJO7XNEAgt8PYJIZVqsKkSQqOC781JcybrKf5LxOvCA5gM/RUY9r7j5+XQRu2+7jcB9Y4/+VXfbXgKyrtQeY2UP4TLTO1KoUHXpjpnP7Tr5Y5rtajnYb6DSbLLJTgSVhm++jjVd3xxoS4OmP7w0XS2SzXKEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EaObn41R; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761320187; x=1792856187;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=c4POsfpSmCeovwXkfa+/5s5a3X9FyKZ4I9A338tJHhk=;
  b=EaObn41RxLAFALgv9xnsDtGHWIVEdQZRJtlrVviovYfVwmJEvw9r/cBl
   KlZBLobWkkZLho0Ybw0yYAqWGYggGoTTzlLH8ZP1qDckG2aL1udSbxJ1t
   5y8qR+tGC4ApSYirWChZxBOh0LUUj1kum7Z890+ulJRgvx2bIDySKCtQJ
   ImDYt8TgCSwjhj61GkQx6/AHgWrVABkAOxCqUzptNUW5FVhEX+S/8R4z0
   f2wECGQNVtWv0XJyxPu88PnUxsfM19PKG3eS2JUvTJ3Q2+1hD57aFJv8j
   c0B7zaOh12v690wTOLFyny6feqJIu+1hXPKJvuEtcvabiI8tWWYMLC5Ln
   g==;
X-CSE-ConnectionGUID: qbU+49LiQWurbh7/GrHJuA==
X-CSE-MsgGUID: vBQU08GBQ9COX7UY8QdVbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62712275"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="62712275"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 08:36:25 -0700
X-CSE-ConnectionGUID: t/camtXVQBymGWd9ZB89Ww==
X-CSE-MsgGUID: lPMOpaDxR46y4tS9e2JuFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="185225555"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.138]) ([10.245.245.138])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 08:36:23 -0700
Message-ID: <8fe27842-8155-44db-b262-a148b5ce5436@linux.intel.com>
Date: Fri, 24 Oct 2025 18:36:17 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
To: Milan Oravec <migo.oravec@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
 <CAAcb1K_bezseTM8DrOrzVUi_W+nZoE2N0CO4k3AQWPw7=7pyjw@mail.gmail.com>
 <2025101544-galore-sculpture-b243@gregkh>
 <CAAcb1K85GK6m_bVUeSfX1GP4=mxzwfmHtaRX0EYD_jgGfQRk9Q@mail.gmail.com>
 <4e6d9b62-b9d0-4a05-99a9-143899547664@linux.intel.com>
 <CAAcb1K_a2dkj5wv__1BW-fu_Zg=z00OmQzJmekQ-GH4svYQ-GQ@mail.gmail.com>
 <f0d0f71c-bc47-4348-85a6-d728a67c982a@linux.intel.com>
 <CAAcb1K-o7DY3Kvqdr+=MN8OsgRZr+g43-zC6YSLG0hbNxEQUeg@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CAAcb1K-o7DY3Kvqdr+=MN8OsgRZr+g43-zC6YSLG0hbNxEQUeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 09:43, Milan Oravec wrote:
> Thank you, is there any workaround for this to get DbC working for me?

I just wrote a quick hack that bluntly retries early_ioremap() with a smaller
size, and then checks if we are lucky and DbC capability in xhci mmio space
is withing this new range.

It will still trigger the same  "WARNING: CPU: 0 PID: 0 at mm/early_ioremap.c:139"
messages, possible several, but would be interesting to see if it works.

Thanks
-Mathias

