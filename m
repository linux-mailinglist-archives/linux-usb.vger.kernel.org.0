Return-Path: <linux-usb+bounces-12720-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B38942F07
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 14:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62A1E288BEA
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 12:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DACA1B3757;
	Wed, 31 Jul 2024 12:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lyIpd5WZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2CB1B3740
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 12:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430071; cv=none; b=gUw9iHb/Lg7c2L1IYXCYVTpLbwPtuDFIGeWmxd282nzrHPiY/ul/ibpM7VPg5RgoiIhYd6He81/kLuYQwU2tjeVETPWNFzeS8eo9rE9gox5/um1evU1gqg7Jrg4xnuCjy1Hz7boT8lhhbE4YMt98NUBVqraGwchp9xewpOPn+pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430071; c=relaxed/simple;
	bh=gWr2nyQGDHBwWGUKjEi0LGgN8dYkjGhnBDLo7yXwImE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlzrnR6uJ4Vc6jwIV7+P6THKt5lYSTwbqHsaQU+LL/AgUoCiTRV1aVTHIrIfaMPDLxIdaG7sBnh6VmjGnhyVWsf+ijwqkj69NipSKanqJxo6Wcw1QP4xezc3wro/Kbv2p8aLVEwBt94uIvA3cE/QeBMTTHJwyXLJr2G96NCcf70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lyIpd5WZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722430070; x=1753966070;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gWr2nyQGDHBwWGUKjEi0LGgN8dYkjGhnBDLo7yXwImE=;
  b=lyIpd5WZsmYtdvdfXwM+6Fb1NsOjLSetzjvdSvidm2INJphMl0KdG/Hp
   FpZ/bO0X72tsATkWNTEILqz1Sz20cLRH52gf0JqhUGurFM8YpaWphcRbV
   71LoSvHx5GG9veTX7zeu8Ub4qXrNck+sR9oRJDjqLuw5WaberIyKZsNi5
   0JTiXRJO+ld/bYg7eOTZy9IXTNNQH/mt7qpxTKXkJI4bg/qXYN6qUvyqV
   wmh3ZFgmuaNC2xMm6Su28tPQAO7JkQbKyiDfJ3/LL/whoKOJHsbD+akjv
   rW9zY+XNXkitBuGSwFDbqw02ohRqHRuT/xIgDZFdjyHXX0GMCoS3/P3uX
   g==;
X-CSE-ConnectionGUID: m6FlA+fMT8mGvG0pP5Aqmg==
X-CSE-MsgGUID: w8CAyfoNRRCi+iXgU52tcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="19894855"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="19894855"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 05:47:38 -0700
X-CSE-ConnectionGUID: +oHYUcE+RSSGVkRctqb9/g==
X-CSE-MsgGUID: vRmNihODRlOvbeQDcS6V+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="54372719"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa006.fm.intel.com with ESMTP; 31 Jul 2024 05:47:37 -0700
Message-ID: <8cc19d0a-80f3-48a4-9fd2-0cc42b8ed1f4@linux.intel.com>
Date: Wed, 31 Jul 2024 15:49:39 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xhci: dbc: fix handling ClearFeature Halt requests
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, linux-usb@vger.kernel.org
References: <20240725074857.623299-1-ukaszb@chromium.org>
 <121d85fe-976a-43c4-95d2-1a066234a758@linux.intel.com>
 <CALwA+Na218B0PK3QG20_XFovJMfB4ud7B9Z=4kX=xwu8bjAvHA@mail.gmail.com>
 <115eb4be-e336-4a29-84d2-bdafb84a0f9f@linux.intel.com>
 <CALwA+NbLsg2qfmaHagMNimN0mvU6vNP-rsY31O-9X6oZovAOJQ@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CALwA+NbLsg2qfmaHagMNimN0mvU6vNP-rsY31O-9X6oZovAOJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31.7.2024 15.28, Łukasz Bartosik wrote:
> On Tue, Jul 30, 2024 at 5:45 PM Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
>>
>> On 30.7.2024 3.17, Łukasz Bartosik wrote:
>>> On Mon, Jul 29, 2024 at 4:11 PM Mathias Nyman
>>> <mathias.nyman@linux.intel.com> wrote:
>>>>
>>>> Hi
>>>>
>>>> On 25.7.2024 10.48, Łukasz Bartosik wrote:
>>>>> DbC driver does not handle ClearFeature Halt requests correctly
>>>>> which in turn may lead to dropping packets on the receive path.
>>>>
>>>> Nice catch.
>>>> Looks like a halted endpoint is treated almost as a disconnect.
>>>>
>>
>>
>> I pushed my thoughts to a "fix_dbc_halted_ep" branch, it compiles but is not complete.
>> It mostly focuses on getting the STALL case for bulk-in working which this report was
>> about.
>>
>> I think the code itself best describes what I'm trying to do.
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_dbc_halted_ep
>> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=fix_dbc_halted_ep&id=8532b621314e93336535528d5d45e41974c75e01
>>
>> If you can try it out it would be great.
>>
> 
> Sure I will test your patch and get back with the result.

Thanks, that patch was missing a "ctrl = readl(&dbc->regs->control);" line

It's now fixed here:
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=fix_dbc_halted_ep&id=cf99b473a1477c1b3510af0021877197a039c43f

Can you try that instead

Thanks
Mathias


