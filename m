Return-Path: <linux-usb+bounces-29688-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B4EC0CAD1
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 10:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0FDFC34C2A6
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 09:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F0B2F3611;
	Mon, 27 Oct 2025 09:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQVmtDQs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3452F2617
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 09:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557697; cv=none; b=rsKybVfNuf/xLvuV4h12AdT44HHV2rQHnKk935AEC0arG0cZSBNyfnZ8RTMGeAykTL9VRXt7qNWtU9pCj9C/+wZ2IXxRx+pv3AKY12Afka4tObfBt3hJI+a/I3/XuyFh+V0+sXZLGvOC5MZL4xvpWbwDVbxALsw/b3LZw06/F6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557697; c=relaxed/simple;
	bh=lrsxeoccJd7IibyXtdvu1wt/7FYcadJ/a8O8xF0P3jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RITUmli5X7POnDkHMsdTCN53LKtrNunJ9Jp9+xhttLQJtbXd5I3qGvT16a9fll6iuCoY4UIKI//k20+QqFatMCFFC/Kc9J94I7c5zSjiUjkMJoJyA7445rjjzvz7Dl+dxsfbSr+WIlhYz99JMdmx7r7aE4GKwREDXniOetdI1Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQVmtDQs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761557695; x=1793093695;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lrsxeoccJd7IibyXtdvu1wt/7FYcadJ/a8O8xF0P3jk=;
  b=aQVmtDQsozqGHmeSNL2F57H+pRMcMnF+XEDHlqa+jY8ZrIQS0rdiDAu9
   lMQ0oNlAMdoxXSXrCLHGDTdzmHgsEjJwf/Xsizua1x9EWO0L9rr4qVcsI
   Hkm0fhimsbhxFJpdZ15KAi7cHApZyjLtYRHA+tDjbuG9OdG3ILyLmReNk
   0ek5vyNW57S4P8fltPKNukHR01wusnxieL+cvCKBuYo33mfaKvmHYvjSt
   utQmX8o7kTMW5P/OzT8OdG5h9yL1II2oXGV9SUZrkzS1m2qMI1m5mBYb9
   Quopa+tV3ouUYBfvTookkMITls9exWlVVQw51m6NXxaUdAsViq6z38GJF
   A==;
X-CSE-ConnectionGUID: X/mEwvugRXm/Ykj7fTxUOA==
X-CSE-MsgGUID: bPUqf2wfSK6T0ipG0nhpPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63557734"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63557734"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 02:34:54 -0700
X-CSE-ConnectionGUID: GV+gOEIyTM2YKcTBbEx00Q==
X-CSE-MsgGUID: totoS2xRSbiawDmqMyspwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="208616166"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.18]) ([10.245.244.18])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 02:34:53 -0700
Message-ID: <65b65e02-e51e-4e7e-ae9e-78d755eb8566@linux.intel.com>
Date: Mon, 27 Oct 2025 11:34:51 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
To: Milan Oravec <migo.oravec@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
 <CAAcb1K_bezseTM8DrOrzVUi_W+nZoE2N0CO4k3AQWPw7=7pyjw@mail.gmail.com>
 <2025101544-galore-sculpture-b243@gregkh>
 <CAAcb1K85GK6m_bVUeSfX1GP4=mxzwfmHtaRX0EYD_jgGfQRk9Q@mail.gmail.com>
 <4e6d9b62-b9d0-4a05-99a9-143899547664@linux.intel.com>
 <CAAcb1K_a2dkj5wv__1BW-fu_Zg=z00OmQzJmekQ-GH4svYQ-GQ@mail.gmail.com>
 <f0d0f71c-bc47-4348-85a6-d728a67c982a@linux.intel.com>
 <CAAcb1K-o7DY3Kvqdr+=MN8OsgRZr+g43-zC6YSLG0hbNxEQUeg@mail.gmail.com>
 <8fe27842-8155-44db-b262-a148b5ce5436@linux.intel.com>
 <CAAcb1K9MDvqJgVbV29ax8tQhXoepJr5ABuh1NHoNpmFdnGxVHw@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CAAcb1K9MDvqJgVbV29ax8tQhXoepJr5ABuh1NHoNpmFdnGxVHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/25 21:48, Milan Oravec wrote:
> Thank you, should try this patch against stable 6.17.5 or 6.18 branch?
> It fails with 6.17.5
> 

It was on top of 6.18-rc1, but should apply fine on 6.17.5
Tried myself, saved the email as patch.eml and applied with patch:

mnyman@mnyman-desk:~/src/linux-stable$ git reset --hard v6.17.5
HEAD is now at 99efbd4259f3 Linux 6.17.5

mnyman@mnyman-desk:~/src/linux-stable$ patch -p1 < ~/src/usb/patch/early/patch.eml
(Stripping trailing CRs from patch; use --binary to disable.)
patching file drivers/usb/early/xhci-dbc.c
(Stripping trailing CRs from patch; use --binary to disable.)
patching file drivers/usb/early/xhci-dbc.h

git am also works as it should

mnyman@mnyman-desk:~/src/linux-stable$ git reset --hard v6.17.5
HEAD is now at 99efbd4259f3 Linux 6.17.5

mnyman@mnyman-desk:~/src/linux-stable$ git am ~/src/usb/patch/early/patch.eml
Applying: usb: early: xhci-dbc: Try smaller early_ioremap size if original size fails

mnyman@mnyman-desk:~/src/linux-stable$ git log --oneline
2ab737012cb8 (HEAD -> linux-6.17.y) usb: early: xhci-dbc: Try smaller early_ioremap size if original size fails
99efbd4259f3 (tag: v6.17.5, origin/linux-6.17.y) Linux 6.17.5
...

Maybe you still have some custom dbc hacks on top of 6.17.5 while patching?

Thanks
Mathias


