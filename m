Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 833F079BBC8
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350553AbjIKVjF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238183AbjIKNpk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 09:45:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E56CD7
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 06:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694439936; x=1725975936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kKrQikZ6yq+UC99XrIsce1ysq1mfEsYTZHtiDCoGTcE=;
  b=guz+8PnHbMYP9WqCqEQOUgaZghOA62BVHEML+GYyjImnaFDcJnNng+qV
   rgrIl5ZYneJOVzJyFRJHziWRtmb08c7locYN600ZoazkCykJ5zZ1r9/1g
   CHh3ScQ6ykg/dfubaBU+MwWHICb0SVrfNTXcKW8vayUtvVSpdNsg4dl2f
   EWR1VU76FcGomDIdUo60JCWTuzwBtn7xdqNTqPsRJIc2XnroHVBI4GlZp
   U2UoScf1PjPwLlf2ds1wW0IOJ+g3b7gS0d3AxTuAPoWeBcoxgYUvSZMEA
   aErRBKGv4Bbyyt/souI5DX0YhikwaNjkD5/WRMA/RtTPk79RRTnJIJ3T6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="381888317"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="381888317"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 06:45:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="990096782"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="990096782"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga006.fm.intel.com with SMTP; 11 Sep 2023 06:45:32 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 11 Sep 2023 16:45:31 +0300
Date:   Mon, 11 Sep 2023 16:45:31 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Douglas Gilbert <dgilbert@interlog.com>
Cc:     Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@chromium.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Saranya Gopal <saranya.gopal@intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [typec] pd: fixed source capability: peak_current field
Message-ID: <ZP8Z+1Kn+RagnFNq@kuha.fi.intel.com>
References: <9b87f828-cf1d-e370-f4ca-e0c53c9a35c5@interlog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b87f828-cf1d-e370-f4ca-e0c53c9a35c5@interlog.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+linux-usb ml, Guenter and others.

On Sun, Sep 10, 2023 at 09:29:04PM -0400, Douglas Gilbert wrote:
> Hi,
> The Peak current 2 bit field has been present in the fixed source PDO
> since PD 2.0 . It is commented out in typec/pd.c with a note to revisit
> as it needs the Operational current field from the active RDO.
> 
> Not sure I agree with that: the 2 bit field is unit-less and could easily
> be displayed as such. At the moment the active RDO is not directly
> available through sysfs and would certainly be a useful addition for
> many reasons.
> 
> So my vote (not that I get one) would be to output peak_current in
> sysfs with no unit. Then in the ABI peak_current could be explained
> by reference to a table in the spec (e.g. "USB Power Delivery
> Specification Revision 3.1, Version 1.8, table 6-10 Fixed Power
> Source Peak Current Capability"). Then the issue of what it means
> is handed off to the user space :-)
> 
> Also of note is that the Peak current field is B21..B20 which is
> below B23 (obviously) so all fixed source PDOs have that field
> (and thus those unit-less values could differ), not just
> PDO #1 .

I agree with you. I don't think it makes sense to try to interpret the
peak current value in kernel, so we could just expose the value as-is.

But first giving the others heads-up on this, just in case somebody
disagrees.

thanks,

-- 
heikki
