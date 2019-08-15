Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F29BB8EF42
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 17:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729084AbfHOPYQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 11:24:16 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33731 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728808AbfHOPYQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Aug 2019 11:24:16 -0400
Received: by mail-wr1-f65.google.com with SMTP id u16so2588009wrr.0
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 08:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xqt902kFy5EO/uMlrR6SNiQ2dmhca8k0x+SK6RbTtjQ=;
        b=nrchQlelwm2d9BGiVUca8Rp2X7H8ZjQeGUcgwCcowHxPovN7YP0FGd/jJckQtwvnFH
         sImYS4FCLmWugGkvxWJoWCZQjC1RzG2cbCx1sK1IhRTBaT7WKLeNuehTZ5NFYKziidrC
         W8cub8Cw5majmWMAPTjXDCKhUIw3Es9Y7fHBVBqQSgmpTP5TTlumfffiWROaUN/qftEC
         9qGLAwxpP0maOr7wuXgv7FrSamvquFQ0N+64GmbJfDl57prDQ+Y79YRgf9JqUa4Q+TLD
         v5kssvORJix70a+iRrIpi4Jl1nqUQkxzavk4NAXKTJTP7Gx8vkzJTsctsFVApg/gPXts
         QhRQ==
X-Gm-Message-State: APjAAAX3NYaNCX8Ms0WWEWDH8WaAT+BZRyA89bDKw35+R8oyF28AWwMV
        yn01aXVzaZ2R+PMzPsc8Yumw+/c3qXE=
X-Google-Smtp-Source: APXvYqyQJti6G2hbIVPIVgTGBGysD3A2+zSrznQlwMSiugY+WhYiNHRsGiM595Jsfbq5uZwfPeKsSg==
X-Received: by 2002:adf:b60c:: with SMTP id f12mr6182449wre.231.1565882653654;
        Thu, 15 Aug 2019 08:24:13 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id 16sm3259070wmx.45.2019.08.15.08.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2019 08:24:13 -0700 (PDT)
Subject: Re: [PATCH] usb: typec: fusb302: Call fusb302_debugfs_init earlier
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20190813101524.80673-1-hdegoede@redhat.com>
 <20190813105216.GD4691@kuha.fi.intel.com> <20190815125441.GB24270@kroah.com>
 <20190815133159.GB24772@kuha.fi.intel.com>
 <20190815152004.GD23562@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8ef6a72e-6ffa-e099-fc21-02fbb522b43a@redhat.com>
Date:   Thu, 15 Aug 2019 17:24:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815152004.GD23562@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 15-08-19 17:20, Guenter Roeck wrote:
> On Thu, Aug 15, 2019 at 04:31:59PM +0300, Heikki Krogerus wrote:
>>>
>>> As Guenter points out, don't check this, just call it anb move on.
>>>
>>> But are you _SURE_ you want this to be the name, at the root of debugfs?
>>> Why not put it under the usb debugfs directory?
>>
>> That's a good point. Let's move it there while at it.
>>
> Maybe we should move the tcpm root as well ?

Ack, I'm preparing a patch series that does both.

Regards,

Hans

