Return-Path: <linux-usb+bounces-38242-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLaLG7lpHWpeaQkAu9opvQ
	(envelope-from <linux-usb+bounces-38242-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 13:15:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AED2A61E2BD
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 13:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F46B3009024
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 11:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6EF3346A0;
	Mon,  1 Jun 2026 11:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1l0GAtP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6555939EF32;
	Mon,  1 Jun 2026 11:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312477; cv=none; b=Y0hEN2j6UxSzEIgrt4YytnoVc9cPVbSenpM67SBgREPfO4CaSJLmqsVWNPlqfzvbJ4pC3l+/j5Rs05mWwhS6L2re53Vst4pVrBVNy93Km4tG9QtUqrqgJf4OKIMxGW/qwf5f+b1x9aYUf6dqT53wKthiN5LfViYZhu7GMIUc6yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312477; c=relaxed/simple;
	bh=o2meyItWUK0h6uJ/o2fD/NrJWg25MD3pBd+TRJbTMJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oi0IyOsf8QW/GcUTlopm5Hv4oXZQNqHXg4DI7umBsP4R+jUzlpViccishNZXbvHr4MNkpzmiFgtxW4VCpVLsgm8gIRyWRFdBMut3gOL0I7SbaeG3+MsCS1Pu4dej7+dfDDNC7v+7IlI4BTM2JIDjAmuERAOFOSoDl4mc95JfI9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1l0GAtP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780312475; x=1811848475;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o2meyItWUK0h6uJ/o2fD/NrJWg25MD3pBd+TRJbTMJc=;
  b=U1l0GAtPsQMFfxHfSmE0nsm4MiGYkNx0KINdCtnXreauu+dWki3MFYiZ
   GLNpxK0GnnHVzFQFNzu5f7ibXLdcO60mEEMHxB6HwGV48qaDDkOWiyBUi
   S5T7xiM2m4W4mZjUzziT/qN55xcd45h37xgnjf2rm+/ohI7yg1SMZ0E5W
   vfzPH7Acy9bsyjllxWZulO5ZmSNDsFexUIH0/LierRnjPOd78Csp+w4dj
   E0f3Yxk/xE4w6uOLAbTNeUsoZcuWJ4kN5xuOUC9HjSYSpJ1daNSEyCIP9
   6mL8QuRPq8Zcyen1gT5KwGWttJRH1/vXxBFCydCxKTUf8rFcAMpClq17s
   w==;
X-CSE-ConnectionGUID: fdN/xAJATMixu/mD0Iy4QQ==
X-CSE-MsgGUID: D593cRbaRouFEeFGUfOJQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="92542729"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="92542729"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 04:14:34 -0700
X-CSE-ConnectionGUID: /kLwE/MURXKRLdqOSxLhcA==
X-CSE-MsgGUID: Jaiq/MrVSeOZc+CcIhJGtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243644937"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.110]) ([10.245.245.110])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 04:14:33 -0700
Message-ID: <7e1cc96e-1ea3-4cb9-92f3-89fdd0a2a11c@linux.intel.com>
Date: Mon, 1 Jun 2026 14:14:31 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Improve Soft Retries after short transfers
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529112007.38091066.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260529112007.38091066.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38242-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AED2A61E2BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/29/26 12:20, Michal Pecio wrote:
> A short transfer is a successful one, so reset the error count.
> Otherwise, endpoints which always complete short are limited to
> three retries per endpoint life rather than per URB.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Added, Thanks

-Mathias



