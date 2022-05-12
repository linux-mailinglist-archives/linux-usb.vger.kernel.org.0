Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEE615245BE
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 08:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350337AbiELG1g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 May 2022 02:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350334AbiELG12 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 May 2022 02:27:28 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDDC5EBE4
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 23:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652336827; x=1683872827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d+kclMhgHvlLhi3EthWInqpndqvLALipWSfXYj/Q96c=;
  b=STGQu9VTYCdI9E+bdSgjGlS7Pa5OzaNBZL1J82VwOFJ271Dhpd95xYMw
   cNbEWj6pDqs/Yn0obZnqshJl6gKkUxQ9AZcoNigDvkbxYfVgvoU9JnAEG
   fZl4fIG1jS2dJCrVDfFTP2ymRFq8v7XvjxjYSexAbgWU1hOeXp5uktRrI
   mbeVJzFUQiePGVjFK77KC6eNlO2FlB5dsMDEKuu+lG6xK/4nHmw0/uJ5t
   3FDP7ynUp6HIWFpRGOazKnYT0JZvFkM+2btfL5BHtj4rwpTwDMVJO9oBB
   P+y5IPfes9RyrIp6QmR0/8Yron/mKwoQQCPYaJD15C3DDFd4yQHVY+/y5
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="249801891"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="249801891"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 23:27:06 -0700
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="739547610"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 23:27:03 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 12 May 2022 09:27:00 +0300
Date:   Thu, 12 May 2022 09:27:00 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH 0/2] thunderbolt: Fix buffers allocation for device
 without DisplayPort adaptors
Message-ID: <YnyotOcIF8tkH9M8@lahna>
References: <20220509204904.8936-1-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509204904.8936-1-gil.fine@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Gil,

On Mon, May 09, 2022 at 11:49:02PM +0300, Gil Fine wrote:
> For the case of device without DP adaptors, we calculate incorrectly the
> buffers allocation. Here we fix the calculation for this case.
> In addition, we add a KUnit test for this case.
> 
> Gil Fine (2):
>   thunderbolt: Fix buffers allocation for device without DisplayPort
>     adaptors
>   thunderbolt: Add KUnit test for buffer allocation for device without
>     DisplayPort adaptors

Both applied to thunderbolt.git/next, thanks!
