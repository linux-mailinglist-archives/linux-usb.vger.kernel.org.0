Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65F104BB7DF
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 12:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbiBRLOA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 06:14:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbiBRLN7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 06:13:59 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E0A23BF35
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 03:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645182822; x=1676718822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K3r/8Qmjtox1KoZ5zPzFl0Mdj2eJMVuKIhUpINrUIo4=;
  b=h4ueFel4xhXIyTLAOkgxN9RlGpQvj8lry5R4TeJxaVhArNUn68/EVP5f
   JnRVWPRtN4qHgFIxirXookqDUzDo50rQbGktFrVNPXMJ1OTCHsa5gArIg
   1EFY+7MRBI2oV+3VE3m2qv29B6yC5LxifBLYGR7C0J0cG6mEeKPBabJ1p
   xJaxaIdyTBhfJ7N3KiNXRV6sRR7aBmww1Vl66kRU/nrZvUf/IaZwDAkYI
   Dvn8hL854yfjTFIHOQtHMYItjmgwhz+2WLLUFFvuvDRb3YIgjTRH4TB6H
   ZDCfZ5ld5N4y8yiUvrrS6rtHTmFqBtUNDeAYirrfYF3Xmn4Olk2EN2qGG
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="337551262"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; 
   d="scan'208";a="337551262"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2022 03:13:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; 
   d="scan'208";a="605522732"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2022 03:13:39 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 18 Feb 2022 13:13:37 +0200
Date:   Fri, 18 Feb 2022 13:13:37 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        jagadish.hadimani@amd.com, sachinkumar.butte@amd.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Retain host router DP IN resources during
 suspend
Message-ID: <Yg9/YWrk4qMhoEut@lahna>
References: <1645168285-126273-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645168285-126273-1-git-send-email-Sanju.Mehta@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sanjay,

On Fri, Feb 18, 2022 at 01:11:25AM -0600, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> All DP resources are released during suspend and while
> resuming back DP IN resource is not available, therefore
> unable to find DP pair to re-establish the DP tunnel.

It should get plug event for the DP IN adapters once the router comes
back from sleep. Is that not happening here?
