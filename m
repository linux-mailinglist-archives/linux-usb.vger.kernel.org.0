Return-Path: <linux-usb+bounces-32802-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPcAKMWueGlasAEAu9opvQ
	(envelope-from <linux-usb+bounces-32802-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 13:25:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C052B944EE
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 13:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 292C93002F65
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 12:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15810337690;
	Tue, 27 Jan 2026 12:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/afb6TB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD3A3491C4;
	Tue, 27 Jan 2026 12:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516726; cv=none; b=rJKqPCBcshlVw0pAv0N99tB8VrHTu4YaHirKCAPJjPBZREc7r1+qC0FgtZKSfiG/nUuo99kRWA5tEqYePduquoQ+ul0kMYE3aLUvxPFEFXarWOm8Akeu1IppS1gB4VoCjXy7+2+wHgvm3SRhMtvW6siSbN+ydvp2oCzhV/eKUjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516726; c=relaxed/simple;
	bh=BGTxr9QRFb3KoxjxURMcaG6WXulSB8kcnMSkt971eIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MkS4yuYQjo70QhywpmGIpQUV2Em049Shor3B6V7mMBmT+SpT/tF8boGkfrKoosPvYJYq0nyB4vnvJS4g+cPrAdRju4ol+M24Num0HS5BxJCYB2uXCIng61ttTtWgmEtrwsM1Fk/aqbLfSq0eeikixJ2ikMPGrhzmOOEqQ/SQcbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/afb6TB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769516726; x=1801052726;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BGTxr9QRFb3KoxjxURMcaG6WXulSB8kcnMSkt971eIo=;
  b=S/afb6TBxh5OM6jQRefN2IKWJffgehj9ZAAjKw4jMd12lKg+MUTWs+10
   eqy37MNnv9zeg7lAxmwEGCKq74JxC/OeFocLW5/PnbUFwQaa8l2dfHgNn
   KBAKhoFGIAMxXzMyo3h1LXgetpt22Ci7t++znIiaBcZqe0jkjsxWPxbwW
   xD59cu/bYZV1bbo3jUrh3Nb+YfbOgamXAiljQxZjYYqjN88+xCsxFyI9F
   MC0S299NAMgFjAB3Dbpt8ovb9x6qgB0RM6Iwr/JTH+jkAT3fX4DjiF5I7
   Wtg6uiVPsyxLwmQGCeGqoGuAl0E7qdGeNcEQjWq5PfAPecAzQ1OFz3kOn
   Q==;
X-CSE-ConnectionGUID: Pj5jQc7rRh6G6JIal27R3w==
X-CSE-MsgGUID: 1V3Mr+dYS3y2EuqaeDAqsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70752503"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70752503"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 04:25:25 -0800
X-CSE-ConnectionGUID: h8Ewd//qQTO14YsoBH9uwg==
X-CSE-MsgGUID: m/VtitNNSL+xWyvLmmgCcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207752989"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.40]) ([10.245.244.40])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 04:25:23 -0800
Message-ID: <fbc1efce-8108-4e36-ad12-983be16c835e@linux.intel.com>
Date: Tue, 27 Jan 2026 14:25:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
To: jiangdayu <jiangdayu@xiaomi.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Longfang Liu <liulongfang@huawei.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, yudongbin <yudongbin@xiaomi.com>,
 guhuinan <guhuinan@xiaomi.com>, chenyu45 <chenyu45@xiaomi.com>,
 mahongwei3 <mahongwei3@xiaomi.com>
References: <20260127110422.306711-1-jiangdayu@xiaomi.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260127110422.306711-1-jiangdayu@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32802-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: C052B944EE
X-Rspamd-Action: no action

Hi

On 1/27/26 13:04, jiangdayu wrote:
> When the xHCI controller reports a Host Controller Error (HCE) status
> in the interrupt handler, the driver currently only logs a warning and
> continues execution. However, a Host Controller Error indicates a
> critical hardware failure that requires the controller to be halted.
> 

The host should cease all activity when it sets the HCE bit.

See xHCI spec 4.24.1 'Internal Errors':
"When the HCE flag is set to ‘1’ the xHC shall cease all activity.
  Software response to the assertion of HCE is to reset the
  xHC (HCRST = ‘1’) and reinitialize it."

Same is true for "Host system error" HSE (STS_FATAL), not sure
why we halt it manually in that case.

> Add xhci_halt(xhci) call after the HCE warning to properly halt the
> controller when this error condition is detected. This ensures the
> controller is in a consistent state and prevents further operations
> on a failed hardware. Additionally, if there are still unhandled
> interrupts at this point, it may cause interrupt storm.

Is this something that has been seen on real word hardware?
If yes, and halting the host helped ,then this fix is ok by me.
At least until a proper host reset solution is implemented.

Thanks
Mathias


