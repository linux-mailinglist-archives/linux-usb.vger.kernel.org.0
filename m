Return-Path: <linux-usb+bounces-143-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C57B67A1F48
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 14:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F9A52823C2
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 12:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B6C10948;
	Fri, 15 Sep 2023 12:53:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC6910945
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 12:53:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F8A8173A
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 05:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694782435; x=1726318435;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zj98OgDvFp1vyqEMLoWQz39z7Wl4r5dRfHX46VXmgxQ=;
  b=ZZLoAC9Yt+AwKz61vIodpHvM1sXdv6ivF7Ycvtr2PBL1O3rZmlgbW8ZM
   dj2X6XrVCKxfJrypxfTmIydDtddnIaslvnlffeMC3pH3o9rxlbc85zF+I
   1vl+EQTV4rrlgCWm8W32ewzqthk7Jb8/Kzq9Ze7M6RIfKrRiE6poXVPc6
   VSQiR6wVgz2M0uYADF2JTUuj2DJAIPrDHxYJh2+sDjQDAtB6qqyf0HfHN
   TSuIqjTDWtr7uwgzaR36FSOWM1CF4w+vOry6KxW1+8C+JKb8EmDnBzkWY
   kezN88Qx4hqWfMHbu/z/frArvi5AGPi/9i8+LsuvrbInMRCf3NXq0sZy3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364286897"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="364286897"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 05:53:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="738316378"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="738316378"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 15 Sep 2023 05:53:52 -0700
Message-ID: <88095d46-8522-1391-dccf-7de67c7bf777@linux.intel.com>
Date: Fri, 15 Sep 2023 15:55:14 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] Handle RPM for xhci-pci
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, mathias.nyman@intel.com
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
 linux-usb@vger.kernel.org
References: <20230821065742.2924681-1-Basavaraj.Natikar@amd.com>
 <00dff98e-a990-4b55-82d6-62d4b7866d71@amd.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <00dff98e-a990-4b55-82d6-62d4b7866d71@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 15.9.2023 7.38, Mario Limonciello wrote:
> On 8/21/2023 01:57, Basavaraj Natikar wrote:
>> This series includes fixes for PCI USB controllers that use RPM as their
>> default policy, including enabling RPM for controllers that support
>> low-power states.
>>
>> Basavaraj Natikar (2):
>>    xhci: Loosen RPM as default policy to cover xHC 1.1 as well
>>    xhci: Enable RPM on controllers that support low-power states
>>
>>   drivers/usb/host/xhci-pci.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
> 
> Hi Matthias,
> 
> Can you take a look at this series?  It's been on the list about a month.
> 
> Thanks,
> 

Yes, sorry about the delay

-Mathias

