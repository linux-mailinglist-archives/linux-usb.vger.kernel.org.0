Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E65D4AF1E0
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 13:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbiBIMiZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 07:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232446AbiBIMiY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 07:38:24 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D106C05CB96
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 04:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644410307; x=1675946307;
  h=to:references:from:subject:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=xy27WOB4ZHmdoSqsfu8si3KyRebZXX9YyeVgnrhV4Os=;
  b=EXb6Keo3LRuJLn1WJdSFDEfw5QELygysZPU7oK8zuLZTrCJx6FiPcJD/
   RIjnquQ5lsW73j6DVBs/j7VZI3b6f1FflwSgg9MBXwB9i8v/aXcNDgeNF
   oztKoHYaTzyMWRswF29GAOsEdn7Vop8/DMC0SIklzbEgAEtVeqlP+mnEQ
   y9PoP9F5ZUTeZGQM/7O4CQbeD2FfFRAoLI2vs65zUfGZ6sKeLbIEqiN1z
   HSW9WE/xtoP3YhpK/bLUBCWPUe4gzQu4smMLMEM6KVi4xOaXs/rybK0y8
   q/1LA30Z8pMT4nwxIaDF2F8tKRTGA9mCD60UhxDY2d2hjByX9q43Yosym
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="273729676"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; 
   d="scan'208";a="273729676"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 04:38:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; 
   d="scan'208";a="568223327"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 09 Feb 2022 04:38:25 -0800
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <4faac4cb-7940-9133-6255-ff9df13bf87d@omp.ru>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2] usb: host: xhci: drop redundant checks
Message-ID: <31067327-08fd-1de6-c011-9e17aec40fa8@linux.intel.com>
Date:   Wed, 9 Feb 2022 14:40:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4faac4cb-7940-9133-6255-ff9df13bf87d@omp.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8.2.2022 21.39, Sergey Shtylyov wrote:
> In xhci_endpoint_{disable|reset}() the expression '&vdev->eps[ep_index]'
> just cannot be NULL, so the checks have no sense at all...
> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

True, adding this

Thanks
-Mathias
