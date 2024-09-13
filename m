Return-Path: <linux-usb+bounces-15087-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9E6977BA2
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 10:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CFF12861A4
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 08:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E581B1507;
	Fri, 13 Sep 2024 08:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAZOBPrR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84E21D6C7D
	for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 08:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726217568; cv=none; b=rS0QHO9A91Weq8/foTiKAhWgevy/1FjmbXexrXgWelCyCWTaxcTv/JUDbyLbOOLe2rBbtkOUqPf8omQK8PzlmdvZroin+bNA331eXe73pLlYH0y52gN0ViwASY7FtK//f4BRQg0h0KmwFhXfd1o30uqETkoU3IfQ9QFJ6jCj5Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726217568; c=relaxed/simple;
	bh=epwSFAKDSaStUHIjblgAOMkjDpYmFrV7d1+0vVVYD5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIL1DYTYUsoP7dLaMMveUsunHDgYbAjmBybdp0WJYC/t+bqy3j22k6Yy211mmiXv+daGdpPc4c3kZFgH2mYgUN7q18ve31q28F3pqRqA2/LsMSqxt+zdSu0tshSbSUOCXYVu9SCrTpxgKaw6yOgF49CfUzy5alpQ1YAudaw/9ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAZOBPrR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726217567; x=1757753567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=epwSFAKDSaStUHIjblgAOMkjDpYmFrV7d1+0vVVYD5I=;
  b=mAZOBPrRbE4uxHj1GnbnM66KvxbSRZQYSV9AA5xM2573Puw5CtgVVD1Q
   /X50MKu3MGKZAq3ntNMU7dOu3LmBlFVZnyiKsR+To+ldlsTZ3rjynpYfx
   MglVwEwRwzXhKk+kZTknRZ44onA1A8vengiUHpx77chvmZU6DITlPYa3A
   Cg/JQ/h3NtVyVa/2OlSwpu7utAS2X4mNYuEY04wRCsdGUdd+wM2JIJhKW
   pF4bncsx0Xw+3aTNbPRDd/pcA97Xuh37P94inMfOOjJhFcSGOo2+uS9QE
   b1CDK+JSLVWIjVk9KHlVxvSw1+FgTXvcZCC3YioNk2ann+QSf+GhEqD8k
   w==;
X-CSE-ConnectionGUID: aExP6/YBQN2RRkxQNvsPcg==
X-CSE-MsgGUID: KxSDo6hNSiKq2YOvqGWj1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25263081"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25263081"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 01:52:46 -0700
X-CSE-ConnectionGUID: sOgoTaJnTZSYEMjsyelMqg==
X-CSE-MsgGUID: bHgAgPzrTPOYihILYLoZrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="68073184"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Sep 2024 01:52:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp22j-0006G4-29;
	Fri, 13 Sep 2024 08:52:41 +0000
Date: Fri, 13 Sep 2024 16:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Yang <xu.yang_2@nxp.com>, peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 2/3] usb: chipidea: udc: improve dTD link logic
Message-ID: <202409131638.TJCPmqQZ-lkp@intel.com>
References: <20240912033551.910337-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912033551.910337-2-xu.yang_2@nxp.com>

Hi Xu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.11-rc7 next-20240912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/usb-chipidea-udc-improve-dTD-link-logic/20240912-113632
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240912033551.910337-2-xu.yang_2%40nxp.com
patch subject: [PATCH 2/3] usb: chipidea: udc: improve dTD link logic
config: i386-randconfig-061-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131638.TJCPmqQZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131638.TJCPmqQZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131638.TJCPmqQZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/chipidea/udc.c:624:33: sparse: sparse: restricted __le32 degrades to integer

vim +624 drivers/usb/chipidea/udc.c

   542	
   543	/**
   544	 * _hardware_enqueue: configures a request at hardware level
   545	 * @hwep:   endpoint
   546	 * @hwreq:  request
   547	 *
   548	 * This function returns an error code
   549	 */
   550	static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
   551	{
   552		struct ci_hdrc *ci = hwep->ci;
   553		int ret = 0;
   554		struct td_node *firstnode, *lastnode;
   555	
   556		/* don't queue twice */
   557		if (hwreq->req.status == -EALREADY)
   558			return -EALREADY;
   559	
   560		hwreq->req.status = -EALREADY;
   561	
   562		ret = usb_gadget_map_request_by_dev(ci->dev->parent,
   563						    &hwreq->req, hwep->dir);
   564		if (ret)
   565			return ret;
   566	
   567		if (hwreq->req.num_mapped_sgs)
   568			ret = prepare_td_for_sg(hwep, hwreq);
   569		else
   570			ret = prepare_td_for_non_sg(hwep, hwreq);
   571	
   572		if (ret)
   573			return ret;
   574	
   575		lastnode = list_entry(hwreq->tds.prev,
   576			struct td_node, td);
   577	
   578		lastnode->ptr->next = cpu_to_le32(TD_TERMINATE);
   579		if (!hwreq->req.no_interrupt)
   580			lastnode->ptr->token |= cpu_to_le32(TD_IOC);
   581	
   582		list_for_each_entry_safe(firstnode, lastnode, &hwreq->tds, td)
   583			trace_ci_prepare_td(hwep, hwreq, firstnode);
   584	
   585		firstnode = list_first_entry(&hwreq->tds, struct td_node, td);
   586	
   587		wmb();
   588	
   589		hwreq->req.actual = 0;
   590		if (!list_empty(&hwep->qh.queue)) {
   591			struct ci_hw_req *hwreqprev;
   592			int n = hw_ep_bit(hwep->num, hwep->dir);
   593			int tmp_stat;
   594			struct td_node *prevlastnode;
   595			u32 next = firstnode->dma & TD_ADDR_MASK;
   596	
   597			hwreqprev = list_entry(hwep->qh.queue.prev,
   598					struct ci_hw_req, queue);
   599			prevlastnode = list_entry(hwreqprev->tds.prev,
   600					struct td_node, td);
   601	
   602			prevlastnode->ptr->next = cpu_to_le32(next);
   603			wmb();
   604	
   605			if (ci->rev == CI_REVISION_22) {
   606				if (!hw_read(ci, OP_ENDPTSTAT, BIT(n)))
   607					reprime_dtd(ci, hwep, prevlastnode);
   608			}
   609	
   610			if (hw_read(ci, OP_ENDPTPRIME, BIT(n)))
   611				goto done;
   612			do {
   613				hw_write(ci, OP_USBCMD, USBCMD_ATDTW, USBCMD_ATDTW);
   614				tmp_stat = hw_read(ci, OP_ENDPTSTAT, BIT(n));
   615			} while (!hw_read(ci, OP_USBCMD, USBCMD_ATDTW) && tmp_stat);
   616			hw_write(ci, OP_USBCMD, USBCMD_ATDTW, 0);
   617			if (tmp_stat)
   618				goto done;
   619	
   620			/* In case of error, ENDPTSTAT will also turn into 0, then
   621			 * don't push this dTD to dQH head if current dTD pointer
   622			 * is not the last dTD in previous request.
   623			 */
 > 624			if (hwep->qh.ptr->curr != prevlastnode->dma)
   625				goto done;
   626		}
   627	
   628		/*  QH configuration */
   629		hwep->qh.ptr->td.next = cpu_to_le32(firstnode->dma);
   630		hwep->qh.ptr->td.token &=
   631			cpu_to_le32(~(TD_STATUS_HALTED|TD_STATUS_ACTIVE));
   632	
   633		if (hwep->type == USB_ENDPOINT_XFER_ISOC && hwep->dir == RX) {
   634			u32 mul = hwreq->req.length / hwep->ep.maxpacket;
   635	
   636			if (hwreq->req.length == 0
   637					|| hwreq->req.length % hwep->ep.maxpacket)
   638				mul++;
   639			hwep->qh.ptr->cap |= cpu_to_le32(mul << __ffs(QH_MULT));
   640		}
   641	
   642		ret = hw_ep_prime(ci, hwep->num, hwep->dir,
   643				   hwep->type == USB_ENDPOINT_XFER_CONTROL);
   644	done:
   645		return ret;
   646	}
   647	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

