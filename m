Return-Path: <linux-usb+bounces-2463-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3727E7DF71C
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 16:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3C4FB21221
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 15:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554121D531;
	Thu,  2 Nov 2023 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzkRWJ8f"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EBF1D69C
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 15:54:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF7E137
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698940470; x=1730476470;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Kq+kChHzpMAymia57f13fJIxDiEf6RGovKcLjkFT7Bg=;
  b=ZzkRWJ8fZ7sQKp2GT5ECdvRAFPntqVghofQ9lGl6mvzHQHqJ85Abdmaj
   jaNDlg+9zWf1dTSgE2Ou+ESdxZH0is4HFfoeC0UDtZkJmp0fqsvrljVgJ
   wZPJA6mwzRLdH3E8MDB60t+pG5bouuQ26DJ1qNBv/HY9yXkptIwxbjy/F
   ivc6GEt6xgDjiT96eVGoaMbFn7J/zW4kf8H9i0MwvG96DZy6nE1OTVkSo
   Aw+zefxmjA870E/GyHqfckRuUTk0hD9DrOW8wBhHFgE84KxQvBJ5hBYNC
   Fd2/MS+dQGIXN5qP+thsBLwurjjuL1nKWz/Lo1y5sXfU7wIHcL5f/y+d8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373784637"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="373784637"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 08:54:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="827180429"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="827180429"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 02 Nov 2023 08:54:28 -0700
Message-ID: <1c9ca4e1-fbf3-c0ff-bd22-5a08097c18ee@intel.com>
Date: Thu, 2 Nov 2023 17:55:40 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: USB 3.0 hub / controller is not working correctly - Error -28
Content-Language: en-US
To: Bastian Sulinski <bastiansulinski@googlemail.com>
Cc: linux-usb@vger.kernel.org
References: <CAEig5iAvL=OjPwmPuzJ6iqBYktzUW7j2TMn=ipYbTzHX8p5dnQ@mail.gmail.com>
From: Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <CAEig5iAvL=OjPwmPuzJ6iqBYktzUW7j2TMn=ipYbTzHX8p5dnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2.11.2023 14.50, Bastian Sulinski wrote:
> Hello Mr. Nyman,

Hi

> 
> *Initial situation:*
> 
> I have a freshly installed Linux Mint 21.2 system. Specifically, it's about
> the two USB3.0 hubs, which are connected to the mainboard via an approx.
> 1.5 meter 3.0 extension. The motherboard has two ports and a USB 3.0
> controller. (Etron EJ168a)
> One hub is "no-name" (passive), the other is an Icy Box IB-HUB 1701-C3
> active.
> 
> *Error Description:*
> 
> Connected HID devices such as a mouse or keyboard (USB 2.0) are not
> recognized.
> Mass storage such as USB stick (USB2.0) as well as an external hard drive
> (USB3.0) without any problems.
> 
> Error in Dmesg
> 
> 
> [ 1896.442107] usb 3-2.1: Not enough bandwidth for new device state.
> [ 1896.442119] usb 3-2.1: can't set config #1, error -28

This Etron xHC controller claims there's not enough bandwidth available in
this bandwidth domain to add more periodic usb endpoints (mice, keyboards etc).

> 
> For further information i will link you a Post where i have more information:
> official LinuxMint Forum <https://forums.linuxmint.com/viewtopic.php?t=406833>
> 

Your dmesg shows that you have several other devices connected to the hub at 3-2.

[    3.824162] usb 3-2.2: new high-speed USB device number 4 using xhci_hcd

[    4.332173] usb 3-2.3: new high-speed USB device number 5 using xhci_hcd

[    4.724173] usb 3-2.4: new full-speed USB device number 6 using xhci_hcd

[ 1896.284241] usb 3-2.1: new full-speed USB device number 7 using xhci_hcd

Does it work if you remove the other devices from the hub before connecting it?

Note that the USB 2.0 High-speed external hub is its own bandwidth domain.
Each transaction translator (TT) in this hub, allowing FS/LS devices
to work under a HS hub is a separate secondary bandwidth domain.

So the downstream facing ports of a single-TT hub creates a single Secondary
Bandwidth Domain, whose bandwidth is shared across all Full- or Low-speed
devices attached to the hub.

lsusb -v shows if the hub is single or multi-TT.

Any chance this setup could be tested on an xHC from another vendor?

Thanks
Mathias

