Return-Path: <linux-usb+bounces-367-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9897A5BF0
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 10:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27EF0281D31
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 08:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB0838DF4;
	Tue, 19 Sep 2023 08:06:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BC938BD3
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 08:06:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68401102
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 01:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695110814; x=1726646814;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=XNhqh4Yg4pHmfWSe0+E3lEed9pnv+zo+7BzL+aePhwk=;
  b=L+sZPt9pkZOixO8baPDTk2RO2rZKsw3jSqTPYiwUC4pkFiZwznjvOpW7
   DbgGXXYPI6hzy4uFRv6gHgIoQYqZ76zZ29tYPgZdCVnWDZY3oC5b2/y48
   d8hTexq/Eo05gwN790TAExy6iNJy2BrP+Rsd2HbTZ711qyOL6dP1ZfnBr
   lXyMWy7RBaOXxIviU7PRsVNfPTQteomuF85FnpoVuyJT8Gx2FEp2L8Rf/
   mX4cOKkyeg3ddqFQj0nHCgB3JpCi3iJj1zFTCrf8S722zzlAst1R0ErhI
   dBGw/RHIB/TEGhUimCiDCoTli9NxCzw7uBQ1OL883iI6gBlINRrjcoY+U
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="379784078"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="379784078"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 01:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775452283"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="775452283"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga008.jf.intel.com with ESMTP; 19 Sep 2023 01:06:44 -0700
Message-ID: <eec7a2dd-6c6b-5d00-55c1-527645404675@linux.intel.com>
Date: Tue, 19 Sep 2023 11:08:06 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/2] Handle RPM for xhci-pci
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
 mario.limonciello@amd.com, linux-usb@vger.kernel.org
References: <20230915141530.1974640-1-Basavaraj.Natikar@amd.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20230915141530.1974640-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 15.9.2023 17.15, Basavaraj Natikar wrote:
> This series includes fixes for PCI AMD USB controllers that use RPM as
> their default policy, including enabling RPM for controllers that support
> low-power states.
> 
> v1->v2:
> *Enable RPM also for all AMD xHC 1.1
> 
> Basavaraj Natikar (2):
>    xhci: Loosen RPM as default policy to cover for AMD xHC 1.1
>    xhci: Enable RPM on controllers that support low-power states
> 
>   drivers/usb/host/xhci-pci.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 

Thanks, added to queue

-Mathias

