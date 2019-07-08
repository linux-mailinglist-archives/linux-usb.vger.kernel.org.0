Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4E06201E
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jul 2019 16:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731664AbfGHOK1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jul 2019 10:10:27 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36669 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbfGHOK1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Jul 2019 10:10:27 -0400
Received: by mail-ed1-f65.google.com with SMTP id k21so14695815edq.3
        for <linux-usb@vger.kernel.org>; Mon, 08 Jul 2019 07:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FH+lyCNVLpdqnAk6UMEnb6+29UF7KaAN4WAnL1+pJf8=;
        b=t6cOryQ6J5EW0gTuzMw3AXgs4T2t7qP4ck8SqpUdF3JcYdymdAW46b1dmbI8DoQdFn
         FVcSOytXmo3Vv9s7f9cRKQrGLtILPUg9CuCrpQCi4jGNBl9Lsn3Ts+2e38c6UNV+Twm2
         jTw9cE1vRAl0fnSBjU7AXUDaT4xYxwr2f4CEQw4Bs+LzV/HkZk97m0xJHkVAiJAqLg8F
         L28ihrWIRjkjC9G/2ra/0C9xkwo2QxiDULSnpwdDYJ1RMkC+xSLcIRPvQuUt2VbRrTvC
         1b3aDrK6lWx0sJyzsgfiF8ZJXLnES63MUMMcFasgZI+R/4LWvlYbApDHRKINceXDY38B
         n4Sg==
X-Gm-Message-State: APjAAAWNphr4dQ6xkbKjc8UoQlzlxhUF+cUjVBt6PBm37cq1i46z8NIt
        0PuxazWdqtDTtND2vDT/iKSDxA==
X-Google-Smtp-Source: APXvYqz7q86JuU+HsIfclBqE21+u9+gdlm0Tg9gXGToP+XOoQWgeYFKXSU5/ltW6dCA+7haeRDOs7g==
X-Received: by 2002:a50:89a2:: with SMTP id g31mr20613517edg.93.1562595025082;
        Mon, 08 Jul 2019 07:10:25 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id bq1sm1133403ejb.45.2019.07.08.07.10.24
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 07:10:24 -0700 (PDT)
Subject: Re: [PATCH] usb: roles: Add PM callbacks
To:     "Chen, Hu" <hu1.chen@intel.com>
Cc:     Balaji <m.balaji@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190708022514.7161-1-hu1.chen@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8d304bb6-9849-ea77-3bd6-fe378de78ce7@redhat.com>
Date:   Mon, 8 Jul 2019 16:10:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190708022514.7161-1-hu1.chen@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 08-07-19 04:25, Chen, Hu wrote:
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

Hmm, but what if the user has say unplugged a host-adapter with a usb-stick
in there and plugged in a cable to a computer *while suspended* because the
battery was getting low?

I see 2 scenarios here:

1) We may get an interrupt for the role change, followed by an
intel_xhci_usb_set_role. In this case the interrupt handling may happen
before the intel_xhci_usb_resume call and we would end up restoring the
wrong value

2) The role may be changed underneath us by the firmware / AML code
without us ever becoming aware of this.

For the specific problem discussed in the commit message it might be better
to do something like:

static int intel_xhci_usb_resume(struct platform_device *pdev)
{
	struct intel_xhci_usb_data *data = platform_get_drvdata(pdev);
	struct device *dev = &pdev->dev;

	if (intel_xhci_usb_get_role(dev) == USB_ROLE_NONE &&
	    power_supply_is_system_supplied())
		intel_xhci_usb_set_role(dev, USB_ROLE_DEVICE);

	return 0;
}

But that is somewhat specific for solving the problem described in
the commit message, but it has the advantage of not being able to
cause any regressions (that I can think of).

Regards,

Hans





> 
> diff --git a/drivers/usb/roles/intel-xhci-usb-role-switch.c b/drivers/usb/roles/intel-xhci-usb-role-switch.c
> index 277de96181f9..caa1cfab41cc 100644
> --- a/drivers/usb/roles/intel-xhci-usb-role-switch.c
> +++ b/drivers/usb/roles/intel-xhci-usb-role-switch.c
> @@ -37,6 +37,7 @@
>   struct intel_xhci_usb_data {
>   	struct usb_role_switch *role_sw;
>   	void __iomem *base;
> +	enum usb_role role;
>   };
>   
>   static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
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
> +
> +	return 0;
> +}
> +
> +static int intel_xhci_usb_resume(struct platform_device *pdev)
> +{
> +	struct intel_xhci_usb_data *data = platform_get_drvdata(pdev);
> +	struct device *dev = &pdev->dev;
> +
> +	if (intel_xhci_usb_get_role(dev) != data->role) {
> +		if (intel_xhci_usb_set_role(dev, data->role) != 0)
> +			dev_warn(dev, "Failed to set role during resume\n");
> +	}
> +
> +	return 0;
> +}
> +
>   static const struct platform_device_id intel_xhci_usb_table[] = {
>   	{ .name = DRV_NAME },
>   	{}
> @@ -180,6 +205,8 @@ static struct platform_driver intel_xhci_usb_driver = {
>   	.id_table = intel_xhci_usb_table,
>   	.probe = intel_xhci_usb_probe,
>   	.remove = intel_xhci_usb_remove,
> +	.suspend = intel_xhci_usb_suspend,
> +	.resume = intel_xhci_usb_resume,
>   };
>   
>   module_platform_driver(intel_xhci_usb_driver);
> 
