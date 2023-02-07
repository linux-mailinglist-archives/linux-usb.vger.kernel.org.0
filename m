Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0D2568D1F9
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 10:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjBGJEB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 04:04:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjBGJEA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 04:04:00 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46AC82E83B
        for <linux-usb@vger.kernel.org>; Tue,  7 Feb 2023 01:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675760640; x=1707296640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DnXst0EwoXGkfXNMnK6o0vSqkUEu85cJIKQNVxQ84O0=;
  b=dxLUDepQfi2WP9UKpdsNwQcd5abasY5rjyIe1i6Q7Ax6OfASmspyjFIS
   YJM4A7qS0KUPwu8iopE1W2iSvRrFLrI/q/MgHX5tLXFsKIiXHPuSAgib0
   MbV6DQcK3YXUn0GEN6p7m4CrQ6GUBSe4tUSOl0ggl0uKrIYIZmICiWJVZ
   WoKLfIXDA253Rev4ipj0mKHByAl94aD9BuTESBfXVjsXP5IcOznxFawZK
   +SVivNKRL4KMF5p3j/OeKoDjfAYaDlrOQoxJdTROlnupv6FEHYaK8Wpdw
   xqFhwgf9KGBvB8k3f3KXRwxID+HDSDs5/duWLQOgg3rNx+GersQerg0b5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="328094881"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="328094881"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 01:03:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="809448817"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="809448817"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 07 Feb 2023 01:03:54 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 07 Feb 2023 11:03:53 +0200
Date:   Tue, 7 Feb 2023 11:03:53 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>
Subject: Re: [PATCH] usb: typec: disable pm for typec class devices
Message-ID: <Y+IT+Y7anYa0w0D3@kuha.fi.intel.com>
References: <1675752122-8147-1-git-send-email-quic_linyyuan@quicinc.com>
 <Y+H+8Nt/5bgTBv4Y@kuha.fi.intel.com>
 <3aa7756b-8967-8ea9-bba1-56811846b5ca@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3aa7756b-8967-8ea9-bba1-56811846b5ca@quicinc.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 07, 2023 at 04:07:17PM +0800, Linyu Yuan wrote:
> > Note that for alt modes you can't do this. They can be bind to
> > drivers - there is a bus for them.
> 
> but even in the bus, there is power management,
> 
> struct bus_type typec_bus = {
>     .name = "typec",
>     .dev_groups = typec_groups,
>     .match = typec_match,
>     .uevent = typec_uevent,
>     .probe = typec_probe,
>     .remove = typec_remove,
> };
> 
> we can disable it, right ?

No. It does not matter if the bus does not have the PM ops, a driver
can still supply the PM ops for the device.

Check how it's handled in drivers/base/power/main.c. Basically, if the
bus, pm domain, device type, or the class don't supply the PM ops,
the drivers own PM ops are then just used directly.

thanks,

-- 
heikki
