Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B652854CA5
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2019 12:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbfFYKrl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jun 2019 06:47:41 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38502 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfFYKrl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jun 2019 06:47:41 -0400
Received: by mail-lf1-f68.google.com with SMTP id b11so12304655lfa.5
        for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2019 03:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=nxbb4pRpRzjQTDs6+thXKRJbtRyOLPYVzfZr4POdHvk=;
        b=DrXaN+IBfHTiHmi5K1X6vQFLHMGYoGYolSFW31h9j+y9OA7HaCnVkB2dSpjROUD86b
         xgw5xjfVEU1Td8o9EHx9Ry2WsH0Gkjuqq0wekbocKKjyYMkU6Cq72V7rvr6h5N7nH/zz
         5JNHv4J3GX0outuUDVpl9/zkDUSoZZqH3V4mddO6uT89C9525S0X9jtyUG882C4XyRxZ
         lRVDnE014jIfPmCUXbGxOM1AKKI6aiMTyPCuVT6DelfrgI5b+mOtvWtXTCAaTxkQTzE5
         gxpCM4qfDHSYjAoSx1K/0uLDq2/Locrz1OX5UQaRNeL/D8ZHtdNLykvWMh6zIj8diBdi
         LCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nxbb4pRpRzjQTDs6+thXKRJbtRyOLPYVzfZr4POdHvk=;
        b=O28MAbGhDZHAAnIhlb5OF24y7X5RmxqTdPSzwuOEMnvW4REg0HDbyw0tLE/BMn2KPX
         lFo+iyWtwMSV9y5iC6w84+Yh01K6ovlB3Opz7H1csG8vLnfspkSIakhCsqOQT6qEgkw2
         IZ9v1MMvE0FpCMKj6zHu2Yc8bMurB5+J9HMB2v3wWH0zkzMcAd2sRKSsjwL3YSz/nnfP
         7vbeeoLgooPrMAJmB37GstqcoFTtXxOBN3q/VWVkazWxRLr2eeTMr6YmDL/wHSMWQkW+
         VslvqRxWs7jvTqzke0ASzMES3ilHqIzBhGEbF9/ZXdgfGJgt4u/0KHVK+5Kjltdqzrnc
         AKuw==
X-Gm-Message-State: APjAAAWr3Hj90Yra+wd8wXoczt20eSy1ndi+vVB2MjFkiwD0zLtdm2lH
        0GkBM1nNB69RLN/EqvGLXaEbxImgYrM=
X-Google-Smtp-Source: APXvYqxx4BbfXAroa7SuxZo6dANGDIcUGyVDgv7nT3uxIf91785cMusrPrrBBfumARw0aV9dSvDs8w==
X-Received: by 2002:a19:4a49:: with SMTP id x70mr40438567lfa.151.1561459659416;
        Tue, 25 Jun 2019 03:47:39 -0700 (PDT)
Received: from [192.168.1.100] ([213.87.147.32])
        by smtp.gmail.com with ESMTPSA id p12sm2043365lja.23.2019.06.25.03.47.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 03:47:38 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] gpss: core: no waiters left behind on deregister
To:     Oliver Neukum <oneukum@suse.com>, johan@kernel.org,
        linux-usb@vger.kernel.org
References: <20190624083323.11876-1-oneukum@suse.com>
Message-ID: <761d0c5b-264d-3289-037d-b7a0cf621df8@cogentembedded.com>
Date:   Tue, 25 Jun 2019 13:47:31 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190624083323.11876-1-oneukum@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

    The subject has gpss ISO gnss. You hardly meant the General Purpose
System Simulation. :-)

On 24.06.2019 11:33, Oliver Neukum wrote:

> If you deregister a device you need to wake up all waiters
> as there will be no further wakeups.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>   drivers/gnss/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gnss/core.c b/drivers/gnss/core.c
> index e6f94501cb28..0d13bd2cefd5 100644
> --- a/drivers/gnss/core.c
> +++ b/drivers/gnss/core.c
> @@ -303,7 +303,7 @@ void gnss_deregister_device(struct gnss_device *gdev)
>   	down_write(&gdev->rwsem);
>   	gdev->disconnected = true;
>   	if (gdev->count) {
> -		wake_up_interruptible(&gdev->read_queue);
> +		wake_up_interruptible_all(&gdev->read_queue);
>   		gdev->ops->close(gdev);
>   	}
>   	up_write(&gdev->rwsem);

MBR, Sergei
