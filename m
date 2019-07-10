Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C569D63050
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jul 2019 08:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbfGIGMF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Jul 2019 02:12:05 -0400
Received: from mga02.intel.com ([134.134.136.20]:7778 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725818AbfGIGME (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Jul 2019 02:12:04 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jul 2019 23:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,469,1557212400"; 
   d="scan'208";a="159359245"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga008.jf.intel.com with ESMTP; 08 Jul 2019 23:12:00 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com,
        nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, jpawar@cadence.com,
        kurahul@cadence.com, aniljoy@cadence.com,
        Pawel Laszczak <pawell@cadence.com>
Subject: Re: [PATCH 1/3] usb: common: Add usb_get_dr_mode_from_string and usb_dr_mode_to_string.
In-Reply-To: <1562592924-17528-1-git-send-email-pawell@cadence.com>
References: <1562592924-17528-1-git-send-email-pawell@cadence.com>
Date:   Tue, 09 Jul 2019 09:11:59 +0300
Message-ID: <87y31768k0.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Pawel Laszczak <pawell@cadence.com> writes:
> diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
> index 69f1b6328532..c156817672c4 100644
> --- a/include/linux/usb/otg.h
> +++ b/include/linux/usb/otg.h
> @@ -129,4 +129,20 @@ enum usb_dr_mode {
>   */
>  extern enum usb_dr_mode usb_get_dr_mode(struct device *dev);
>  
> +/**
> + * usb_get_dr_mode_from_string - Convert string to dual role mode.
> + * @str: Pointer to the given string
> + *
> + * The function gets string and returns the correspondig enum usb_dr_mode.
> + */
> +extern enum usb_dr_mode usb_get_dr_mode_from_string(const char *str);
> +
> +/**
> + * usb_dr_mode_to_string - Convert dual role mode to string.
> + * @dr_mode: Pointer to the given dual role mode
> + *
> + * The function gets enum usb_dr_mode, and returns the correspondig string.
> + */
> +extern const char *usb_dr_mode_to_string(const enum usb_dr_mode dr_mode);
> +
>  #endif /* __LINUX_USB_OTG_H */

Still missing the stubs I mentioned. Did you try compiling with and
without common enabled?

-- 
balbi
