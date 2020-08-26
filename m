Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE1E252CA3
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 13:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728960AbgHZLlJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 07:41:09 -0400
Received: from mga07.intel.com ([134.134.136.100]:22746 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729077AbgHZLlD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 07:41:03 -0400
IronPort-SDR: Zw3xv8ZBUZQT6/u9k2D1ZkHAfIxUkWhStUSDtCjJrJ4056zsI0V/nd/EV3zsw5B2mNzrCv9fOq
 oBfoU1K2EV/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="220534185"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="220534185"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:40:56 -0700
IronPort-SDR: F65wMn1j39HEqIHOulahc+IHP0DvRXuZwf66EJImcRrERW9ExclF53Av3ZwMRIVDS4b93GH50G
 1OxFwACoFzRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="403038793"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 26 Aug 2020 04:40:53 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 26 Aug 2020 14:40:52 +0300
Date:   Wed, 26 Aug 2020 14:40:52 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 9/9] thunderbolt: Add debugfs interface
Message-ID: <20200826114052.GK1375436@lahna.fi.intel.com>
References: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
 <20200826110736.55186-10-mika.westerberg@linux.intel.com>
 <20200826112246.GA3760307@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826112246.GA3760307@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Wed, Aug 26, 2020 at 01:22:46PM +0200, Greg Kroah-Hartman wrote:
> > +#define DEBUGFS_ATTR(__space, __write)					\
> > +static int __space ## _open(struct inode *inode, struct file *file)	\
> > +{									\
> > +	return single_open(file, __space ## _show, inode->i_private);	\
> > +}									\
> > +									\
> > +static const struct file_operations __space ## _fops = {		\
> > +	.owner = THIS_MODULE,						\
> > +	.open = __space ## _open,					\
> > +	.release = single_release,					\
> > +	.read  = seq_read,						\
> > +	.write = __write,						\
> > +	.llseek = seq_lseek,						\
> > +}
> > +
> > +#define DEBUGFS_ATTR_RO(__space)					\
> > +	DEBUGFS_ATTR(__space, NULL)
> > +
> > +#define DEBUGFS_ATTR_RW(__space)					\
> > +	DEBUGFS_ATTR(__space, __space ## _write)
> 
> We do have DEFINE_SIMPLE_ATTRIBUTE() and DEFINE_DEBUGFS_ATTRIBUTE, do
> those work here instead of your custom macro?

Unfortunately they do not work as they want u64 for the write side but
we actually need to parse (offset, value) pairs here when write is
enabled.

> Other than that, this series looks fine to me:
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks!
