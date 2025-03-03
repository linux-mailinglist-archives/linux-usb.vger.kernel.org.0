Return-Path: <linux-usb+bounces-21273-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED4EA4C1C8
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 14:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C2861896C11
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 13:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D5D2116EB;
	Mon,  3 Mar 2025 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="X/pDSJr0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2891578F32
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007972; cv=none; b=i4wNERu0UbyUvyd3xuf5rrh2mnLKl0b1mPkbKKn/0uezpXqcN9VB5ccGgICPVYNAOFuWzTjWudPw3lSRmcnqhuKu4WuE7Rw8DhT2SyzHU1yFCe1xbK5tIh8mdKoL6hG/3ikMQIlCgGqog0m0770Ls20plr2EvqnZpVwL983PfAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007972; c=relaxed/simple;
	bh=7onwNOhaT5R45R4Fr2oOrNM4d+bhAhd+hYK8FVOqZg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJaSfm0Q4CYpLW11CtAvo7Js+6CxOh0T+P5ck+KqJ+6mwNRgOdv3p52arnbWxX7DMKRi5dBTqKwW7aHEWf9TPGkgdQ52SFW/NrhtkCXDE/O8FjOQlDlIlmK8hSDA9A2fMV+5lQruafVy1RxsLOreG5ZQ8oqjTy15zq+dgtBu3Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=X/pDSJr0; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.189] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z5ztS4mwBz1135;
	Mon,  3 Mar 2025 08:19:28 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1741007969; bh=7onwNOhaT5R45R4Fr2oOrNM4d+bhAhd+hYK8FVOqZg8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=X/pDSJr0Ox7sjPVFRWAlReSD/CpatcQYzvo9+q5i2fXKG9nTQz0Slf6970wPygAOf
	 7p4AqzyLm5K1cOIbQRcGn1+0YdJ0WNN6DBfyGcyh4L5zg6B+zW8Dy0+QyJh+xfQdg9
	 np1tO/gF8Dwop4cE3djtKnNxTj4ZQ2e07WmN4RUc=
Message-ID: <744090aa-074e-443f-8a94-567dadff4c7d@panix.com>
Date: Mon, 3 Mar 2025 05:19:27 -0800
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
References: <8e175721-806f-45d6-892a-bd3356af80c9@panix.com>
 <bd731ba2-5509-44e6-a419-814ef5329bbd@panix.com>
 <992dba2a-4919-4f76-ac48-986792d5843c@panix.com>
 <2b55ab09-8389-4916-8acc-abc73f234d21@panix.com>
 <20250303104618.GP3713119@black.fi.intel.com>
 <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>
 <20250303112149.GS3713119@black.fi.intel.com>
 <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
 <20250303115329.GT3713119@black.fi.intel.com>
 <68cec31a-0132-43bd-8a61-29e0ac23b326@panix.com>
 <20250303131359.GV3713119@black.fi.intel.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <20250303131359.GV3713119@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


 >> Oh and the failure mode for d6d458d4 is ALWAYS this, and always(?) 
from line
 >> 436/7 of ".../drivers/thunderbolt/path.c", a call to tb_port_write():

I was looking thru the pstore dumps; it may not ALWAYS be line 436, but 
it is always in "tb_port_write()".

On 3/3/25 05:13, Mika Westerberg wrote:

> That's also weird because we don't do anything for DP tunnels on resume so
> what this code is doing is to clean up for the tunnels left by the boot
> kernel (since this is hibernate). 

OK, but for completeness' sake the crash happens on a suspend resume as 
well (and the same failure mode as a resume hibernate).

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


