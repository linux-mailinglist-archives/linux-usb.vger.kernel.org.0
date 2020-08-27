Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7898253E78
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 09:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgH0HAS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 03:00:18 -0400
Received: from mga04.intel.com ([192.55.52.120]:13571 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726266AbgH0HAQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 03:00:16 -0400
IronPort-SDR: pa0a8PYvYtre/StopX/2N5fTqlX/igRqksx4s/SqkdZB5mYwCQimcZfwcygGP6ioLv078VPPSF
 /8I72yt23poA==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="153853994"
X-IronPort-AV: E=Sophos;i="5.76,358,1592895600"; 
   d="scan'208";a="153853994"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2020 00:00:14 -0700
IronPort-SDR: kHpcijfD+yR6Tg4r54FzTAXLEmhy/8XXi04TrI7nV+lh6WcRY0fGbWlBxbxpNCtindSrIiQxt7
 RYSzKcJj0aYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,358,1592895600"; 
   d="scan'208";a="403315220"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 27 Aug 2020 00:00:10 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 27 Aug 2020 10:00:10 +0300
Date:   Thu, 27 Aug 2020 10:00:10 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     cy_huang <u0084500@gmail.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        matthias.bgg@gmail.com, linux@roeck-us.net, cy_huang@richtek.com,
        gene_chen@richtek.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb typec: mt6360: Add support for mt6360 Type-C
 driver
Message-ID: <20200827070010.GD813478@kuha.fi.intel.com>
References: <1598503859-29620-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598503859-29620-1-git-send-email-u0084500@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 27, 2020 at 12:50:58PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Mediatek MT6360 is a multi-functional IC that includes USB Type-C.
> It works with Type-C Port Controller Manager to provide USB PD
> and USB Type-C functionalities.
> 
> Add fix to Prevent the race condition from interrupt and tcpci port unregister
> during module remove.

You merged two patches from v2 together, so that really makes this
v3. Where is the changelog?

thanks,

-- 
heikki
