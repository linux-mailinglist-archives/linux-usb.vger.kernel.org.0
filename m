Return-Path: <linux-usb+bounces-5365-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F91836482
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 14:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA0031C226B5
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 13:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5E03CF75;
	Mon, 22 Jan 2024 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxYuTdi3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0913D0A0
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 13:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705930540; cv=none; b=SLizCKx4H/CToYBUxmDaj/BJwcYiC9TpsyMKNcw7jub5hBTdxeQQDLCmD+ruYm3LmdQbtHL0KvxkXi3iSE/zBXWHTApX5pgAHn6o2qlW03aB5aTPYYI9NV2cFCIv2DM9NPjtJoCyd4ecLSq4XsVHPb2NuzWom6TTwQ3yPILWnX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705930540; c=relaxed/simple;
	bh=InYdJX+1X5H/27PXcj12umLpwv3nS2Tjul9O0wupYUo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=iuojwkVLQLlMg+rO1NtMpnzKfF8vCfBc+BIikG6oUDhD13ciBDzw/Z4mRUba673xe029ckN6XY13tdRRZS1A0/gMdUMocQFx3PDSOaZo2+eGDp8cu/y+YwUWuEUwSyg71d/NBIWLLaI9FJMEptn4Gby/+OhhIJgr6hRw1sETDoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxYuTdi3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705930538; x=1737466538;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=InYdJX+1X5H/27PXcj12umLpwv3nS2Tjul9O0wupYUo=;
  b=mxYuTdi335IZUX+WfRBfBzcwPPOudqjRS8ZwRJeSfMFg+uXGveOa15v0
   sJfDOYe9A0Asq3YLvKhdqm3bXoSJM55ec3eMmgK+l18cq8ftE5OqTPvWR
   OMjwWVFp/p8RoZAHLtnmxcbG9F3kq77rKo8+nU/dIBkfPHyJ9r2q8BHFU
   8CvVtywFn+W7GX3SguzqWCWBPfJdnUb8g/vks9MioBLh3RYuSWpcVfk+v
   aoGbmDsKTRVbByazTBl/LJjodOqbIRW8lKrApz1jWTEoDPnMFTuMNn9i0
   M+mUxSuTQ40DpEZ7RZydpCKlkTTq1w32MeOOH8SxHqOwWPbxZOtqUXBwp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="100245"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="100245"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 05:35:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="908942863"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="908942863"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 22 Jan 2024 05:35:34 -0800
Message-ID: <6413c910-a57a-6d25-7672-18ae34ec674b@linux.intel.com>
Date: Mon, 22 Jan 2024 15:37:05 +0200
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
 <20240119225432.78c2d35d@foxbook> <20240122100332.6341ef1d@foxbook>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RTF PATCH v3] xhci: process isoc TD properly when there was an
 error mid TD.
In-Reply-To: <20240122100332.6341ef1d@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.1.2024 11.03, Michał Pecio wrote:
>> Apparently a babble error, and it seems to have generated a "success"
>> which the event handler tried to match with the next TD. So a mid TD
>> babble may need the same treatment, which is not surprising.

Makes sense.

> 
> This is now confirmed and fixed here. The change is obvious enough:
>          case COMP_ISOCH_BUFFER_OVERRUN:
>          case COMP_BABBLE_DETECTED_ERROR:
> +               error_mid_td = true;
>                  frame->status = -EOVERFLOW;
>                  break;
> 
> I don't know yet what COMP_ISOCH_BUFFER_OVERRUN means, but I guess it's
> the same story. BTW, error_mid_td is a local variable now and I use the
> urb_length_set flag instead, as explained before.

To me it looks like COMP_BABBLE_DETECTED_ERROR and COMP_ISOCH_BUFFER_OVERRUN
have the same cause, device is sending too much data.

Isoc endpoints should use COMP_ISOCH_BUFFER_OVERRUN to indicate endpoint
hasn't halted like it does in the COMP_BABBLE_DETECTED_ERROR case.

See xhci 6.4.5 "TRB completion codes" Footnote 115

> 
> I found that it can be reproduced on the VIA host, with enough tries it
> can happen even on a chained TD. NEC doesn't signal these babble errors
> but new mid TD event handling should cope with either host.

So looks like VIA host incorrectly sends babble for Isoc endpoints

> 
> Debug trace ("interesting" is other than "success" or "short packet"):
> [ 4113.376349] xhci_hcd 0000:03:00.0: handle_tx_event interesting ep_trb_dma 132961000 comp_code 3 slot 2 ep 2
> [ 4113.376361] xhci_hcd 0000:03:00.0: handle_tx_event first_trb 132961000 last_trb 132961010
> [ 4113.376364] xhci_hcd 0000:03:00.0: Error mid isoc TD, wait for final completion event
> [ 4113.376366] xhci_hcd 0000:03:00.0: handle_tx_event uninteresting ep_trb_dma 132961010 comp_code 1 slot 2 ep 2
> [ 4113.376369] xhci_hcd 0000:03:00.0: handle_tx_event first_trb 132961000 last_trb 132961010
> [ 4113.376371] xhci_hcd 0000:03:00.0: Got SUCCESS after mid TD error
> [ 4113.376373] xhci_hcd 0000:03:00.0: finish_td comp_code 1 status -75

I'm afraid we end up tuning that original patch forever with these new findings,
so lets make this into a new patch on top of the previous one.
That one is tested and known to work in the transaction error case.

Let me know if you want to write it, otherwise I will

Thanks
Mathias

