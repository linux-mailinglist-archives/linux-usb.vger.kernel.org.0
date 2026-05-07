Return-Path: <linux-usb+bounces-37084-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FQwFTeR/Gn3RQAAu9opvQ
	(envelope-from <linux-usb+bounces-37084-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 15:18:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7774E91D9
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 15:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF2433036D72
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 13:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E3B388E49;
	Thu,  7 May 2026 13:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNxVp/YM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CA439FCCC;
	Thu,  7 May 2026 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159507; cv=none; b=b8qpcRTANdRWC6EFJe6QADrY3Zfsx8TdLTznComIfhDiIVfJNw8bOISpnTwPQHAAqFHhcm6//e3++bth6BxN8dbwj7x6aFmgCxyopmOOwcxJqSiYGqGE2vq48eT624YMV1dVFTVLodFG7rl/MlFHJHUm9ADAridQbZnWkESJxY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159507; c=relaxed/simple;
	bh=w6xmi+sEWiUa2hKDyF5vFXyNoINr7k+gla2bppYN4OY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0TJzTsMYTLsJ51J+HglPBJF0BaSzf3PkgT4ZyFi35JFxAwzHX0Ek/JLwvKq5YDwAd/8v2onpawo/SHwe6YQ7Er928LwL/AB/svtD9YIz9B7GPvl+aIE///tJEwX9vUaQVwrkK53LoOLCyQ26AZdcce4C8JacUqGvFKBPlisFuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNxVp/YM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778159505; x=1809695505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=w6xmi+sEWiUa2hKDyF5vFXyNoINr7k+gla2bppYN4OY=;
  b=QNxVp/YM8HFqeIJXABt3u4AZsz1pVzUwPnPXlgtPaQ0y92LieEubj2KG
   U2jJ9XzguPznoBXEpFIWz3D+cfnCIKZDRqugvAxk5WXgpVnS+kyhUvAZO
   p9Kr6dWBeDMskC2rExPKiEyrwd2aSYt+ROlNhDtkVkGAzxzKDyxKXndqN
   eybi0KAAFKf7gihcoe7rf+f4rpTLcfxNpsM5ZXRt6a2vAo0FoEJicZss8
   TgFZvL25w2/9HKhtqNHTGucpiB/44jOyOCekA5ZQMuNE+FVrDfyP6b/2S
   PU7/JZcWaQxofjJlu8Cdu3CFe4tAz5DcMc8S5RJof5MZLSXQjVqgb9RR6
   Q==;
X-CSE-ConnectionGUID: OJH4ZdyXT7GBjDKbstX9ow==
X-CSE-MsgGUID: YXbcimugTHKhZtLS3sYUmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="89803689"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="89803689"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 06:11:44 -0700
X-CSE-ConnectionGUID: EZ9bBbDLRgC/HzquXa49mA==
X-CSE-MsgGUID: ivcxqGByTwS3+fTT3C/bHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="240441757"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2026 06:11:41 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5E74995; Thu, 07 May 2026 15:11:40 +0200 (CEST)
Date: Thu, 7 May 2026 15:11:40 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] usb: host: xhci: Allow non-Intel
 usb_link_tunnel_mode reporting
Message-ID: <20260507131140.GN6785@black.igk.intel.com>
References: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-1-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505121404.GG6785@black.igk.intel.com>
 <02b4a4ca-c091-47b0-bae7-e38d9fa77850@oss.qualcomm.com>
 <803cc760-93f3-429e-bae3-669f86c07585@linux.intel.com>
 <cf71a13b-dd6d-4234-89f0-42eb6ea117fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf71a13b-dd6d-4234-89f0-42eb6ea117fc@oss.qualcomm.com>
X-Rspamd-Queue-Id: AD7774E91D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37084-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,black.igk.intel.com:mid]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 02:53:22PM +0200, Konrad Dybcio wrote:
> On 5/7/26 2:48 PM, Mathias Nyman wrote:
> > On 5/7/26 13:40, Konrad Dybcio wrote:
> >> On 5/5/26 2:14 PM, Mika Westerberg wrote:
> >>> Hi,
> >>>
> >>> On Tue, May 05, 2026 at 10:55:04AM +0200, Konrad Dybcio wrote:
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> The Thunderbolt framework relies on the USB core to create device links
> >>>> for tunneled ports, so that the USB3 controller is only kept
> >>>> runtime-resumed for the duration of the tunneling.
> >>>>
> >>>> Currently, retrieving that information is only possibe on Intel XHCI
> >>>> hosts, through a vendor-specific capability. Extend xhci-plat to allow
> >>>> plumbing a custom one.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>   drivers/usb/host/xhci-hub.c  | 4 ++--
> >>>>   drivers/usb/host/xhci-plat.c | 2 ++
> >>>>   drivers/usb/host/xhci-plat.h | 1 +
> >>>>   drivers/usb/host/xhci.c      | 6 +++++-
> >>>>   drivers/usb/host/xhci.h      | 5 ++++-
> >>>>   5 files changed, 14 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> >>>> index bacd0ddd0d09..09e5da912066 100644
> >>>> --- a/drivers/usb/host/xhci-hub.c
> >>>> +++ b/drivers/usb/host/xhci-hub.c
> >>>> @@ -750,7 +750,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
> >>>>   }
> >>>>     /**
> >>>> - * xhci_port_is_tunneled() - Check if USB3 connection is tunneled over USB4
> >>>> + * xhci_port_tunnel_mode() - Check if USB3 connection is tunneled over USB4
> >>>>    * @xhci: xhci host controller
> >>>>    * @port: USB3 port to be checked.
> >>>>    *
> >>>> @@ -764,7 +764,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
> >>>>    * detecting USB3 over USB4 tunnels. USB_LINK_NATIVE or USB_LINK_TUNNELED
> >>>>    * otherwise.
> >>>>    */
> >>>> -enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
> >>>> +enum usb_link_tunnel_mode xhci_port_tunnel_mode(struct xhci_hcd *xhci,
> >>>>                           struct xhci_port *port)
> >>>
> >>> I'm wondering if this could be:
> >>>
> >>> bool xhci_port_is_tunneled()
> >>>
> >>> becase if I understand correctly that's the only information we need e.g is
> >>> it going over tunnel or not.
> >>
> >> It was originally introduced as a tristate enum in:
> >>
> >> f46a6e165197 ("usb: Add tunnel_mode parameter to usb device structure")
> >>
> >> but the usefulness of USB_LINK_UNKNOWN is limited to a dev_dbg() print..
> >> I don't really have strong opinions either way
> >>
> > 
> > Tunnel detection can be tried other ways if state is USB_LINK_UNKNOWN.
> > 
> > For example usb-acpi.c will try to create a tunnel if all the ACPI entries exists
> > that indicate a tunnel, but the current xHC doesn't support tunnel detection.
> 
> Fair, I didn't consider that!

Yeah, I missed it too. Thanks Mathias for explaining.

