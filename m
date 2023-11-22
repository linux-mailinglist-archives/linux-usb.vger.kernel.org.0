Return-Path: <linux-usb+bounces-3206-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 404D77F4FA7
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 19:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 707891C20AA3
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 18:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694E75ABB7;
	Wed, 22 Nov 2023 18:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpkuOZ0u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E61D7D;
	Wed, 22 Nov 2023 10:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700678055; x=1732214055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y1RQ+f1Q5efZzIZfRLadFxuw8IiQKXJxuGko9Zmlt9s=;
  b=VpkuOZ0ul6O19xFzfCE0Rn+dWZAUA7bjbjYbTWxBrT+7MnRZ0ZiM/TBG
   5/ks7tfvOUEp4mQaqM3he1/7VOiF6SsOloTsQrgkL/mDjcO/4Y+bn6x5r
   59YyRycVX6ghsSKgXkQQwRYbvQB/Ok/gHT9MhSNt1jRmmOx0EUAMB+02V
   VQL61i+7quuo1b5SjzqK83ljiXrTZUvtv6BMzkO7de7Cu4uxwdMGI88oM
   S9kEg78mrNT0Oj2KZoPeE835ZlXMV/qgBehL2PVXB+3eFupTddXr4Yxas
   HxqMG2MX7fU42jvS0HYC3QxQyQwHgo7yMPqJzS2IkTOVFKKxVNojuUcqL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13672024"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="13672024"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa101.fm.intel.com with ESMTP; 22 Nov 2023 10:33:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="743344455"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="743344455"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 02:51:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r5kmC-0000000G49b-3FaF;
	Wed, 22 Nov 2023 12:48:12 +0200
Date: Wed, 22 Nov 2023 12:48:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kunwu Chan <chentao@kylinos.cn>
Cc: gregkh@linuxfoundation.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kunwu.chan@hotmail.com, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: aspeed: Check return value of kasprintf in
 ast_vhub_alloc_epn
Message-ID: <ZV3cbH-i09AQelaB@smile.fi.intel.com>
References: <20231122014212.304254-1-chentao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122014212.304254-1-chentao@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 22, 2023 at 09:42:12AM +0800, Kunwu Chan wrote:
> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.

OK.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



