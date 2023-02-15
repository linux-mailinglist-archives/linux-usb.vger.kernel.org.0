Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23B226975FC
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 06:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjBOFtY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 00:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjBOFtX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 00:49:23 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF522B0A1
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 21:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676440162; x=1707976162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+nK2OE7ert4yKNKfoTPI/DF8a6xH3T9JFvFa5mvnMA8=;
  b=kyLBg42WSA/vCutwVn7iNkp1azQTJ4kW3vF7mN46nQP2VQG/kimh4aiY
   hqrBj/AaQ5/xNP9Ea/pL7gnatjik6oTm2tv4+ktowMsKk/MggwnYkoWjp
   oO+m2NYEZ3e1G0ABGh31qWdKo+WzEQsgDqNAHsNHuJUGVyaancis1uJxY
   1mTRDOpgkMD2db6syN9QFwRDcTKJAQw1XaJNuFKkb9vMMY4N6mzrCyfUd
   CcMwF7P2HvZWzKUjlEH0PKJA3mQdsGxNXGlCvSEg+2R5+OfBDzWzeMzIF
   KBvUMTZRZIfHZCj9qGEK9yNIzszfOR2NlPk9PXLknjaJCq++sD1nYjCL3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="331353913"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="331353913"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 21:49:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="701903039"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="701903039"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 14 Feb 2023 21:49:19 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C1E991A6; Wed, 15 Feb 2023 07:49:59 +0200 (EET)
Date:   Wed, 15 Feb 2023 07:49:59 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v5] thunderbolt: Add quirk to disable CLx
Message-ID: <Y+xyh44lGEzwuOj/@black.fi.intel.com>
References: <1676404912-7048-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1676404912-7048-1-git-send-email-Sanju.Mehta@amd.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 14, 2023 at 02:01:52PM -0600, Sanjay R Mehta wrote:
>  void tb_check_quirks(struct tb_switch *sw)
>  {
> +	struct tb_switch *root_sw = sw->tb->root_switch;
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(tb_quirks); i++) {
>  		const struct tb_quirk *q = &tb_quirks[i];
>  
> -		if (q->hw_vendor_id && q->hw_vendor_id != sw->config.vendor_id)
> +		if (q->hw_vendor_id && (q->hw_vendor_id != sw->config.vendor_id &&
> +					q->hw_vendor_id != root_sw->config.vendor_id))

Again, why you need to change this?

If you have the AMD host router device ID in the list the quirk applies
and that makes the driver skip enabling CL states for that link. It
should not matter if we enable CL states in the deeper parts of the
topology (even if we actually do not at the moment) because that's
completely different link, right.
