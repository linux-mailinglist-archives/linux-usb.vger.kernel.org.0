Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50524295E5C
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 14:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898174AbgJVM3Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 08:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2507176AbgJVM3Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Oct 2020 08:29:16 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A4CCC0613CE;
        Thu, 22 Oct 2020 05:29:16 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kVZiE-006Dx9-78; Thu, 22 Oct 2020 12:28:58 +0000
Date:   Thu, 22 Oct 2020 13:28:58 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Luo Jiaxing <luojiaxing@huawei.com>
Cc:     akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com,
        linux-kernel@vger.kernel.org, martin.petersen@oracle.com,
        john.garry@huawei.com, himanshu.madhani@cavium.com,
        felipe.balbi@linux.intel.com, gregkh@linuxfoundation.org,
        uma.shankar@intel.com, anshuman.gupta@intel.com,
        animesh.manna@intel.com, linux-usb@vger.kernel.org,
        linux-scsi@vger.kernel.org, linuxarm@huawei.com
Subject: Re: [PATCH v1 0/5] Introduce a new helper marco
 DEFINE_STORE_ATTRIBUTE at seq_file.c
Message-ID: <20201022122858.GT3576660@ZenIV.linux.org.uk>
References: <1603355997-32350-1-git-send-email-luojiaxing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603355997-32350-1-git-send-email-luojiaxing@huawei.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 22, 2020 at 04:39:52PM +0800, Luo Jiaxing wrote:
> We already own DEFINE_SHOW_ATTRIBUTE() helper macro for defining attribute
> for read-only file, but we found many of drivers also want a helper marco for
> read-write file too.

DEFINE_SHOW_ATTRIBUTE is a bloody bad idea; let's not replicate the garbage
any further.  If you want templates - C++ is over that way...
