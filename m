Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161E02165DB
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 07:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbgGGFRU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 01:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbgGGFRU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 01:17:20 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2379CC061755
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 22:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=ySstHELzlSD5/RLq5Az/t9DJ4W+ybktphcNlPaCd/Ds=; b=XDGIfh91r6qLIq7ZzBqMRtHcUD
        FFPzPJQY5oarkiMxToEyH1gG+gGeLLaKkdMQKDx7xiHWC5Ostpa8Y5l137RogqYEwRuQnnR1I3I7n
        zVYf8ywOBVdAqkzTWlo48l9wUtHyVqQyAR55sUUD+OOo/9Z6ua+1X49dYc10+9nauwW5qwcILp7J7
        Mw4/sOfRIT6/j8KNF3Fnr4f0MfcnBRh5Vpya1l+UVgcYXyX5JuxGNPCOf9mqayDT4nuV//dG7TVzQ
        ZaZRybuA8nIrWqCSftptm0e5cRzOd7Sj6p9G0JZqmlWS7ESEIWEHs1Pj+pbPqpY2lUjlGkNR+I9E1
        LbrorRZA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jsfyl-0000GO-FA; Tue, 07 Jul 2020 05:17:18 +0000
Subject: Re: [PATCH 2/2] usb: correct kernel-doc inconsistency
To:     Colton Lewis <colton.w.lewis@protonmail.com>,
        gregkh@linuxfoundation.og
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
References: <20200707045207.235540-1-colton.w.lewis@protonmail.com>
 <20200707045207.235540-2-colton.w.lewis@protonmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <36ce325b-3c64-1e7b-f56a-7c3251e8bdfe@infradead.org>
Date:   Mon, 6 Jul 2020 22:17:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200707045207.235540-2-colton.w.lewis@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/6/20 9:52 PM, Colton Lewis wrote:
> Silence documentation build warning by correcting kernel-doc comments
> for usb_device and usb_device_driver structs.
> 
> ./include/linux/usb.h:713: warning: Function parameter or member 'use_generic_driver' not described in 'usb_device'
> ./include/linux/usb.h:1253: warning: Function parameter or member 'match' not described in 'usb_device_driver'
> ./include/linux/usb.h:1253: warning: Function parameter or member 'id_table' not described in 'usb_device_driver'
> 
> Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>

Hi,
I also sent a patch for this on June 28.


> ---
>  include/linux/usb.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 9f3c721c70dc..88c80289e51f 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -621,6 +621,7 @@ struct usb3_lpm_parameters {
>   *	be manipulated by those functions, with the bandwidth_mutex is held.
>   * @hub_delay: cached value consisting of:
>   *		parent->hub_delay + wHubDelay + tTPTransmissionDelay (40ns)
> + * @use_generic_driver: bit is set to use generic usb driver
>   *
>   *	Will be used as wValue for SetIsochDelay requests.
>   *
> @@ -1215,6 +1216,7 @@ struct usb_driver {
>   * struct usb_device_driver - identifies USB device driver to usbcore
>   * @name: The driver name should be unique among USB drivers,
>   *	and should normally be the same as the module name.
> + * @match: Called to see if driver matches a device.
>   * @probe: Called to see if the driver is willing to manage a particular
>   *	device.  If it is, probe returns zero and uses dev_set_drvdata()
>   *	to associate driver-specific data with the device.  If unwilling
> @@ -1227,6 +1229,7 @@ struct usb_driver {
>   * @dev_groups: Attributes attached to the device that will be created once it
>   *	is bound to the driver.
>   * @drvwrap: Driver-model core structure wrapper.
> + * @id_table: Array of device ids supported by this driver.
>   * @supports_autosuspend: if set to 0, the USB core will not allow autosuspend
>   *	for devices bound to this driver.
>   * @generic_subclass: if set to 1, the generic USB driver's probe, disconnect,
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
