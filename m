Return-Path: <linux-usb+bounces-25315-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA80AEE227
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 17:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0C2D17830B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 15:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D454D28C5D9;
	Mon, 30 Jun 2025 15:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFNU55cd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29F372633
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751296583; cv=none; b=Ctj73MkyYYS4y6Yu70RAb95RCVPNccgOZq97itDu034MIgwPAOBTE6kOvlOpvd8zNBO8ISuc8aq9UmG/qniLK62faW+wKnU0kDBVUbOriNY4blD7Z5t2LXs3UwzKUHQuCvWFmPsNCxok/sGx7R7aCiTZ9Pcn9ZxQW+fXBODv3g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751296583; c=relaxed/simple;
	bh=sFWrpJRRh3FiL6SVphpdJYY9RGCzJvoO1Ou9RVwggLw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=FMbv/x17kOnODLCRTkrT5qhcidoFWgLvVruRJbcTS+lrIBcDnU2Bpku+6usDttYX6qyGTCZYfgNcnefhqoSu5zZ1R4PZpisuqCJyn3yOjpjPkpUwjdfed9BE6yeibJqdavADYz8MkrCKW/BNDqQ5x4P0If5WmyRguD2xkucD/78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFNU55cd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751296582; x=1782832582;
  h=message-id:date:mime-version:to:cc:from:subject:
   content-transfer-encoding;
  bh=sFWrpJRRh3FiL6SVphpdJYY9RGCzJvoO1Ou9RVwggLw=;
  b=WFNU55cdISl8qhP5kDBTdUAsULI5NXPtFiSju2DZCAUnNPJfhv+VgcwO
   SDDxZFMfYv6nzKEp6vFs+YtKt4CXbtA94SxDgDbKGQUePK1P+AnyQT+Xn
   eC0TRjz1Obt1+S7Xm74GR6TkT+wSx55YxdQIi2dgDEtOxnZBORy4cOrP3
   vR8mx/iLLJagUvRlFH/Z4PKlWtLBhV5MWrW6zg99Bo0kqAVX7L9JkdEl0
   eAzwsZ2aUKB/MVtRrxzkd34yZBdYUhFK3kgi7J7kFKTS7bL1NPYxRJuka
   tZsAeW44GEcMrxTM5SJI+6pXENyhjJbznARY7Y5WLAPdqln6OP3kSLXyy
   g==;
X-CSE-ConnectionGUID: UiH9vzlHTCSfaDvFP7iyFg==
X-CSE-MsgGUID: 74FOQFpXTOCzotzkeNhH+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64125298"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="64125298"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 08:16:20 -0700
X-CSE-ConnectionGUID: dg1H8vU/QUqlvh8kk2/jyw==
X-CSE-MsgGUID: lUTqvQn4R8OR5jwreTjisg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="177152305"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 30 Jun 2025 08:16:19 -0700
Message-ID: <2a4a2761-734e-42b6-96df-2cf1d1b6de17@linux.intel.com>
Date: Mon, 30 Jun 2025 18:16:17 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: USB <linux-usb@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: xHCI USB3 host maintenance on vacation until July 22
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi


I will be on vacation starting today, back July 22.

Niklas promised to keep an eye on xHCI in case of emergency, and
I will track a few select hub related patches for regression.
Otherwise there won't be much xHCI maintenance activity during this time.
   
Have a nice summer
-Mathias

