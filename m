Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFECE26BF8F
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 10:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgIPImr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 04:42:47 -0400
Received: from mga01.intel.com ([192.55.52.88]:57495 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbgIPImp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 04:42:45 -0400
IronPort-SDR: GNUQ5oeNVNRNp9Ceq7qlCqI1OvmF34D1l9ObUqrBGdDByNni+rKraj8lq3NjS+jyQlvv95cYF+
 npl32uxux0yg==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="177498599"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="177498599"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 01:42:45 -0700
IronPort-SDR: yfyfi23xL6rCkwEgqf8aPz8TKiL+3epKXT6wTF+RiDhxbqW+SUrBgRak2mW9franFRemezpU1U
 csBhcgkLhxFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="409480881"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 16 Sep 2020 01:42:43 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 16 Sep 2020 11:42:42 +0300
Date:   Wed, 16 Sep 2020 11:42:42 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/5] USB Type-C fixes
Message-ID: <20200916084242.GD1358028@kuha.fi.intel.com>
References: <20200916081617.17146-1-heikki.krogerus@linux.intel.com>
 <20200916083709.GA676008@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916083709.GA676008@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 16, 2020 at 10:37:09AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Sep 16, 2020 at 11:16:12AM +0300, Heikki Krogerus wrote:
> > Hi,
> > 
> > There are two fixes for the UCSI drivers that address issues related
> > to the alternate modes. The other three fixes are for the PMC mux
> > driver. We were missing dependency on ACPI and the port number that
> > was used with the IOM was incorrect.
> > 
> > Let me know if you want anything to be changed.
> 
> This seems to be a mix of patches to be sent to Linus for 5.9-final and
> some for 5.10-rc1, right?
> 
> Can you resend these as two series so I know which one is which?

OK.

-- 
heikki
