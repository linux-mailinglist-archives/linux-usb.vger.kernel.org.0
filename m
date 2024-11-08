Return-Path: <linux-usb+bounces-17364-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFE59C198C
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 10:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A281A28471D
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 09:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5C11E1A1F;
	Fri,  8 Nov 2024 09:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmONyJRX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA981CF291
	for <linux-usb@vger.kernel.org>; Fri,  8 Nov 2024 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731059645; cv=none; b=t5C3LhkvV/2zT26bcrO0KUrcFQO5sLluBeO5Ao3Cf6OF/4p17srqHewLoPaxjg3RMM3L8aF7+5YPwC7J+hmAuQJwXNhfgUWQm4icl6FzHiwsto2QDDbZ/Og/QDGo27tgf7rbiKTf6tXHPe6OTu10zWAdgztMfTcVyNWC0zp/laY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731059645; c=relaxed/simple;
	bh=5le75sCBQ9RAPu8rT/rVmRrx26fQeLRKhnEjPq3Os8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntHkQK9RtgVoKFMjp+zqYoouD84O5D/N/dadgWRR957yGeuKGDi3gezS31bqYKav+T5q8BUdsXrij0gDTtEeK1qOlEjUZQbExaf+pbmDdXl8Sk1vXxT3wRYRR8eOUdO3ed3SdZ5RycF7ZRg3nDW7p1/inDXnp0X8HizI1fWmUy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EmONyJRX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731059643; x=1762595643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5le75sCBQ9RAPu8rT/rVmRrx26fQeLRKhnEjPq3Os8Y=;
  b=EmONyJRXmbxRKEsQyXaS7E8Aug1RJSSQLfoahKixRuVE9w4n5BiaH6OZ
   dCsSlIQO6gcRazeO5jreY8cwt0GXEd+e+8K/oVXbpblXR1uYRAv8LCLrt
   vnQ0f+yGBzzHYlCKydpcAwFUK+YcMu7xPqX4ttpIzvu0y079QoBDlqSCf
   DG7NsmrvkcKWwG6SnfGLO76zydX+HC7GVKfaqc8sFkX+ysdY6PFRMZN9D
   Zdk/oYlpUuQE4mGCpYiRd69q80Pje7scfjk+mtFUu2JqGwkge7SARTvSF
   WaIFhAGR0YifB3Nw/DlyPxV+uAqo6xLSloK6bHcxXpzws6cnPbpqFKSiH
   g==;
X-CSE-ConnectionGUID: A4PslWKnTZyvFJOl3n4gcA==
X-CSE-MsgGUID: tKOUYYwoQ7KpJOXSeQKGPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="33796048"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="33796048"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 01:54:03 -0800
X-CSE-ConnectionGUID: j++IFxZeSouMS5R+WAjnvQ==
X-CSE-MsgGUID: vXuENkDZT6SYjgCoY+oTRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85472750"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa010.jf.intel.com with SMTP; 08 Nov 2024 01:54:01 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 08 Nov 2024 11:53:59 +0200
Date: Fri, 8 Nov 2024 11:53:59 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "nicolas.oury@gmail.com" <nicolas.oury@gmail.com>
Cc: Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org
Subject: Re: GET_CABLE_PROPERTY issue
Message-ID: <Zy3ftxwWqpFLIlGD@kuha.fi.intel.com>
References: <CAMuksQ8wsZA7tan0CJOfQhOyuJSn+DedWF3Sq5o9zJpbOOHJgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuksQ8wsZA7tan0CJOfQhOyuJSn+DedWF3Sq5o9zJpbOOHJgQ@mail.gmail.com>

Hi Nicolas,

Let's have the discussion on the mailing list.

On Fri, Nov 08, 2024 at 08:35:06AM +0000, nicolas.oury@gmail.com wrote:
> Hello,
> 
> I am sorry to disturb you but I am not sure what is the proper way to
> report this.
> Please let me know what would be a better channel to report this issue.
> 
> I am on a Framework 16 AMD and have this message on boot:
> 
> [    1.705612] ucsi_acpi USBC000:00: unknown error 0
> [    1.707485] ucsi_acpi USBC000:00: GET_CABLE_PROPERTY failed (-5)
> [    2.869536] ucsi_acpi USBC000:00: unknown error 256
> [    2.870668] ucsi_acpi USBC000:00: GET_CABLE_PROPERTY failed (-5)
> 
> It seems to be fairly frequent:
> https://community.frame.work/t/usb-c-error-on-boot/52012
> 
> I digged a bit, and it seems to have started with :
> https://lore.kernel.org/all/20240305025804.1290919-3-jthies@google.com/
> 
> Looking at the USCI specification, it seems that 0 and 256 are telling
> that this does not support the GET_CABLE_PROPERTY. This seems weird as
> your patch asks whether it supports this call before doing it.

+James

> The framework have many converters from usb C to usb A for modularity
> and I could try removing some of them to check which trigger this, it
> you find it helpful.
> 
> I am also very happy to help in any way.

You need to report this to AMD. The driver has to be able to rely on
what the interface is telling it. In this case the interface is
claiming that the Cable Details feature is supported, even though it
clearly is not.

Br,

-- 
heikki

