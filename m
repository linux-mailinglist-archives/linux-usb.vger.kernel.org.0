Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50A6D74B1D6
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jul 2023 15:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbjGGNfP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jul 2023 09:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbjGGNfO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jul 2023 09:35:14 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70EC72105
        for <linux-usb@vger.kernel.org>; Fri,  7 Jul 2023 06:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688736913; x=1720272913;
  h=message-id:date:mime-version:to:from:subject:
   content-transfer-encoding;
  bh=N52buUcN34j1/ZLYDM0K26jSY7sswlSur9jwvPT2DWY=;
  b=MelRkzucqMCqH8+0wRT+iqKy1YUzEsntY7hAZtzIgjjDfyPp5qYjXoiW
   0LUg7qm+623/yE8aaIxMkGzKvPT2OcTpvbCQdoVW+dstszHpw5XvOWSW9
   CBwA0O/cOKliZUsIMXTq8s98Lw2AlitBNGoeRjt2ecrPE2nEo3zQ/gMPg
   J6g11Cck1k+GZXkxy3wlVJ4L6DDsIvqZckpRBdNQrEpoQIiqQbwMI6bDq
   i/Ojf3E4PZQNRu9qB2P5/avET1/paGjV9FRssHxRXJGP/sxh/Db9DdF3X
   eAH6Ac2denxIp9b+MrA+/PaKdx+IKJSxl6H4PgrYkkdK1hADYmbwpTOVS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="366471890"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="366471890"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 06:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="966657428"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="966657428"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga006.fm.intel.com with ESMTP; 07 Jul 2023 06:33:41 -0700
Message-ID: <64df77dc-2c66-4799-0679-b9d1ca9016c5@linux.intel.com>
Date:   Fri, 7 Jul 2023 16:35:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To:     USB <linux-usb@vger.kernel.org>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: xHCI maintenance on vacation rest of July
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

I'm out on vacation rest of July, putting xhci in vacation mode.
I'll be back in August collecting all missed xHCI patches.

Have a great summer.
-Mathias
