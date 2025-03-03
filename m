Return-Path: <linux-usb+bounces-21279-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A565CA4C2E6
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 15:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB378188601E
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 14:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1321C213E7D;
	Mon,  3 Mar 2025 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="PjNnbAXr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE60B2139D4
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741011014; cv=none; b=vDCk7hJF8dO5kWJxAaxmN3Y8olV8u7wl20iz3HhmVPfUA7bLtxyXS7htv0z5jqHfbH5C3+SxqoLqFsxyANl+VmOlpQH2/aKmiZmbbkBDE52WosbASPxFNSVHaaoXn7+vS6AI+Tzb3L6U+KX1EF6x4jazN8Q2mS5sOea+BEQ7pjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741011014; c=relaxed/simple;
	bh=n+mOKLyLS2tjQgKUQ3QMXV1zxyUv+PMhPnidZOYfXlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CaFP5NRx83+hthxxZl1jb0RGu4OCHpGgbpEzB/0gpJI0lKrkvexL37EdtM+/UxZwc3dFvMrUexoTG4vWXb0UI8yo+n6EN0FzlzD0DnNoBKuviwMQU7O37NyYiPAHZC27rXbP4uBByY3tfXBmEGsrRooS8ZDhnsbNVr2n42RAuYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=PjNnbAXr; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.122] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z610z2hxlz14Kr;
	Mon,  3 Mar 2025 09:10:11 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1741011011; bh=n+mOKLyLS2tjQgKUQ3QMXV1zxyUv+PMhPnidZOYfXlg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PjNnbAXrqA6a8rpb8znYmOdMOeYzmE83/iIk2kCdcw6h5GQXAIsuu2tt2YIEBTswn
	 uDenjJFfhKMzBeozYgFoka0BI8pywpCn76fTDkRmnCn9y+gSrasn976wOVhx4Y9tLK
	 WzJ2Dsm9HT/mxkalZIyX31wA4Eyp8y8yHbPzTP3E=
Message-ID: <567725a5-f984-4ea1-bd38-8815825c1211@panix.com>
Date: Mon, 3 Mar 2025 06:10:09 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Me <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
References: <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>
 <20250303112149.GS3713119@black.fi.intel.com>
 <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
 <20250303115329.GT3713119@black.fi.intel.com>
 <68cec31a-0132-43bd-8a61-29e0ac23b326@panix.com>
 <20250303131359.GV3713119@black.fi.intel.com>
 <744090aa-074e-443f-8a94-567dadff4c7d@panix.com>
 <20250303132327.GW3713119@black.fi.intel.com>
 <20250303134618.GX3713119@black.fi.intel.com>
 <24ef839c-8fa5-4a19-b9c6-0a267aab84f5@panix.com>
 <20250303140156.GY3713119@black.fi.intel.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <20250303140156.GY3713119@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> And my system recognizes all new TB devices automatically
>> (no manual intervention required).

On 3/3/25 06:01, Mika Westerberg wrote:

> Right it does that if you have screen unlocked.

I'm running Kubuntu (24.10); AFAIK it just allows them anyway. The 
"System Settings" dialog is just an Enable/Disable toggle.

> If you "forget" them then it should in theory at least keep from creating
> PCIe tunnels, so keeping them out of the equation (we just want to
> concentrate on the TB/DP side here).

But what I can try is just connecting the monitors directly; the 
portable monitor directly to one of the laptop's USB-Cs, and the 
Odyssey's USB-C-to-DP w/o using the dock.

Now I'm curious, and may take an hour or so to try this stuff out.

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


