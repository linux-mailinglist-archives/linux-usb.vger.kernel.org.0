Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB392588C4
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 09:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgIAHI5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 03:08:57 -0400
Received: from mga18.intel.com ([134.134.136.126]:34002 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbgIAHIv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 03:08:51 -0400
IronPort-SDR: bwe+3Q/PJ+kZISc6PeI+DPCW30WzjBp0maI6bO4LDubet8qEJaRKnrWEG3wcF9tD9LhHiTXfY4
 dSwQrbvJbaeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="144807411"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; 
   d="scan'208";a="144807411"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2020 00:08:50 -0700
IronPort-SDR: OhHvXl/KLwt+PprKU98EynflzWb9DBha91GSGGAbx4adRBqSk5jyG0wWGYgNQUgUJwAJ2sTwbX
 1XVxS/H7m4tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; 
   d="scan'208";a="404687296"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 01 Sep 2020 00:08:47 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 01 Sep 2020 10:08:47 +0300
Date:   Tue, 1 Sep 2020 10:08:47 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
        linuxarm@huawei.com
Subject: Re: [PATCH] thunderbolt: Use kobj_to_dev() instead of container_of()
Message-ID: <20200901070847.GR1375436@lahna.fi.intel.com>
References: <1598922090-39482-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598922090-39482-1-git-send-email-tiantao6@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Sep 01, 2020 at 09:01:30AM +0800, Tian Tao wrote:
> Use kobj_to_dev() instead of container_of()

OK, but can you write here why it is better? :)

> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/thunderbolt/domain.c | 2 +-
>  drivers/thunderbolt/switch.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index bba4cbf..7a192b7 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -275,7 +275,7 @@ static struct attribute *domain_attrs[] = {
>  static umode_t domain_attr_is_visible(struct kobject *kobj,
>  				      struct attribute *attr, int n)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct tb *tb = container_of(dev, struct tb, dev);
>  
>  	if (attr == &dev_attr_boot_acl.attr) {
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index a921de9..173ce3b 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -1649,7 +1649,7 @@ static struct attribute *switch_attrs[] = {
>  static umode_t switch_attr_is_visible(struct kobject *kobj,
>  				      struct attribute *attr, int n)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct tb_switch *sw = tb_to_switch(dev);
>  
>  	if (attr == &dev_attr_device.attr) {
> -- 
> 2.7.4
