Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C39F2435EB
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 10:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgHMIZM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 04:25:12 -0400
Received: from mga07.intel.com ([134.134.136.100]:2378 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726048AbgHMIZL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 04:25:11 -0400
IronPort-SDR: sEri0CE3jVZZhTZqbOhCj87L6x/yspkIQeeYi5SZ6dxnlA7XgjCDgqIqxIej6Fl7pKj9BW6rHN
 dWNo6HicqbRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="218518149"
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; 
   d="scan'208";a="218518149"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 01:25:10 -0700
IronPort-SDR: xlUF/TAZonNcLBa+JoHxeygpJGso829xFRvjOe8/7yMFDcx6zB5SSApLBjksHOtzBujYdWdJph
 9IAZvUASYVrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; 
   d="scan'208";a="399096643"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 13 Aug 2020 01:25:08 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 13 Aug 2020 11:25:07 +0300
Date:   Thu, 13 Aug 2020 11:25:07 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Badhri Jagan Sridharan <badhri@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2 v3] tcpm: During PR_SWAP, source caps should be sent
 only after tSwapSourceStart
Message-ID: <20200813082507.GE1169992@kuha.fi.intel.com>
References: <20200812022934.568134-1-badhri@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812022934.568134-1-badhri@google.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

> This fixes TD.PD.CP.E3, TD.PD.CP.E4, TD.PD.CP.E5 failures

I'm sorry, but that statement is way too cryptic. You really need to
explain what those are.

thanks,

-- 
heikki
