Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E229F180E86
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2020 04:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727659AbgCKDco convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 10 Mar 2020 23:32:44 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37156 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbgCKDco (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Mar 2020 23:32:44 -0400
Received: from mail-pj1-f70.google.com ([209.85.216.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jBs6s-0007to-I3
        for linux-usb@vger.kernel.org; Wed, 11 Mar 2020 03:32:42 +0000
Received: by mail-pj1-f70.google.com with SMTP id d2so327733pjz.5
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2020 20:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=TO0qv6efKA7cZs1yfHfT13W25PN4EYUJVO1YMN34FnQ=;
        b=ZhsHX/nPyZZv8yEJl/nswZkWe2EudttaQUl9BmBYIcdT9/OL8NzcvS5m0ScuLJlvLA
         kODUgu+YCMVMGHP2z094qgEFxrj/Na6XvfLt1oUx85A5edJ33Rrzpp7cLYtRkccExfS0
         Hg9I1CJcvKhss3dj5tERyjTKCjQtscR111U1eS0Jh1d+fxI1dY2z5frSzh44WtRl3B+K
         vuK+73Mm0EY/YZbxrwDX+2NvughaHzYA2nD42KwI7jFAKZKY5+JS/5TXiAiXGzHGJowf
         2ssydVDA74IMvHugUGbZgrnRXIBto0KA47KTZCTBcNuPOvvYVKFro0WpUfkpcr9cE3+E
         ZiVA==
X-Gm-Message-State: ANhLgQ1NpLBKzclb90AKGRwoSCNJi+zzMHJzVJSkDmDl2iUWnHyU5YDk
        1v4oYxHe0YNP9JZ72i6UKBL2y5e9dWM/ZEmA4fTWvkpzrxkLRaSitrlDCpTNr0hU/iSf0mfDa+e
        UoAeD7YecgkV1AhALjOgGgUgUG7biC6cfbTPS1A==
X-Received: by 2002:a65:53c5:: with SMTP id z5mr956095pgr.0.1583897559831;
        Tue, 10 Mar 2020 20:32:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvHaCAuDG8ZXxP6dI2E0k+Q5QuKeZli0FiRJpCet81PmNlzXAF3LuHsh7RN9iPMIp47894dLg==
X-Received: by 2002:a65:53c5:: with SMTP id z5mr956085pgr.0.1583897559542;
        Tue, 10 Mar 2020 20:32:39 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id s23sm3567125pjp.28.2020.03.10.20.32.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Mar 2020 20:32:38 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [RESEND] [PATCH v2 3/3] USB: Disable LPM on WD19's Realtek Hub
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20200205112633.25995-3-kai.heng.feng@canonical.com>
Date:   Wed, 11 Mar 2020 11:32:27 +0800
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <4F77B65D-77B0-4E63-ADB3-BF127BDE3BA2@canonical.com>
References: <20200205112633.25995-1-kai.heng.feng@canonical.com>
 <20200205112633.25995-3-kai.heng.feng@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

> On Feb 5, 2020, at 19:26, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> 
> Realtek Hub (0bda:0x0487) used in Dell Dock WD19 sometimes drops off the
> bus when bringing underlying ports from U3 to U0.
> 
> Disabling LPM on the hub during setting link state is not enough, so
> let's disable LPM completely for this hub.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

As Mathias stated, this patch can be considered as a separate one.
Can you please review and merge this patch?

Kai-Heng

> ---
> v2:
> - Use quirk instead of the original approach.
> 
> drivers/usb/core/quirks.c | 3 +++
> 1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 6b6413073584..2fb7c1602280 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -371,6 +371,9 @@ static const struct usb_device_id usb_quirk_list[] = {
> 	{ USB_DEVICE(0x0b05, 0x17e0), .driver_info =
> 			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
> 
> +	/* Realtek hub in Dell WD19 (Type-C) */
> +	{ USB_DEVICE(0x0bda, 0x0487), .driver_info = USB_QUIRK_NO_LPM },
> +
> 	/* Action Semiconductor flash disk */
> 	{ USB_DEVICE(0x10d6, 0x2200), .driver_info =
> 			USB_QUIRK_STRING_FETCH_255 },
> -- 
> 2.17.1
> 

