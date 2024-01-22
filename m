Return-Path: <linux-usb+bounces-5358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B54F183627C
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 12:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12F99B250BD
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 11:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFAA3BB24;
	Mon, 22 Jan 2024 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHkaAe7p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF083B79C
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 11:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705923934; cv=none; b=tLCplPgdS1pwzmYWmqWJLs8nI/HmAdLeqNZq7BwE/ktKJxFVzGh+AReNVCpUNtSs7VXl7bF4gFrHRyRsu3+7wZVIsnSKtKprWU8qHoOl4DEJmnSRKjhzTLyNuRka9/LfrRQPyT7YDkB6B+HNsPqFweockZR7A6YsxgT4fH+HEJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705923934; c=relaxed/simple;
	bh=c6P+JYzYIuqExp3UOxVYQVqC6aqWCZ941kaDd//oyUw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=juHqM1VeyVI0dhf6mjWEv47Oa5xKFNe5oMFA8spwRvP9KXbiFjMOVA6F9dVsZ5uHdahvuQpZuO+Ci4gn/jF+e8TCoq7Drh1FKriCJ3eE2sr26/pqhtEN0TOa3hFjYDeaf0kxBOCAqKmd/Xo8IJZ2I9iKU3OIEefU2lM3V8Uordc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHkaAe7p; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705923933; x=1737459933;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=c6P+JYzYIuqExp3UOxVYQVqC6aqWCZ941kaDd//oyUw=;
  b=QHkaAe7p5aIWDlQkiYfinUhRsFaSv/NvxMDM4DUdj8n3Gd261PE9tdgD
   xz25U2J4QW5qHYMzpfw4Jby6SZgqb/tkP4ZHW189LVAXBNiqyZj/gtwve
   6v+pSVLh4kmrb3/SZ+f6GqZQzTYuZ0PjvWsvQGzcV37hNAz+zvlPzU0xc
   +vxO8si4vp1OcdIy+7KvKrxT6a1fMRgx26ipXFBSJXm/VlxYxzQ+CaZ03
   Tc4kxkQZBXGTyde7DYuLjkb7ZdDI7RMGqkFpzdzwbQwpg20M1MwUOTgXS
   3S/hnS9r439WNO9ZjFcRbB48wrauA4Vcl7srs1ACnFEMH9eamPZaX7S/b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="22664551"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="22664551"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 03:45:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="855908062"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="855908062"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jan 2024 03:45:31 -0800
Message-ID: <ff56ae38-c95a-0a31-7e81-a645ba156875@linux.intel.com>
Date: Mon, 22 Jan 2024 13:47:02 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <2c2d8711-3d2b-e943-a2a0-75637e725dc3@linux.intel.com>
 <20240119105835.2637358-1-mathias.nyman@linux.intel.com>
 <20240119225432.78c2d35d@foxbook>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RTF PATCH v3] xhci: process isoc TD properly when there was an
 error mid TD.
In-Reply-To: <20240119225432.78c2d35d@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19.1.2024 23.54, Michał Pecio wrote:
> Usual tests passed (but only transaction errors are covered).

Thanks for testing, I'l add your a tested-by tag to the patch.

> 
> 
> I noticed that with your new fix to the frame length bug, error_mid_td
> always equals urb_length_set. So the new flag is perhaps not necessary
> after all. The test in handle_tx_event() could be:
> 
> if (usb_pipeisoc(td->urb->pipe) && td->urb_length_set &&
>      !list_is_last(...  ))
> 
> I tried it and it works just as well.

This is probably true here, but urb_length_set and error_mid_td have a bit
different idea behind them

For example short control transfers may send an event mid TD (during data stage).
There is no error, we wait for the completion of the status stage but don't want
to change the transfer length set in the urb.

I suspect we will need to play with both flags for other error cases in the future.

Thanks
Mathias


