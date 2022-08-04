Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5A895899D0
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 11:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238727AbiHDJRt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 05:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238660AbiHDJRs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 05:17:48 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0A46565E
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 02:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659604667; x=1691140667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JTBDu4R1f9V1KnhUHxo5w+1kYPn6jpZkbvKCnsCPPaU=;
  b=NJu5elsMqukrFIAsdybUW4ao3c0LtgQS0qZBUSUIZdhBVcSXZKxBRxO7
   MH0vQAqCvRZI7HPD9i/Shu8JwcTzDyn98b4Edwtxyhd3pZ0wOM5y6qdyy
   t2N00Qc4DRViP0BwGPO7hY4HXiZT7LlRS2wyC16uRKjEwd0+cscXNOz8q
   ELT9ZsOFqOSK7/HZoRmHJSVwGEXpJTlu0BbLt/i59nYB1OiqWsYWCwnrS
   60ZEx9Zz1dd34zDl+/WQMowa+hchAFLHkvq5JEqcBW2cqIBAe1SHbo82o
   a4q2sa7UaCJk8zf4uU3G+gsh6OJ9FrN/AO8Nun8hGGk3sjrfDMfZVgoMy
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="270268685"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; 
   d="scan'208";a="270268685"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 02:17:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; 
   d="scan'208";a="553655294"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 02:17:43 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 04 Aug 2022 12:15:30 +0300
Date:   Thu, 4 Aug 2022 12:15:30 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <sanmehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        mario.limonciello@amd.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] thunderbolt: Add DP out resource when DP tunnel is
 discovered.
Message-ID: <YuuOMrH+TOt5o8WY@lahna>
References: <1659587394-115256-1-git-send-email-Sanju.Mehta@amd.com>
 <Yutnjq64OO07QbAR@lahna>
 <a5b6e0a1-a334-1bc5-46fa-b9ee5f53688f@amd.com>
 <YutwWI8xENDkAtg9@lahna>
 <5ba4e184-d9cb-a120-8044-e200b6e47812@amd.com>
 <YuuDxU59ud2LhFbl@lahna>
 <1bdd4947-0343-d907-48c3-e33c9063fa77@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bdd4947-0343-d907-48c3-e33c9063fa77@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 04, 2022 at 02:27:22PM +0530, Sanjay R Mehta wrote:
> You mean something as below & call it into tb_start() after
> tb_discover_tunnels() ?
> 
> static void tb_discover_dp_resources(struct tb *tb)
> {
>         struct tb_cm *tcm = tb_priv(tb);
>         struct tb_tunnel *tunnel;
> 
> 
>         list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
>                 if (tb_tunnel_is_dp(tunnel))
> 			tb_discover_dp_resource(tb, tunnel->dst_port);
> 	}
> }
> 

Yes.
