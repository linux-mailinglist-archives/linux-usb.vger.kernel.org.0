Return-Path: <linux-usb+bounces-36967-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FhYOJHx+WmcFQMAu9opvQ
	(envelope-from <linux-usb+bounces-36967-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 15:33:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A74CE910
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 15:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96D39303671F
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 13:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BA147D95E;
	Tue,  5 May 2026 13:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3rLdTp7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D46247886A;
	Tue,  5 May 2026 13:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987981; cv=none; b=HaAR2Gv3V1xoBWmT92eUcan4CqxeWaUdTWiOoeh3L0gbQ6s2QOSCmPP4lA4J2Um3uE5RXUcghsvjv8+RqPawdGJu2mVkYMnfxghOeZ10+Uxe53G9S5HVFDExNlGFhEaFXbo15O8UKKVGVxPuhpI7aMeJsfVfp9B/BZcqQA9+zo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987981; c=relaxed/simple;
	bh=EQm/BkygmjaS40YCAwAzhAI7bhhEsKn7rOKOdXHNW8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lS5E0LiYlgE80pQm6kA6OlPSVO12fjJ7m/yrPO2KwnmaWab/v//Pm2KMDWQaZC96qhuFzxyw6CL09f5nrwIvbe7Ctnfy44tNofHf6cktSywTiMOFd+kg06l84r17wvm/jtuae/MMtwyP4DS2oeZFeFo7dREknYzMblpDpBvIywA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3rLdTp7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777987980; x=1809523980;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EQm/BkygmjaS40YCAwAzhAI7bhhEsKn7rOKOdXHNW8c=;
  b=O3rLdTp7yVQDEouEzcydQ6GHrS4+xYABOup6Xhb7VsHNmYUJsG/o+LhZ
   ASKUZaKs3fP9zW6GuDE3XTjNeqp0rmes30gcuxxfVD8IY5ARLJMa1l5JI
   YktR55Qr2zT9MsOdyhSrxZAdxZuXQCVlgJxi+/cwzUotfQO9sfpchqF48
   nP/FTBBNLJ87qVg/cGicJ6Yni4FKjv/n83Xr9TJZw50Hv2p1Ndg/2wuxE
   ksorQOdmugvOwKLtgiw8kcfuaBpqdJf8jmUUo+RexqJ/MVJdsDqiViTpP
   PmFMXxsPjeX3C4pjfWvDAfo5ckB1prURwogw/Sd4BAIGkwW1UFdCv49rK
   Q==;
X-CSE-ConnectionGUID: SJyb7RpzT+GEZGO3oURdYQ==
X-CSE-MsgGUID: 1MpYQqTzSnaAOFX3UCGYwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="77879989"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="77879989"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 06:32:59 -0700
X-CSE-ConnectionGUID: xzZ8d71KR72aXTg4tUw4og==
X-CSE-MsgGUID: 4zS5zGTjR6id8gJfg2CBig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="229331899"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.244.68]) ([10.245.244.68])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 06:32:56 -0700
Message-ID: <50ce5341-bf93-474b-acd8-c25dc3e42f87@linux.intel.com>
Date: Tue, 5 May 2026 16:32:54 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: xhci: fix isoc silent reschedule creating stream
 gap on CFC controllers
To: Nicola Lunghi <nick83ola@gmail.com>, mathias.nyman@intel.com,
 michal.pecio@gmail.com, niklas.neronin@linux.intel.com,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260504233143.10242-2-nick83ola@gmail.com>
 <20260504233143.10242-3-nick83ola@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260504233143.10242-3-nick83ola@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 617A74CE910
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linux.intel.com,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-36967-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,linux.intel.com:mid]

On 5/5/26 02:31, Nicola Lunghi wrote:
> xhci_get_isoc_frame_id() silently rescheduled the first TRB to
> start_frame_id+1 when the requested start frame was out of the valid
> scheduling window or landed exactly on its boundary. This creates an
> explicit one-frame hole in the isochronous stream.

Agreed, setting start_frame to start_frame_id + 1 would only make
sense for the very first URB, otherwise we create glitches.

Looks like the whole start_frame_id calculation is incorrect.

xhci specification 4.11.2.5 'Start Frame ID' formula sums together several
values in frame units, while driver currently sums values in microframes, and
then turns it into frames.

xhci 4.11.2.5
"Software should not schedule an Isoch TD with a Frame ID value that is less than
  the Start Frame ID, where:

  Start Frame ID = (Frame Index of the current MFINDEX register value + IST + 1) MOD 2048
  where IST shall be rounded up to the nearest frame boundary if it is defined in
  microframes"

Looks like we don't consider the ESIT rules for frame id either (xhci 4.11.2.5.1).
frame ID must be aligned with starting frames of an ESIT, so if ESIT is 2ms then
allowed frame ID values are 0,2,4,6... not 1,3,5..

Thanks
Mathias


