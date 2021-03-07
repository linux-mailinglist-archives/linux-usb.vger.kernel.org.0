Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE8723302C8
	for <lists+linux-usb@lfdr.de>; Sun,  7 Mar 2021 16:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbhCGPzH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 10:55:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31798 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232049AbhCGPyz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Mar 2021 10:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615132495;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EFGDhzS5rcqOc3RM9clVoGZ0o3uhf02wOPFwu2P4VbY=;
        b=iTYAdP8TneNwKDZil6CZ0Qkn4JcFcUGYZMqEqEa4e6SWbE8MlgZAhSRNvwRb3S1F7TDPKa
        dWYG8FMwvyXvlUGka+s5qdCkIS6Ge3+UgW0Y6ugu2gGioZV04NPuVEIrnx4R/dXt6e/D4P
        05H0zLx7cUJoRxJZ9y6KgVxTEm1x0Nc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-i7Mw-5mzN1mQUYaEuKLK1Q-1; Sun, 07 Mar 2021 10:54:53 -0500
X-MC-Unique: i7Mw-5mzN1mQUYaEuKLK1Q-1
Received: by mail-ed1-f71.google.com with SMTP id p12so3827460edw.9
        for <linux-usb@vger.kernel.org>; Sun, 07 Mar 2021 07:54:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EFGDhzS5rcqOc3RM9clVoGZ0o3uhf02wOPFwu2P4VbY=;
        b=iptG0kvrydQHfrIhqMwDyllpo05M4v++jMWSUz3JjzjYcecbUYRroBchS3H5jEd5Ce
         /3uO48yq0yNcqS/om0t6WFdXG7TRVlqLe7DWqjN/xk/R8qQfeZw2Qx2yGRkjs0wU4MEB
         v7f1U5YjStUYHhwoHajLSoLzNvnMZ8nlR0BjKkvfSe1g9HP36alH93WBvT7CWMAkYdun
         lp1LJGZFrpVb/P1pWGCaxuqJlj0ZCmbhsbcli2qwh1YAzCv5IZDoNEaTUCXQYSnA0Tw2
         7qcAu7g7WoDL97vYEpdoU3PH3c6vt9j2r8Dw0pWrWSXwOUDwQSU3iCJpuVHe40aBcMjg
         pMLw==
X-Gm-Message-State: AOAM533dsGrcgpWc4IHH0Gkvz9lnU+QxCNMsntrxsKoqYsS9zYVjmUQp
        hTtuMRxP+ZT9fXmtHbnhN/nRmjhzZR6ct3OgC0e7faqbyyVZ/97d1nu+UZlQNPiET2VSjUkUZ3m
        RQe4lZeStmwqslUlmnBSdxtPJLnMGEZmO6WuwYiSIoE81Y0V3S75tsgEO34IjuZ/1mUDmidAs
X-Received: by 2002:a17:906:ac6:: with SMTP id z6mr11015003ejf.505.1615132491870;
        Sun, 07 Mar 2021 07:54:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCPc/tRqZeR89amek2ObgHnLwoBXBRZi+misOF82ceJTg/ZR+fbf7YDeQCeSqqKf5VK4F9Lg==
X-Received: by 2002:a17:906:ac6:: with SMTP id z6mr11014991ejf.505.1615132491729;
        Sun, 07 Mar 2021 07:54:51 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bw22sm5137990ejb.78.2021.03.07.07.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Mar 2021 07:54:51 -0800 (PST)
Subject: Re: [PATCH v2] Add unusal uas devices reported by Umbrel users
To:     Aaron Dewes <aaron.dewes@web.de>
Cc:     linux-usb@vger.kernel.org
References: <20210307154124.41651-1-aaron.dewes@web.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e09744c3-ca34-025d-0a83-96c4ce9a46d0@redhat.com>
Date:   Sun, 7 Mar 2021 16:54:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210307154124.41651-1-aaron.dewes@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 3/7/21 4:41 PM, Aaron Dewes wrote:
> This patch adds more unusual UAS devices.
> All these devices were reported by users of Umbrel,
> and applying this patch fixed the issues.
> 
> Signed-off-by: Aaron Dewes <aaron.dewes@web.de>

NACK, see my reply to v1 of the patch.

Regards,

Hans


> ---
>  drivers/usb/storage/unusual_uas.h | 70 +++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index f9677a5ec31b..a67ed2b527fa 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -28,6 +28,27 @@
>   * and don't forget to CC: the USB development list <linux-usb@vger.kernel.org>
>   */
> 
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x04e8, 0x4001, 0x0000, 0x9999,
> +		"Samsung",
> +		"SSD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x04e8, 0x61b6, 0x0000, 0x9999,
> +		"Samsung",
> +		"M3 Portable Hard Drive",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x04e8, 0x61f5, 0x0000, 0x9999,
> +		"Samsung",
> +		"Portable SSD T5",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +
>  /* Reported-by: Till Dörges <doerges@pre-sense.de> */
>  UNUSUAL_DEV(0x054c, 0x087d, 0x0000, 0x9999,
>  		"Sony",
> @@ -62,6 +83,20 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_REPORT_LUNS),
> 
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x1058, 0x082a, 0x0000, 0x9999,
> +		"Western Digital",
> +		"SSD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x125f, 0xa76a, 0x0000, 0x9999,
> +		"ADATA",
> +		"ED600 enclosure",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +
>  /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
>  UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
>  		"Initio Corporation",
> @@ -76,6 +111,13 @@ UNUSUAL_DEV(0x152d, 0x0539, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_REPORT_OPCODES),
> 
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x152d, 0x0562, 0x0000, 0x9999,
> +		"JMicron",
> +		"JMS567",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +
>  /* Reported-by: Claudio Bizzarri <claudio.bizzarri@gmail.com> */
>  UNUSUAL_DEV(0x152d, 0x0567, 0x0000, 0x9999,
>  		"JMicron",
> @@ -90,6 +132,20 @@ UNUSUAL_DEV(0x152d, 0x0578, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_BROKEN_FUA),
> 
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x152d, 0x1561, 0x0000, 0x9999,
> +		"JMicron",
> +		"JMS561U",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x152d, 0x1561, 0x0000, 0x9999,
> +		"JMicron",
> +		"External Disk connector",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +
>  /* Reported-by: Thinh Nguyen <thinhn@synopsys.com> */
>  UNUSUAL_DEV(0x154b, 0xf00b, 0x0000, 0x9999,
>  		"PNY",
> @@ -104,6 +160,13 @@ UNUSUAL_DEV(0x154b, 0xf00d, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_ATA_1X),
> 
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x174c, 0x55aa, 0x0000, 0x9999,
> +		"ASMedia",
> +		"ASM1051E and ASM1053E",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> +
>  /* Reported-by: Hans de Goede <hdegoede@redhat.com> */
>  UNUSUAL_DEV(0x2109, 0x0711, 0x0000, 0x9999,
>  		"VIA",
> @@ -150,3 +213,10 @@ UNUSUAL_DEV(0x4971, 0x8024, 0x0000, 0x9999,
>  		"External HDD",
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_ALWAYS_SYNC),
> +
> +/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
> +UNUSUAL_DEV(0x7825, 0xa2a4, 0x0000, 0x9999,
> +		"Other World Computing",
> +		"PA023U3",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
> --
> 2.30.1
> 

