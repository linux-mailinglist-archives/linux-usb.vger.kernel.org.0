Return-Path: <linux-usb+bounces-31732-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2354FCDA852
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 21:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A21963032FF9
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 20:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E2C357732;
	Tue, 23 Dec 2025 20:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ge7+QuFK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84035357714;
	Tue, 23 Dec 2025 20:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521293; cv=none; b=SrnPIpivu4GZtwT6ZcI/OXJuiaerkacoVl1OOrG5kMSKQYvLWNDvPQQY30ziP90MLlR3kqAzGqTDXR21N5UxzD+SqSiCTSvQNRd1noFKp4cp/DXzSz8uIx8qMHx9QxbDXXzAcc2ZPjlSQPCa0jKPRJFPnrUSW7D8EdMrMMMZ7M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521293; c=relaxed/simple;
	bh=XoVqXxU38vsEHvi/bZFZTTxmPGmjmrMXiPolm10/Gg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gw6btGqfKfCAUm8sE2mvUL0/jsFfR9Ds42EF30hYxn/GyLkQFBtzOnOcwA/wjEdfghVA8o6+T0faCrgfyPZgYwke4DxbYmipj9EZSDKSnw8466tsoNhzOxDWnXYTB/7GvhO1jhoxx7MDpirP923ZmLwh9ldiocRiXZOCQRaDBMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ge7+QuFK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766521291; x=1798057291;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XoVqXxU38vsEHvi/bZFZTTxmPGmjmrMXiPolm10/Gg8=;
  b=ge7+QuFK8Qd8UvLqyC7l8i3/iMY4ArCJk+AnjeM0gP5wMGEQKUzRW+rK
   e8swGb4jQkyQOVU0FsbyyVcW3Ug1HBPZYXpJL10kY/ehyhMcDUhi4LW+P
   aYguk8GJ+LFUygXed67ZYVbGwkVbONTdhAGlqk7kNTKqbDMzPkg3MvXoY
   x3t3Gqj6QzMiaG6vnOF5hhHZOZWY/vWFRXiaSgeQ3buvSzLKO5/j7LZJG
   CPaXyuaWR3Qh7gfvmv5zuhRtejXAyFLpjORSfg3RkF5XJNGzVnovASwAe
   7l7QYzegsOnjRtq+MiVtJbOicNZvTZ0a7/pJyEq8MCJ8Sy9PBBlG5twhn
   A==;
X-CSE-ConnectionGUID: p7FNwaF7Tu6XcJMpzrufNw==
X-CSE-MsgGUID: qJg+lJIEQqqHz5cckChnJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="55939911"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="55939911"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 12:21:30 -0800
X-CSE-ConnectionGUID: gnOHSH7qRg6jfyPtuD9HPQ==
X-CSE-MsgGUID: IdIofmAHQeSn7IGGwhqelQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="237264322"
Received: from soc-5cg1426swj.clients.intel.com (HELO [10.121.200.125]) ([10.121.200.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 12:21:31 -0800
Message-ID: <9f5fd0d3-feac-4b43-ad3b-87cee7fa1f9b@linux.intel.com>
Date: Tue, 23 Dec 2025 12:21:28 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] usb: typec: ucsi: revert broken buffer management
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Pooja Katiyar <pooja.katiyar@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251222152204.2846-1-johan@kernel.org>
 <a6073f4f-edb3-470c-be63-4c3054d497a0@linux.intel.com>
 <aUqhgbxGIbq_V9Cz@hovoldconsulting.com>
 <2025122344-purely-subsonic-4b97@gregkh>
Content-Language: en-US
From: "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>
In-Reply-To: <2025122344-purely-subsonic-4b97@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Johan and Greg,

On Tue, Dec 23, 2025 at 06:24:24AM -0800, Greg Kroah-Hartman wrote:
> On Tue, Dec 23, 2025 at 03:04:49PM +0100, Johan Hovold wrote:
>> On Mon, Dec 22, 2025 at 02:15:10PM -0800, Katiyar, Pooja wrote:
>>> On Mon, Dec 22, 2025 at 07:22:00AM -0800, Johan Hovold wrote:
>>>> The new buffer management code has not been tested or reviewed properly
>>>> and breaks boot of machines like the Lenovo ThinkPad X13s.
>>>>
>>>> Fixing this will require designing a proper interface for managing these
>>>> transactions, something which most likely involves reverting most of the
>>>> offending commit anyway.
>>>> 	    
>>>> Revert the broken code to fix the regression and let Intel come up with
>>>> a properly tested implementation for a later kernel.
>>>>
>>>
>>> Thanks! A fix patch addressing the race condition has been identified and
>>> is being tested right now. It will be submitted for review shortly.
>>>
>>> Here’s the discussion on same - 
>>> https://lore.kernel.org/all/349e1f70-7e40-4e3e-b078-6e001bbb5f1a@oss.qualcomm.com/
>>
>> Yes, I'm aware that discussion and I still think this needs to be
>> reverted. Then you can propose a redesigned and tested implementation
>> that we can help you review as that kind of work is not something that
>> should be done as part of rc stabilisation.
> 
> I agree, I don't see a submitted patch yet so I'll go take your reverts
> at this point in time.  That way people have more time to get this
> correct instead of being rushed this time of the year.
> 
> thanks,
> 
> greg k-h
> 
Thank you for your feedback! We will work on a redesign for clearer implementation.

Regards,
Pooja

