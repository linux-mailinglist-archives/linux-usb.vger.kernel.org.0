Return-Path: <linux-usb+bounces-37082-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGEYL0aK/GleRAAAu9opvQ
	(envelope-from <linux-usb+bounces-37082-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 14:49:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C84E8715
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 14:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05F7C30214F6
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 12:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6549A3B27C7;
	Thu,  7 May 2026 12:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ax3N6SaU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E023B2FFE;
	Thu,  7 May 2026 12:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158116; cv=none; b=qBk78wiSuvDgmi0HroSPJS2Yu6so8axvVItQSwiUd0BJuEibUy0W5edh9ES5zAfZQtH1Kc4fbM3K2u3mjEVcwr6sH2GKN5VPYmSfSdV6b+hNLLDh2cR+WksV4ItJN30cqWubl4gRNuSgJ++ywABM3zJqclBo5XFUbKqj63W9E8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158116; c=relaxed/simple;
	bh=/T9rcWHAMk5X2apXwjXuJl1NKHVKea/Pzs1XibyT0fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OO50Dv56jU7URQkLMknPrESEyMhnb48k2pncfEJ1rtPvyYAVwEXLZ1o6K0BztZ+Foj2lxKGjzoC6MJD7XZPkyDCpFRZ5iJ8kmevhEhKBLMedRvCd6BUE5FIPOiQlnbzUE3eD8jvTE5rlq9wTdQ7Y/EO0QCLmESJDF3vOS62FEZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ax3N6SaU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778158113; x=1809694113;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/T9rcWHAMk5X2apXwjXuJl1NKHVKea/Pzs1XibyT0fs=;
  b=ax3N6SaU/ngb8hWe+SpJTPlYzNrLu/AXgwXJYCcbzDDdwwfYUqg8phbx
   E6dH3POQc9zVHS4hr2tJ8M0bvIlJFYuRhIBqF5cLM46BTa22ibXXHl6ge
   JjOLbN8HLsiAqDaH9zmCRjKiiXmsUjslEgFnsK6yt3UMFC3x7OmX1w1IW
   ychhlbnOfC+UKdsnY0OrGUCiZlfTcTQraI33VIsUpAQPynh7wGRc3MhG3
   isxp/7nOqpJNazKOmLAUm13OX52iDPTYuiwkpB/vFmZ058gH2zQYzezkb
   ITyZV6fjhGfOen9wP1n7UTKHE0d1neFvfHLMQvIXVFnsmQU+ZSLIoHMyX
   A==;
X-CSE-ConnectionGUID: vieu25PLSG+4hP7JXMn90Q==
X-CSE-MsgGUID: ZvdMuXsXQ16o+yVg9eOvOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90564273"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="90564273"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 05:48:33 -0700
X-CSE-ConnectionGUID: 42a1u9Y6RM+4qHtHzKYtPg==
X-CSE-MsgGUID: DCMlx8EQSoyM/EfB1I9J7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="260159521"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.122]) ([10.245.245.122])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 05:48:30 -0700
Message-ID: <803cc760-93f3-429e-bae3-669f86c07585@linux.intel.com>
Date: Thu, 7 May 2026 15:48:27 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: host: xhci: Allow non-Intel usb_link_tunnel_mode
 reporting
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
References: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-1-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505121404.GG6785@black.igk.intel.com>
 <02b4a4ca-c091-47b0-bae7-e38d9fa77850@oss.qualcomm.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <02b4a4ca-c091-47b0-bae7-e38d9fa77850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1C8C84E8715
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37082-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,linux.intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

On 5/7/26 13:40, Konrad Dybcio wrote:
> On 5/5/26 2:14 PM, Mika Westerberg wrote:
>> Hi,
>>
>> On Tue, May 05, 2026 at 10:55:04AM +0200, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> The Thunderbolt framework relies on the USB core to create device links
>>> for tunneled ports, so that the USB3 controller is only kept
>>> runtime-resumed for the duration of the tunneling.
>>>
>>> Currently, retrieving that information is only possibe on Intel XHCI
>>> hosts, through a vendor-specific capability. Extend xhci-plat to allow
>>> plumbing a custom one.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---
>>>   drivers/usb/host/xhci-hub.c  | 4 ++--
>>>   drivers/usb/host/xhci-plat.c | 2 ++
>>>   drivers/usb/host/xhci-plat.h | 1 +
>>>   drivers/usb/host/xhci.c      | 6 +++++-
>>>   drivers/usb/host/xhci.h      | 5 ++++-
>>>   5 files changed, 14 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
>>> index bacd0ddd0d09..09e5da912066 100644
>>> --- a/drivers/usb/host/xhci-hub.c
>>> +++ b/drivers/usb/host/xhci-hub.c
>>> @@ -750,7 +750,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
>>>   }
>>>   
>>>   /**
>>> - * xhci_port_is_tunneled() - Check if USB3 connection is tunneled over USB4
>>> + * xhci_port_tunnel_mode() - Check if USB3 connection is tunneled over USB4
>>>    * @xhci: xhci host controller
>>>    * @port: USB3 port to be checked.
>>>    *
>>> @@ -764,7 +764,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
>>>    * detecting USB3 over USB4 tunnels. USB_LINK_NATIVE or USB_LINK_TUNNELED
>>>    * otherwise.
>>>    */
>>> -enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
>>> +enum usb_link_tunnel_mode xhci_port_tunnel_mode(struct xhci_hcd *xhci,
>>>   						struct xhci_port *port)
>>
>> I'm wondering if this could be:
>>
>> bool xhci_port_is_tunneled()
>>
>> becase if I understand correctly that's the only information we need e.g is
>> it going over tunnel or not.
> 
> It was originally introduced as a tristate enum in:
> 
> f46a6e165197 ("usb: Add tunnel_mode parameter to usb device structure")
> 
> but the usefulness of USB_LINK_UNKNOWN is limited to a dev_dbg() print..
> I don't really have strong opinions either way
> 

Tunnel detection can be tried other ways if state is USB_LINK_UNKNOWN.

For example usb-acpi.c will try to create a tunnel if all the ACPI entries exists
that indicate a tunnel, but the current xHC doesn't support tunnel detection.

usb_acpi_find_companion_for_device(struct usb_device *udev)
{
	...

	/* Tunneled USB3 devices depend on USB4 Host Interface, set device link to it */
	if (udev->speed >= USB_SPEED_SUPER &&
		udev->tunnel_mode != USB_LINK_NATIVE)
		usb_acpi_add_usb4_devlink(udev);
}

-Mathias






