Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9A361BBB
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jul 2019 10:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728874AbfGHIam (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jul 2019 04:30:42 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35916 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbfGHIam (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Jul 2019 04:30:42 -0400
Received: by mail-lf1-f65.google.com with SMTP id q26so10300468lfc.3
        for <linux-usb@vger.kernel.org>; Mon, 08 Jul 2019 01:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ztkKFuoNyYWW8TvhBAfe9IkmKE0E5S6jFYK6qsfI+as=;
        b=2FLKiWfJ6TELTzv2UmKaQ8Ce56VitiUoFyz37Mt8idG0Tcb4aShmNk9A2xRnAANDpr
         Wbg75xrRLdbKNJ9uoFgb+pO81pUcwd90P8+6xsLyLKWhMtbPz4bHKlO7X4f83xbPsAp5
         f9Uz94axmque8KceNcL14YcYjqYwtHUYfXJeO4UHb9UbtCRYUUpB7JCRQpgzt7IVzHKY
         7a018YhWOu8XMrX6cE2ddTJzD7zApYVPIwACOiH5/sw/WWJIt2l45fcdutxjIl6JVqaI
         jJ6fM+bdvubDrKkV6uQ49DLMg1kEf+q5pwn2eFlIjWPdOmwIfNMSHbu9bt/fkcAC/Gvv
         MvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ztkKFuoNyYWW8TvhBAfe9IkmKE0E5S6jFYK6qsfI+as=;
        b=CVJ2QhIG+sYC9r3oe+9sYK+6REO0I89gLTBGYpOJNc3bDG98E08ytU1r1p/SrHDxRD
         ECXOve6z4/Jm3xXDGLmTzruQAcHSdcwaBJLayOkBqZOpgdXxBTHsSH/0TjbzOHh2C1Xu
         OL6y8NPkwkeFH0PAT4BjNXLtjmJF7YVFanxkdTeYw5pveMJvQDd+jNR6SOh2pD9V897T
         paj8GMEAKPWJTIXIaS9hEUdX3QI5MhjnGGpxRH295IldHp4gqPkupWxWrb7D1lnoNavb
         7k/Tk+eCPU0GTeHB+lebG5/HrD1uU4bmRKT5UTx/EquYmojZV80kdp7M4LeCTftK4r5A
         uChw==
X-Gm-Message-State: APjAAAW/c2H9ZmdEVSaSen+DmtIHmXTfb7VULbZ5QLnWtJtOEkNT0i2K
        V51cMqfX/d71QRe1Vk7OvTYKbw==
X-Google-Smtp-Source: APXvYqxI1tVn7Kh3jFQltkzQRum0mRc1xHVC7YeMg/XXBNxCzrBu9D7uRCAaeKQOWInbA16ct1+25A==
X-Received: by 2002:ac2:455a:: with SMTP id j26mr7890772lfm.18.1562574640173;
        Mon, 08 Jul 2019 01:30:40 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:80a:6f53:f8ef:3097:c1a4:9983? ([2a00:1fa0:80a:6f53:f8ef:3097:c1a4:9983])
        by smtp.gmail.com with ESMTPSA id j7sm3887470lji.27.2019.07.08.01.30.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 01:30:39 -0700 (PDT)
Subject: Re: [PATCH] usb: roles: Add PM callbacks
To:     "Chen, Hu" <hu1.chen@intel.com>, hdegoede@redhat.com
Cc:     Balaji <m.balaji@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190708022514.7161-1-hu1.chen@intel.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <699cc89d-7366-c167-4295-5153ab7b5716@cogentembedded.com>
Date:   Mon, 8 Jul 2019 11:30:36 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708022514.7161-1-hu1.chen@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 08.07.2019 5:25, Chen, Hu wrote:

> On some Broxton NUC, the usb role is lost after S3 (it becomes "none").
> Add PM callbacks to address this issue: save the role during suspend and
> restore usb to that role during resume.
> 
> Test:
> Run Android on UC6CAY, a NUC powered by Broxton. Access this NUC via
> "adb shell" from a host PC. After a suspend/resume cycle, the adb still
> works well.
> 
> Signed-off-by: Chen, Hu <hu1.chen@intel.com>
> Signed-off-by: Balaji <m.balaji@intel.com>
> 
> diff --git a/drivers/usb/roles/intel-xhci-usb-role-switch.c b/drivers/usb/roles/intel-xhci-usb-role-switch.c
> index 277de96181f9..caa1cfab41cc 100644
> --- a/drivers/usb/roles/intel-xhci-usb-role-switch.c
> +++ b/drivers/usb/roles/intel-xhci-usb-role-switch.c
[...]
> @@ -167,6 +168,30 @@ static int intel_xhci_usb_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static int intel_xhci_usb_suspend(struct platform_device *pdev,
> +				  pm_message_t state)
> +{
> +	struct intel_xhci_usb_data *data = platform_get_drvdata(pdev);
> +	struct device *dev = &pdev->dev;
> +
> +	data->role = intel_xhci_usb_get_role(dev);

    Why not just pass &pdev->dev here?

> +
> +	return 0;
> +}
> +
[...]

MBR, Sergei
