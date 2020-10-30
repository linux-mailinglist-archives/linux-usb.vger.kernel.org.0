Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04D452A003F
	for <lists+linux-usb@lfdr.de>; Fri, 30 Oct 2020 09:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgJ3IoB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 04:44:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:51580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgJ3IoB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Oct 2020 04:44:01 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88CB02075E;
        Fri, 30 Oct 2020 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604047440;
        bh=BADdsaGSmKEWz7XlhZAacYvZU3dbPRUVwNoUa9EQ9fY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jWsiaE+jA/WD/bs1UBm0uEdmn22Y4A1qlUCKFpn9Niob/NbNcIjYmoTLUaF9bFI+c
         +XhL6Nz1FUX2R/Kw033G8Mt4ZY7DWfOyUVejoQJJM4z+bJFglLaN9WyPisL8y90Q9G
         TTSSMYIXmv5A6Y+FIb4hYD/Q7aLgwt8hdWd3daLA=
Date:   Fri, 30 Oct 2020 09:44:48 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Luo Jiaxing <luojiaxing@huawei.com>
Cc:     akpm@linux-foundation.org, viro@zeniv.linux.org.uk,
        andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org,
        martin.petersen@oracle.com, john.garry@huawei.com,
        himanshu.madhani@cavium.com, felipe.balbi@linux.intel.com,
        uma.shankar@intel.com, anshuman.gupta@intel.com,
        animesh.manna@intel.com, linux-usb@vger.kernel.org,
        linux-scsi@vger.kernel.org, linuxarm@huawei.com
Subject: Re: [PATCH v2 0/5] Introduce a new helper marco
 DEFINE_SHOW_STORE_ATTRIBUTE at seq_file.c
Message-ID: <20201030084448.GA1625087@kroah.com>
References: <1604046722-15531-1-git-send-email-luojiaxing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604046722-15531-1-git-send-email-luojiaxing@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 30, 2020 at 04:31:57PM +0800, Luo Jiaxing wrote:
> We already own DEFINE_SHOW_ATTRIBUTE() helper macro for defining attribute
> for read-only file, but we found many of drivers also want a helper marco for
> read-write file too.
> 
> So we try to add this macro to help decrease code duplication.
> 
> Luo Jiaxing (5):
>   seq_file: Introduce DEFINE_SHOW_STORE_ATTRIBUTE() helper macro
>   scsi: hisi_sas: Introduce DEFINE_SHOW_STORE_ATTRIBUTE for debugfs
>   scsi: qla2xxx: Introduce DEFINE_SHOW_STORE_ATTRIBUTE for debugfs
>   usb: dwc3: debugfs: Introduce DEFINE_SHOW_STORE_ATTRIBUTE
>   drm/i915/display: Introduce DEFINE_SHOW_STORE_ATTRIBUTE for debugfs

What changed from v1?

thanks,

greg k-h
