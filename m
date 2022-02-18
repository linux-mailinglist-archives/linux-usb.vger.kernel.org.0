Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB08F4BBA91
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 15:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236003AbiBROZ6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 09:25:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbiBROZ5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 09:25:57 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 154E64CD70
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 06:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645194340; x=1676730340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qL0/m0eHftpJYv/EXf7DlgPHfScPS/xKSP+cfqqVBYI=;
  b=Yiczlan9f5zyj7oTXoQAEaGFUSJD2CwuIlKzaLjTeMXg4uMUqXerej18
   zpX08f5jeJ5cqKf7yeH3jObF4eQOwmINgUK4S6rnrDE6WER8ouEEtdFYv
   Xlbfunlh8G8J0/SuADdfHmKN9LypoX5k1QV6TRLpMv1INUQLnDcEeJ6vG
   jfjxgY9aAXQKwplSrKYA1SDe4AoAZbFoct9jnhs3IVz4Z2NUqqqETz5jo
   PJvpexbeF9O4xxLqvTFaGcfxUhia72/qip9FIaJHjb7pRqP7SEpU6eeOG
   erlELF5UzGCjUUSnczaBPZz9ZSAIp9DU8cZj11HJ4EstmEjYtCSQCchAP
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="251076353"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; 
   d="scan'208";a="251076353"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2022 06:25:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; 
   d="scan'208";a="626644705"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2022 06:25:36 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 18 Feb 2022 16:25:33 +0200
Date:   Fri, 18 Feb 2022 16:25:33 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <sanmehta@amd.com>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        Basavaraj.Natikar@amd.com, jagadish.hadimani@amd.com,
        sachinkumar.butte@amd.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Retain host router DP IN resources during
 suspend
Message-ID: <Yg+sXedW1RFa65SE@lahna>
References: <1645168285-126273-1-git-send-email-Sanju.Mehta@amd.com>
 <Yg9/YWrk4qMhoEut@lahna>
 <ac90de2a-2d13-ed0f-2d75-8cc3e5a882f1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac90de2a-2d13-ed0f-2d75-8cc3e5a882f1@amd.com>
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

On Fri, Feb 18, 2022 at 07:38:23PM +0530, Sanjay R Mehta wrote:
> 
> 
> On 2/18/2022 4:43 PM, Mika Westerberg wrote:
> > Hi Sanjay,
> > 
> > On Fri, Feb 18, 2022 at 01:11:25AM -0600, Sanjay R Mehta wrote:
> >> From: Sanjay R Mehta <sanju.mehta@amd.com>
> >>
> >> All DP resources are released during suspend and while
> >> resuming back DP IN resource is not available, therefore
> >> unable to find DP pair to re-establish the DP tunnel.
> > 
> > It should get plug event for the DP IN adapters once the router comes
> > back from sleep. Is that not happening here?
> 
> Yes, plug event is not happening for the DP IN adapter after resume.
> 
> The DP In resources are put into tcm->dp_resources list as part  of host
> router enumeration. But when it resumes from sleep, there is no plug
> event happening for DP IN, hence DP IN resource will not be in
> tcm->dp_resources list.

Right but if I understand the spec correctly you should get a new
hotplug event for the DP IN adapters once the host router is moved back
to "enumerated" state. This is how Intel hardware works at least (and
this is the understanding I have from the USB4 spec too). Do you see
anything in the log wrt. this when you resume the domain?
