Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2931422EC9E
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 14:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbgG0MyH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 08:54:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52273 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728387AbgG0MyG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 08:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595854445;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hrA74aXd35zP1sOcI9tpB+pNbIu1jdqls3VUIGLFQtw=;
        b=dFv9L/VOUnueNvp+yqi8k80YLa0XPUHUvRzpAae+YRvhUQ7U9gO9u2E/IZs6kW+/DP6w8K
        B+3f0Ozv73cKOofNVvYjBATQbhPATYjz8nirxuouGRMJZqaggnoJYWWwHD/9nSGWpdTAWq
        ebyas3e7cU70pjcqwDrA/5VCElI9umw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-PET_5ND5O1SpL2HziqeuYQ-1; Mon, 27 Jul 2020 08:54:03 -0400
X-MC-Unique: PET_5ND5O1SpL2HziqeuYQ-1
Received: by mail-wr1-f72.google.com with SMTP id d6so2345542wrv.23
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 05:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hrA74aXd35zP1sOcI9tpB+pNbIu1jdqls3VUIGLFQtw=;
        b=RqhPcegeBjhty44AcgUrDScIw6nka03be8UakNk6VcDiFiLB7JWfCaVJFdTkgtcX4N
         PyO70KGcFM6AQWkdUHeWd3qhndGllxadUV0vvMd2yB8MKm6mQHteIFQ7GCv9eOn4Vb1L
         wQYk9Bhoz6wy90Sk9SOCnXLImnJoqrhx10JHQGg1Q3zdiEOP1zhLDeYQn4hMqWZUKgSn
         bYhgJL206DnAocU7Cprdgk/rAwHAjaWjqBSBVA6ziXf19QXslNmgwwOLJ/myg0L3vdvY
         o5lVm5FPZSDnkOFCSQkOXcht73MfeI7uDdJv4QmsFbe6zBV1MDSG1ZrWYFkvvhVA5Xi7
         yHrQ==
X-Gm-Message-State: AOAM532DcxpL5g6UcV0ac0jJsl3Fiyo3FxAsGnpE+vYSzflM02gLb4dn
        SEIV59ATw62gJ52Oamey1hy9TRMyH5OmR9KYUV9/qspc9mFcj4lv32yqTKuJl8wNtzhUkutqevL
        2HB4sLQh8QEDii3ka5wZF
X-Received: by 2002:adf:94c3:: with SMTP id 61mr19296125wrr.289.1595854442033;
        Mon, 27 Jul 2020 05:54:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGEZWBUUIdDuDB8OUcTVu8ZQNcGT3UfbIo36JrIrRBFgb42tznTDDhcCtczfDhCG5ZQbFJQQ==
X-Received: by 2002:adf:94c3:: with SMTP id 61mr19296118wrr.289.1595854441834;
        Mon, 27 Jul 2020 05:54:01 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id v15sm16906398wmh.24.2020.07.27.05.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 05:54:01 -0700 (PDT)
Subject: Re: AB BA lock inversion in ucsi driver caused by "usb: typec: ucsi:
 displayport: Fix a potential race during registration"
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
References: <734333be-aa48-d2fc-0463-6334115e3c12@redhat.com>
 <20200727123735.GA883641@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <95664b27-19c5-7cf8-2cd8-98ae956a6d31@redhat.com>
Date:   Mon, 27 Jul 2020 14:54:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200727123735.GA883641@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 7/27/20 2:37 PM, Heikki Krogerus wrote:
> Hi Hans,
> 
> Sorry about the late reply. I just returned from vacation.

NP. I hope you've enjoyed your vacation.

> On Fri, Jul 17, 2020 at 12:04:58PM +0200, Hans de Goede wrote:
>> Hi Heikki,
>>
>> I've been running my personal kernel builds with lockdep enabled
>> (more people should do that) and it found an AB BA lock inversion in the
>> ucsi driver. This has been introduced by commit 081da1325d35 ("usb: typec:
>> ucsi: displayport: Fix a potential race during registration").
>>
>> The problem is as follows:
>>
>> AB order:
>>
>> 1. ucsi_init takes ucsi->ppm_lock (it runs with that locked for the duration of the function)
>> 2. usci_init eventually end up calling ucsi_register_displayport, which takes
>>     ucsi_connector->lock
>>
>> BA order:
>>
>> 1. ucsi_handle_connector_change work is started, takes ucsi_connector->lock
>> 2. ucsi_handle_connector_change calls ucsi_send_command which takes ucsi->ppm_lock
>>
>> I think this can be fixed by doing the following:
>>
>> a. Make ucsi_init drop the ucsi->ppm_lock before it starts registering ports; and
>>     replacing any ucsi_run_command calls after this point with ucsi_send_command
>>     (which is a wrapper around run_command taking the lock while handling the command)
>>
>> b. Move the taking of the ucsi_connector->lock from ucsi_register_displayport into
>>     ucsi_register_port() to make sure that nothing can touch the connector/port until
>>     ucsi_register_port() has completed.
>>
>>
>> b. is not stricly necessary but it brings the locking during init more inline
>> with locking done during runtime so this seems like a good idea.
> 
> Makes sense. So b. it is. Can you prepare the patch for that?

b. is just a cleanup / extra step on top of a. we need a. to fix the inversion.

If you are ok with that I can try to make some time for this...

Regards,

Hans

