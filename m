Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52ABE47BA95
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 08:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234898AbhLUHRk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 02:17:40 -0500
Received: from mga12.intel.com ([192.55.52.136]:54945 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229999AbhLUHRk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Dec 2021 02:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640071060; x=1671607060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6zje/X+VZ5ZHiQi7LYboiBDqpvPYTfvlFD10O9V+6dE=;
  b=QeGKk7oX6HAHBsCxHTd/yNDzaP+H0BcWRF4uRg2hOQBZDuB77dZxOV6o
   DVshaIBfC5nW5ZklJ1oHGxHS2q7jFyrR908hxwV/azqKMrV2q1OD4KQua
   V5qzR5rIvrCLu6ws6H0v2L8XSQ9kzbX/iPHXJBcu6bQY4H1vmNsEHi0sR
   k+Gu5YlHFRlKfhn6b17BCsRbnhP8bYKWodiK44rCcu6qjFGVIM4rf4zN4
   gOwGlZwWyGKpxUYA9zce7gWA1MSpoS+/Xyqisb39j0uEu7XO5aUVR6sKe
   d+4VvYEYZ0qrMpfJtuSpVVQRFbWrRenb9oLshy+3aM08/vec7EL95yJcl
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="220354089"
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; 
   d="scan'208";a="220354089"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 23:17:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; 
   d="scan'208";a="663867574"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 20 Dec 2021 23:17:34 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 21 Dec 2021 09:17:34 +0200
Date:   Tue, 21 Dec 2021 09:17:34 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thorsten Leemhuis <regressions@leemhuis.info>,
        Chris Hixon <linux-kernel-bugs@hixontech.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Only check the contract if there is a
 connection
Message-ID: <YcF/jlRxl2uNwo/Z@kuha.fi.intel.com>
References: <20211217140327.31921-1-heikki.krogerus@linux.intel.com>
 <1d90a23b-fe2f-6892-1641-7a13e38a00dc@leemhuis.info>
 <YbypYo4Ohii4fSNx@kuha.fi.intel.com>
 <YcCXnMKPHAS7qaS+@kroah.com>
 <YcCkIp1U7YVAK/O3@kuha.fi.intel.com>
 <YcC1cnyzjoH2bPS9@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcC1cnyzjoH2bPS9@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 20, 2021 at 05:55:14PM +0100, Greg Kroah-Hartman wrote:
> > OK... so I don't prepare v2 then.
> 
> No, please do, I will not get to this for another few days because it
> takes me more work :)

OK. I'll send it asap, today.

thanks,

-- 
heikki
