Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6F410A17B
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2019 16:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbfKZPvE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Nov 2019 10:51:04 -0500
Received: from mga07.intel.com ([134.134.136.100]:12387 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727309AbfKZPvE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Nov 2019 10:51:04 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Nov 2019 07:51:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; 
   d="scan'208";a="217184355"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 26 Nov 2019 07:51:00 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 26 Nov 2019 17:50:59 +0200
Date:   Tue, 26 Nov 2019 17:50:59 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wen Yang <wenyang@linux.alibaba.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: roles: fix a potential use after free
Message-ID: <20191126155059.GC6428@kuha.fi.intel.com>
References: <20191124142236.25671-1-wenyang@linux.alibaba.com>
 <20191126154913.GB6428@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191126154913.GB6428@kuha.fi.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 26, 2019 at 05:49:17PM +0200, Heikki Krogerus wrote:
> On Sun, Nov 24, 2019 at 10:22:36PM +0800, Wen Yang wrote:
> > Free the sw structure only after we are done using it.
> > This patch just moves the put_device() down a bit to avoid the
> > use after free.
> > 
> > Fixes: 5c54fcac9a9d ("usb: roles: Take care of driver module reference counting")
> > Signed-off-by: Wen Yang <wenyang@linux.alibaba.com>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Cc: linux-usb@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org

Ups, sorry. I meant:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

thanks,

-- 
heikki
